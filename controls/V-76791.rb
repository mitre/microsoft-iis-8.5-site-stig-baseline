LOG_FIELDS = attribute(
    'fields',
    description: 'List of fields to be included in Web Server Logging Configuration',
    default: ['UserAgent', 'UserName', 'Referer']
)

control "V-76791" do
  title "The IIS 8.5 website must produce log records containing sufficient
  information to establish the identity of any user/subject or process associated
  with an event."
  desc  "Web server logging capability is critical for accurate forensic
  analysis. Without sufficient and accurate information, a correct replay of the
  events cannot be determined.

      Determining user accounts, processes running on behalf of the user, and
  running process identifiers also enable a better understanding of the overall
  event. User tool identification is also helpful to determine if events are
  related to overall user access or specific client tools.

      Log record content that may be necessary to satisfy the requirement of this
  control includes: time stamps, source and destination addresses, user/process
  identifiers, event descriptions, success/fail indications, file names involved,
  and access control or flow control rules invoked.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000100-WSR-000064"
  tag "gid": "V-76791"
  tag "rid": "SV-91487r1_rule"
  tag "stig_id": "IISW-SI-000210"
  tag "fix_id": "F-83487r1_fix"
  tag "cci": ["CCI-001487"]
  tag "nist": ["AU-3", "Rev_4"]
  tag "false_negatives": nil
  tag "false_positives": nil
  tag "documentable": false
  tag "mitigations": nil
  tag "severity_override_guidance": false
  tag "potential_impacts": nil
  tag "third_party_tools": nil
  tag "mitigation_controls": nil
  tag "responsibility": nil
  tag "ia_controls": nil
  tag "check": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Access the IIS 8.5 web server IIS 8.5 Manager.

  Under \"IIS\", double-click the \"Logging\" icon.

  Verify the \"Format:\" under \"Log File\" is configured to \"W3C\".

  Select the \"Fields\" button.

  Under \"Standard Fields\", verify \"User Agent\", \"User Name\" and
  \"Referrer\" are selected.

  Under \"Custom Fields\", verify the following fields have been configured:

  Server Variable >> HTTP_USER_AGENT

  Request Header >> User-Agent

  Request Header >> Authorization

  Response Header >> Content-Type

  If any of the above fields are not selected, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Access the IIS 8.5 web server IIS 8.5 Manager.

  Select the website being reviewed.

  Under \"IIS\", double-click the \"Logging\" icon.

  Configure the \"Format:\" under \"Log File\" to \"W3C\".

  Select the \"Fields\" button.

  Under \"Standard Fields\", select \"User Agent\", \"User Name\" and
  \"Referrer\".

  Under \"Custom Fields\", select the following fields:

  Server Variable >> HTTP_USER_AGENT

  Request Header >> User-Agent

  Request Header >> Authorization

  Response Header >> Content-Type

  Click \"OK\".

  Select \"Apply\" from the \"Actions\" pane."

  
  get_names = command("Get-Website | select name | findstr /r /v '^$' | findstr /v 'name ---'").stdout.strip.split("\r\n")
  fields = command('Get-WebConfigurationProperty -filter "system.applicationHost/sites/*/logFile" -name * | select -expand logExtFileFlags').stdout.strip.split("\r\n")
  field = LOG_FIELDS

  fields.each do |f|
    field.zip(get_names).each do |myField, names|
      describe "The iis site #{names} logging field #{myField}" do
        subject {myField}
        it { should be_in f}
      end
    end
  end

  log_format = command('Get-WebConfigurationProperty -pspath "MACHINE/WEBROOT/APPHOST"  -filter "system.applicationHost/sites/*/logFile" -name "logFormat"').stdout.strip.split("\r\n")
  
  log_format.zip(get_names).each do |format, names|
    describe "The iss site: #{names} logging format" do
      subject { format }
        it { should cmp 'W3C' }
    end
  end

  custom_field_configuration = []
  get_names.each do |names|

    custom_field_configuration = command("Get-WebConfiguration -filter \"system.applicationHost/sites/site[@name=\'#{names}\']/logFile/customFields/*\"").stdout.strip
    describe "IIS Custom Fields logging configuration" do
      subject { custom_field_configuration }
      it { should match /sourceName\s+:\s+User-Agent\s+sourceType\s+:\s+RequestHeader/}
      it { should match /sourceName\s+:\s+Authorization\s+sourceType\s+:\s+RequestHeader/}
      it { should match /sourceName\s+:\s+Content-Type\s+sourceType\s+:\s+ServerVariable/}
    end
  end
  if get_names.empty?
    describe "There are no IIS sites configured" do
      impact 0.0
      skip "Control not applicable"
    end
  end
end

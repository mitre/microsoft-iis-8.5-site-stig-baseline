LOG_FIELDS = attribute(
    'fields',
    description: 'List of fields to be included in Web Server Logging Configuration',
    default: ['Date', 'Time', 'ClientIP', 'UserName', 'Method', 'UriQuery', 'HttpStatus', 'Referer']
)

control "V-76783" do
  title "The enhanced logging for each IIS 8.5 website must be enabled and
  capture, record, and log all content related to a user session."
  desc  "Log files are a critical component to the successful management of an
  IS used within the DoD. By generating log files with useful information web
  administrators can leverage them in the event of a disaster, malicious attack,
  or other site-specific needs.

      Ascertaining the correct order of the events that occurred is important
  during forensic analysis. Events that appear harmless by themselves might be
  flagged as a potential threat when properly viewed in sequence. By also
  establishing the event date and time, an event can be properly viewed with an
  enterprise tool to fully see a possible threat in its entirety.

      Without sufficient information establishing when the log event occurred,
  investigation into the cause of event is severely hindered. Log record content
  that may be necessary to satisfy the requirement of this control includes, but
  is not limited to, time stamps, source and destination IP addresses,
  user/process identifiers, event descriptions, application-specific events,
  success/fail indications, file names involved, access control, or flow control
  rules invoked.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000092-WSR-000055"
  tag "satisfies": ["SRG-APP-000092-WSR-000055", "SRG-APP-000093-WSR-000053"]
  tag "gid": "V-76783"
  tag "rid": "SV-91479r1_rule"
  tag "stig_id": "IISW-SI-000205"
  tag "fix_id": "F-83479r1_fix"
  tag "cci": ["CCI-001462", "CCI-001464"]
  tag "nist": ["AU-14 (2)", "AU-14 (1)", "Rev_4"]
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

  Open the IIS 8.5 Manager.

  Click the site name.

  Click the \"Logging\" icon.

  Under Format select \"W3C\".

  Click Select Fields, verify at a minimum the following fields are checked:
  Date, Time, Client IP Address, User Name, Method, URI Query, Protocol Status,
  and Referrer.

  If the \"W3C\" is not selected as the logging format OR any of the required
  fields are not selected, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager. 

  Click the site name.

  Click the \"Logging\" icon.

  Under Format select \"W3C\".

  Select the following fields: Date, Time, Client IP Address, User Name, Method,
  URI Query, Protocol Status, and Referrer.

  Select \"Apply\" from the \"Actions\" pane."
  is_file_logging_enabled_string = command("Get-WebConfiguration system.applicationHost/log/centralW3CLogFile | select -expand enabled").stdout.strip
  is_file_logging_enabled = (is_file_logging_enabled_string == 'False' || is_file_logging_enabled_string == '') ? false : true

  logging_fields = command("Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter 'system.applicationHost/sites/siteDefaults/logFile' -name * | select -expand logExtFileFlags").stdout.strip.split(',')
  fields = LOG_FIELDS

  describe "Is Web Server Central W3C Logging Configuration Enabled" do
    subject { is_file_logging_enabled }
    it { should be true }
  end
 
  fields.each do |myField|
    describe "#{myField}" do
      it { should be_in logging_fields}
    end
   
  end

end


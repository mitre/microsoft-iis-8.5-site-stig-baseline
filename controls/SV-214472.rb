control 'SV-214472' do
  title 'Warning and error messages displayed to clients must be modified to minimize the identity of the IIS 8.5 website, patches, loaded modules, and directory paths.'
  desc 'HTTP error pages contain information that could enable an attacker to gain access to an information system. Failure to prevent the sending of HTTP error pages with full information to remote requesters exposes internal configuration information to potential attackers.'
  desc 'check', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click the "Error Pages" icon.

Click each error message and click "Edit Feature" setting from the "Actions" pane.

If any error message is not set to “Detailed errors for local requests and custom error pages for remote requests”, this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click the "Error Pages" icon.

Click each error message and click "Edit Feature" Setting from the "Actions" pane; set each error message to “Detailed errors for local requests and custom error pages for remote requests”.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000266-WSR-000159'
  tag gid: 'V-214472'
  tag rid: 'SV-214472r879655_rule'
  tag stig_id: 'IISW-SI-000233'
  tag fix_id: 'F-15679r310621_fix'
  tag cci: ['CCI-001312']
  tag nist: ['SI-11 a']
  tag 'false_negatives'
  tag 'false_positives'
  tag 'documentable'
  tag 'mitigations'
  tag 'severity_override_guidance'
  tag 'potential_impacts'
  tag 'third_party_tools'
  tag 'mitigation_controls'
  tag 'responsibility'
  tag 'ia_controls'
  tag 'check'
  tag 'fix'

  get_names = command("Get-Website | select name | findstr /v 'name ---'").stdout.strip.split("\r\n")
  get_errorMode = command('Get-WebConfigurationProperty -pspath "IIS:\Sites\*" -Filter system.webServer/httpErrors -Name errorMode').stdout.strip.split("\r\n")

  get_errorMode.zip(get_names).each do |errorMode, names|
    n = names.strip

    describe "The IIS site: #{n} websites error mode" do
      subject { errorMode }
      it { should cmp 'DetailedLocalOnly' }
    end
  end
  if get_names.empty?
    impact 0.0
    desc 'There are no IIS sites configured hence the control is Not-Applicable'

    describe 'No sites where found to be reviewed' do
      skip 'No sites where found to be reviewed'
    end
  end
end

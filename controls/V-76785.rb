control 'V-76785' do
  title "Both the log file and Event Tracing for Windows (ETW) for each IIS 8.5
  website must be enabled."
  desc  "Internet Information Services (IIS) on Windows Server 2012 provides
  basic logging capabilities. However, because IIS takes some time to flush logs
  to disk, administrators do not have access to logging information in real-time.
  In addition, text-based log files can be difficult and time-consuming to
  process.

      In IIS 8.5, the administrator has the option of sending logging information
  to Event Tracing for Windows (ETW). This option gives the administrator the
  ability to use standard query tools, or create custom tools, for viewing
  real-time logging information in ETW. This provides a significant advantage
  over parsing text-based log files that are not updated in real time.
  "
  impact 0.5
  tag "gtitle": 'SRG-APP-000092-WSR-000055'
  tag "satisfies": ['SRG-APP-000092-WSR-000055', 'SRG-APP-000108-WSR-000166']
  tag "gid": 'V-76785'
  tag "rid": 'SV-91481r1_rule'
  tag "stig_id": 'IISW-SI-000206'
  tag "fix_id": 'F-83481r1_fix'
  tag "cci": ['CCI-000139', 'CCI-001464']
  tag "nist": ['AU-5 a', 'AU-14 (1)', 'Rev_4']
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

  Under Log Event Destination, verify the \"Both log file and ETW event\" radio
  button is selected.

  If the \"Both log file and ETW event\" radio button is not selected, this is a
  finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name.

  Click the \"Logging\" icon.

  Under Log Event Destination, select the \"Both log file and ETW event\" radio
  button.

  Select \"Apply\" from the \"Actions\" pane."

  iis_modules = command('Get-WebConfiguration  system.webServer/globalModules/*').stdout.strip

  describe 'IIS Module for ETW (Tracing) should be installed; Installed modules' do
    subject { iis_modules }
    it { should include 'UriCacheModule' }
  end

  site_names = json(command: 'ConvertTo-Json @(Get-Website | select -expand name)').params

  site_names.each do |site_name|
    iis_logging_configuration = json(command: %(Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST' -filter 'System.Applicationhost/Sites/site[@name="#{site_name}"]/logfile'  -Name * | ConvertTo-Json))

    describe "IIS Logging configuration for Site :'#{site_name}'" do
      subject { iis_logging_configuration }
      its('logTargetW3C') { should include 'File' }
      its('logTargetW3C') { should include 'ETW' }
    end
  end

  if site_names.empty?
    impact 0.0
    desc 'There are no IIS sites configured hence the control is Not-Applicable'

    describe 'No sites where found to be reviewed' do
      skip 'No sites where found to be reviewed'
    end
  end
end

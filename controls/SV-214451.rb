control 'SV-214451' do
  title 'The IIS 8.5 website must produce log records that contain sufficient information to establish the outcome (success or failure) of IIS 8.5 website events.'
  desc 'Web server logging capability is critical for accurate forensic analysis. Without sufficient and accurate information, a correct replay of the events cannot be determined.

Ascertaining the success or failure of an event is important during forensic analysis. Correctly determining the outcome will add information to the overall reconstruction of the logable event. By determining the success or failure of the event correctly, analysis of the enterprise can be undertaken to determine if events tied to the event occurred in other areas within the enterprise.

Without sufficient information establishing the success or failure of the logged event, investigation into the cause of event is severely hindered. The success or failure also provides a means to measure the impact of an event and help authorized personnel to determine the appropriate response. Log record content that may be necessary to satisfy the requirement of this control includes, but is not limited to, time stamps, source and destination IP addresses, user/process identifiers, event descriptions, application-specific events, success/fail indications, file names involved, access control, or flow control rules invoked.'
  desc 'check', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Select the website being reviewed.

Under "IIS", double-click the "Logging" icon.

Verify the "Format:" under "Log File" is configured to "W3C".

Select the "Fields" button.

Under "Custom Fields", verify the following fields are selected:

Request Header >> Connection

Request Header >> Warning

If any of the above fields are not selected, this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Select the website being reviewed.

Under "IIS", double-click the "Logging" icon.

Configure the "Format:" under "Log File" to "W3C".

Select the "Fields" button.

Under "Custom Fields", select the following fields:

Request Header >> Connection

Request Header >> Warning

Click "OK".

Select "Apply" from the "Actions" pane.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000099-WSR-000061'
  tag gid: 'V-214451'
  tag rid: 'SV-214451r879567_rule'
  tag stig_id: 'IISW-SI-000209'
  tag fix_id: 'F-15658r310558_fix'
  tag cci: ['CCI-000134']
  tag nist: ['AU-3', 'AU-3 e']
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

  site_names = json(command: 'ConvertTo-Json @(Get-Website | select -expand name)').params

  site_names.each do |site_name|
    iis_logging_configuration = json(command: %(Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST' -filter 'System.Applicationhost/Sites/site[@name="#{site_name}"]/logfile'  -Name * | ConvertTo-Json))

    describe "IIS Logging configuration for Site :'#{site_name}'" do
      subject { iis_logging_configuration }
      its('logFormat') { should cmp 'W3C' }
    end
  end

  custom_field_configuration = []
  site_names.each do |site_name|
    custom_field_configuration = command("Get-WebConfiguration -filter \"system.applicationHost/sites/site[@name=\'#{site_name}\']/logFile/customFields/*\"").stdout.strip
    describe "IIS Custom Fields Logging configuration for Site :'#{site_name}'" do
      subject { custom_field_configuration }
      it { should match /sourceName\s+:\s+Connection\s+sourceType\s+:\s+RequestHeader/ }
      it { should match /sourceName\s+:\s+Warning\s+sourceType\s+:\s+RequestHeader/ }
      it { should match /sourceName\s+:\s+HTTP_CONNECTION\s+sourceType\s+:\s+ServerVariable/ }
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

control 'SV-214448' do
  title 'The enhanced logging for each IIS 8.5 website must be enabled and capture, record, and log all content related to a user session.'
  desc 'Log files are a critical component to the successful management of an IS used within the DoD. By generating log files with useful information web administrators can leverage them in the event of a disaster, malicious attack, or other site-specific needs.

Ascertaining the correct order of the events that occurred is important during forensic analysis. Events that appear harmless by themselves might be flagged as a potential threat when properly viewed in sequence. By also establishing the event date and time, an event can be properly viewed with an enterprise tool to fully see a possible threat in its entirety.

Without sufficient information establishing when the log event occurred, investigation into the cause of event is severely hindered. Log record content that may be necessary to satisfy the requirement of this control includes, but is not limited to, time stamps, source and destination IP addresses, user/process identifiers, event descriptions, application-specific events, success/fail indications, file names involved, access control, or flow control rules invoked.'
  desc 'check', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name.

Click the "Logging" icon.

Under Format select "W3C".

Click “Select Fields”, verify at a minimum the following fields are checked: Date, Time, Client IP Address, User Name, Method, URI Query, Protocol Status, and Referrer.

If the "W3C" is not selected as the logging format OR any of the required fields are not selected, this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name.

Click the "Logging" icon.

Under Format select "W3C".

Select the following fields: Date, Time, Client IP Address, User Name, Method, URI Query, Protocol Status, and Referrer.

Select "Apply" from the "Actions" pane.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000092-WSR-000055'
  tag satisfies: ['SRG-APP-000092-WSR-000055', 'SRG-APP-000093-WSR-000053']
  tag gid: 'V-214448'
  tag rid: 'SV-214448r879562_rule'
  tag stig_id: 'IISW-SI-000205'
  tag fix_id: 'F-15655r310549_fix'
  tag cci: ['CCI-001462', 'CCI-001464']
  tag nist: ['AU-14 (2)', 'AU-14 (1)']
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
      its('logExtFileFlags') { should include 'Date' }
      its('logExtFileFlags') { should include 'Time' }
      its('logExtFileFlags') { should include 'ClientIP' }
      its('logExtFileFlags') { should include 'UserName' }
      its('logExtFileFlags') { should include 'Method' }
      its('logExtFileFlags') { should include 'UriQuery' }
      its('logExtFileFlags') { should include 'HttpStatus' }
      its('logExtFileFlags') { should include 'Referer' }
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

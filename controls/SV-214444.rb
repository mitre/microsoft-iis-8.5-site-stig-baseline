control 'SV-214444' do
  title 'The IIS 8.5 website session state must be enabled.'
  desc "When the session information is stored on the client, the session ID, along with the user authorization and identity information, is sent along with each client request and is stored in either a cookie, embedded in the uniform resource locator (URL), or placed in a hidden field on the displayed form. Each of these offers advantages and disadvantages. The biggest disadvantage to all three is the hijacking of a session along with all of the user's credentials.

When the user authorization and identity information is stored on the server in a protected and encrypted database, the communication between the client and web server will only send the session identifier, and the server can then retrieve user credentials for the session when needed. If, during transmission, the session were to be hijacked, the user's credentials would not be compromised.

ASP.NET provides a session state, which is available as the HttpSessionState class, as a method of storing session-specific information that is visible only within the session. ASP.NET session state identifies requests from the same browser during a limited time window as a session, and provides the ability to persist variable values for the duration of that session."
  desc 'check', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name.

Under the "ASP.NET" section, select "Session State".

Under "Session State Mode Settings", verify the "In Process" mode is selected.

If the "Session State Mode Settings" is set to "In Process", this is not a finding.

Alternative method:

Click the site name.

Select "Configuration Editor" under the "Management" section.

From the "Section:" drop-down list at the top of the configuration editor, locate "system.web/sessionState".

Verify the "mode" reflects "InProc".

If the "mode" is not set to "InProc", this is a finding.

If the system being reviewed is part of a Web Farm, interview the System Administrator to ensure Session State Tracking is enabled via a SQL server, or other means.  If Session State Tracking is enabled on the Web Farm, this is not a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name.

Under the "ASP.NET" section, select "Session State".

Under "Session State Mode Settings", verify the "In Process" mode is selected.

Select "Apply" from the "Actions" pane.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000001-WSR-000002'
  tag gid: 'V-214444'
  tag rid: 'SV-214444r879511_rule'
  tag stig_id: 'IISW-SI-000201'
  tag fix_id: 'F-15651r505295_fix'
  tag cci: ['CCI-000054']
  tag nist: ['AC-10']
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
    iis_configuration = json(command: "Get-WebConfigurationProperty -Filter system.web/sessionState 'IIS:\\Sites\\#{site_name}'  -Name * | ConvertTo-Json")

    describe "IIS sessionState setting for Site :'#{site_name}'" do
      subject { iis_configuration }
      its('mode') { should cmp 'InProc' }
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

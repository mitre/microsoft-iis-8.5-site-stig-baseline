control 'SV-214481' do
  title 'IIS 8.5 website session IDs must be sent to the client using TLS.'
  desc 'The HTTP protocol is a stateless protocol. To maintain a session, a session identifier is used. The session identifier is a piece of data that is used to identify a session and a user. If the session identifier is compromised by an attacker, the session can be hijacked. By encrypting the session identifier, the identifier becomes more difficult for an attacker to hijack, decrypt, and use before the session has expired.'
  desc 'check', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Access the IIS 8.5 Manager.

Select the website being reviewed.

Under "Management" section, double-click the "Configuration Editor" icon.

From the "Section:" drop-down list, select “system.webServer/asp".

Expand the "session" section.

Verify the "keepSessionIdSecure" is set to "True".

If the "keepSessionIdSecure" is not set to "True", this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Access the IIS 8.5 Manager.

Select the website being reviewed.

Under "Management" section, double-click the "Configuration Editor" icon.

From the "Section:" drop-down list, select “system.webServer/asp".

Expand the "session" section.

Select "True" for the "keepSessionIdSecure" setting.

Select "Apply" from the "Actions" pane.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000439-WSR-000152'
  tag gid: 'V-214481'
  tag rid: 'SV-214481r879810_rule'
  tag stig_id: 'IISW-SI-000244'
  tag fix_id: 'F-15688r310648_fix'
  tag cci: ['CCI-002418']
  tag nist: ['SC-8']
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
  get_keepSessionIdSecure = command('Get-WebConfigurationProperty -pspath "IIS:\Sites\*" -Filter system.webServer/asp -name * | select -expand session | select -expand keepSessionIdSecure').stdout.strip.split("\r\n")

  get_keepSessionIdSecure.zip(get_names).each do |keepSessionIdSecure, names|
    n = names.strip

    describe "The IIS site: #{n} website keepSessionIdSecure enabled setting" do
      subject { keepSessionIdSecure }
      it { should cmp 'True' }
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

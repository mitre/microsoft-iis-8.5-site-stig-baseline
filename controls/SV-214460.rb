control 'SV-214460' do
  title 'A private websites authentication mechanism must use client certificates to transmit session identifier to assure integrity.'
  desc 'A DoD private website must utilize PKI as an authentication mechanism for web users. Information systems residing behind web servers requiring authorization based on individual identity must use the identity provided by certificate-based authentication to support access control decisions. Not using client certificates allows an attacker unauthenticated access to private websites.'
  desc 'check', 'Note: If the server being reviewed is a public IIS 8.5 web server, this is Not Applicable.
Note: If the server being reviewed is hosting Exchange, this is Not Applicable.
Note: If the server being reviewed is hosting SharePoint, this is Not Applicable.
Note: If the server being reviewed is hosting WSUS, this is Not Applicable.
Note: If certificate handling is performed at the Proxy/Load Balancer, this is not a finding.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Double-click the "SSL Settings" icon.

Verify the "Clients Certificate Required" check box is selected.

If the "Clients Certificate Required" check box is not selected, this is a finding.'
  desc 'fix', 'Note: If the server being reviewed is a public IIS 8.5 web server, this is Not Applicable.
Note: If the server is hosting Exchange, this is Not Applicable.
Note: If the server is hosting SharePoint, this is Not Applicable.
Note: If certificate handling is performed at the Proxy/Load Balancer, this is not a finding.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Double-click the "SSL Settings" icon.

Verify the "Clients Certificate Required" check box is selected.

Select "Apply" from the "Actions" pane.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000172-WSR-000104'
  tag satisfies: ['SRG-APP-000172-WSR-000104', 'SRG-APP-000224-WSR-000135', 'SRG-APP-000427-WSR-000186']
  tag gid: 'V-214460'
  tag rid: 'SV-214460r903091_rule'
  tag stig_id: 'IISW-SI-000220'
  tag fix_id: 'F-15667r840133_fix'
  tag cci: ['CCI-000197', 'CCI-001188', 'CCI-002470']
  tag nist: ['IA-5 (1) (c)', 'SC-23 (3)', 'SC-23 (5)']
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

  get_names = json(command: 'ConvertTo-Json @(Get-Website | select -expand name)').params

  get_names.each do |site_name|
    iis_configuration = json(command: "Get-WebConfigurationProperty -Filter system.webServer/security/access 'IIS:\\Sites\\#{site_name}'  -Name * | ConvertTo-Json")

    describe "IIS sessionState for site :'#{site_name}'" do
      subject { iis_configuration }
      its('sslFlags') { should include 'SslRequireCert' }
    end
  end

  if attribute('public_server')
    impact 0.0
    desc 'The server being reviewed is a public IIS 8.5 web
    server, hence this control is Not Applicable.'
  end

  if get_names.empty?
    impact 0.0
    desc 'There are no IIS sites configured hence the control is Not-Applicable'

    describe 'No sites where found to be reviewed' do
      skip 'No sites where found to be reviewed'
    end
  end
end

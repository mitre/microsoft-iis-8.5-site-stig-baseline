control 'SV-214480' do
  title 'The IIS 8.5 private website must employ cryptographic mechanisms (TLS) and require client certificates.'
  desc 'TLS encryption is a required security setting for a private web server. Encryption of private information is essential to ensuring data confidentiality. If private information is not encrypted, it can be intercepted and easily read by an unauthorized party. A private web server must use a FIPS 140-2-approved TLS version, and all non-FIPS-approved SSL versions must be disabled.

NIST SP 800-52 specifies the preferred configurations for government systems.'
  desc 'check', 'Note: If this is a public facing web server, this requirement is Not Applicable.
Note: If the server is hosting SharePoint, this is Not Applicable.
Note: If this server is hosting WSUS, this requirement is Not Applicable.
Note: If SSL is installed on load balancer/proxy server through which traffic is routed to the IIS 8.5 server, and the IIS 8.5 server receives traffic from the load balancer/proxy server, the SSL requirement must be met on the load balancer/proxy server.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Double-click the "SSL Settings" icon under the "IIS" section.

Verify "Require SSL" is checked.

Verify "Client Certificates Required" is selected.

Click the site under review.

Select "Configuration Editor" under the "Management" section.

From the "Section:" drop-down list at the top of the configuration editor, locate "system.webServer/security/access".

The value for "sslFlags" set must include "ssl128".

If the "Require SSL" is not selected, this is a finding.

If the "Client Certificates Required" is not selected, this is a finding.

If the "sslFlags" is not set to "ssl128", this is a finding.'
  desc 'fix', 'Note: If this is a public facing web server, this requirement is Not Applicable.
Note: If the server is hosting SharePoint, this is Not Applicable.
Note: If this server is hosting WSUS, this requirement is Not Applicable.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Double-click the "SSL Settings" icon under the "IIS" section.

Select the "Require SSL" setting.

Select the "Client Certificates Required" setting.

Click "Apply" in the "Actions" pane.

Click the site under review.

Select "Configuration Editor" under the "Management" section.

From the "Section:" drop-down list at the top of the configuration editor, locate “system.webServer/security/access”.

Click on the drop-down list for "sslFlags".

Select the "Ssl128" check box.

Click "Apply" in the "Actions" pane.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000429-WSR-000113'
  tag gid: 'V-214480'
  tag rid: 'SV-214480r879800_rule'
  tag stig_id: 'IISW-SI-000242'
  tag fix_id: 'F-15687r802882_fix'
  tag cci: ['CCI-002476']
  tag nist: ['SC-28 (1)']
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
      its('sslFlags') { should include 'Ssl' }
      its('sslFlags') { should include 'SslRequireCert' }
      its('sslFlags') { should include 'Ssl128' }
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

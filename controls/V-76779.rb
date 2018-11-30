control 'V-76779' do
  title "A private IIS 8.5 website must only accept Secure Socket Layer
  connections."
  desc "Transport Layer Security (TLS) encryption is a required security
  setting for a private web server. Encryption of private information is
  essential to ensuring data confidentiality. If private information is not
  encrypted, it can be intercepted and easily read by an unauthorized party. A
  private web server must use a FIPS 140-2-approved TLS version, and all
  non-FIPS-approved SSL versions must be disabled.

      FIPS 140-2-approved TLS versions include TLS V1.1 or greater. NIST SP
  800-52 specifies the preferred configurations for government systems.
  "
  impact 0.5
  tag "gtitle": 'SRG-APP-000014-WSR-000006'
  tag "gid": 'V-76779'
  tag "rid": 'SV-91475r1_rule'
  tag "stig_id": 'IISW-SI-000203'
  tag "fix_id": 'F-83475r1_fix'
  tag "cci": ['CCI-000068']
  tag "nist": ['AC-17 (2)', 'Rev_4']
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
  tag "check": "Note: If the server being reviewed is a public IIS 8.5 web
  server, this is Not Applicable.

  Follow the procedures below for each site hosted on the IIS 8.5 web server:

  Open the IIS 8.5 Manager.

  Click the site name.

  Double-click the \"SSL Settings\" icon.

  Verify \"Require SSL\" check box is selected.

  If the \"Require SSL\" check box is not selected, this is a finding."
  tag "fix": "Note: If the server being reviewed is a public IIS 8.5 web
  server, this is Not Applicable.

  Follow the procedures below for each site hosted on the IIS 8.5 web server:

  Open the IIS 8.5 Manager.

  Click the site name.

  Double-click the \"SSL Settings\" icon.

  Select \"Require SSL\" check box.

  Select \"Apply\" from the \"Actions\" pane."

  site_names = json(command: 'Get-Website | select -expand name | ConvertTo-Json').params

  site_names.each do |site_name|
    iis_configuration = json(command: "Get-WebConfigurationProperty -Filter system.webServer/security/access 'IIS:\\Sites\\#{site_name}'  -Name * | ConvertTo-Json")

    describe "IIS sessionState for site :'#{site_name}'" do
      subject { iis_configuration }
      its('sslFlags') { should include 'Ssl' }
    end
  end

  if attribute('public_server')
    impact 0.0
    desc 'The server being reviewed is a public IIS 8.5 web
    server, hence this control is Not Applicable.'
  end

  if site_names.empty?
    impact 0.0
    desc 'There are no IIS sites configured hence the control is Not-Applicable'

    describe 'No sites where found to be reviewed' do
      skip 'No sites where found to be reviewed'
    end
  end
end

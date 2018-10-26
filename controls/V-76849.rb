control "V-76849" do
  title "The IIS 8.5 private website have a server certificate issued by DoD
  PKI or DoD-approved PKI Certification Authorities (CAs)."
  desc  "The use of a DoD PKI certificate ensures clients the private website
  they are connecting to is legitimate, and is an essential part of the DoD
  defense-in-depth strategy."
  impact 0.7
  tag "gtitle": "SRG-APP-000427-WSR-000186"
  tag "gid": "V-76849"
  tag "rid": "SV-91545r2_rule"
  tag "stig_id": "IISW-SI-000241"
  tag "fix_id": "F-83545r1_fix"
  tag "cci": ["CCI-002470"]
  tag "nist": ["SC-23 (5)", "Rev_4"]
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

  Click the site name under review.

  Click Bindings in the Action Pane.

  Click the HTTPS type from the box.

  Click Edit.

  Click View and then review and verify the certificate path.

  If the list of CAs in the trust hierarchy does not lead to the DoD PKI Root CA,
  DoD-approved external certificate authority (ECA), or DoD-approved external
  partner, this is a finding.

  If HTTPS is not an available type under site bindings, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the Server name.

  Double-click Server Certificates.

  Click Import under the \"Actions\" pane.

  Browse to the DoD certificate location, select it, and click OK.

  Remove any non-DoD certificates if present.

  Click on the site needing the certificate.

  Select Bindings under the \"Actions\" pane.

  Click on the binding needing a certificate and select Edit, or add a site
  binding for HTTPS.

  Assign the certificate to the website by choosing it under the SSL
  Certificate drop-down and clicking OK."
  certificate_store = command("Import-Module WebAdministration; Get-ChildItem IIS:SSLBindings | select -expand Store | Findstr /v 'Store ---'").stdout.strip
  certificate_subject = command("Get-ChildItem CERT:LocalMachine\\#{certificate_store} | select Subject | Findstr /v 'Subject --'").stdout.strip
  certificate_issuer = command("Get-ChildItem CERT:LocalMachine\\#{certificate_store} | select Issuer | Findstr /v 'Issuer --'").stdout.strip

  describe certificate_subject do
    it { should match  /CN=DoD Root\s\w*/ }
  end
  describe certificate_issuer do
    it { should match  /CN=DoD Root\s\w*/ }
  end

end

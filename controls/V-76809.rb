control "V-76809" do
  title "A private websites authentication mechanism must use client
  certificates to transmit session identifier to assure integrity."
  desc  "A DoD private website must utilize PKI as an authentication mechanism
  for web users. Information systems residing behind web servers requiring
  authorization based on individual identity must use the identity provided by
  certificate-based authentication to support access control decisions. Not using
  client certificates allows an attacker unauthenticated access to private
  websites.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000172-WSR-000104"
  tag "satisfies": ["SRG-APP-000172-WSR-000104", "SRG-APP-000224-WSR-000135",
  "SRG-APP-000427-WSR-000186"]
  tag "gid": "V-76809"
  tag "rid": "SV-91505r1_rule"
  tag "stig_id": "IISW-SI-000220"
  tag "fix_id": "F-83505r1_fix"
  tag "cci": ["CCI-000197", "CCI-001188", "CCI-002470"]
  tag "nist": ["IA-5 (1) (c)", "SC-23 (3)", "SC-23 (5)", "Rev_4"]
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

  Double-click the \"SSL Settings\" icon.

  Verify the \"Clients Certificate Required\" check box is selected.

  If the \"Clients Certificate Required\" check box is not selected, this is a
  finding."
  tag "fix": "Note: If the server being reviewed is a public IIS 8.5 web
  server, this is Not Applicable

  Follow the procedures below for each site hosted on the IIS 8.5 web server:

  Open the IIS 8.5 Manager.

  Double-click the \"SSL Settings\" icon.

  Verify the \"Clients Certificate Required\" check box is selected.
   
  Select \"Apply\" from the \"Actions\" pane."
  sslFlags = command('Get-WebConfigurationProperty -Filter system.webServer/security/access -name * | select -expand sslFlags').stdout.strip
 
  describe "The website ssl flags" do
    subject { sslFlags }
    it {should include 'SslRequireCert'}
  end
end

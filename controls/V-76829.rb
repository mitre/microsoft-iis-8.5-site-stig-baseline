control "V-76829" do
  title "Directory Browsing on the IIS 8.5 website must be disabled."
  desc  "Directory browsing allows the contents of a directory to be displayed
  upon request from a web client. If directory browsing is enabled for a
  directory in IIS, users could receive a web page listing the contents of the
  directory. If directory browsing is enabled the risk of inadvertently
  disclosing sensitive content is increased."
  impact 0.7
  tag "gtitle": "SRG-APP-000251-WSR-000157"
  tag "gid": "V-76829"
  tag "rid": "SV-91525r1_rule"
  tag "stig_id": "IISW-SI-000231"
  tag "fix_id": "F-83525r1_fix"
  tag "cci": ["CCI-001310"]
  tag "nist": ["SI-10", "Rev_4"]
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

  Click the Site.

  Double-click the \"Directory Browsing\" icon.

  If the \"Directory Browsing\" is not installed, this is Not Applicable.

  Under the \"Actions\" pane verify \"Directory Browsing\" is \"Disabled\".

  If \"Directory Browsing\" is not \"Disabled\", this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the Site.

  Double-click the \"Directory Browsing\" icon.

  Under the \"Actions\" pane click \"Disabled\"."
  describe command('Get-WebConfigurationProperty -Filter system.webServer/directoryBrowse -name * | select -expand enabled').stdout.strip do
    it {should cmp 'False'}
  end
end

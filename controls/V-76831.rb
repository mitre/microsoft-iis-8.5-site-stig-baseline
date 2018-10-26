control "V-76831" do
  title "The IIS 8.5 website must prevent a web content directory from being
  displayed."
  desc  "The goal is to control the web users experience in navigating any
  portion of the web document root directories. Ensuring all web content
  directories have at least the equivalent of an indexhtml file is a significant
  factor to accomplish this end. Also enumeration techniques such as URL
  parameter manipulation rely upon being able to obtain information about the
  web servers directory structure by locating directories with default pages
  This practice helps ensure the anonymous web user will not obtain directory
  browsing information or an error message revealing the server type and version."
  impact 0.7
  tag "gtitle": "SRG-APP-000266-WSR-000142"
  tag "gid": "V-76831"
  tag "rid": "SV-91527r1_rule"
  tag "stig_id": "IISW-SI-000232"
  tag "fix_id": "F-83527r1_fix"
  tag "cci": ["CCI-001312"]
  tag "nist": ["SI-11 a", "Rev_4"]
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
  tag "check": "Note: This requirement is only for each site's root directory.

  Follow the procedures below for each site hosted on the IIS 8.5 web server:

  Click the site name under review.

  Double-click \"Default Document\".

  In the \"Actions\" pane, verify the \"Default Document\" feature is enabled.

  If an \"Enable\" option is listed under the \"Actions\" pane, the \"Default
  Document\" feature is not enabled and this is a finding.

  If \"Default Document\" is \"Enabled, review the document types.

  Click the \"Content View\" tab, click on each listed \"Default Document\" and
  click on \"Explore\" under the \"Actions\" pane. Verify there is a document of
  that type in the directory.

  If \"Default Document\" is \"Enabled\" but no listed document types are present
  in the \"Content View\", this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name under review.

  Double-click \"Default Document\".

  In the Actions pane select \"Enable\".

  Click the \"Content View\" tab, click on each listed \"Default Document\" and
  click on \"Explore\" under the \"Actions\" pane. Create a valid document for
  the listed \"Default Document\"."
  describe command('Get-WebConfigurationProperty -Filter system.webServer/defaultDocument -name * | select -expand enabled') do
    its('stdout') {should eq "True\r\n"}
  end
  describe command("Get-WebConfigurationProperty -Filter system.webServer/defaultDocument/files/add -Name value | Select value | Findstr /v 'Value ---'") do
   its('stdout') {should_not eq ''}
  end
end
 



control "V-76803" do
  title "The IIS 8.5 website must have Web Distributed Authoring and Versioning
  (WebDAV) disabled."
  desc  "A web server can be installed with functionality that, just by its
  nature, is not secure. Web Distributed Authoring (WebDAV) is an extension to
  the HTTP protocol that, when developed, was meant to allow users to create,
  change, and move documents on a server, typically a web server or web share.
  Allowing this functionality, development, and deployment is much easier for web
  authors.

      WebDAV is not widely used and has serious security concerns because it may
  allow clients to modify unauthorized files on the web server.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000141-WSR-000085"
  tag "gid": "V-76803"
  tag "rid": "SV-91499r1_rule"
  tag "stig_id": "IISW-SI-000217"
  tag "fix_id": "F-83499r1_fix"
  tag "cci": ["CCI-000381"]
  tag "nist": ["CM-7 a", "Rev_4"]
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

  Select the IIS 8.5 website.

  Review the features listed under the \"IIS\" section.

  If the \"WebDAV Authoring Rules\" icon exists, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Access Server Manager on the IIS 8.5 website.

  Select the Local Server.

  Click on \"Manage\".

  Select \"Add Roles and Features\".

  Click \"Next\" on the \"Before you begin\" dialog box.

  Select \"Role-based or feature-based installation\" on the \"Installation
  Type\" dialog box and click on \"Next\".

  Select the IIS 8.5 web server on the \"Server Selection\" dialog box.

  From the \"Windows Features\" dialog box, navigate to \"World Wide Web
  Services\" >> \"Common HTTP Features\".

  De-select \"WebDAV Publishing\" and click \"Next\" to complete removing the
  WebDAV Publishing feature from the IIS 8.5 web server.

  Select \"Apply\" from the \"Actions\" pane."
  describe windows_feature('Web-DAV-Publishing') do
    it { should_not be_installed }
  end
end


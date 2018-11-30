control 'V-76885' do
  title "Interactive scripts on the IIS 8.5 web server must be located in
  unique and designated folders."
  desc  "CGI and ASP scripts represent one of the most common and exploitable
  means of compromising a web server. All CGI and ASP program files must be
  segregated into their own unique folder to simplify the protection of these
  files. ASP scripts must be placed into a unique folder only containing other
  ASP scripts. JAVA and other technology-specific scripts must also be placed
  into their own unique folders. The placement of CGI, ASP, or equivalent scripts
  to special folders gives the Web Manager or the SA control over what goes into
  those folders and to facilitate access control at the folder level."
  impact 0.5
  tag "gtitle": 'SRG-APP-000141-WSR-000087'
  tag "gid": 'V-76885'
  tag "rid": 'SV-91581r2_rule'
  tag "stig_id": 'IISW-SI-000261'
  tag "fix_id": 'F-83581r2_fix'
  tag "cci": ['CCI-000381']
  tag "nist": ['CM-7 a', 'Rev_4']
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
  tag "check": "Determine whether scripts are used on the web server for the
  target website. Common file extensions include, but are not limited to: .cgi,
  .pl, .vb, .class, .c, .php, .asp, and .aspx.

  All interactive programs must be placed in unique designated folders based on
  CGI or ASP script type.

  Open the IIS 8.5 Manager.

  Right-click the IIS 8.5 web site name and select Explore.

  Search for the listed script extensions. Each script type must be in its unique
  designated folder.

  If scripts are not segregated from web content and in their own unique folders,
  then this is a finding."
  tag "fix": "All interactive programs must be placed in unique designated
  folders based on CGI or ASP script type.

  Open the IIS 8.5 Manager.

  Right-click the IIS 8.5 web server name and select Explore.

  Search for the listed script extensions.

  Move each script type to its unique designated folder.

  Set the permissions to the scripts folders as follows:

  Administrators: FULL
  TrustedInstaller: FULL
  SYSTEM: FULL
  ApplicationPoolId:READ
  Custom Service Account: READ
  Users: READ
  ALL APPLICATION PACKAGES: READ
  "
  describe 'Manual review of website is needed' do
    skip "Manually review to confirm that that interactive scripts on the
    IIS 8.5 web server is located in unique and designated folders"
  end
end

control "V-76815" do
  title "The IIS 8.5 website document directory must be in a separate partition
from the IIS 8.5 websites system files."
  desc  "The web document (home) directory is accessed by multiple anonymous
users when the web server is in production. By locating the web document (home)
directory on the same partition as the web server system file the risk for
unauthorized access to these protected files is increased. Additionally, having
the web document (home) directory path on the same drive as the system folders
also increases the potential for a drive space exhaustion attack."
  impact 0.7
  tag "gtitle": "SRG-APP-000233-WSR-000146"
  tag "gid": "V-76815"
  tag "rid": "SV-91511r1_rule"
  tag "stig_id": "IISW-SI-000224"
  tag "fix_id": "F-83511r1_fix"
  tag "cci": ["CCI-001084"]
  tag "nist": ["SC-3", "Rev_4"]
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

Click the \"Advanced Settings\" from the \"Actions\" pane.

Review the Physical Path.

If the Path is on the same partition as the OS, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Click the “Advanced Settings” from the \"Actions\" pane.

Change the Physical Path to the new partition and directory location."
end


control "V-76819" do
  title "The IIS 8.5 website must be configured to limit the size of web
requests."
  desc  "By setting limits on web requests, it ensures availability of web
services and mitigates the risk of buffer overflow type attacks. The
maxAllowedContentLength Request Filter limits the number of bytes the server
will accept in a request."
  impact 0.7
  tag "gtitle": "SRG-APP-000246-WSR-000149"
  tag "gid": "V-76819"
  tag "rid": "SV-91515r2_rule"
  tag "stig_id": "IISW-SI-000226"
  tag "fix_id": "F-83515r1_fix"
  tag "cci": ["CCI-001094"]
  tag "nist": ["SC-5 (1)", "Rev_4"]
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

Click on the site name.

Double-click the \"Request Filtering\" icon.

Click “Edit Feature Settings” in the \"Actions\" pane.

If the \"maxAllowedContentLength\" value is not explicitly set to \"30000000\"
or less or a length documented and approved by the ISSO, this is a finding.
"
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click the \"Request Filtering\" icon.

Click “Edit Feature Settings” in the \"Actions\" pane.

Set the \"maxAllowedContentLength\" value to \"30000000\" or less."
  describe command('Get-WebConfigurationProperty -Filter system.webServer/security/requestFiltering -name * | select -expand requestLimits | select -expand maxAllowedContentLength').stdout.strip do
    it {should cmp <= 30000000 }
  end
end


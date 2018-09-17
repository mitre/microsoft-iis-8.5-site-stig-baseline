control "V-76817" do
  title "The IIS 8.5 website must be configured to limit the maxURL."
  desc  "Request filtering replaces URLScan in IIS, enabling administrators to
create a more granular rule set with which to allow or reject inbound web
content. By setting limits on web requests, it helps to ensure availability of
web services and may also help mitigate the risk of buffer overflow type
attacks. The MaxURL Request Filter limits the number of bytes the server will
accept in a URL."
  impact 0.7
  tag "gtitle": "SRG-APP-000246-WSR-000149"
  tag "gid": "V-76817"
  tag "rid": "SV-91513r1_rule"
  tag "stig_id": "IISW-SI-000225"
  tag "fix_id": "F-83513r1_fix"
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

If the \"maxUrl\" value is not set to \"4096\" or less, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
web server:

Click the site name under review.

Double-click the \"Request Filtering\" icon.

Click “Edit Feature Settings” in the \"Actions\" pane.

Set the \"maxURL\" value to \"4096\" or less."
end


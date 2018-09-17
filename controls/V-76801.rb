control "V-76801" do
  title "The IIS 8.5 website must have resource mappings set to disable the
serving of certain file types."
  desc  "Resource mapping is the process of tying a particular file type to a
process in the web server that can serve that type of file to a requesting
client and to identify which file types are not to be delivered to a client.

    By not specifying which files can and which files cannot be served to a
user, the web server could deliver to a user web server configuration files,
log files, password files, etc.

    The web server must only allow hosted application file types to be served
to a user and all other types must be disabled.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000141-WSR-000083"
  tag "gid": "V-76801"
  tag "rid": "SV-91497r1_rule"
  tag "stig_id": "IISW-SI-000216"
  tag "fix_id": "F-83497r1_fix"
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
  tag "check": "For \"Handler Mappings\", the ISSO must document and approve
all allowable file extensions the website allows (white list) and denies (black
list) by the website. The white list and black list will be compared to the
\"Handler Mappings\" in IIS 8.5. \"Handler Mappings\" at the site level take
precedence over \"Handler Mappings\" at the server level.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Double-click \"Request Filtering\".

If any file name extensions from the black list have \"Allowed\" set to
\"True\", this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click \"Request Filtering\".

For any file name extensions from the black list which have \"Allowed\" set to
\"True\", remove the file name extension.

Select \"Deny File Name Extension\" from the \"Actions\" pane.

Add each file name extension from the black list.

Select \"Apply\" from the \"Actions\" pane."
end


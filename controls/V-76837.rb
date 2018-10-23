control "V-76837" do
  title "Debugging and trace information used to diagnose the IIS 8.5 website
must be disabled."
  desc  "Setting compilation debug to false ensures detailed error information
does not inadvertently display during live application usage, mitigating the
risk of application information being displayed to users."
  impact 0.7
  tag "gtitle": "SRG-APP-000266-WSR-000160"
  tag "gid": "V-76837"
  tag "rid": "SV-91533r1_rule"
  tag "stig_id": "IISW-SI-000234"
  tag "fix_id": "F-83533r1_fix"
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
  tag "check": "Note: If the \".NET feature\" is not installed, this check is
Not Applicable.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click \".NET Compilation\".

Scroll down to the \"Behavior\" section and verify the value for \"Debug\" is
set to \"False\".

If the \"Debug\" value is not set to \"False\", this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click \".NET Compilation\".

Scroll down to the \"Behavior\" section and set the value for \"Debug\" to
\"False\"."
  describe command('Get-WebConfigurationProperty -Filter system.web/compilation -name * | select -expand debug').stdout.strip do
    it {should cmp 'True' }
  end
end
  

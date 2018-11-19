control "V-76875" do
  title "The maximum queue length for HTTP.sys for each IIS 8.5 website must be
  explicitly configured."
  desc  "In order to determine the possible causes of client connection errors
  and to conserve system resources, it is important to both log errors and manage
  those settings controlling requests to the application pool."
  impact 0.7
  tag "gtitle": "SRG-APP-000516-WSR-000174"
  tag "gid": "V-76875"
  tag "rid": "SV-91571r1_rule"
  tag "stig_id": "IISW-SI-000256"
  tag "fix_id": "F-83571r1_fix"
  tag "cci": ["CCI-000366"]
  tag "nist": ["CM-6 b", "Rev_4"]
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
  tag "check": "Open the IIS 8.5 Manager.

  Perform for each Application Pool.

  Click the Application Pools.

  Highlight an Application Pool to review and click \"Advanced Settings\" in the
  \"Actions\" pane.

  Scroll down to the \"General\" section and verify the value for \"Queue
  Length\" is set to 1000.

  If the \"Queue Length\" is set to \"1000\" or less, this is not a finding."
  tag "fix": "Open the IIS 8.5 Manager.

  Click the Application Pools.

  Highlight an Application Pool to review and click \"Advanced Settings\" in the
  \"Actions\" pane.

  Scroll down to the General section and set the value for Queue Length to
  1000 or less.

  Click OK."

  queueLength = command('Get-WebConfigurationProperty -Filter system.applicationHost/applicationPools -name * | select -expand applicationPoolDefaults | select -expand queueLength').stdout.strip

  describe "The maximum queue length for HTTP.sys for each IIS 8.5 website" do
    subject { queueLength }
    it {should cmp <= '1000'}
  end
end

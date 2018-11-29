control "V-76873" do
  title "The application pool for each IIS 8.5 website must have a recycle time
  explicitly set."
  desc  "Application pools can be periodically recycled to avoid unstable
  states possibly leading to application crashes, hangs, or memory leaks."
  impact 0.7
  tag "gtitle": "SRG-APP-000516-WSR-000174"
  tag "gid": "V-76873"
  tag "rid": "SV-91569r1_rule"
  tag "stig_id": "IISW-SI-000255"
  tag "fix_id": "F-83569r1_fix"
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
  tag "check": "Note: Recycling Application Pools can create an unstable
  environment in a 64-bit SharePoint environment. If operational issues arise,
  with supporting documentation from the ISSO this check can be downgraded to a
  Cat III.

  Open the IIS 8.5 Manager.

  Perform for each Application Pool.

  Click the Application Pools.

  Highlight an Application Pool and click \"Advanced Settings\" in the Action
  Pane.

  Scroll down to the \"Recycling\" section and expand the \"Generate Recycle
  Event Log Entry\" section.

  Verify both the \"Regular time interval\" and \"Specific time\" options are set
  to \"True\".

  If both the \"Regular time interval\" and \"Specific time\" options are not set
  to \"True\", this is a finding."
  tag "fix": "Open the IIS 8.5 Manager.

  Click the Application Pools.

  Perform for each Application Pool.

  Highlight an Application Pool and click \"Advanced Settings\" in the Action
  Pane.

  Scroll down to the \"Recycling\" section and expand the \"Generate Recycle
  Event Log Entry\" section.

  Set both the \"Regular time interval\" and \"Specific time\" options to
  \"True\"."

  get_names = command("Get-Website | select name | findstr /v 'name ---'").stdout.strip.split("\r\n")
  get_names.each do |names|
      n = names.strip

    get_recycle_time = command("Get-WebConfigurationProperty -pspath \"IIS:\Sites\\#{n}\" -Filter system.applicationHost/applicationPools -name * | select -expand applicationPoolDefaults | select -expand recycling | select -expand logEventOnRecycle").stdout.strip.split("\r\n")
    get_recycle_time.each do |recycle_time|
  
      describe "The application pool should set the recycle time for IIS site: #{n}" do
        subject { recycle_time }
        it {should include 'Time'}
        it {should include 'Schedule'}
      end
    end
  end
  if get_names.empty?
    describe "There are no IIS sites configured" do
      impact 0.0
      skip "Control not applicable"
    end
  end
end

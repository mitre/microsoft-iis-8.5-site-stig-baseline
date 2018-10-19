control "V-76869" do
  title "The amount of virtual memory an application pool uses for each IIS 8.5
website must be explicitly set."
  desc  "IIS application pools can be periodically recycled to avoid unstable
states possibly leading to application crashes, hangs, or memory leaks. By
default, application pool recycling is overlapped, which means the worker
process to be shut down is kept running until after a new worker process is
started. After a new worker process starts, new requests are passed to it. The
old worker process shuts down after it finishes processing its existing
requests, or after a configured time-out, whichever comes first. This way of
recycling ensures uninterrupted service to clients."
  impact 0.7
  tag "gtitle": "SRG-APP-000516-WSR-000174"
  tag "gid": "V-76869"
  tag "rid": "SV-91565r2_rule"
  tag "stig_id": "IISW-SI-000253"
  tag "fix_id": "F-83565r1_fix"
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
mitigation steps can be set, to include setting the “Fixed number or requests”,
“Specific time”, and “Private memory usage” in the recycling conditions lieu of
the “Virtual memory” setting. If mitigation is used in lieu of this
requirement, with supporting documentation from the ISSO, this check can be
downgraded to a Cat III.

Open the IIS 8.5 Manager.

Perform for each Application Pool.

Click on “Application Pools”.

Highlight an Application Pool and click \"Advanced Settings\" in the Action
Pane.

In the \"Advanced Settings\" dialog box scroll down to the \"Recycling\"
section and verify the value for \"Virtual Memory Limit\" is not set to 0.

If the value for \"Virtual Memory Limit\" is set to 0, this is a finding.
"
  tag "fix": "Open the IIS 8.5 Manager.

Click on Application Pools.

Perform for each Application Pool.

Highlight an Application Pool and click \"Advanced Settings\" in the Action
Pane.

In the \"Advanced Settings\" dialog box scroll down to the \"Recycling\"
section and set the value for \"Virtual Memory Limit\" to a value other than
\"0\".

Click OK."
  describe command('Get-WebConfigurationProperty -Filter system.applicationHost/applicationPools -name * | select -expand applicationPoolDefaults | select -expand recycling | select -expand periodicRestart | select -expand memory').stdout.strip do
    it {should_not cmp 0 }
  end
end


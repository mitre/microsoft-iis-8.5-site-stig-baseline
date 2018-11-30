control "V-76871" do
  title "The amount of private memory an application pool uses for each IIS 8.5
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
  tag "gid": "V-76871"
  tag "rid": "SV-91567r1_rule"
  tag "stig_id": "IISW-SI-000254"
  tag "fix_id": "F-83567r1_fix"
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

  Scroll down to the \"Recycling\" section and verify the value for \"Private
  Memory Limit\" is set to a value other than \"0\".

  If the \"Private Memory Limit\" is set to a value of \"0\", this is a finding."
  tag "fix": "Open the IIS 8.5 Manager.

  Click the Application Pools.

  Perform for each Application Pool.

  Highlight an Application Pool and click \"Advanced Settings\" in the Action
  Pane.

  Scroll down to the \"Recycling\" section and set the value for \"Private Memory
  Limit\" to a value other than \"0\"."

  site_names = json(command: 'Get-Website | select -expand name | ConvertTo-Json').params

  application_pool_names = json(command: 'Get-ChildItem -Path IIS:\AppPools | select -expand name | ConvertTo-Json').params

  application_pool_names.each do |application_pool|
    iis_configuration = json(command: "Get-ItemProperty 'IIS:\\AppPools\\#{application_pool}' -name * | select -expand recycling | select -expand periodicRestart | ConvertTo-Json")

    describe "The amount of private memory for IIS Application Pool :'#{application_pool}' uses" do
      subject { iis_configuration }
      its('privateMemory') { should_not cmp 0 }
    end
  end
  if application_pool_names.empty?
    describe "There are no IIS application pools configured" do
      impact 0.0
      skip "Control not applicable"
    end
  end
end

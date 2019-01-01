control 'V-76873' do
  title "The application pool for each IIS 8.5 website must have a recycle time
  explicitly set."
  desc "Application pools can be periodically recycled to avoid unstable
  states possibly leading to application crashes, hangs, or memory leaks."
  impact 0.5
  tag "gtitle": 'SRG-APP-000516-WSR-000174'
  tag "gid": 'V-76873'
  tag "rid": 'SV-91569r1_rule'
  tag "stig_id": 'IISW-SI-000255'
  tag "fix_id": 'F-83569r1_fix'
  tag "cci": ['CCI-000366']
  tag "nist": ['CM-6 b', 'Rev_4']
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

  application_pool_names = json(command: 'ConvertTo-Json @(Get-ChildItem -Path IIS:\AppPools | select -expand name)').params

  application_pool_names.each do |application_pool|
    iis_configuration = json(command: "Get-ItemProperty 'IIS:\\AppPools\\#{application_pool}' -name * | select -expand recycling | ConvertTo-Json")

    describe "The recycle time for IIS Application Pool :'#{application_pool}" do
      subject { iis_configuration }
      its('logEventOnRecycle') { should include 'Time' }
      its('logEventOnRecycle') { should include 'Schedule' }
    end
  end
  if application_pool_names.empty?
    impact 0.0
    desc 'There are no application pool configured hence the control is Not-Applicable'

    describe 'No application pool where found to be reviewed' do
      skip 'No application pool where found to be reviewed'
    end
  end
end

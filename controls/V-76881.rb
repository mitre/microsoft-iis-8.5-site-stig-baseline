control "V-76881" do
  title "The application pools rapid fail protection settings for each IIS 8.5
  website must be managed."
  desc  "Windows Process Activation Service (WAS) manages application pool
  configuration and may flag a worker process as unhealthy and shut it down. The
  rapid fail protection must be set to a suitable value. A lack of response from
  the worker process might mean the worker process does not have a thread to
  respond to the ping request, or that it is hanging for some other reason. The
  ping interval and ping response time may need adjustment to gain access to
  timely information about application pool health without triggering false,
  unhealthy conditions."
  impact 0.7
  tag "gtitle": "SRG-APP-000516-WSR-000174"
  tag "gid": "V-76881"
  tag "rid": "SV-91577r1_rule"
  tag "stig_id": "IISW-SI-000259"
  tag "fix_id": "F-83577r1_fix"
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

  Click the Application Pools.

  Perform for each Application Pool.

  Highlight an Application Pool to review and click \"Advanced Settings\" in the
  \"Actions\" pane.

  Scroll down to the \"Rapid Fail Protection\" section and verify the value for
  \"Failure Interval\" is set to \"5\".

  If the \"Failure Interval\" is not set to \"5\" or less, this is a finding."
  tag "fix": "Open the IIS 8.5 Manager.

  Click the Application Pools.

  Perform for each Application Pool.

  Highlight an Application Pool to review and click \"Advanced Settings\" in the
  \"Actions\" pane.

  Scroll down to the \"Rapid Fail Protection\" section and set the value for
  \"Failure Interval\" to \"5\" or less.

  Click OK."

  site_names = json(command: 'Get-Website | select -expand name | ConvertTo-Json').params

  application_pool_names = json(command: 'Get-ChildItem -Path IIS:\AppPools | select -expand name | ConvertTo-Json').params

  application_pool_names.each do |application_pool|
    iis_configuration = json(command: "Get-ItemProperty 'IIS:\\AppPools\\#{application_pool}' -name * | select -expand failure | select -expand rapidFailProtectionInterval| ConvertTo-Json")

    describe "The rapid fail protection total minutes for IIS Application Pool :'#{application_pool}'" do
      subject { iis_configuration }
      its('TotalMinutes') { should cmp <= 5} 
    end
  end
  if application_pool_names.empty?
    describe "There are no IIS application pools configured" do
      impact 0.0
      skip "Control not applicable"
    end
  end
end

control "V-76839" do
  title "The Idle Time-out monitor for each IIS 8.5 website must be enabled."
  desc  "The idle time-out attribute controls the amount of time a worker
  process will remain idle before it shuts down. A worker process is idle if it
  is not processing requests and no new requests are received.

      The purpose of this attribute is to conserve system resources; the default
  value for idle time-out is 20 minutes.

      By default, the World Wide Web (WWW) service establishes an overlapped
  recycle, in which the worker process to be shut down is kept running until
  after a new worker process is started.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000295-WSR-000012"
  tag "gid": "V-76839"
  tag "rid": "SV-91535r1_rule"
  tag "stig_id": "IISW-SI-000235"
  tag "fix_id": "F-83535r1_fix"
  tag "cci": ["CCI-002361"]
  tag "nist": ["AC-12", "Rev_4"]
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

  Click the Application Pools.

  Highlight an Application Pool to review and click \"Advanced Settings\" in the
  \"Actions\" pane.

  Scroll down to the \"Process Model\" section and verify the value for \"Idle
  Time-out\" is set to \"20\".

  If the \"Idle Time-out\" is not set to \"20\" or less, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the Application Pools.

  Highlight an Application Pool to review and click \"Advanced Settings\" in the
  \"Actions\" pane.

  Scroll down to the \"Process Model\" section and set the value for \"Idle
  Time-out\" to \"20\" or less."
  describe command('Get-WebConfigurationProperty -Filter system.applicationHost/applicationPools -name * | select -expand applicationPoolDefaults | select -expand processModel | select -expand idleTimeout | select -expand TotalMinutes').stdout.strip do
    it {should cmp <= 20}
  end
end

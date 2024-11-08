control 'SV-214474' do
  title 'The Idle Time-out monitor for each IIS 8.5 website must be enabled.'
  desc 'The idle time-out attribute controls the amount of time a worker process will remain idle before it shuts down. A worker process is idle if it is not processing requests and no new requests are received.

The purpose of this attribute is to conserve system resources; the default value for idle time-out is 20 minutes.

By default, the World Wide Web (WWW) service establishes an overlapped recycle, in which the worker process to be shut down is kept running until after a new worker process is started.'
  desc 'check', 'If this IIS 8.5 installation is supporting Microsoft Exchange, and not otherwise hosting any content, this requirement is Not Applicable.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the Application Pools.

Highlight an Application Pool to review and click "Advanced Settings" in the "Actions" pane.

Scroll down to the "Process Model" section and verify the value for "Idle Time-out" is set to "20".

If the "Idle Time-out" is not set to "20" or less, this is a finding.

If the "Idle Time-out" is set to "0", this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the Application Pools.

Highlight an Application Pool to review and click "Advanced Settings" in the "Actions" pane.

Scroll down to the "Process Model" section and set the value for "Idle Time-out" to "20" or less.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000295-WSR-000012'
  tag gid: 'V-214474'
  tag rid: 'SV-214474r879673_rule'
  tag stig_id: 'IISW-SI-000235'
  tag fix_id: 'F-15681r310627_fix'
  tag cci: ['CCI-002361']
  tag nist: ['AC-12']
  tag 'false_negatives'
  tag 'false_positives'
  tag 'documentable'
  tag 'mitigations'
  tag 'severity_override_guidance'
  tag 'potential_impacts'
  tag 'third_party_tools'
  tag 'mitigation_controls'
  tag 'responsibility'
  tag 'ia_controls'
  tag 'check'
  tag 'fix'

  get_names = command("Get-Website | select name | findstr /v 'name ---'").stdout.strip.split("\r\n")
  get_idleTimeout_monitor = command('Get-WebConfigurationProperty -pspath "IIS:\Sites\*" -Filter system.applicationHost/applicationPools -name * | select -expand applicationPoolDefaults | select -expand processModel | select -expand idleTimeout | select -expand TotalMinutes').stdout.strip.split("\r\n")

  get_idleTimeout_monitor.zip(get_names).each do |idleTimeout_monitor, names|
    n = names.strip

    describe "The IIS site: #{n} websites idle monitor time-out" do
      subject { idleTimeout_monitor }
      it { should cmp <= 20 }
    end
  end
  if get_names.empty?
    impact 0.0
    desc 'There are no IIS sites configured hence the control is Not-Applicable'

    describe 'No sites where found to be reviewed' do
      skip 'No sites where found to be reviewed'
    end
  end
end

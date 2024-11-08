control 'SV-214477' do
  title 'The IIS 8.5 website must use a logging mechanism that is configured to allocate log record storage capacity large enough to accommodate the logging requirements of the IIS 8.5 website.'
  desc 'In order to make certain that the logging mechanism used by the web server has sufficient storage capacity in which to write the logs, the logging mechanism needs to be able to allocate log record storage capacity.

The task of allocating log record storage capacity is usually performed during initial installation of the logging mechanism. The system administrator will usually coordinate the allocation of physical drive space with the web server administrator along with the physical location of the partition and disk. Refer to NIST SP 800-92 for specific requirements on log rotation and storage dependent on the impact of the web server.'
  desc 'check', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Access the IIS 8.5 web server IIS 8.5 Manager.

Under "IIS" double-click on the "Logging" icon.

In the "Logging" configuration box, determine the "Directory:" to which the "W3C" logging is being written.

Confirm with the System Administrator that the designated log path is of sufficient size to maintain the logging.

Under "Log File Rollover", verify the "Do not create new log files" is not selected.

Verify a schedule is configured to rollover log files on a regular basis.

Consult with the System Administrator to determine if there is a documented process for moving the log files off of the IIS 8.5 web server to another logging device.

If the designated logging path device is not of sufficient space to maintain all log files and there is not a schedule to rollover files on a regular basis, this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Under "IIS" double-click on the "Logging" icon.

If necessary, in the "Logging" configuration box, redesignate a log path to a location able to house the logs.

Under "Log File Rollover", deselect the "Do not create new log files" setting.

Configure a schedule to rollover log files on a regular basis.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000357-WSR-000150'
  tag gid: 'V-214477'
  tag rid: 'SV-214477r879730_rule'
  tag stig_id: 'IISW-SI-000238'
  tag fix_id: 'F-15684r310636_fix'
  tag cci: ['CCI-001849']
  tag nist: ['AU-4']
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

  log_directory_path = attribute('log_directory')

  get_names = json(command: 'ConvertTo-Json @(Get-Website | select -expand name)').params

  system_drive = command('$env:SystemDrive').stdout.strip

  get_log_directory = command("Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter 'system.applicationHost/sites/*/logFile' -name * | select -expand directory").stdout.strip.split("\r\n")

  get_log_directory.zip(get_names).each do |log_directory, name|
    log_directory = log_directory.gsub(/%SystemDrive%/, system_drive.to_s)

    describe "The IIS site: #{name} log directory" do
      subject { log_directory }
      it { should cmp log_directory_path.to_s }
    end
  end

  get_log_period = command('Get-WebConfigurationProperty -pspath "IIS:\Sites\*" -Filter system.ApplicationHost/log -name centralW3CLogFile | select -expand period').stdout.strip.split("\r\n")

  get_log_period.zip(get_names).each do |log_period, name|
    describe "The IIS site: #{name} websites log file rollover period" do
      subject { log_period }
      it { should cmp 'Daily' }
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

LOG_DIRECTORY= attribute(
    'log_directory',
    description: 'Path of IIS log directory',
    default: '%SystemDrive%\inetpub\logs\LogFiles'
)

control "V-76845" do
  title "The IIS 8.5 website must use a logging mechanism that is configured to
  allocate log record storage capacity large enough to accommodate the logging
  requirements of the IIS 8.5 website."
  desc  "In order to make certain that the logging mechanism used by the web
  server has sufficient storage capacity in which to write the logs, the logging
  mechanism needs to be able to allocate log record storage capacity.

      The task of allocating log record storage capacity is usually performed
  during initial installation of the logging mechanism. The system administrator
  will usually coordinate the allocation of physical drive space with the web
  server administrator along with the physical location of the partition and
  disk. Refer to NIST SP 800-92 for specific requirements on log rotation and
  storage dependent on the impact of the web server.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000357-WSR-000150"
  tag "gid": "V-76845"
  tag "rid": "SV-91541r1_rule"
  tag "stig_id": "IISW-SI-000238"
  tag "fix_id": "F-83541r1_fix"
  tag "cci": ["CCI-001849"]
  tag "nist": ["AU-4", "Rev_4"]
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

  Access the IIS 8.5 web server IIS 8.5 Manager.

  Under \"IIS\" double-click on the \"Logging\" icon.

  In the \"Logging\" configuration box, determine the \"Directory:\" to which the
  \"W3C\" logging is being written.

  Confirm with the System Administrator that the designated log path is of
  sufficient size to maintain the logging.

  Under \"Log File Rollover\", verify the \"Do not create new log files\" is not
  selected.

  Verify a schedule is configured to rollover log files on a regular basis.

  Consult with the System Administrator to determine if there is a documented
  process for moving the log files off of the IIS 8.5 web server to another
  logging device.

  If the designated logging path device is not of sufficient space to maintain
  all log files and there is not a schedule to rollover files on a regular basis,
  this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Under \"IIS\" double-click on the \"Logging\" icon.

  If necessary, in the \"Logging\" configuration box, redesignate a log path to a
  location able to house the logs.

  Under \"Log File Rollover\", deselect the \"Do not create new log files\"
  setting.

  Configure a schedule to rollover log files on a regular basis."
  describe command('Get-WebConfigurationProperty -pspath "MACHINE/WEBROOT/APPHOST" -filter "system.ApplicationHost/log" -Name centralW3CLogFile | select -expandProperty directory').stdout.strip do
    it {should cmp "#{LOG_DIRECTORY}"}
  end
  describe command('Get-WebConfigurationProperty -pspath "MACHINE/WEBROOT/APPHOST" -filter "system.ApplicationHost/log" -Name centralW3CLogFile | select -expandProperty period').stdout.strip do
    it {should cmp "Daily"}
  end
end

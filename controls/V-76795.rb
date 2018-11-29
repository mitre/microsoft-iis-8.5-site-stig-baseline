control "V-76795" do
  title "The log information from the IIS 8.5 website must be protected from
  unauthorized modification or deletion."
  desc  "A major tool in exploring the website use, attempted use, unusual
  conditions, and problems are the access and error logs. In the event of a
  security incident, these logs can provide the SA and the web manager with
  valuable information. Failure to protect log files could enable an attacker to
  modify the log file data or falsify events to mask an attacker's activity."
  impact 0.7
  tag "gtitle": "SRG-APP-000120-WSR-000070"
  tag "gid": "V-76795"
  tag "rid": "SV-91491r2_rule"
  tag "stig_id": "IISW-SI-000213"
  tag "fix_id": "F-83491r1_fix"
  tag "cci": ["CCI-000163", "CCI-000164"]
  tag "nist": ["AU-9", "AU-9", "Rev_4"]
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

  Click the site name.

  Click the \"Logging\" icon.

  Click \"Browse\" and navigate to the directory where the log files are stored.

  Right-click the log file name to review and click Properties.

  Click the Security tab; verify only authorized groups are listed, if others
  are listed, this is a finding.

  Note: The log file should be restricted as follows:

  SYSTEM, Auditors group: Full
  SA, web managers: Read
  "
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name.

  Click the \"Logging\" icon.

  Click \"Browse\" and navigate to the directory where the log files are stored.

  Right-click the log file name to review and click Properties.

  Click the Security tab.

  Set the log file permissions for the appropriate group."
  #obtain the log directory
  log_directory = command("Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter 'system.applicationHost/sites/siteDefaults/logFile' -name * | select -expand directory").stdout.strip
  get_log_directory = command("Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter 'system.applicationHost/sites/*/logFile' -name * | select -expand directory").stdout.strip.split("\r\n")

  get_names = command("Get-Website | select name | findstr /v 'name ---'").stdout.strip.split("\r\n")
  dirs = []

  get_log_directory.zip(get_names).each do |log_dir, names|

    get_system_drive = command("env | findstr SYSTEMDRIVE").stdout.strip

    system_drive  = get_system_drive[12..-1]
 
    dirs = log_dir.gsub(/%SystemDrive%/, "#{system_drive}")
 
    describe "IIS site #{names} log file directory #{dirs}" do
      subject {file("#{dirs}")}
         it { should be_allowed('read', by_user: 'BUILTIN\\Administrators Allow') }
         it { should be_allowed('full-control', by_user: 'NT AUTHORITY\\SYSTEM') }
         it { should be_allowed('full-control', by_user: 'NT SERVICE\\TrustedInstaller') }
    end
  end
  if get_names.empty?
    describe "There are no IIS sites configured" do
      impact 0.0
      skip "Control not applicable"
    end
  end
end

control 'SV-214463' do
  title 'The IIS 8.5 website document directory must be in a separate partition from the IIS 8.5 websites system files.'
  desc 'The web document (home) directory is accessed by multiple anonymous users when the web server is in production. By locating the web document (home) directory on the same partition as the web server system file the risk for unauthorized access to these protected files is increased. Additionally, having the web document (home) directory path on the same drive as the system folders also increases the potential for a drive space exhaustion attack.'
  desc 'check', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Click the "Advanced Settings" from the "Actions" pane.

Review the Physical Path.

If the Path is on the same partition as the OS, this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Click the “Advanced Settings” from the "Actions" pane.

Change the Physical Path to the new partition and directory location.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000233-WSR-000146'
  tag gid: 'V-214463'
  tag rid: 'SV-214463r879643_rule'
  tag stig_id: 'IISW-SI-000224'
  tag fix_id: 'F-15670r310594_fix'
  tag cci: ['CCI-001084']
  tag nist: ['SC-3']
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

  get_names.each do |names|
    n = names.strip
    system_drive = command('$env:SystemDrive').stdout.strip

    get_physical_path = command("(Get-Website -Name '#{n}').PhysicalPath").stdout.strip.gsub(/%SystemDrive%/, system_drive.to_s)

    path = get_physical_path[0..1]
    describe "IIS site #{n} physical path #{path}" do
      subject { path.gsub(/%SystemDrive%/, system_drive.to_s) }
      it { should_not cmp system_drive.to_s }
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

control 'V-76823' do
  title "Non-ASCII characters in URLs must be prohibited by any IIS 8.5
  website."
  desc "By setting limits on web requests, it ensures availability of web
  services and mitigates the risk of buffer overflow type attacks. The allow
  high-bit characters Request Filter enables rejection of requests containing
  non-ASCII characters."
  impact 0.5
  tag "gtitle": 'SRG-APP-000246-WSR-000149'
  tag "gid": 'V-76823'
  tag "rid": 'SV-91519r1_rule'
  tag "stig_id": 'IISW-SI-000228'
  tag "fix_id": 'F-83519r1_fix'
  tag "cci": ['CCI-001094']
  tag "nist": ['SC-5 (1)', 'Rev_4']
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

  Click on the site name.

  Double-click the \"Request Filtering\" icon.

  Click Edit Feature Settings in the \"Actions\" pane.

  If the \"Allow high-bit characters\" check box is checked, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name under review.

  Double-click the \"Request Filtering\" icon.

  Click Edit Feature Settings in the \"Actions\" pane.

  Uncheck the \"Allow high-bit characters\" check box."

  get_names = command("Get-Website | select name | findstr /v 'name ---'").stdout.strip.split("\r\n")
  get_allowHighBitCharacters = command('Get-WebConfigurationProperty -pspath "IIS:\Sites\*" -Filter system.webServer/security/requestFiltering -name * | select -expand allowHighBitCharacters').stdout.strip.split("\r\n")

  get_allowHighBitCharacters.zip(get_names).each do |allowHighBitCharacters, names|
    n = names.strip

    describe "The IIS site: #{n} websites Allow high-bit characters" do
      subject { allowHighBitCharacters }
      it { should cmp 'True' }
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

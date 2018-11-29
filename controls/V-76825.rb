control "V-76825" do
  title "Double encoded URL requests must be prohibited by any IIS 8.5 website."
  desc  "Request filtering enables administrators to create a more granular
  rule set with which to allow or reject inbound web content. By setting limits
  on web requests, it ensures availability of web services and mitigates the risk
  of buffer overflow type attacks. When the “Allow double escaping” option is
  disabled it prevents attacks that rely on double-encoded requests."
  impact 0.7
  tag "gtitle": "SRG-APP-000246-WSR-000149"
  tag "gid": "V-76825"
  tag "rid": "SV-91521r1_rule"
  tag "stig_id": "IISW-SI-000229"
  tag "fix_id": "F-83521r1_fix"
  tag "cci": ["CCI-001094"]
  tag "nist": ["SC-5 (1)", "Rev_4"]
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

  If the \"Allow double escaping\" check box is checked, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name under review.

  Double-click the \"Request Filtering\" icon.

  Click Edit Feature Settings in the \"Actions\" pane.

  Uncheck the \"Allow double escaping\" check box."
  
  get_names = command("Get-Website | select name | findstr /v 'name ---'").stdout.strip.split("\r\n")
  get_allowDoubleEscaping = command('Get-WebConfigurationProperty -pspath "IIS:\Sites\*" -Filter system.webServer/security/requestFiltering -name * | select -expand allowDoubleEscaping').stdout.strip.split("\r\n")

  get_allowDoubleEscaping.zip(get_names).each do |allowDoubleEscaping, names|
    n = names.strip

    describe "The IIS site: #{n} websites Allow double escaping" do
      subject { allowDoubleEscaping }
      it {should cmp 'False'}
    end
  end
  if get_names.empty?
    describe "There are no IIS sites configured" do
      impact 0.0
      skip "Control not applicable"
    end
  end
end

control 'V-76883' do
  title "The Content Location header on the IIS 8.5 website must not contain
  proprietary IP addresses."
  desc "When using static HTML pages, a Content-Location header is added to
  the response. The Internet Information Server (IIS) Content-Location may
  reference the IP address of the server, rather than the Fully Qualified Domain
  Name (FQDN) or Hostname. This header may expose internal IP addresses that are
  usually hidden or masked behind a Network Address Translation (NAT) firewall or
  proxy server. There is a value that can be modified in the IIS metabase to
  change the default behavior from exposing IP addresses, to sending the FQDN
  instead."
  impact 0.5
  tag "gtitle": 'SRG-APP-000516-WSR-000174'
  tag "gid": 'V-76883'
  tag "rid": 'SV-91579r1_rule'
  tag "stig_id": 'IISW-SI-000260'
  tag "fix_id": 'F-83579r1_fix'
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
  tag "check": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Double-click Configuration Editor.

  From the drop-down box select system.webserver serverRuntime.

  If alternateHostName has no assigned value, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Double-click Configuration Editor.

  Click the drop-down box located at the top of the Configuration Editor Pane.

  Scroll until the system.webserver/serverRuntime is found, double-click the
  element, and add the appropriate value."

  get_names = command("Get-Website | select name | findstr /v 'name ---'").stdout.split("\r\n")

  get_names.each do |names|
    n = names.strip
    get_alternateHostName = command("Get-WebConfigurationProperty  -pspath \"IIS:\Sites\\#{n}\" -Filter system.webServer/serverRuntime -name * | select -expand alternateHostName").stdout.strip
    describe "The IIS site: #{n} alternate host name" do
      subject { get_alternateHostName }
      it { should_not eq '' }
    end
  end
  if site_names.empty?
    impact 0.0
    desc 'There are no IIS sites configured hence the control is Not-Applicable'

    describe 'No sites where found to be reviewed' do
      skip 'No sites where found to be reviewed'
    end
  end
end

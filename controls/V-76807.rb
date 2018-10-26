SITE_NAME= attribute(
    'site_name',
    description: 'Name of IIS site',
    default: 'Default Web Site'
)

HTTP_IP= attribute(
    'http_ip',
    description: 'IP address used for http',
    default: '10.0.2.15'
)

HTTP_HOSTNAME= attribute(
    'http_hostname',
    description: 'Hostname used for http',
    default: 'local'
)

HTTPS_IP= attribute(
    'https_ip',
    description: 'IP address used for https',
    default: '10.0.2.15'
)

HTTPS_HOSTNAME= attribute(
    'https_hostname',
    description: 'Hostname used for https',
    default: '10.0.2.15'
)

 control "V-76807" do
  title "Each IIS 8.5 website must be assigned a default host header."
  desc  "The web server must be configured to listen on a specified IP address
  and port. Without specifying an IP address and port for the web server to
  utilize, the web server will listen on all IP addresses available to the
  hosting server. If the web server has multiple IP addresses, i.e., a management
  IP address, the web server will also accept connections on the management IP
  address.

      Accessing the hosted application through an IP address normally used for
  non-application functions opens the possibility of user access to resources,
  utilities, files, ports, and protocols that are protected on the desired
  application IP address.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000142-WSR-000089"
  tag "gid": "V-76807"
  tag "rid": "SV-91503r1_rule"
  tag "stig_id": "IISW-SI-000219"
  tag "fix_id": "F-83503r1_fix"
  tag "cci": ["CCI-000382"]
  tag "nist": ["CM-7 b", "Rev_4"]
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

  Right-click on the site name under review.

  Select Edit Bindings.

  Verify there are hostname entries and unique IP addresses assigned to port 80
  for HTTP and port 443 for HTTPS.

  If both hostname entries and unique IP addresses are not configure to port 80
  for HTTP and port 443 for HTTPS, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Right-click on the site name under review.

  Select Edit Bindings.

  Assign hostname entries and unique IP addresses to port 80 for HTTP and port
  443 for HTTPS.

  Click \"OK\".

  Select \"Apply\" from the \"Actions\" pane."

  describe iis_site("#{SITE_NAME}") do
    it { should exist }
    it { should have_binding("http #{HTTP_IP}:80:#{HTTP_HOSTNAME}") }
    it { should have_binding("https #{HTTPS_IP}:443:#{HTTPS_HOSTNAME}") }
  end
end

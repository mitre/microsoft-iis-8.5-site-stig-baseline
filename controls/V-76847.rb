SITE_NAME= attribute(
    'site_name',
    description: 'Name of IIS site',
    default: ['tt', 'Default']
)

HTTP_IP= attribute(
    'http_ip',
    description: 'IP address used for http',
    default: ['10.0.2.15', '0.0.0.0']
)

HTTP_HOSTNAME= attribute(
    'http_hostname',
    description: 'Hostname used for http',
    default: ['local', 'l']
)

HTTPS_IP= attribute(
    'https_ip',
    description: 'IP address used for https',
    default: ['10.0.2.15', '0.0.0.0']
)

HTTPS_HOSTNAME= attribute(
    'https_hostname',
    description: 'Hostname used for https',
    default: ['localhttps', 'test']
)

control "V-76847" do
  title "The IIS 8.5 websites must utilize ports, protocols, and services
  according to PPSM guidelines."
  desc  "Web servers provide numerous processes, features, and functionalities
  that utilize TCP/IP ports. Some of these processes may be deemed unnecessary or
  too unsecure to run on a production system.

      The web server must provide the capability to disable or deactivate
  network-related services that are deemed to be non-essential to the server
  mission, are too unsecure, or are prohibited by the PPSM CAL and vulnerability
  assessments.

      Failure to comply with DoD ports, protocols, and services (PPS)
  requirements can result in compromise of enclave boundary protections and/or
  functionality of the AIS.

      The ISSM will ensure web servers are configured to use only authorized PPS
  in accordance with the Network Infrastructure STIG, DoD Instruction 8551.1,
  Ports, Protocols, and Services Management (PPSM), and the associated Ports,
  Protocols, and Services (PPS) Assurance Category Assignments List.
  " 
  impact 0.7
  tag "gtitle": "SRG-APP-000383-WSR-000175"
  tag "gid": "V-76847"
  tag "rid": "SV-91543r1_rule"
  tag "stig_id": "IISW-SI-000239"
  tag "fix_id": "F-83543r1_fix"
  tag "cci": ["CCI-001762"]
  tag "nist": ["CM-7 (1) (b)", "Rev_4"]
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
  tag "check": "Review the website to determine if HTTP and HTTPs (e.g., 80 and
  443) are used in accordance with those ports and services registered and
  approved for use by the DoD PPSM. Any variation in PPS will be documented,
  registered, and approved by the PPSM.

  Follow the procedures below for each site hosted on the IIS 8.5 web server:

  Open the IIS 8.5 Manager.

  Click the site name under review.

  In the “Action” Pane, click “Bindings”.

  Review the ports and protocols. If unknown ports or protocols are used, then
  this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name under review.

  In the “Action” Pane, click “Bindings\".

  Edit to change an existing binding and set the correct ports and protocol."
  
  SITE_NAME.zip(HTTP_IP, HTTP_HOSTNAME).each do |site, httpip, httphostname|
    describe iis_site("#{site}") do
      it { should exist }
      it { should have_binding("http #{httpip}:80:#{httphostname}") }
    end
  end
  SITE_NAME.zip(HTTPS_IP, HTTPS_HOSTNAME).each do |site, httpsip, httsphostname|
    describe iis_site("#{site}") do
      it { should exist }
      it { should have_binding("https #{httpsip}:80:#{httsphostname}") }
    end
  end
end

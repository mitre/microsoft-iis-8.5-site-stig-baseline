control 'SV-214478' do
  title 'The IIS 8.5 websites must utilize ports, protocols, and services according to PPSM guidelines.'
  desc 'Web servers provide numerous processes, features, and functionalities that utilize TCP/IP ports. Some of these processes may be deemed unnecessary or too unsecure to run on a production system.

The web server must provide the capability to disable or deactivate network-related services that are deemed to be non-essential to the server mission, are too unsecure, or are prohibited by the PPSM CAL and vulnerability assessments.

Failure to comply with DoD ports, protocols, and services (PPS) requirements can result in compromise of enclave boundary protections and/or functionality of the AIS.

The ISSM will ensure web servers are configured to use only authorized PPS in accordance with the Network Infrastructure STIG, DoD Instruction 8551.1, Ports, Protocols, and Services Management (PPSM), and the associated Ports, Protocols, and Services (PPS) Assurance Category Assignments List.'
  desc 'check', 'Review the website to determine if HTTP and HTTPs (e.g., 80 and 443) are used in accordance with those ports and services registered and approved for use by the DoD PPSM. Any variation in PPS will be documented, registered, and approved by the PPSM.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

In the “Action” Pane, click “Bindings”.

Review the ports and protocols. If unknown ports or protocols are used, then this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

In the “Action” Pane, click “Bindings".

Edit to change an existing binding and set the correct ports and protocol.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000383-WSR-000175'
  tag gid: 'V-214478'
  tag rid: 'SV-214478r879756_rule'
  tag stig_id: 'IISW-SI-000239'
  tag fix_id: 'F-15685r310639_fix'
  tag cci: ['CCI-001762']
  tag nist: ['CM-7 (1) (b)']
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

  site_name = attribute('site_name')

  http_ip = attribute('http_ip')

  http_hostname = attribute('http_hostname')

  https_ip = attribute('https_ip')

  https_hostname = attribute('https_hostname')

  site_name.zip(http_ip, http_hostname).each do |site, httpip, httphostname|
    describe iis_site(site.to_s) do
      it { should exist }
      it { should have_binding("http #{httpip}:80:#{httphostname}") }
    end
  end
  site_name.zip(https_ip, https_hostname).each do |site, httpsip, httsphostname|
    describe iis_site(site.to_s) do
      it { should exist }
      it { should have_binding("https #{httpsip}:443:#{httsphostname}") }
    end
  end
end

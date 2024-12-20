control 'SV-214465' do
  title 'The IIS 8.5 website must be configured to limit the size of web requests.'
  desc 'By setting limits on web requests, it ensures availability of web services and mitigates the risk of buffer overflow type attacks. The maxAllowedContentLength Request Filter limits the number of bytes the server will accept in a request.'
  desc 'check', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click on the site name.

Double-click the "Request Filtering" icon.

Click “Edit Feature Settings” in the "Actions" pane.

If the "maxAllowedContentLength" value is not explicitly set to "30000000" or less or a length documented and approved by the ISSO, this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click the "Request Filtering" icon.

Click “Edit Feature Settings” in the "Actions" pane.

Set the "maxAllowedContentLength" value to "30000000" or less.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000246-WSR-000149'
  tag gid: 'V-214465'
  tag rid: 'SV-214465r879650_rule'
  tag stig_id: 'IISW-SI-000226'
  tag fix_id: 'F-15672r310600_fix'
  tag cci: ['CCI-001094']
  tag nist: ['SC-5 (1)']
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
  get_maxAllowedContentLength = command('Get-WebConfigurationProperty -pspath "IIS:\Sites\*" -Filter system.webServer/security/requestFiltering -name * | select -expand requestLimits | select -expand maxAllowedContentLength').stdout.strip.split("\r\n")

  get_maxAllowedContentLength.zip(get_names).each do |maxAllowedContentLength, names|
    n = names.strip

    describe "The IIS site: #{n} websites max allowed content length" do
      subject { maxAllowedContentLength }
      it { should cmp <= 30_000_000 }
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

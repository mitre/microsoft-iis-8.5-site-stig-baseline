control 'SV-214466' do
  title 'The IIS 8.5 websites Maximum Query String limit must be configured.'
  desc 'By setting limits on web requests, it helps to ensure availability of web services and may also help mitigate the risk of buffer overflow type attacks. The Maximum Query String Request Filter describes the upper limit on allowable query string lengths. Upon exceeding the configured value, IIS will generate a Status Code 404.15.'
  desc 'check', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click on the site name.

Double-click the "Request Filtering" icon.

Click “Edit Feature Settings” in the "Actions" pane.

If the "Maximum Query String" value is not set to "2048" or less, this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click the "Request Filtering" icon.

Click “Edit Feature Settings” in the "Actions" pane.

Set the "Maximum Query String" value to "2048" or less.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000246-WSR-000149'
  tag gid: 'V-214466'
  tag rid: 'SV-214466r879650_rule'
  tag stig_id: 'IISW-SI-000227'
  tag fix_id: 'F-15673r310603_fix'
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
  get_maxQueryString = command('Get-WebConfigurationProperty -pspath "IIS:\Sites\*" -Filter system.webServer/security/requestFiltering -name * | select -expand requestLimits | select -expand maxQueryString').stdout.strip.split("\r\n")

  get_maxQueryString.zip(get_names).each do |maxQueryString, names|
    n = names.strip
    describe "The IIS site: #{n} websites Maximum Query String limit" do
      subject { maxQueryString }
      it { should cmp <= 2048 }
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

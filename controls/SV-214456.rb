control 'SV-214456' do
  title 'The IIS 8.5 website must have resource mappings set to disable the serving of certain file types.'
  desc 'Resource mapping is the process of tying a particular file type to a process in the web server that can serve that type of file to a requesting client and to identify which file types are not to be delivered to a client.

By not specifying which files can and which files cannot be served to a user, the web server could deliver to a user web server configuration files, log files, password files, etc.

The web server must only allow hosted application file types to be served to a user and all other types must be disabled.'
  desc 'check', 'Note: If the server being reviewed is hosting SharePoint, this is Not Applicable.

For Request Filtering, the ISSO must document and approve all allowable scripts the website allows (white list) and denies (black list). The white list and black list will be compared to the Request Filtering in IIS 8.5. Request Filtering at the site level take precedence over Request Filtering at the server level.

Follow the procedures below for each site hosted on the IIS 8.5 web server: 

Open the IIS 8.5 Manager.
Click the site name to review.
Double-click Request Filtering >> File Name Extensions Tab.

If any script file extensions from the black list are not denied, this is a finding.'
  desc 'fix', 'Follow the procedures below for each site hosted on the IIS 8.5 web server: 

Open the IIS 8.5 Manager.
Click the site name to review.
Double-click Request Filtering >> File Name Extensions Tab >> Deny File Name Extension.
Add any script file extensions listed on the black list that are not listed.
Select "Apply" from the "Actions" pane.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000141-WSR-000083'
  tag gid: 'V-214456'
  tag rid: 'SV-214456r903089_rule'
  tag stig_id: 'IISW-SI-000216'
  tag fix_id: 'F-15663r505307_fix'
  tag cci: ['CCI-000381']
  tag nist: ['CM-7 a']
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

  site_names = json(command: 'ConvertTo-Json @(Get-Website | select -expand name)').params
  black_listed_extensions = attribute('black_listed_extensions')

  site_names.each do |site_name|
    extensions = command("Get-WebConfigurationProperty -Filter /system.webserver/security/requestFiltering/fileExtensions 'IIS:\\Sites\\#{site_name}'  -Name Collection | where {$_.allowed -eq $true}| select -expand fileExtension").stdout.split

    describe "Allowed Request Filtering extensions should not be in black listed extensions; #{extensions}" do
      subject { extensions }
      it { should_not be_in black_listed_extensions }
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

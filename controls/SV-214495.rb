control 'SV-214495' do
  title 'Backup interactive scripts on the IIS 8.5 server must be removed.'
  desc 'Copies of backup files will not execute on the server, but they can be read by the anonymous user if special precautions are not taken. Such backup copies contain the same sensitive information as the actual script being executed and, as such, are useful to malicious users. Techniques and systems exist today to search web servers for such files and are able to exploit the information contained in them.'
  desc 'check', 'Determine whether scripts are used on the web server for the subject website. Common file extensions include, but are not limited to: .cgi, .pl, .vb, .class, .c, .php, .asp, and .aspx.

If the website does not utilize CGI, this finding is Not Applicable.

Open the IIS 8.5 Manager.

Right-click the IIS 8.5 web site name and select “Explore”.

Search for the listed script extensions

Search for the following files: *.bak, *.old, *.temp, *.tmp, *.backup, or “copy of...”.

If files with these extensions are found, this is a finding.'
  desc 'fix', 'Remove the backup files from the production web server.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000141-WSR-000087'
  tag gid: 'V-214495'
  tag rid: 'SV-214495r879587_rule'
  tag stig_id: 'IISW-SI-000263'
  tag fix_id: 'F-15702r310690_fix'
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

  iis_modules = command('Get-WebConfiguration system.webServer/globalModules/*').stdout.strip

  unless iis_modules.include?('CgiModule')
    impact 0.0
    desc 'CgiModule not installed hence the control not applicable'
  end

  describe 'Manual review of website is needed' do
    skip 'Manual review that Backup interactive scripts on the IIS 8.5 server is removed'
  end
end

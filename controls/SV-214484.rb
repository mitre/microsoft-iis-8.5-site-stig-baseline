control 'SV-214484' do
  title 'The IIS 8.5 website must have a unique application pool.'
  desc 'Application pools isolate sites and applications to address reliability, availability, and security issues. Sites and applications may be grouped according to configurations, although each site will be associated with a unique application pool.'
  desc 'check', 'Note: If the IIS Application Pool is hosting Microsoft SharePoint, this is Not Applicable.

If this IIS 8.5 installation is supporting Microsoft Exchange and not otherwise hosting any content, this requirement is Not Applicable.

Open the IIS 8.5 Manager.

Expand "Sites" from the "Connections" pane. For every Site listed:

Highlight Site name. Click "Basic Settings" and document the name of the Application Pool.

If any Application Pools are being used for more than one website, this is a finding.'
  desc 'fix', 'Open the IIS 8.5 Manager.

Click the site name under review.

Assign a unique application pool to each website.'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000516-WSR-000174'
  tag gid: 'V-214484'
  tag rid: 'SV-214484r879887_rule'
  tag stig_id: 'IISW-SI-000251'
  tag fix_id: 'F-15691r505328_fix'
  tag cci: ['CCI-000366']
  tag nist: ['CM-6 b']
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

  describe 'Manual review of website is needed' do
    skip 'Manually review to confirm that the IIS 8.5 websites have a unique
    application pool'
  end
end

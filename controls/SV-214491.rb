control 'SV-214491' do
  title 'The application pools rapid fail protection for each IIS 8.5 website must be enabled.'
  desc 'Rapid fail protection is a feature that interrogates the health of worker processes associated with websites and web applications. It can be configured to perform a number of actions such as shutting down and restarting worker processes that have reached failure thresholds. By not setting rapid fail protection the web server could become unstable in the event of a worker process crash potentially leaving the web server unusable.'
  desc 'check', 'If this IIS 8.5 installation is supporting Microsoft Exchange, and not otherwise hosting any content, this requirement is Not Applicable.

Open the IIS 8.5 Manager.

Click the "Application Pools".

Perform for each Application Pool.

Highlight an Application Pool to review and click "Advanced Settings" in the "Actions" pane.

Scroll down to the "Rapid Fail Protection" section and verify the value for "Enabled" is set to "True".

If the "Rapid Fail Protection:Enabled" is not set to "True", this is a finding.'
  desc 'fix', 'Open the IIS 8.5 Manager.

Click the "Application Pools".

Perform for each Application Pool.

Highlight an Application Pool to review and click "Advanced Settings" in the "Actions" pane.

Scroll down to the "Rapid Fail Protection" section and set the value for "Enabled" to "True".

Click "OK".'
  impact 0.5
  ref 'DPMS Target Microsoft IIS 8.5 Site'
  tag gtitle: 'SRG-APP-000516-WSR-000174'
  tag gid: 'V-214491'
  tag rid: 'SV-214491r879887_rule'
  tag stig_id: 'IISW-SI-000258'
  tag fix_id: 'F-15698r766894_fix'
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

  application_pool_names = json(command: 'ConvertTo-Json @(Get-ChildItem -Path IIS:\AppPools | select -expand name)').params

  application_pool_names.each do |application_pool|
    iis_configuration = json(command: "Get-ItemProperty 'IIS:\\AppPools\\#{application_pool}' -name * | select -expand failure | ConvertTo-Json")

    describe "The rapid fail protection setting for IIS Application Pool :'#{application_pool}'" do
      subject { iis_configuration }
      its('rapidFailProtection') { should cmp 'True' }
    end
  end
  if application_pool_names.empty?
    impact 0.0
    desc 'There are no application pool configured hence the control is Not-Applicable'

    describe 'No application pool where found to be reviewed' do
      skip 'No application pool where found to be reviewed'
    end
  end
end

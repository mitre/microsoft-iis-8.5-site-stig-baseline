control 'V-76799' do
  title "Mappings to unused and vulnerable scripts on the IIS 8.5 website must
  be removed."
  desc "IIS 8.5 will either allow or deny script execution based on file
  extension. The ability to control script execution is controlled through two
  features with IIS 8.5, Request Filtering and \"Handler Mappings\".

      For \"Handler Mappings\", the ISSO must document and approve all allowable
  file extensions the website allows (white list) and denies (black list) by the
  website. The white list and black list will be compared to the \"Handler
  Mappings\" in IIS 8. \"Handler Mappings\" at the site level take precedence
  over \"Handler Mappings\" at the server level.
  "
  impact 0.5
  tag "gtitle": 'SRG-APP-000141-WSR-000082'
  tag "gid": 'V-76799'
  tag "rid": 'SV-91495r1_rule'
  tag "stig_id": 'IISW-SI-000215'
  tag "fix_id": 'F-83495r1_fix'
  tag "cci": ['CCI-000381']
  tag "nist": ['CM-7 a', 'Rev_4']
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
  tag "check": "For \"Handler Mappings\", the ISSO must document and approve
  all allowable scripts the website allows (white list) and denies (black list)
  by the website. The white list and black list will be compared to the \"Handler
  Mappings\" in IIS 8.5. \"Handler Mappings\" at the site level take precedence
  over \"Handler Mappings\" at the server level.

  Open the IIS 8.5 Manager.

  Click the site name under review.

  Double-click \"Handler Mappings\".

  If any script file extensions from the black list are enabled, this is a
  finding."
  tag "fix": "Open the IIS 8.5 Manager.

  Click the site name under review.

  Double-click \"Handler Mappings\".

  Remove any script file extensions listed on the black list that are enabled.

  Select \"Apply\" from the \"Actions\" pane."

  describe 'Manually review the Handler Mappings' do
    skip 'Manually review site Handler Mappings configuration; If any script file
    extensions from the black list are enabled, this is a finding."'
  end

  get_names = json(command: 'ConvertTo-Json @(Get-Website | select -expand name)').params
  if get_names.empty?
    impact 0.0
    desc 'There are no IIS sites configured hence the control is Not-Applicable'

    describe 'No sites where found to be reviewed' do
      skip 'No sites where found to be reviewed'
    end
  end
end

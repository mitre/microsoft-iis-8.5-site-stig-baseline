control "V-76865" do
  title "The IIS 8.5 website must have a unique application pool."
  desc  "Application pools isolate sites and applications to address
  reliability, availability, and security issues. Sites and applications may be
  grouped according to configurations, although each site will be associated with
  a unique application pool."
  impact 0.7
  tag "gtitle": "SRG-APP-000516-WSR-000174"
  tag "gid": "V-76865"
  tag "rid": "SV-91561r2_rule"
  tag "stig_id": "IISW-SI-000251"
  tag "fix_id": "F-83561r1_fix"
  tag "cci": ["CCI-000366"]
  tag "nist": ["CM-6 b", "Rev_4"]
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
  tag "check": "Open the IIS 8.5 Manager.

  Click \"Application Pools\".

  In the list of Application Pools, review the \"Applications\" column and verify
  unique application pools for each website.

  If any Application Pools are being used for more than one website, this is a
  finding.
  "
  tag "fix": "Open the IIS 8.5 Manager.

  Click the site name under review.

  Assign a unique application pool to each website."
  describe "Manual review of website is needed" do
    skip "The IIS 8.5 website must have a unique application pool"
  end
end

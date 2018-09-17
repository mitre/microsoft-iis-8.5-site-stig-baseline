{:id=>"V-76865",
 :title=>"The IIS 8.5 website must have a unique application pool.",
 :desc=>
  "Application pools isolate sites and applications to address reliability, availability, and security issues. Sites and applications may be grouped according to configurations, although each site will be associated with a unique application pool.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000516-WSR-000174"},
   {:name=>"gid", :value=>"V-76865"},
   {:name=>"rid", :value=>"SV-91561r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000251"},
   {:name=>"fix_id", :value=>"F-83561r1_fix"},
   {:name=>"cci", :value=>["CCI-000366"]},
   {:name=>"nist", :value=>["CM-6 b", "Rev_4"]},
   {:name=>"false_negatives", :value=>nil},
   {:name=>"false_positives", :value=>nil},
   {:name=>"documentable", :value=>false},
   {:name=>"mitigations", :value=>nil},
   {:name=>"severity_override_guidance", :value=>false},
   {:name=>"potential_impacts", :value=>nil},
   {:name=>"third_party_tools", :value=>nil},
   {:name=>"mitigation_controls", :value=>nil},
   {:name=>"responsibility", :value=>nil},
   {:name=>"ia_controls", :value=>nil},
   {:name=>"check",
    :value=>
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click \"Application Pools\".\n" +
     "\n" +
     "In the list of Application Pools, review the \"Applications\" column and verify unique application pools for each website.\n" +
     "\n" +
     "If any Application Pools are being used for more than one website, this is a finding.\n"},
   {:name=>"fix",
    :value=>
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Assign a unique application pool to each website."}]}

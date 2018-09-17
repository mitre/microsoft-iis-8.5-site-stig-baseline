{:id=>"V-76799",
 :title=>
  "Mappings to unused and vulnerable scripts on the IIS 8.5 website must be removed.",
 :desc=>
  "IIS 8.5 will either allow or deny script execution based on file extension. The ability to control script execution is controlled through two features with IIS 8.5, Request Filtering and \"Handler Mappings\".\n" +
  "\n" +
  "For \"Handler Mappings\", the ISSO must document and approve all allowable file extensions the website allows (white list) and denies (black list) by the website. The white list and black list will be compared to the \"Handler Mappings\" in IIS 8. \"Handler Mappings\" at the site level take precedence over \"Handler Mappings\" at the server level.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000141-WSR-000082"},
   {:name=>"gid", :value=>"V-76799"},
   {:name=>"rid", :value=>"SV-91495r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000215"},
   {:name=>"fix_id", :value=>"F-83495r1_fix"},
   {:name=>"cci", :value=>["CCI-000381"]},
   {:name=>"nist", :value=>["CM-7 a", "Rev_4"]},
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
     "For \"Handler Mappings\", the ISSO must document and approve all allowable scripts the website allows (white list) and denies (black list) by the website. The white list and black list will be compared to the \"Handler Mappings\" in IIS 8.5. \"Handler Mappings\" at the site level take precedence over \"Handler Mappings\" at the server level.\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click \"Handler Mappings\".\n" +
     "\n" +
     "If any script file extensions from the black list are enabled, this is a finding."},
   {:name=>"fix",
    :value=>
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click \"Handler Mappings\".\n" +
     "\n" +
     "Remove any script file extensions listed on the black list that are enabled.\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

{:id=>"V-76875",
 :title=>
  "The maximum queue length for HTTP.sys for each IIS 8.5 website must be explicitly configured.",
 :desc=>
  "In order to determine the possible causes of client connection errors and to conserve system resources, it is important to both log errors and manage those settings controlling requests to the application pool.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000516-WSR-000174"},
   {:name=>"gid", :value=>"V-76875"},
   {:name=>"rid", :value=>"SV-91571r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000256"},
   {:name=>"fix_id", :value=>"F-83571r1_fix"},
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
     "Perform for each Application Pool.\n" +
     "\n" +
     "Click the “Application Pools”.\n" +
     "\n" +
     "Highlight an Application Pool to review and click \"Advanced Settings\" in the \"Actions\" pane.\n" +
     "\n" +
     "Scroll down to the \"General\" section and verify the value for \"Queue Length\" is set to 1000.\n" +
     "\n" +
     "If the \"Queue Length\" is set to \"1000\" or less, this is not a finding."},
   {:name=>"fix",
    :value=>
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the “Application Pools”.\n" +
     "\n" +
     "Highlight an Application Pool to review and click \"Advanced Settings\" in the \"Actions\" pane.\n" +
     "\n" +
     "Scroll down to the “General” section and set the value for “Queue Length” to “1000” or less.\n" +
     "\n" +
     "Click “OK”."}]}

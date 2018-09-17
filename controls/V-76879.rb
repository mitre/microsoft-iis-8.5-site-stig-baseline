{:id=>"V-76879",
 :title=>
  "The application pools rapid fail protection for each IIS 8.5 website must be enabled.",
 :desc=>
  "Rapid fail protection is a feature that interrogates the health of worker processes associated with websites and web applications. It can be configured to perform a number of actions such as shutting down and restarting worker processes that have reached failure thresholds. By not setting rapid fail protection the web server could become unstable in the event of a worker process crash potentially leaving the web server unusable.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000516-WSR-000174"},
   {:name=>"gid", :value=>"V-76879"},
   {:name=>"rid", :value=>"SV-91575r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000258"},
   {:name=>"fix_id", :value=>"F-83575r1_fix"},
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
     "Click the “Application Pools”.\n" +
     "\n" +
     "Perform for each Application Pool.\n" +
     "\n" +
     "Highlight an Application Pool to review and click \"Advanced Settings\" in the \"Actions\" pane.\n" +
     "\n" +
     "Scroll down to the \"Rapid Fail Protection\" section and verify the value for \"Enabled\" is set to \"True\".\n" +
     "\n" +
     "If the \"Rapid Fail Protection:Enabled\" is not set to \"True\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the “Application Pools”.\n" +
     "\n" +
     "Perform for each Application Pool.\n" +
     "\n" +
     "Highlight an Application Pool to review and click \"Advanced Settings\" in the \"Actions\" pane.\n" +
     "\n" +
     "Scroll down to the \"Rapid Fail Protection\" section and set the value for \"Enabled\" to \"True\".\n" +
     "\n" +
     "Click “OK”."}]}

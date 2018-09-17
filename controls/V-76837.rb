{:id=>"V-76837",
 :title=>
  "Debugging and trace information used to diagnose the IIS 8.5 website must be disabled.",
 :desc=>
  "Setting compilation debug to false ensures detailed error information does not inadvertently display during live application usage, mitigating the risk of application information being displayed to users.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000266-WSR-000160"},
   {:name=>"gid", :value=>"V-76837"},
   {:name=>"rid", :value=>"SV-91533r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000234"},
   {:name=>"fix_id", :value=>"F-83533r1_fix"},
   {:name=>"cci", :value=>["CCI-001312"]},
   {:name=>"nist", :value=>["SI-11 a", "Rev_4"]},
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
     "Note: If the \".NET feature\" is not installed, this check is Not Applicable.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click \".NET Compilation\".\n" +
     "\n" +
     "Scroll down to the \"Behavior\" section and verify the value for \"Debug\" is set to \"False\".\n" +
     "\n" +
     "If the \"Debug\" value is not set to \"False\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click \".NET Compilation\".\n" +
     "\n" +
     "Scroll down to the \"Behavior\" section and set the value for \"Debug\" to \"False\"."}]}

{:id=>"V-76873",
 :title=>
  "The application pool for each IIS 8.5 website must have a recycle time explicitly set.",
 :desc=>
  "Application pools can be periodically recycled to avoid unstable states possibly leading to application crashes, hangs, or memory leaks.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000516-WSR-000174"},
   {:name=>"gid", :value=>"V-76873"},
   {:name=>"rid", :value=>"SV-91569r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000255"},
   {:name=>"fix_id", :value=>"F-83569r1_fix"},
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
     "Note: Recycling Application Pools can create an unstable environment in a 64-bit SharePoint environment. If operational issues arise, with supporting documentation from the ISSO this check can be downgraded to a Cat III.\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Perform for each Application Pool.\n" +
     "\n" +
     "Click the “Application Pools”.\n" +
     "\n" +
     "Highlight an Application Pool and click \"Advanced Settings\" in the “Action” Pane.\n" +
     "\n" +
     "Scroll down to the \"Recycling\" section and expand the \"Generate Recycle Event Log Entry\" section.\n" +
     "\n" +
     "Verify both the \"Regular time interval\" and \"Specific time\" options are set to \"True\".\n" +
     "\n" +
     "If both the \"Regular time interval\" and \"Specific time\" options are not set to \"True\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the “Application Pools”.\n" +
     "\n" +
     "Perform for each Application Pool.\n" +
     "\n" +
     "Highlight an Application Pool and click \"Advanced Settings\" in the “Action” Pane.\n" +
     "\n" +
     "Scroll down to the \"Recycling\" section and expand the \"Generate Recycle Event Log Entry\" section.\n" +
     "\n" +
     "Set both the \"Regular time interval\" and \"Specific time\" options to \"True\"."}]}

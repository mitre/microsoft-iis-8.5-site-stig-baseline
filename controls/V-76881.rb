{:id=>"V-76881",
 :title=>
  "The application pools rapid fail protection settings for each IIS 8.5 website must be managed.",
 :desc=>
  "Windows Process Activation Service (WAS) manages application pool configuration and may flag a worker process as unhealthy and shut it down. The rapid fail protection must be set to a suitable value. A lack of response from the worker process might mean the worker process does not have a thread to respond to the ping request, or that it is hanging for some other reason. The ping interval and ping response time may need adjustment to gain access to timely information about application pool health without triggering false, unhealthy conditions.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000516-WSR-000174"},
   {:name=>"gid", :value=>"V-76881"},
   {:name=>"rid", :value=>"SV-91577r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000259"},
   {:name=>"fix_id", :value=>"F-83577r1_fix"},
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
     "Scroll down to the \"Rapid Fail Protection\" section and verify the value for \"Failure Interval\" is set to \"5\".\n" +
     "\n" +
     "If the \"Failure Interval\" is not set to \"5\" or less, this is a finding."},
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
     "Scroll down to the \"Rapid Fail Protection\" section and set the value for \"Failure Interval\" to \"5\" or less.\n" +
     "\n" +
     "Click “OK”."}]}

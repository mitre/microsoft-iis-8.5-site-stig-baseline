{:id=>"V-76877",
 :title=>
  "The application pools pinging monitor for each IIS 8.5 website must be enabled.",
 :desc=>
  "Windows Process Activation Service (WAS) manages application pool configurations and may flag a worker process as unhealthy and shut it down. An application pool’s pinging monitor must be enabled to confirm worker processes are functional. A lack of response from the worker process might mean the worker process does not have a thread to respond to the ping request, or it is hanging for some other reason. The ping interval and ping response time may need adjustment to gain access to timely information about application pool health without triggering false, unhealthy conditions; for example, instability caused by an application.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000516-WSR-000174"},
   {:name=>"gid", :value=>"V-76877"},
   {:name=>"rid", :value=>"SV-91573r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000257"},
   {:name=>"fix_id", :value=>"F-83573r1_fix"},
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
     "Open the Internet Information Services (IIS) Manager.\n" +
     "\n" +
     "Click the “Application Pools”.\n" +
     "\n" +
     "Perform for each Application Pool.\n" +
     "\n" +
     "Highlight an Application Pool to review and click \"Advanced Settings\" in the \"Actions\" pane.\n" +
     "\n" +
     "Scroll down to the \"Process Model\" section and verify the value for \"Ping Enabled\" is set to \"True\".\n" +
     "\n" +
     "If the value for \"Ping Enabled\" is not set to \"True\", this is a finding."},
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
     "Scroll down to the \"Process Model\" section and set the value for \"Ping Enabled\" to \"True\".\n" +
     "\n" +
     "Click “OK”."}]}

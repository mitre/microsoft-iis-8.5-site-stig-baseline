{:id=>"V-76839",
 :title=>"The Idle Time-out monitor for each IIS 8.5 website must be enabled.",
 :desc=>
  "The idle time-out attribute controls the amount of time a worker process will remain idle before it shuts down. A worker process is idle if it is not processing requests and no new requests are received.\n" +
  "\n" +
  "The purpose of this attribute is to conserve system resources; the default value for idle time-out is 20 minutes.\n" +
  "\n" +
  "By default, the World Wide Web (WWW) service establishes an overlapped recycle, in which the worker process to be shut down is kept running until after a new worker process is started.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000295-WSR-000012"},
   {:name=>"gid", :value=>"V-76839"},
   {:name=>"rid", :value=>"SV-91535r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000235"},
   {:name=>"fix_id", :value=>"F-83535r1_fix"},
   {:name=>"cci", :value=>["CCI-002361"]},
   {:name=>"nist", :value=>["AC-12", "Rev_4"]},
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
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the Application Pools.\n" +
     "\n" +
     "Highlight an Application Pool to review and click \"Advanced Settings\" in the \"Actions\" pane.\n" +
     "\n" +
     "Scroll down to the \"Process Model\" section and verify the value for \"Idle Time-out\" is set to \"20\".\n" +
     "\n" +
     "If the \"Idle Time-out\" is not set to \"20\" or less, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the Application Pools.\n" +
     "\n" +
     "Highlight an Application Pool to review and click \"Advanced Settings\" in the \"Actions\" pane.\n" +
     "\n" +
     "Scroll down to the \"Process Model\" section and set the value for \"Idle Time-out\" to \"20\" or less."}]}

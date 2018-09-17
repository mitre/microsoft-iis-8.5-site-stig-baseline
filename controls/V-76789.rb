{:id=>"V-76789",
 :title=>
  "The IIS 8.5 website must produce log records that contain sufficient information to establish the outcome (success or failure) of IIS 8.5 website events.",
 :desc=>
  "Web server logging capability is critical for accurate forensic analysis. Without sufficient and accurate information, a correct replay of the events cannot be determined.\n" +
  "\n" +
  "Ascertaining the success or failure of an event is important during forensic analysis. Correctly determining the outcome will add information to the overall reconstruction of the logable event. By determining the success or failure of the event correctly, analysis of the enterprise can be undertaken to determine if events tied to the event occurred in other areas within the enterprise.\n" +
  "\n" +
  "Without sufficient information establishing the success or failure of the logged event, investigation into the cause of event is severely hindered. The success or failure also provides a means to measure the impact of an event and help authorized personnel to determine the appropriate response. Log record content that may be necessary to satisfy the requirement of this control includes, but is not limited to, time stamps, source and destination IP addresses, user/process identifiers, event descriptions, application-specific events, success/fail indications, file names involved, access control, or flow control rules invoked.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000099-WSR-000061"},
   {:name=>"gid", :value=>"V-76789"},
   {:name=>"rid", :value=>"SV-91485r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000209"},
   {:name=>"fix_id", :value=>"F-83485r1_fix"},
   {:name=>"cci", :value=>["CCI-000134"]},
   {:name=>"nist", :value=>["AU-3", "Rev_4"]},
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
     "Select the website being reviewed.\n" +
     "\n" +
     "Under \"IIS\", double-click the \"Logging\" icon.\n" +
     "\n" +
     "Verify the \"Format:\" under \"Log File\" is configured to \"W3C\".\n" +
     "\n" +
     "Select the \"Fields\" button.\n" +
     "\n" +
     "Under \"Custom Fields\", verify the following fields are selected:\n" +
     "\n" +
     "Request Header >> Connection\n" +
     "\n" +
     "Request Header >> Warning\n" +
     "\n" +
     "Server Variable >> HTTP_CONNECTION\n" +
     "\n" +
     "If any of the above fields are not selected, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Select the website being reviewed.\n" +
     "\n" +
     "Under \"IIS\", double-click the \"Logging\" icon.\n" +
     "\n" +
     "Configure the \"Format:\" under \"Log File\" to \"W3C\".\n" +
     "\n" +
     "Select the \"Fields\" button.\n" +
     "\n" +
     "Under \"Custom Fields\", select the following fields:\n" +
     "\n" +
     "Request Header >> Connection\n" +
     "\n" +
     "Request Header >> Warning\n" +
     "\n" +
     "Server Variable >> HTTP_CONNECTION\n" +
     "\n" +
     "Click \"OK\".\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

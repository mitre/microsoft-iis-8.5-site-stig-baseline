{:id=>"V-76791",
 :title=>
  "The IIS 8.5 website must produce log records containing sufficient information to establish the identity of any user/subject or process associated with an event.",
 :desc=>
  "Web server logging capability is critical for accurate forensic analysis. Without sufficient and accurate information, a correct replay of the events cannot be determined.\n" +
  "\n" +
  "Determining user accounts, processes running on behalf of the user, and running process identifiers also enable a better understanding of the overall event. User tool identification is also helpful to determine if events are related to overall user access or specific client tools.\n" +
  "\n" +
  "Log record content that may be necessary to satisfy the requirement of this control includes: time stamps, source and destination addresses, user/process identifiers, event descriptions, success/fail indications, file names involved, and access control or flow control rules invoked.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000100-WSR-000064"},
   {:name=>"gid", :value=>"V-76791"},
   {:name=>"rid", :value=>"SV-91487r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000210"},
   {:name=>"fix_id", :value=>"F-83487r1_fix"},
   {:name=>"cci", :value=>["CCI-001487"]},
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
     "Access the IIS 8.5 web server IIS 8.5 Manager.\n" +
     "\n" +
     "Under \"IIS\", double-click the \"Logging\" icon.\n" +
     "\n" +
     "Verify the \"Format:\" under \"Log File\" is configured to \"W3C\".\n" +
     "\n" +
     "Select the \"Fields\" button.\n" +
     "\n" +
     "Under \"Standard Fields\", verify \"User Agent\", \"User Name\" and \"Referrer\" are selected.\n" +
     "\n" +
     "Under \"Custom Fields\", verify the following fields have been configured: \n" +
     "\n" +
     "Server Variable >> HTTP_USER_AGENT\n" +
     "\n" +
     "Request Header >> User-Agent\n" +
     "\n" +
     "Request Header >> Authorization\n" +
     "\n" +
     "Response Header >> Content-Type\n" +
     "\n" +
     "If any of the above fields are not selected, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Access the IIS 8.5 web server IIS 8.5 Manager.\n" +
     "\n" +
     "Select the website being reviewed.\n" +
     "\n" +
     "Under \"IIS\", double-click the \"Logging\" icon.\n" +
     "\n" +
     "Configure the \"Format:\" under \"Log File\" to \"W3C\".\n" +
     "\n" +
     "Select the \"Fields\" button.\n" +
     "\n" +
     "Under \"Standard Fields\", select \"User Agent\", \"User Name\" and \"Referrer\".\n" +
     "\n" +
     "Under \"Custom Fields\", select the following fields:\n" +
     "\n" +
     "Server Variable >> HTTP_USER_AGENT\n" +
     "\n" +
     "Request Header >> User-Agent\n" +
     "\n" +
     "Request Header >> Authorization\n" +
     "\n" +
     "Response Header >> Content-Type\n" +
     "\n" +
     "Click \"OK\".\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

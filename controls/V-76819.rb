{:id=>"V-76819",
 :title=>
  "The IIS 8.5 website must be configured to limit the size of web requests.",
 :desc=>
  "By setting limits on web requests, it ensures availability of web services and mitigates the risk of buffer overflow type attacks. The maxAllowedContentLength Request Filter limits the number of bytes the server will accept in a request.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000246-WSR-000149"},
   {:name=>"gid", :value=>"V-76819"},
   {:name=>"rid", :value=>"SV-91515r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000226"},
   {:name=>"fix_id", :value=>"F-83515r1_fix"},
   {:name=>"cci", :value=>["CCI-001094"]},
   {:name=>"nist", :value=>["SC-5 (1)", "Rev_4"]},
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
     "Click on the site name.\n" +
     "\n" +
     "Double-click the \"Request Filtering\" icon.\n" +
     "\n" +
     "Click “Edit Feature Settings” in the \"Actions\" pane.\n" +
     "\n" +
     "If the \"maxAllowedContentLength\" value is not explicitly set to \"30000000\" or less or a length documented and approved by the ISSO, this is a finding.\n"},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click the \"Request Filtering\" icon.\n" +
     "\n" +
     "Click “Edit Feature Settings” in the \"Actions\" pane.\n" +
     "\n" +
     "Set the \"maxAllowedContentLength\" value to \"30000000\" or less."}]}

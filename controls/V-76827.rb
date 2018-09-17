{:id=>"V-76827",
 :title=>
  "Unlisted file extensions in URL requests must be filtered by any IIS 8.5 website.",
 :desc=>
  "Request filtering enables administrators to create a more granular rule set to allow or reject inbound web content. By setting limits on web requests it helps to ensure availability of web services and may also help mitigate the risk of buffer overflow type attacks. The allow unlisted property of the “File Extensions Request” filter enables rejection of requests containing specific file extensions not defined in the “File Extensions” filter. Tripping this filter will cause IIS to generate a Status Code 404.7.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000246-WSR-000149"},
   {:name=>"gid", :value=>"V-76827"},
   {:name=>"rid", :value=>"SV-91523r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000230"},
   {:name=>"fix_id", :value=>"F-83523r1_fix"},
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
     "If \"Allow unlisted file extensions\" check box is checked, this is a finding."},
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
     "Uncheck the \"Allow unlisted file extensions\" check box."}]}

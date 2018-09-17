{:id=>"V-76821",
 :title=>"The IIS 8.5 websites Maximum Query String limit must be configured.",
 :desc=>
  "By setting limits on web requests, it helps to ensure availability of web services and may also help mitigate the risk of buffer overflow type attacks. The Maximum Query String Request Filter describes the upper limit on allowable query string lengths. Upon exceeding the configured value, IIS will generate a Status Code 404.15.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000246-WSR-000149"},
   {:name=>"gid", :value=>"V-76821"},
   {:name=>"rid", :value=>"SV-91517r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000227"},
   {:name=>"fix_id", :value=>"F-83517r1_fix"},
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
     "If the \"Maximum Query String\" value is not set to \"2048\" or less, this is a finding."},
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
     "Set the \"Maximum Query String\" value to \"2048\" or less."}]}

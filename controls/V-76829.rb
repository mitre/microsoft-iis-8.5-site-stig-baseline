{:id=>"V-76829",
 :title=>"Directory Browsing on the IIS 8.5 website must be disabled.",
 :desc=>
  "Directory browsing allows the contents of a directory to be displayed upon request from a web client. If directory browsing is enabled for a directory in IIS, users could receive a web page listing the contents of the directory. If directory browsing is enabled the risk of inadvertently disclosing sensitive content is increased.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000251-WSR-000157"},
   {:name=>"gid", :value=>"V-76829"},
   {:name=>"rid", :value=>"SV-91525r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000231"},
   {:name=>"fix_id", :value=>"F-83525r1_fix"},
   {:name=>"cci", :value=>["CCI-001310"]},
   {:name=>"nist", :value=>["SI-10", "Rev_4"]},
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
     "Click the Site.\n" +
     "\n" +
     "Double-click the \"Directory Browsing\" icon.\n" +
     "\n" +
     "If the \"Directory Browsing\" is not installed, this is Not Applicable.\n" +
     "\n" +
     "Under the \"Actions\" pane verify \"Directory Browsing\" is \"Disabled\".\n" +
     "\n" +
     "If \"Directory Browsing\" is not \"Disabled\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the Site.\n" +
     "\n" +
     "Double-click the \"Directory Browsing\" icon.\n" +
     "\n" +
     "Under the \"Actions\" pane click \"Disabled\"."}]}

{:id=>"V-76831",
 :title=>
  "The IIS 8.5 website must prevent a web content directory from being displayed.",
 :desc=>
  "The goal is to control the web users experience in navigating any portion of the web document root directories. Ensuring all web content directories have at least the equivalent of an index.html file is a significant factor to accomplish this end. Also, enumeration techniques, such as URL parameter manipulation, rely upon being able to obtain information about the web server’s directory structure by locating directories with default pages. This practice helps ensure the anonymous web user will not obtain directory browsing information or an error message revealing the server type and version.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000266-WSR-000142"},
   {:name=>"gid", :value=>"V-76831"},
   {:name=>"rid", :value=>"SV-91527r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000232"},
   {:name=>"fix_id", :value=>"F-83527r1_fix"},
   {:name=>"cci", :value=>["CCI-001312"]},
   {:name=>"nist", :value=>["SI-11 a", "Rev_4"]},
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
     "Note: This requirement is only for each site's root directory.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click \"Default Document\".\n" +
     "\n" +
     "In the \"Actions\" pane, verify the \"Default Document\" feature is enabled. \n" +
     "\n" +
     "If an \"Enable\" option is listed under the \"Actions\" pane, the \"Default Document\" feature is not enabled and this is a finding.\n" +
     "\n" +
     "If \"Default Document\" is \"Enabled, review the document types.\n" +
     "\n" +
     "Click the \"Content View\" tab, click on each listed \"Default Document\" and click on \"Explore\" under the \"Actions\" pane. Verify there is a document of that type in the directory.\n" +
     "\n" +
     "If \"Default Document\" is \"Enabled\" but no listed document types are present in the \"Content View\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click \"Default Document\".\n" +
     "\n" +
     "In the “Actions” pane select \"Enable\".\n" +
     "\n" +
     "Click the \"Content View\" tab, click on each listed \"Default Document\" and click on \"Explore\" under the \"Actions\" pane. Create a valid document for the listed \"Default Document\"."}]}

{:id=>"V-76803",
 :title=>
  "The IIS 8.5 website must have Web Distributed Authoring and Versioning (WebDAV) disabled.",
 :desc=>
  "A web server can be installed with functionality that, just by its nature, is not secure. Web Distributed Authoring (WebDAV) is an extension to the HTTP protocol that, when developed, was meant to allow users to create, change, and move documents on a server, typically a web server or web share. Allowing this functionality, development, and deployment is much easier for web authors.\n" +
  "\n" +
  "WebDAV is not widely used and has serious security concerns because it may allow clients to modify unauthorized files on the web server.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000141-WSR-000085"},
   {:name=>"gid", :value=>"V-76803"},
   {:name=>"rid", :value=>"SV-91499r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000217"},
   {:name=>"fix_id", :value=>"F-83499r1_fix"},
   {:name=>"cci", :value=>["CCI-000381"]},
   {:name=>"nist", :value=>["CM-7 a", "Rev_4"]},
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
     "Select the IIS 8.5 website.\n" +
     "\n" +
     "Review the features listed under the \"IIS\" section.\n" +
     "\n" +
     "If the \"WebDAV Authoring Rules\" icon exists, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Access Server Manager on the IIS 8.5 website.\n" +
     "\n" +
     "Select the Local Server.\n" +
     "\n" +
     "Click on \"Manage\".\n" +
     "\n" +
     "Select \"Add Roles and Features\".\n" +
     "\n" +
     "Click \"Next\" on the \"Before you begin\" dialog box.\n" +
     "\n" +
     "Select \"Role-based or feature-based installation\" on the \"Installation Type\" dialog box and click on \"Next\".\n" +
     "\n" +
     "Select the IIS 8.5 web server on the \"Server Selection\" dialog box.\n" +
     "\n" +
     "From the \"Windows Features\" dialog box, navigate to \"World Wide Web Services\" >> \"Common HTTP Features\".\n" +
     "\n" +
     "De-select \"WebDAV Publishing\" and click \"Next\" to complete removing the WebDAV Publishing feature from the IIS 8.5 web server.\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

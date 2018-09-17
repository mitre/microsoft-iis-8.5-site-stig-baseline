{:id=>"V-76801",
 :title=>
  "The IIS 8.5 website must have resource mappings set to disable the serving of certain file types.",
 :desc=>
  "Resource mapping is the process of tying a particular file type to a process in the web server that can serve that type of file to a requesting client and to identify which file types are not to be delivered to a client.\n" +
  "\n" +
  "By not specifying which files can and which files cannot be served to a user, the web server could deliver to a user web server configuration files, log files, password files, etc.\n" +
  "\n" +
  "The web server must only allow hosted application file types to be served to a user and all other types must be disabled.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000141-WSR-000083"},
   {:name=>"gid", :value=>"V-76801"},
   {:name=>"rid", :value=>"SV-91497r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000216"},
   {:name=>"fix_id", :value=>"F-83497r1_fix"},
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
     "For \"Handler Mappings\", the ISSO must document and approve all allowable file extensions the website allows (white list) and denies (black list) by the website. The white list and black list will be compared to the \"Handler Mappings\" in IIS 8.5. \"Handler Mappings\" at the site level take precedence over \"Handler Mappings\" at the server level.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server: \n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Double-click \"Request Filtering\". \n" +
     "\n" +
     "If any file name extensions from the black list have \"Allowed\" set to \"True\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server: \n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click \"Request Filtering\".\n" +
     "\n" +
     "For any file name extensions from the black list which have \"Allowed\" set to \"True\", remove the file name extension.\n" +
     "\n" +
     "Select \"Deny File Name Extension\" from the \"Actions\" pane.\n" +
     "\n" +
     "Add each file name extension from the black list.\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

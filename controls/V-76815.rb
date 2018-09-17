{:id=>"V-76815",
 :title=>
  "The IIS 8.5 website document directory must be in a separate partition from the IIS 8.5 websites system files.",
 :desc=>
  "The web document (home) directory is accessed by multiple anonymous users when the web server is in production. By locating the web document (home) directory on the same partition as the web server system file the risk for unauthorized access to these protected files is increased. Additionally, having the web document (home) directory path on the same drive as the system folders also increases the potential for a drive space exhaustion attack.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000233-WSR-000146"},
   {:name=>"gid", :value=>"V-76815"},
   {:name=>"rid", :value=>"SV-91511r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000224"},
   {:name=>"fix_id", :value=>"F-83511r1_fix"},
   {:name=>"cci", :value=>["CCI-001084"]},
   {:name=>"nist", :value=>["SC-3", "Rev_4"]},
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
     "Click the site name under review.\n" +
     "\n" +
     "Click the \"Advanced Settings\" from the \"Actions\" pane.\n" +
     "\n" +
     "Review the Physical Path.\n" +
     "\n" +
     "If the Path is on the same partition as the OS, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Click the “Advanced Settings” from the \"Actions\" pane.\n" +
     "\n" +
     "Change the Physical Path to the new partition and directory location."}]}

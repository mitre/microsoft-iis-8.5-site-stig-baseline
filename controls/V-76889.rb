{:id=>"V-76889",
 :title=>"Backup interactive scripts on the IIS 8.5 server must be removed.",
 :desc=>
  "Copies of backup files will not execute on the server, but they can be read by the anonymous user if special precautions are not taken. Such backup copies contain the same sensitive information as the actual script being executed and, as such, are useful to malicious users. Techniques and systems exist today to search web servers for such files and are able to exploit the information contained in them.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000141-WSR-000087"},
   {:name=>"gid", :value=>"V-76889"},
   {:name=>"rid", :value=>"SV-91585r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000263"},
   {:name=>"fix_id", :value=>"F-83585r1_fix"},
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
     "Determine whether scripts are used on the web server for the subject website. Common file extensions include, but are not limited to: .cgi, .pl, .vb, .class, .c, .php, .asp, and .aspx.\n" +
     "\n" +
     "If the website does not utilize CGI, this finding is Not Applicable.\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Right-click the IIS 8.5 web site name and select “Explore”.\n" +
     "\n" +
     "Search for the listed script extensions\n" +
     "\n" +
     "Search for the following files: *.bak, *.old, *.temp, *.tmp, *.backup, or “copy of...”.\n" +
     "\n" +
     "If files with these extensions are found, this is a finding."},
   {:name=>"fix",
    :value=>"Remove the backup files from the production web server."}]}

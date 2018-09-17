{:id=>"V-76811",
 :title=>"Anonymous IIS 8.5 website access accounts must be restricted.",
 :desc=>
  "Many of the security problems that occur are not the result of a user gaining access to files or data for which the user does not have permissions, but rather users are assigned incorrect permissions to unauthorized data. The files, directories, and data that are stored on the web server need to be evaluated and a determination made concerning authorized access to information and programs on the server. Only authorized users and administrative accounts will be allowed on the host server in order to maintain the web server, applications, and review the server operations.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000211-WSR-000031"},
   {:name=>"gid", :value=>"V-76811"},
   {:name=>"rid", :value=>"SV-91507r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000221"},
   {:name=>"fix_id", :value=>"F-83507r1_fix"},
   {:name=>"cci", :value=>["CCI-001082"]},
   {:name=>"nist", :value=>["SC-2", "Rev_4"]},
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
     "Check the account used for anonymous access to the website.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Double-click \"Authentication\" in the IIS section of the website’s Home Pane.\n" +
     "\n" +
     "If Anonymous access is disabled, this is Not a Finding.\n" +
     "\n" +
     "If enabled, click “Anonymous Authentication” and then click “Edit” in the \"Actions\" pane.\n" +
     "\n" +
     "If the “Specific user” radio button is enabled and an ID is specified in the adjacent control box, this is the ID being used for anonymous access.\n" +
     "\n" +
     "Check privileged groups that may allow the anonymous account inappropriate membership.\n" +
     "\n" +
     "Click “Start” and then double-click “Server Manager”.\n" +
     "\n" +
     "Expand Configuration; expand Local Users and Groups; and then click “Groups”.\n" +
     "\n" +
     "Review group members.\n" +
     "\n" +
     "Privileged Groups:\n" +
     "Administrators\n" +
     "Backup Operators\n" +
     "Certificate Services (of any designation)\n" +
     "Distributed COM Users\n" +
     "Event Log Readers\n" +
     "Network Configuration Operators\n" +
     "Performance Log Users\n" +
     "Performance Monitor Users\n" +
     "Power Users\n" +
     "Print Operators\n" +
     "Remote Desktop Users\n" +
     "Replicator\n" +
     "Users\n" +
     "\n" +
     "Double-click each group and review its members.\n" +
     "\n" +
     "If the IUSR account or any account used for anonymous access is a member of any group with privileged access, this is a finding."},
   {:name=>"fix",
    :value=>
     "Remove the Anonymous access account from all privileged accounts and all privileged groups."}]}

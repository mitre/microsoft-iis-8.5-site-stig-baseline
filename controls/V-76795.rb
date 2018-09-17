{:id=>"V-76795",
 :title=>
  "The log information from the IIS 8.5 website must be protected from unauthorized modification or deletion.",
 :desc=>
  "A major tool in exploring the website use, attempted use, unusual conditions, and problems are the access and error logs. In the event of a security incident, these logs can provide the SA and the web manager with valuable information. Failure to protect log files could enable an attacker to modify the log file data or falsify events to mask an attacker's activity.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000120-WSR-000070"},
   {:name=>"gid", :value=>"V-76795"},
   {:name=>"rid", :value=>"SV-91491r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000213"},
   {:name=>"fix_id", :value=>"F-83491r1_fix"},
   {:name=>"cci", :value=>["CCI-000163", "CCI-000164"]},
   {:name=>"nist", :value=>["AU-9", "AU-9", "Rev_4"]},
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
     "Click the site name.\n" +
     "\n" +
     "Click the \"Logging\" icon.\n" +
     "\n" +
     "Click \"Browse\" and navigate to the directory where the log files are stored.\n" +
     "\n" +
     "Right-click the log file name to review and click “Properties”.\n" +
     "\n" +
     "Click the “Security” tab; verify only authorized groups are listed, if others are listed, this is a finding.\n" +
     "\n" +
     "Note: The log file should be restricted as follows:\n" +
     "\n" +
     "SYSTEM, Auditors group: Full\n" +
     "SA, web managers: Read\n" +
     "\n"},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name.\n" +
     "\n" +
     "Click the \"Logging\" icon.\n" +
     "\n" +
     "Click \"Browse\" and navigate to the directory where the log files are stored.\n" +
     "\n" +
     "Right-click the log file name to review and click “Properties”.\n" +
     "\n" +
     "Click the “Security” tab.\n" +
     "\n" +
     "Set the log file permissions for the appropriate group."}]}

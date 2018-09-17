{:id=>"V-76785",
 :title=>
  "Both the log file and Event Tracing for Windows (ETW) for each IIS 8.5 website must be enabled.",
 :desc=>
  "Internet Information Services (IIS) on Windows Server 2012 provides basic logging capabilities. However, because IIS takes some time to flush logs to disk, administrators do not have access to logging information in real-time. In addition, text-based log files can be difficult and time-consuming to process.\n" +
  "\n" +
  "In IIS 8.5, the administrator has the option of sending logging information to Event Tracing for Windows (ETW). This option gives the administrator the ability to use standard query tools, or create custom tools, for viewing real-time logging information in ETW. This provides a significant advantage over parsing text-based log files that are not updated in real time.\n" +
  "\n",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000092-WSR-000055"},
   {:name=>"satisfies",
    :value=>["SRG-APP-000092-WSR-000055", "SRG-APP-000108-WSR-000166"]},
   {:name=>"gid", :value=>"V-76785"},
   {:name=>"rid", :value=>"SV-91481r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000206"},
   {:name=>"fix_id", :value=>"F-83481r1_fix"},
   {:name=>"cci", :value=>["CCI-000139", "CCI-001464"]},
   {:name=>"nist", :value=>["AU-5 a", "AU-14 (1)", "Rev_4"]},
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
     "Under Log Event Destination, verify the \"Both log file and ETW event\" radio button is selected.\n" +
     "\n" +
     "If the \"Both log file and ETW event\" radio button is not selected, this is a finding."},
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
     "Under Log Event Destination, select the \"Both log file and ETW event\" radio button.\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

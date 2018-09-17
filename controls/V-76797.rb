{:id=>"V-76797",
 :title=>
  "The IIS 8.5 website must have Multipurpose Internet Mail Extensions (MIME) that invoke OS shell programs disabled.",
 :desc=>
  "Controlling what a user of a hosted application can access is part of the security posture of the web server. Any time a user can access more functionality than is needed for the operation of the hosted application poses a security issue. A user with too much access can view information that is not needed for the user's job role, or the user could use the function in an unintentional manner.\n" +
  "\n" +
  "A MIME tells the web server what type of program various file types and extensions are and what external utilities or programs are needed to execute the file type.\n" +
  "\n" +
  "A shell is a program that serves as the basic interface between the user and the operating system, so hosted application users must not have access to these programs. Shell programs may execute shell escapes and can then perform unauthorized activities that could damage the security posture of the web server.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000141-WSR-000081"},
   {:name=>"gid", :value=>"V-76797"},
   {:name=>"rid", :value=>"SV-91493r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000214"},
   {:name=>"fix_id", :value=>"F-83493r1_fix"},
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
     "Click on the IIS 8.5 site.\n" +
     "\n" +
     "Under IIS, double-click the “MIME Types” icon.\n" +
     "\n" +
     "From the \"Group by:\" drop-down list, select \"Content Type\".\n" +
     "\n" +
     "From the list of extensions under \"Application\", verify MIME types for OS shell program extensions have been removed, to include at a minimum, the following extensions:\n" +
     "\n" +
     ".exe\n" +
     ".dll\n" +
     ".com\n" +
     ".bat\n" +
     ".csh\n" +
     "\n" +
     "If any OS shell MIME types are configured, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click on the IIS 8.5 site.\n" +
     "\n" +
     "Under IIS, double-click the “MIME Types” icon.\n" +
     "\n" +
     "From the \"Group by:\" drop-down list, select \"Content Type\".\n" +
     "\n" +
     "From the list of extensions under \"Application\", remove MIME types for OS shell program extensions, to include at a minimum, the following extensions:\n" +
     "\n" +
     ".exe\n" +
     ".dll\n" +
     ".com\n" +
     ".bat\n" +
     ".csh\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

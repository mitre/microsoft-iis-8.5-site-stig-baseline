{:id=>"V-76885",
 :title=>
  "Interactive scripts on the IIS 8.5 web server must be located in unique and designated folders.",
 :desc=>
  "CGI and ASP scripts represent one of the most common and exploitable means of compromising a web server. All CGI and ASP program files must be segregated into their own unique folder to simplify the protection of these files. ASP scripts must be placed into a unique folder only containing other ASP scripts. JAVA and other technology-specific scripts must also be placed into their own unique folders. The placement of CGI, ASP, or equivalent scripts to special folders gives the Web Manager or the SA control over what goes into those folders and to facilitate access control at the folder level.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000141-WSR-000087"},
   {:name=>"gid", :value=>"V-76885"},
   {:name=>"rid", :value=>"SV-91581r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000261"},
   {:name=>"fix_id", :value=>"F-83581r2_fix"},
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
     "Determine whether scripts are used on the web server for the target website. Common file extensions include, but are not limited to: .cgi, .pl, .vb, .class, .c, .php, .asp, and .aspx.\n" +
     "\n" +
     "All interactive programs must be placed in unique designated folders based on CGI or ASP script type.\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Right-click the IIS 8.5 web site name and select Explore.\n" +
     "\n" +
     "Search for the listed script extensions. Each script type must be in its unique designated folder.\n" +
     "\n" +
     "If scripts are not segregated from web content and in their own unique folders, then this is a finding."},
   {:name=>"fix",
    :value=>
     "All interactive programs must be placed in unique designated folders based on CGI or ASP script type.\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Right-click the IIS 8.5 web server name and select Explore.\n" +
     "\n" +
     "Search for the listed script extensions.\n" +
     "\n" +
     "Move each script type to its unique designated folder.\n" +
     "\n" +
     "Set the permissions to the scripts folders as follows:\n" +
     "\n" +
     "Administrators: FULL\n" +
     "TrustedInstaller: FULL\n" +
     "SYSTEM: FULL\n" +
     "ApplicationPoolId:READ\n" +
     "Custom Service Account: READ\n" +
     "Users: READ \n" +
     "ALL APPLICATION PACKAGES: READ  \n"}]}

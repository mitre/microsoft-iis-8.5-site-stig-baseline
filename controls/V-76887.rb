{:id=>"V-76887",
 :title=>
  "Interactive scripts on the IIS 8.5 web server must have restrictive access controls.",
 :desc=>
  "CGI is a programming standard for interfacing external applications with information servers, such as HTTP or web servers. CGI, represented by all upper case letters, should not be confused with the .cgi file extension. The .cgi file extension does represent a CGI script, but CGI scripts may be written in a number of programming languages (e.g., PERL, C, PHP, and JavaScript), each having their own unique file extension.\n" +
  "\n" +
  "The use of CGI scripts represent one of the most common and exploitable means of compromising a web server. By definition, CGI scripts are executable by the operating system of the host server. While access control is provided via the web service, the execution of CGI programs is not limited unless the SA or the Web Manager takes specific measures. CGI programs can access and alter data files, launch other programs, and use the network.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000141-WSR-000087"},
   {:name=>"gid", :value=>"V-76887"},
   {:name=>"rid", :value=>"SV-91583r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000262"},
   {:name=>"fix_id", :value=>"F-83583r1_fix"},
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
     "All interactive programs must have restrictive permissions.\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Right-click the IIS 8.5 web site name and select “Explore”.\n" +
     "\n" +
     "Search for the listed script extensions.\n" +
     "\n" +
     "Review the permissions to the CGI scripts and verify only the permissions listed, or more restrictive permissions are assigned.\n" +
     "\n" +
     "Administrators: FULL\n" +
     "TrustedInstaller: FULL\n" +
     "ALL APPLICATION PACKAGES: Read\n" +
     "SYSTEM: FULL\n" +
     "ApplicationPoolId: READ\n" +
     "Custom Service Account: READ\n" +
     "Users: READ\n" +
     "\n" +
     "If the permissions are less restrictive than listed above, this is a finding."},
   {:name=>"fix",
    :value=>
     "Determine whether scripts are used on the web server for the subject website. Common file extensions include, but are not limited to: .cgi, .pl, .vb, .class, .c, .php, .asp, and .aspx.\n" +
     "\n" +
     "If the website does not utilize CGI, this finding is NA.\n" +
     "\n" +
     "All interactive programs must have restrictive permissions.\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Right-click the IIS 8.5 web server name and select “Explore”.\n" +
     "\n" +
     "Search for the listed script extensions.\n" +
     "\n" +
     "Set the permissions to the CGI scripts as follows:\n" +
     "\n" +
     "Administrators: FULL\n" +
     "TrustedInstaller: FULL\n" +
     "ALL APPLICATION PACKAGES: Read\n" +
     "SYSTEM: FULL\n" +
     "ApplicationPoolId: READ\n" +
     "Custom Service Account: READ\n" +
     "Users: READ"}]}

{:id=>"V-76807",
 :title=>"Each IIS 8.5 website must be assigned a default host header.",
 :desc=>
  "The web server must be configured to listen on a specified IP address and port. Without specifying an IP address and port for the web server to utilize, the web server will listen on all IP addresses available to the hosting server. If the web server has multiple IP addresses, i.e., a management IP address, the web server will also accept connections on the management IP address.\n" +
  "\n" +
  "Accessing the hosted application through an IP address normally used for non-application functions opens the possibility of user access to resources, utilities, files, ports, and protocols that are protected on the desired application IP address.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000142-WSR-000089"},
   {:name=>"gid", :value=>"V-76807"},
   {:name=>"rid", :value=>"SV-91503r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000219"},
   {:name=>"fix_id", :value=>"F-83503r1_fix"},
   {:name=>"cci", :value=>["CCI-000382"]},
   {:name=>"nist", :value=>["CM-7 b", "Rev_4"]},
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
     "Right-click on the site name under review.\n" +
     "\n" +
     "Select “Edit Bindings”.\n" +
     "\n" +
     "Verify there are hostname entries and unique IP addresses assigned to port 80 for HTTP and port 443 for HTTPS.\n" +
     "\n" +
     "If both hostname entries and unique IP addresses are not configure to port 80 for HTTP and port 443 for HTTPS, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Right-click on the site name under review.\n" +
     "\n" +
     "Select “Edit Bindings”.\n" +
     "\n" +
     "Assign hostname entries and unique IP addresses to port 80 for HTTP and port 443 for HTTPS.\n" +
     "\n" +
     "Click \"OK\".\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

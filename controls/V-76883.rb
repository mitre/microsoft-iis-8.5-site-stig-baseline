{:id=>"V-76883",
 :title=>
  "The Content Location header on the IIS 8.5 website must not contain proprietary IP addresses.",
 :desc=>
  "When using static HTML pages, a Content-Location header is added to the response. The Internet Information Server (IIS) Content-Location may reference the IP address of the server, rather than the Fully Qualified Domain Name (FQDN) or Hostname. This header may expose internal IP addresses that are usually hidden or masked behind a Network Address Translation (NAT) firewall or proxy server. There is a value that can be modified in the IIS metabase to change the default behavior from exposing IP addresses, to sending the FQDN instead.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000516-WSR-000174"},
   {:name=>"gid", :value=>"V-76883"},
   {:name=>"rid", :value=>"SV-91579r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000260"},
   {:name=>"fix_id", :value=>"F-83579r1_fix"},
   {:name=>"cci", :value=>["CCI-000366"]},
   {:name=>"nist", :value=>["CM-6 b", "Rev_4"]},
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
     "Double-click “Configuration Editor”.\n" +
     "\n" +
     "From the drop-down box select “system.webserver serverRuntime”.\n" +
     "\n" +
     "If “alternateHostName” has no assigned value, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Double-click “Configuration Editor”.\n" +
     "\n" +
     "Click the drop-down box located at the top of the “Configuration Editor” Pane.\n" +
     "\n" +
     "Scroll until the “system.webserver/serverRuntime” is found, double-click the element, and add the appropriate value."}]}

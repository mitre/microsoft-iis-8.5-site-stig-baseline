{:id=>"V-76787",
 :title=>
  "An IIS 8.5 website behind a load balancer or proxy server, must produce log records containing the source client IP and destination information.",
 :desc=>
  "Web server logging capability is critical for accurate forensic analysis. Without sufficient and accurate information, a correct replay of the events cannot be determined. \n" +
  "\n" +
  "Ascertaining the correct source, e.g. source IP, of the events is important during forensic analysis. Correctly determining the source of events will add information to the overall reconstruction of the logable event. By determining the source of the event correctly, analysis of the enterprise can be undertaken to determine if events tied to the source occurred in other areas within the enterprise.\n" +
  "\n" +
  "A web server behind a load balancer or proxy server, when not configured correctly, will record the load balancer or proxy server as the source of every logable event. When looking at the information forensically, this information is not helpful in the investigation of events. The web server must record with each event the client source of the event.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000098-WSR-000060"},
   {:name=>"gid", :value=>"V-76787"},
   {:name=>"rid", :value=>"SV-91483r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000208"},
   {:name=>"fix_id", :value=>"F-83483r1_fix"},
   {:name=>"cci", :value=>["CCI-000133"]},
   {:name=>"nist", :value=>["AU-3", "Rev_4"]},
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
     "Interview the System Administrator to review the configuration of the IIS 8.5 architecture and determine if inbound web traffic is passed through a proxy.\n" +
     "\n" +
     "If the IIS 8.5 is receiving inbound web traffic through a proxy, the audit logs must be reviewed to determine if correct source information is being passed through by the proxy server.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name.\n" +
     "\n" +
     "Click the \"Logging\" icon.\n" +
     "\n" +
     "Click on \"View log file\" button.\n" +
     "\n" +
     "When log file is displaced, review source IP information in log entries and verify entries do not reflect the IP address of the proxy server.\n" +
     "\n" +
     "If the log entries in the log file(s) reflect the IP address of the proxy server as the source, this is a finding."},
   {:name=>"fix",
    :value=>
     "Access the proxy server through which inbound web traffic is passed and configure settings to pass web traffic to the IIS 8.5 web server transparently."}]}

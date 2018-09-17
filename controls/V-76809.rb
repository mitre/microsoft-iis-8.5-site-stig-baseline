{:id=>"V-76809",
 :title=>
  "A private websites authentication mechanism must use client certificates to transmit session identifier to assure integrity.",
 :desc=>
  "A DoD private website must utilize PKI as an authentication mechanism for web users. Information systems residing behind web servers requiring authorization based on individual identity must use the identity provided by certificate-based authentication to support access control decisions. Not using client certificates allows an attacker unauthenticated access to private websites.\n" +
  "\n",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000172-WSR-000104"},
   {:name=>"satisfies",
    :value=>
     ["SRG-APP-000172-WSR-000104",
      "SRG-APP-000224-WSR-000135",
      "SRG-APP-000427-WSR-000186"]},
   {:name=>"gid", :value=>"V-76809"},
   {:name=>"rid", :value=>"SV-91505r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000220"},
   {:name=>"fix_id", :value=>"F-83505r1_fix"},
   {:name=>"cci", :value=>["CCI-000197", "CCI-001188", "CCI-002470"]},
   {:name=>"nist",
    :value=>["IA-5 (1) (c)", "SC-23 (3)", "SC-23 (5)", "Rev_4"]},
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
     "Note: If the server being reviewed is a public IIS 8.5 web server, this is Not Applicable.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Double-click the \"SSL Settings\" icon.\n" +
     "\n" +
     "Verify the \"Clients Certificate Required\" check box is selected.\n" +
     "\n" +
     "If the \"Clients Certificate Required\" check box is not selected, this is a finding."},
   {:name=>"fix",
    :value=>
     "Note: If the server being reviewed is a public IIS 8.5 web server, this is Not Applicable\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Double-click the \"SSL Settings\" icon.\n" +
     "\n" +
     "Verify the \"Clients Certificate Required\" check box is selected.\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

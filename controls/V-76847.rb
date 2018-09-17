{:id=>"V-76847",
 :title=>
  "The IIS 8.5 websites must utilize ports, protocols, and services according to PPSM guidelines.",
 :desc=>
  "Web servers provide numerous processes, features, and functionalities that utilize TCP/IP ports. Some of these processes may be deemed unnecessary or too unsecure to run on a production system.\n" +
  "\n" +
  "The web server must provide the capability to disable or deactivate network-related services that are deemed to be non-essential to the server mission, are too unsecure, or are prohibited by the PPSM CAL and vulnerability assessments.\n" +
  "\n" +
  "Failure to comply with DoD ports, protocols, and services (PPS) requirements can result in compromise of enclave boundary protections and/or functionality of the AIS.\n" +
  "\n" +
  "The ISSM will ensure web servers are configured to use only authorized PPS in accordance with the Network Infrastructure STIG, DoD Instruction 8551.1, Ports, Protocols, and Services Management (PPSM), and the associated Ports, Protocols, and Services (PPS) Assurance Category Assignments List.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000383-WSR-000175"},
   {:name=>"gid", :value=>"V-76847"},
   {:name=>"rid", :value=>"SV-91543r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000239"},
   {:name=>"fix_id", :value=>"F-83543r1_fix"},
   {:name=>"cci", :value=>["CCI-001762"]},
   {:name=>"nist", :value=>["CM-7 (1) (b)", "Rev_4"]},
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
     "Review the website to determine if HTTP and HTTPs (e.g., 80 and 443) are used in accordance with those ports and services registered and approved for use by the DoD PPSM. Any variation in PPS will be documented, registered, and approved by the PPSM.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "In the “Action” Pane, click “Bindings”.\n" +
     "\n" +
     "Review the ports and protocols. If unknown ports or protocols are used, then this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "In the “Action” Pane, click “Bindings\".\n" +
     "\n" +
     "Edit to change an existing binding and set the correct ports and protocol."}]}

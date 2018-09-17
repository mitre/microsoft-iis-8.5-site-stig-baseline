{:id=>"V-76855",
 :title=>"IIS 8.5 website session IDs must be sent to the client using TLS.",
 :desc=>
  "The HTTP protocol is a stateless protocol. To maintain a session, a session identifier is used. The session identifier is a piece of data that is used to identify a session and a user. If the session identifier is compromised by an attacker, the session can be hijacked. By encrypting the session identifier, the identifier becomes more difficult for an attacker to hijack, decrypt, and use before the session has expired.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000439-WSR-000152"},
   {:name=>"gid", :value=>"V-76855"},
   {:name=>"rid", :value=>"SV-91551r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000244"},
   {:name=>"fix_id", :value=>"F-83551r1_fix"},
   {:name=>"cci", :value=>["CCI-002418"]},
   {:name=>"nist", :value=>["SC-8", "Rev_4"]},
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
     "Access the IIS 8.5 Manager.\n" +
     "\n" +
     "Select the website being reviewed.\n" +
     "\n" +
     "Under \"Management\" section, double-click the \"Configuration Editor\" icon.\n" +
     "\n" +
     "From the \"Section:\" drop-down list, select “system.webServer/asp\".\n" +
     "\n" +
     "Expand the \"session\" section.\n" +
     "\n" +
     "Verify the \"keepSessionIdSecure\" is set to \"True\".\n" +
     "\n" +
     "If the \"keepSessionIdSecure\" is not set to \"True\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Access the IIS 8.5 Manager.\n" +
     "\n" +
     "Select the website being reviewed.\n" +
     "\n" +
     "Under \"Management\" section, double-click the \"Configuration Editor\" icon.\n" +
     "\n" +
     "From the \"Section:\" drop-down list, select “system.webServer/asp\".\n" +
     "\n" +
     "Expand the \"session\" section.\n" +
     "\n" +
     "Select \"True\" for the \"keepSessionIdSecure\" setting.\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

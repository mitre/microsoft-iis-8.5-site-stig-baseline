{:id=>"V-76813",
 :title=>
  "The IIS 8.5 website must generate unique session identifiers that cannot be reliably reproduced.",
 :desc=>
  "Communication between a client and the web server is done using the HTTP protocol, but HTTP is a stateless protocol. In order to maintain a connection or session, a web server will generate a session identifier (ID) for each client session when the session is initiated. The session ID allows the web server to track a user session and, in many cases, the user, if the user previously logged into a hosted application.\n" +
  "\n" +
  "By being able to guess session IDs, an attacker can easily perform a man-in-the-middle attack. To truly generate random session identifiers that cannot be reproduced, the web server session ID generator, when used twice with the same input criteria, must generate an unrelated random ID.\n" +
  "\n" +
  "The session ID generator also needs to be a FIPS 140-2-approved generator.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000224-WSR-000136"},
   {:name=>"gid", :value=>"V-76813"},
   {:name=>"rid", :value=>"SV-91509r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000223"},
   {:name=>"fix_id", :value=>"F-83509r1_fix"},
   {:name=>"cci", :value=>["CCI-001188"]},
   {:name=>"nist", :value=>["SC-23 (3)", "Rev_4"]},
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
     "Under the \"ASP.NET\" section, select \"Session State\".\n" +
     "\n" +
     "Under \"Session State\" Mode Settings, verify the \"In Process\" mode is selected.\n" +
     "\n" +
     "If the \"In Process\" mode is selected, this is not a finding.\n" +
     "\n" +
     "Alternative method:\n" +
     "\n" +
     "Click the site name.\n" +
     "\n" +
     "Select \"Configuration Editor\" under the \"Management\" section.\n" +
     "\n" +
     "From the \"Section:\" drop-down list at the top of the configuration editor, locate \"system.web/sessionState\".\n" +
     "\n" +
     "Verify the \"mode\" reflects \"InProc\".\n" +
     "\n" +
     "If the \"mode\" is not set to \"InProc\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name.\n" +
     "\n" +
     "Under the ASP.NET section, select \"Session State\".\n" +
     "\n" +
     "Under \"Session State\" Mode Settings, select the \"In Process\" mode."}]}

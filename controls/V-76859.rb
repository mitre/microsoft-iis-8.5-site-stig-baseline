{:id=>"V-76859",
 :title=>
  "Cookies exchanged between the IIS 8.5 website and the client must use SSL/TLS, have cookie properties set to prohibit client-side scripts from reading the cookie data and must not be compressed.",
 :desc=>
  "A cookie is used when a web server needs to share data with the client's browser. The data is often used to remember the client when the client returns to the hosted application at a later date. A session cookie is a special type of cookie used to remember the client during the session. The cookie will contain the session identifier (ID) and may contain authentication data to the hosted application. To protect this data from easily being compromised, the cookie must be encrypted. \n" +
  "\n" +
  "When a cookie is sent encrypted via SSL/TLS, an attacker must spend a great deal of time and resources to decrypt the cookie. If, along with encryption, the cookie is compressed, the attacker can now use a combination of plaintext injection and inadvertent information leakage through data compression to reduce the time needed to decrypt the cookie. This attack is called Compression Ratio Info-leak Made Easy (CRIME). \n" +
  "\n" +
  "Cookies shared between the web server and the client when encrypted should not also be compressed.\n" +
  "\n" +
  "A cookie can be read by client-side scripts easily if cookie properties are not set properly. By allowing cookies to be read by the client-side scripts, information such as session identifiers could be compromised and used by an attacker who intercepts the cookie. Setting cookie properties (i.e. HttpOnly property) to disallow client-side scripts from reading cookies better protects the information inside the cookie.\n" +
  "\n" +
  "\n" +
  "\n",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000439-WSR-000154"},
   {:name=>"satisfies",
    :value=>
     ["SRG-APP-000439-WSR-000154",
      "SRG-APP-000439-SSR-000155",
      "SRG-APP-000439-WSR-000153"]},
   {:name=>"gid", :value=>"V-76859"},
   {:name=>"rid", :value=>"SV-91555r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000246"},
   {:name=>"fix_id", :value=>"F-83555r1_fix"},
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
     "Under \"Management\" section, double-click the \"Configuration Editor\" icon.\n" +
     "\n" +
     "From the \"Section:\" drop-down list, select \"system.web/httpCookies\".\n" +
     "\n" +
     "Verify the \"require SSL\" is set to \"True\".\n" +
     "\n" +
     "From the \"Section:\" drop-down list, select \"system.web/sessionState\".\n" +
     "\n" +
     "Verify the \"compressionEnabled\" is set to \"False\".\n" +
     "\n" +
     "If both the \"system.web/httpCookies:require SSL\" is set to \"True\" and the \"system.web/sessionState:compressionEnabled\" is set to \"False\", this is not a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Access the IIS 8.5 Manager.\n" +
     "\n" +
     "Under \"Management\" section, double-click the \"Configuration Editor\" icon.\n" +
     "\n" +
     "From the \"Section:\" drop-down list, select \"system.web/httpCookies\".\n" +
     "\n" +
     "Set the \"require SSL\" to \"True\".\n" +
     "\n" +
     "From the \"Section:\" drop-down list, select \"system.web/sessionState\".\n" +
     "\n" +
     "Set the \"compressionEnabled\" to \"False\".\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

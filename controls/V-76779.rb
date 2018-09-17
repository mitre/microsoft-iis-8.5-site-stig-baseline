{:id=>"V-76779",
 :title=>
  "A private IIS 8.5 website must only accept Secure Socket Layer connections.",
 :desc=>
  "Transport Layer Security (TLS) encryption is a required security setting for a private web server. Encryption of private information is essential to ensuring data confidentiality. If private information is not encrypted, it can be intercepted and easily read by an unauthorized party. A private web server must use a FIPS 140-2-approved TLS version, and all non-FIPS-approved SSL versions must be disabled.\n" +
  "\n" +
  "FIPS 140-2-approved TLS versions include TLS V1.1 or greater. NIST SP 800-52 specifies the preferred configurations for government systems.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000014-WSR-000006"},
   {:name=>"gid", :value=>"V-76779"},
   {:name=>"rid", :value=>"SV-91475r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000203"},
   {:name=>"fix_id", :value=>"F-83475r1_fix"},
   {:name=>"cci", :value=>["CCI-000068"]},
   {:name=>"nist", :value=>["AC-17 (2)", "Rev_4"]},
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
     "Click the site name.\n" +
     "\n" +
     "Double-click the \"SSL Settings\" icon.\n" +
     "\n" +
     "Verify \"Require SSL\" check box is selected.\n" +
     "\n" +
     "If the \"Require SSL\" check box is not selected, this is a finding."},
   {:name=>"fix",
    :value=>
     "Note: If the server being reviewed is a public IIS 8.5 web server, this is Not Applicable.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name.\n" +
     "\n" +
     "Double-click the \"SSL Settings\" icon.\n" +
     "\n" +
     "Select \"Require SSL\" check box.\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

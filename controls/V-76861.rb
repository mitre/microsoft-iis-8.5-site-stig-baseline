{:id=>"V-76861",
 :title=>
  "The IIS 8.5 website must maintain the confidentiality and integrity of information during preparation for transmission and during reception.",
 :desc=>
  "Information can be either unintentionally or maliciously disclosed or modified during preparation for transmission, including, for example, during aggregation, at protocol transformation points, and during packing/unpacking. These unauthorized disclosures or modifications compromise the confidentiality or integrity of the information.\n" +
  "\n" +
  "An example of this would be an SMTP queue. This queue may be added to a web server through an SMTP module to enhance error reporting or to allow developers to add SMTP functionality to their applications. \n" +
  "\n" +
  "Any modules used by the web server that queue data before transmission must maintain the confidentiality and integrity of the information before the data is transmitted.\n" +
  "\n" +
  "Information can be either unintentionally or maliciously disclosed or modified during reception, including, for example, during aggregation, at protocol transformation points, and during packing/unpacking. These unauthorized disclosures or modifications compromise the confidentiality or integrity of the information. \n" +
  "\n" +
  "Protecting the confidentiality and integrity of received information requires that application servers take measures to employ approved cryptography in order to protect the information during transmission over the network. This is usually achieved through the use of Transport Layer Security (TLS), SSL VPN, or IPsec tunnel. \n" +
  "\n" +
  "The web server must utilize approved encryption when receiving transmitted data.\n" +
  "\n" +
  "Also satisfies: SRG-APP-000442-WSR-000182",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000441-WSR-000181"},
   {:name=>"gid", :value=>"V-76861"},
   {:name=>"rid", :value=>"SV-91557r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000249"},
   {:name=>"fix_id", :value=>"F-83557r1_fix"},
   {:name=>"cci", :value=>["CCI-002420", "CCI-002422"]},
   {:name=>"nist", :value=>["SC-8 (2)", "SC-8 (2)", "Rev_4"]},
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
     "Double-click the \"SSL Settings\" icon under the \"IIS\" section.\n" +
     "\n" +
     "Verify \"Require SSL\" is checked.\n" +
     "\n" +
     "Verify \"Client Certificates Required\" is selected.\n" +
     "\n" +
     "Click the site under review.\n" +
     "\n" +
     "Select \"Configuration Editor\" under the \"Management\" section.\n" +
     "\n" +
     "From the \"Section:\" drop-down list at the top of the configuration editor, locate “system.webServer/security/access”.\n" +
     "\n" +
     "The value for \"sslFlags\" should be ssl128.\n" +
     "\n" +
     "If the \"Require SSL\" is not selected, this is a finding.\n" +
     "\n" +
     "If the \"Client Certificates Required\" is not selected, this is a finding.\n" +
     "\n" +
     "If the \"sslFlags\" is not set to \"ssl128\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for web server and each site under review:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name.\n" +
     "\n" +
     "Double-click the \"SSL Settings\" icon.\n" +
     "\n" +
     "Select \"Require SSL\" check box."}]}

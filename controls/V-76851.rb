{:id=>"V-76851",
 :title=>
  "The IIS 8.5 private website must employ cryptographic mechanisms (TLS) and require client certificates.",
 :desc=>
  "When data is written to digital media, such as hard drives, mobile computers, external/removable hard drives, personal digital assistants, flash/thumb drives, etc., there is risk of data loss and data compromise. User identities and passwords stored on the hard drive of the hosting hardware must be encrypted to protect the data from easily being discovered and used by an unauthorized user to access the hosted applications. The cryptographic libraries and functionality used to store and retrieve the user identifiers and passwords must be part of the web server.\n" +
  "\n" +
  "Preventing the disclosure of transmitted information requires that the web server take measures to employ some form of cryptographic mechanism in order to protect the information during transmission. This is usually achieved through the use of Transport Layer Security (TLS). \n" +
  "\n" +
  "Transmission of data can take place between the web server and a large number of devices/applications external to the web server. Examples are a web client used by a user, a backend database, an audit server, or other web servers in a web cluster. \n" +
  "\n" +
  "If data is transmitted unencrypted, the data then becomes vulnerable to disclosure. The disclosure may reveal user identifier/password combinations, website code revealing business logic, or other user personal information.\n" +
  "\n" +
  "Also satisfies: SRG-APP-000439-WSR-000151",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000429-WSR-000113"},
   {:name=>"gid", :value=>"V-76851"},
   {:name=>"rid", :value=>"SV-91547r3_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000242"},
   {:name=>"fix_id", :value=>"F-83547r1_fix"},
   {:name=>"cci", :value=>["CCI-002476"]},
   {:name=>"nist", :value=>["SC-28 (1)", "Rev_4"]},
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
     "The value for \"sslFlags\" set must include \"ssl128\".\n" +
     "\n" +
     "If the \"Require SSL\" is not selected, this is a finding.\n" +
     "\n" +
     "If the \"Client Certificates Required\" is not selected, this is a finding.\n" +
     "\n" +
     "If the \"sslFlags\" is not set to \"ssl128\", this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Double-click the \"SSL Settings\" icon under the \"IIS\" section.\n" +
     "\n" +
     "Select the \"Require SSL\" setting.\n" +
     "\n" +
     "Select the \"Client Certificates Required\" setting.\n" +
     "\n" +
     "Click \"Apply\" in the \"Actions\" pane.\n" +
     "\n" +
     "Click the site under review.\n" +
     "\n" +
     "Select \"Configuration Editor\" under the \"Management\" section.\n" +
     "\n" +
     "From the \"Section:\" drop-down list at the top of the configuration editor, locate “system.webServer/security/access”.\n" +
     "\n" +
     "Click on the drop-down list for \"sslFlags\".\n" +
     "\n" +
     "Select the \"Ssl128\" check box.\n" +
     "\n" +
     "Click \"Apply\" in the \"Actions\" pane."}]}

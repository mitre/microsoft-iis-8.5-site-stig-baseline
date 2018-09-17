{:id=>"V-76805",
 :title=>"The production website must configure the Global .NET Trust Level.",
 :desc=>
  "A web server may host too many applications. Each application will need certain system resources and privileged operations to operate correctly. An application's trust level determines the permissions granted by the ASP.NET Code Access Security (CAS) policy. An application with full trust permissions may access all resource types on a server and perform privileged operations, while applications running with partial trust have varying levels of operating permissions and access to resources. The CAS determines the permissions granted to the application on the server. Setting a level of trust compatible with the applications will limit the potential harm a compromised application could cause to a system. The web server must be configured to contain and control the applications and protect the system resources and privileged operations from those not needed by the application for operation.\n" +
  "\n" +
  "Limiting the application will confine the potential harm a compromised application could cause to a system.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000141-WSR-000086"},
   {:name=>"gid", :value=>"V-76805"},
   {:name=>"rid", :value=>"SV-91501r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000218"},
   {:name=>"fix_id", :value=>"F-83501r2_fix"},
   {:name=>"cci", :value=>["CCI-000381"]},
   {:name=>"nist", :value=>["CM-7 a", "Rev_4"]},
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
     "Note: If the server being reviewed is a non-production website, this is Not Applicable.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click the \".NET Trust Level\" icon.\n" +
     "\n" +
     "If the \".NET Trust Level\" is not set to Full or less, this is a finding.\n"},
   {:name=>"fix",
    :value=>
     "Note: If the server being reviewed is a non-production website, this is Not Applicable.\n" +
     "\n" +
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click the \".NET Trust Level\" icon.\n" +
     "\n" +
     "Set the \".NET Trust Level\" to Full or less and click “Apply”.\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane.   \n"}]}

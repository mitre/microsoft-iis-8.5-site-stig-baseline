{:id=>"V-76835",
 :title=>
  "Warning and error messages displayed to clients must be modified to minimize the identity of the IIS 8.5 website, patches, loaded modules, and directory paths.",
 :desc=>
  "HTTP error pages contain information that could enable an attacker to gain access to an information system. Failure to prevent the sending of HTTP error pages with full information to remote requesters exposes internal configuration information to potential attackers.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000266-WSR-000159"},
   {:name=>"gid", :value=>"V-76835"},
   {:name=>"rid", :value=>"SV-91531r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000233"},
   {:name=>"fix_id", :value=>"F-83531r1_fix"},
   {:name=>"cci", :value=>["CCI-001312"]},
   {:name=>"nist", :value=>["SI-11 a", "Rev_4"]},
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
     "Click the site name under review.\n" +
     "\n" +
     "Double-click the \"Error Pages\" icon.\n" +
     "\n" +
     "Click each error message and click \"Edit Feature\" setting from the \"Actions\" pane.\n" +
     "\n" +
     "If any error message is not set to “Detailed errors for local requests and custom error pages for remote requests”, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name under review.\n" +
     "\n" +
     "Double-click the \"Error Pages\" icon.\n" +
     "\n" +
     "Click each error message and click \"Edit Feature\" Setting from the \"Actions\" pane; set each error message to “Detailed errors for local requests and custom error pages for remote requests”."}]}

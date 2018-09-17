{:id=>"V-76843",
 :title=>
  "The IIS 8.5 website must provide the capability to immediately disconnect or disable remote access to the hosted applications.",
 :desc=>
  "During an attack on the web server or any of the hosted applications, the system administrator may need to disconnect or disable access by users to stop the attack.\n" +
  "\n" +
  "The web server must provide a capability to disconnect users to a hosted application without compromising other hosted applications unless deemed necessary to stop the attack. Methods to disconnect or disable connections are to stop the application service for a specified hosted application, stop the web server, or block all connections through web server access list.\n" +
  "\n" +
  "The web server capabilities used to disconnect or disable users from connecting to hosted applications and the web server must be documented to make certain that, during an attack, the proper action is taken to conserve connectivity to any other hosted application if possible and to make certain log data is conserved for later forensic analysis.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000316-WSR-000170"},
   {:name=>"gid", :value=>"V-76843"},
   {:name=>"rid", :value=>"SV-91539r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000237"},
   {:name=>"fix_id", :value=>"F-83539r1_fix"},
   {:name=>"cci", :value=>["CCI-002322"]},
   {:name=>"nist", :value=>["AC-17 (9)", "Rev_4"]},
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
     "Interview the System Administrator and Web Manager.\n" +
     "\n" +
     "Ask for documentation for the IIS 8.5 web server administration.\n" +
     "\n" +
     "Verify there are documented procedures for shutting down an IIS 8.5 website in the event of an attack. The procedure should, at a minimum, provide the following steps:\n" +
     "\n" +
     "Determine the respective website for the application at risk of an attack.\n" +
     "\n" +
     "Access the IIS 8.5 web server IIS 8.5 Manager.\n" +
     "\n" +
     "Select the respective website.\n" +
     "\n" +
     "In the \"Actions\" pane, under \"Manage Website\", click on \"Stop\".\n" +
     "\n" +
     "If necessary, stop all websites.\n" +
     "\n" +
     "If necessary, stop the IIS 8.5 web server by selecting the web server in the IIS 8.5 Manager.\n" +
     "\n" +
     "In the \"Actions\" pane, under \"Manage Server\", click on \"Stop\".\n" +
     "\n" +
     "If there are not documented procedures with, at a minimum, the mentioned steps for stopping a website, this is a finding."},
   {:name=>"fix",
    :value=>
     "Prepare documented procedures for shutting down an IIS 8.5 website in the event of an attack. The procedure should, at a minimum, provide the following steps:\n" +
     "\n" +
     "Determine the respective website for the application at risk of an attack.\n" +
     "\n" +
     "Access the IIS 8.5 web server IIS 8.5 Manager.\n" +
     "\n" +
     "Select the respective website.\n" +
     "\n" +
     "In the \"Actions\" pane, under \"Manage Website\", click on \"Stop\".\n" +
     "\n" +
     "If necessary, stop all websites.\n" +
     "\n" +
     "If necessary, stop the IIS 8.5 web server by selecting the web server in the IIS 8.5 Manager.\n" +
     "\n" +
     "In the \"Actions\" pane, under \"Manage Server\", click on \"Stop\"."}]}

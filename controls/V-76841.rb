{:id=>"V-76841",
 :title=>
  "The IIS 8.5 websites connectionTimeout setting must be explicitly configured to disconnect an idle session.",
 :desc=>
  "Leaving sessions open indefinitely is a major security risk. An attacker can easily use an already authenticated session to access the hosted application as the previously authenticated user. By closing sessions after a set period of inactivity, the web server can make certain that those sessions that are not closed through the user logging out of an application are eventually closed.\n" +
  "\n" +
  "Acceptable values are 5 minutes for high-value applications, 10 minutes for medium-value applications, and 20 minutes for low-value applications.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000295-WSR-000134"},
   {:name=>"gid", :value=>"V-76841"},
   {:name=>"rid", :value=>"SV-91537r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000236"},
   {:name=>"fix_id", :value=>"F-83537r2_fix"},
   {:name=>"cci", :value=>["CCI-002361"]},
   {:name=>"nist", :value=>["AC-12", "Rev_4"]},
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
     "Select \"Configuration Editor\" under the \"Management\" section.\n" +
     "\n" +
     "From the \"Section:\" drop-down list at the top of the configuration editor, locate \"system.web/sessionState\".\n" +
     "\n" +
     "Verify the \"timeout\" is set to \"00:20:00 or less”, using the lowest value possible depending upon the application.\n" +
     "Acceptable values are 5 minutes for high-value applications, 10 minutes for medium-value applications, and 20 minutes for low-value applications.\n" +
     "\n" +
     "If \"timeout\" is not set to \"00:20:00 or less”, this is a finding.\n" +
     "\n"},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name.\n" +
     "\n" +
     "Select \"Configuration Editor\" under the \"Management\" section.\n" +
     "\n" +
     "From the \"Section:\" drop-down list at the top of the configuration editor, locate \"system.web/sessionState\". \n" +
     "\n" +
     "Set the \"timeout\" to \"00:20:00 or less”, using the lowest value possible depending upon the application.\n" +
     "Acceptable values are 5 minutes for high-value applications, 10 minutes for medium-value applications, and 20 minutes for low-value applications.\n" +
     "\n" +
     "In the \"Actions\" pane, click \"Apply\".  \n"}]}

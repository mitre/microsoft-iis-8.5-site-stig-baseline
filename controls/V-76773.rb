{:id=>"V-76773",
 :title=>
  "The IIS 8.5 websites MaxConnections setting must be configured to limit the number of allowed simultaneous session requests.",
 :desc=>
  "Resource exhaustion can occur when an unlimited number of concurrent requests are allowed on a website, facilitating a Denial of Service attack. Mitigating this kind of attack will include limiting the number of concurrent HTTP/HTTPS requests per IP address and may include, where feasible, limiting parameter values associated with keepalive (i.e., a parameter used to limit the amount of time a connection may be inactive).",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000001-WSR-000001"},
   {:name=>"gid", :value=>"V-76773"},
   {:name=>"rid", :value=>"SV-91469r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000200"},
   {:name=>"fix_id", :value=>"F-83469r1_fix"},
   {:name=>"cci", :value=>["CCI-000054"]},
   {:name=>"nist", :value=>["AC-10", "Rev_4"]},
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
     "Access the IIS 8.5 IIS Manager.\n" +
     "\n" +
     "Click the IIS 8.5 server.\n" +
     "\n" +
     "Select \"Configuration Editor\" under the \"Management\" section.\n" +
     "\n" +
     "From the \"Section:\" drop-down list at the top of the configuration editor, locate \"system.applicationHost/sites\".\n" +
     "\n" +
     "Expand \"siteDefaults\".\n" +
     "Expand \"limits\".\n" +
     "\n" +
     "Review the results and verify the value is greater than zero for the \"maxconnections\" parameter.\n" +
     "\n" +
     "If the maxconnections parameter is set to zero, this is a finding."},
   {:name=>"fix",
    :value=>
     "Access the IIS 8.5 IIS Manager.\n" +
     "\n" +
     "Click the IIS 8.5 server.\n" +
     "\n" +
     "Select \"Configuration Editor\" under the \"Management\" section.\n" +
     "\n" +
     "From the \"Section:\" drop-down list at the top of the configuration editor, locate \"system.applicationHost/sites\".\n" +
     "\n" +
     "Expand \"siteDefaults\".\n" +
     "Expand \"limits\".\n" +
     "\n" +
     "Set the \"maxconnections\" parameter to a value greater than zero."}]}

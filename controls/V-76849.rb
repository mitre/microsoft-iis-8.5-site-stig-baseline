{:id=>"V-76849",
 :title=>
  "The IIS 8.5 private website have a server certificate issued by DoD PKI or DoD-approved PKI Certification Authorities (CAs).",
 :desc=>
  "The use of a DoD PKI certificate ensures clients the private website they are connecting to is legitimate, and is an essential part of the DoD defense-in-depth strategy.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000427-WSR-000186"},
   {:name=>"gid", :value=>"V-76849"},
   {:name=>"rid", :value=>"SV-91545r2_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000241"},
   {:name=>"fix_id", :value=>"F-83545r1_fix"},
   {:name=>"cci", :value=>["CCI-002470"]},
   {:name=>"nist", :value=>["SC-23 (5)", "Rev_4"]},
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
     "Click “Bindings” in the “Action” Pane.\n" +
     "\n" +
     "Click the “HTTPS type” from the box.\n" +
     "\n" +
     "Click “Edit”.\n" +
     "\n" +
     "Click “View” and then review and verify the certificate path.\n" +
     "\n" +
     "If the list of CAs in the trust hierarchy does not lead to the DoD PKI Root CA, DoD-approved external certificate authority (ECA), or DoD-approved external partner, this is a finding.\n" +
     "\n" +
     "If HTTPS is not an available type under site bindings, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the Server name.\n" +
     "\n" +
     "Double-click “Server Certificates”.\n" +
     "\n" +
     "Click “Import” under the \"Actions\" pane.\n" +
     "\n" +
     "Browse to the DoD certificate location, select it, and click “OK”.\n" +
     "\n" +
     "Remove any non-DoD certificates if present.\n" +
     "\n" +
     "Click on the site needing the certificate.\n" +
     "\n" +
     "Select “Bindings” under the \"Actions\" pane.\n" +
     "\n" +
     "Click on the binding needing a certificate and select “Edit”, or add a site binding for HTTPS.\n" +
     "\n" +
     "Assign the certificate to the website by choosing it under the “SSL Certificate” drop-down and clicking “OK”."}]}

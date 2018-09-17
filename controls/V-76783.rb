{:id=>"V-76783",
 :title=>
  "The enhanced logging for each IIS 8.5 website must be enabled and capture, record, and log all content related to a user session.",
 :desc=>
  "Log files are a critical component to the successful management of an IS used within the DoD. By generating log files with useful information web administrators can leverage them in the event of a disaster, malicious attack, or other site-specific needs.\n" +
  "\n" +
  "Ascertaining the correct order of the events that occurred is important during forensic analysis. Events that appear harmless by themselves might be flagged as a potential threat when properly viewed in sequence. By also establishing the event date and time, an event can be properly viewed with an enterprise tool to fully see a possible threat in its entirety.\n" +
  "\n" +
  "Without sufficient information establishing when the log event occurred, investigation into the cause of event is severely hindered. Log record content that may be necessary to satisfy the requirement of this control includes, but is not limited to, time stamps, source and destination IP addresses, user/process identifiers, event descriptions, application-specific events, success/fail indications, file names involved, access control, or flow control rules invoked.\n" +
  "\n",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000092-WSR-000055"},
   {:name=>"satisfies",
    :value=>["SRG-APP-000092-WSR-000055", "SRG-APP-000093-WSR-000053"]},
   {:name=>"gid", :value=>"V-76783"},
   {:name=>"rid", :value=>"SV-91479r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000205"},
   {:name=>"fix_id", :value=>"F-83479r1_fix"},
   {:name=>"cci", :value=>["CCI-001462", "CCI-001464"]},
   {:name=>"nist", :value=>["AU-14 (2)", "AU-14 (1)", "Rev_4"]},
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
     "Click the \"Logging\" icon.\n" +
     "\n" +
     "Under Format select \"W3C\".\n" +
     "\n" +
     "Click “Select Fields”, verify at a minimum the following fields are checked: Date, Time, Client IP Address, User Name, Method, URI Query, Protocol Status, and Referrer.\n" +
     "\n" +
     "If the \"W3C\" is not selected as the logging format OR any of the required fields are not selected, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Open the IIS 8.5 Manager.\n" +
     "\n" +
     "Click the site name.\n" +
     "\n" +
     "Click the \"Logging\" icon.\n" +
     "\n" +
     "Under Format select \"W3C\".\n" +
     "\n" +
     "Select the following fields: Date, Time, Client IP Address, User Name, Method, URI Query, Protocol Status, and Referrer.\n" +
     "\n" +
     "Select \"Apply\" from the \"Actions\" pane."}]}

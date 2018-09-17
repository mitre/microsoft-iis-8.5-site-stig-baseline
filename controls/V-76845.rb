{:id=>"V-76845",
 :title=>
  "The IIS 8.5 website must use a logging mechanism that is configured to allocate log record storage capacity large enough to accommodate the logging requirements of the IIS 8.5 website.",
 :desc=>
  "In order to make certain that the logging mechanism used by the web server has sufficient storage capacity in which to write the logs, the logging mechanism needs to be able to allocate log record storage capacity.\n" +
  "\n" +
  "The task of allocating log record storage capacity is usually performed during initial installation of the logging mechanism. The system administrator will usually coordinate the allocation of physical drive space with the web server administrator along with the physical location of the partition and disk. Refer to NIST SP 800-92 for specific requirements on log rotation and storage dependent on the impact of the web server.",
 :impact=>0.7,
 :tests=>[],
 :tags=>
  [{:name=>"gtitle", :value=>"SRG-APP-000357-WSR-000150"},
   {:name=>"gid", :value=>"V-76845"},
   {:name=>"rid", :value=>"SV-91541r1_rule"},
   {:name=>"stig_id", :value=>"IISW-SI-000238"},
   {:name=>"fix_id", :value=>"F-83541r1_fix"},
   {:name=>"cci", :value=>["CCI-001849"]},
   {:name=>"nist", :value=>["AU-4", "Rev_4"]},
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
     "Access the IIS 8.5 web server IIS 8.5 Manager.\n" +
     "\n" +
     "Under \"IIS\" double-click on the \"Logging\" icon.\n" +
     "\n" +
     "In the \"Logging\" configuration box, determine the \"Directory:\" to which the \"W3C\" logging is being written.\n" +
     "\n" +
     "Confirm with the System Administrator that the designated log path is of sufficient size to maintain the logging.\n" +
     "\n" +
     "Under \"Log File Rollover\", verify the \"Do not create new log files\" is not selected.\n" +
     "\n" +
     "Verify a schedule is configured to rollover log files on a regular basis.\n" +
     "\n" +
     "Consult with the System Administrator to determine if there is a documented process for moving the log files off of the IIS 8.5 web server to another logging device.\n" +
     "\n" +
     "If the designated logging path device is not of sufficient space to maintain all log files and there is not a schedule to rollover files on a regular basis, this is a finding."},
   {:name=>"fix",
    :value=>
     "Follow the procedures below for each site hosted on the IIS 8.5 web server:\n" +
     "\n" +
     "Under \"IIS\" double-click on the \"Logging\" icon.\n" +
     "\n" +
     "If necessary, in the \"Logging\" configuration box, redesignate a log path to a location able to house the logs.\n" +
     "\n" +
     "Under \"Log File Rollover\", deselect the \"Do not create new log files\" setting.\n" +
     "\n" +
     "Configure a schedule to rollover log files on a regular basis."}]}

control "V-76835" do
  title "Warning and error messages displayed to clients must be modified to
  minimize the identity of the IIS 8.5 website, patches, loaded modules, and
  directory paths."
  desc  "HTTP error pages contain information that could enable an attacker to
  gain access to an information system. Failure to prevent the sending of HTTP
  error pages with full information to remote requesters exposes internal
  configuration information to potential attackers."
  impact 0.7
  tag "gtitle": "SRG-APP-000266-WSR-000159"
  tag "gid": "V-76835"
  tag "rid": "SV-91531r1_rule"
  tag "stig_id": "IISW-SI-000233"
  tag "fix_id": "F-83531r1_fix"
  tag "cci": ["CCI-001312"]
  tag "nist": ["SI-11 a", "Rev_4"]
  tag "false_negatives": nil
  tag "false_positives": nil
  tag "documentable": false
  tag "mitigations": nil
  tag "severity_override_guidance": false
  tag "potential_impacts": nil
  tag "third_party_tools": nil
  tag "mitigation_controls": nil
  tag "responsibility": nil
  tag "ia_controls": nil
  tag "check": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name under review.

  Double-click the \"Error Pages\" icon.

  Click each error message and click \"Edit Feature\" setting from the
  \"Actions\" pane.

  If any error message is not set to “Detailed errors for local requests and
  custom error pages for remote requests”, this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Open the IIS 8.5 Manager.

  Click the site name under review.

  Double-click the \"Error Pages\" icon.

  Click each error message and click \"Edit Feature\" Setting from the
  \"Actions\" pane; set each error message to “Detailed errors for local requests
  and custom error pages for remote requests”."

  errorMode = command("Get-WebConfigurationProperty -filter \"system.webServer/httpErrors\" -Name errorMode").stdout.strip

  describe "The websites error mode" do
     subject { errorMode }
     it {should cmp "DetailedLocalOnly"}
  end

end

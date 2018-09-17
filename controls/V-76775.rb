control "V-76775" do
  title "The IIS 8.5 website session state must be enabled."
  desc  "When the session information is stored on the client, the session ID,
along with the user authorization and identity information, is sent along with
each client request and is stored in either a cookie, embedded in the uniform
resource locator (URL), or placed in a hidden field on the displayed form. Each
of these offers advantages and disadvantages. The biggest disadvantage to all
three is the hijacking of a session along with all of the user's credentials.

    When the user authorization and identity information is stored on the
server in a protected and encrypted database, the communication between the
client and web server will only send the session identifier, and the server can
then retrieve user credentials for the session when needed. If, during
transmission, the session were to be hijacked, the user's credentials would not
be compromised.

    ASP.NET provides a session state, which is available as the
HttpSessionState class, as a method of storing session-specific information
that is visible only within the session. ASP.NET session state identifies
requests from the same browser during a limited time window as a session, and
provides the ability to persist variable values for the duration of that
session.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000001-WSR-000002"
  tag "gid": "V-76775"
  tag "rid": "SV-91471r1_rule"
  tag "stig_id": "IISW-SI-000201"
  tag "fix_id": "F-83471r1_fix"
  tag "cci": ["CCI-000054"]
  tag "nist": ["AC-10", "Rev_4"]
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

Click the site name.

Under the \"ASP.NET\" section, select \"Session State\".

Under \"Session State Mode Settings\", verify the \"In Process\" mode is
selected.

If the \"Session State Mode Settings\" is set to \"In Process\", this is not a
finding.

Alternative method:

Click the site name.

Select \"Configuration Editor\" under the \"Management\" section.

From the \"Section:\" drop-down list at the top of the configuration editor,
locate \"system.web/sessionState\".

Verify the \"mode\" reflects \"InProc\".

If the \"mode\" is not set to \"InProc\", this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
web server:

Open the IIS 8.5 Manager.

Click the site name.

Under the \"ASP.NET\" section, select \"Session State\".

Under \"Session State Mode Settings\", verify the \"In Process\" mode is
selected.

Select \"Apply\" from the \"Actions\" pane."
end


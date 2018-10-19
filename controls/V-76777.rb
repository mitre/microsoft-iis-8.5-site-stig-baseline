control "V-76777" do
  title "The IIS 8.5 website session state cookie settings must be configured
to Use Cookies mode."
  desc  "When the session information is stored on the client, the session ID,
along with the user authorization and identity information, is sent along with
each client request and is stored in either a cookie, embedded in the uniform
resource locator (URL), or placed in a hidden field on the displayed form. Each
of these offers advantages and disadvantages. The biggest disadvantage to all
three is the hijacking of a session along with all of the user's credentials.

    When the user authorization and identity information is stored on the
server in a protected and encrypted database, the communication between the
client and website will only send the session identifier, and the server can
then retrieve user credentials for the session when needed. If, during
transmission, the session were to be hijacked, the user's credentials would not
be compromised.

    ASP.NET provides a session state, which is available as the
HttpSessionState class, as a method of storing session-specific information
that is visible only within the session. ASP.NET session state identifies
requests from the same browser during a limited time window as a session, and
provides the ability to persist variable values for the duration of that
session.

    Cookies associate session information with client information for the
duration of a user’s connection to a website. Using cookies is a more efficient
way to track session state than any of the methods that do not use cookies
because cookies do not require any redirection.

  "
  impact 0.7
  tag "gtitle": "SRG-APP-000001-WSR-000002"
  tag "gid": "V-76777"
  tag "rid": "SV-91473r2_rule"
  tag "stig_id": "IISW-SI-000202"
  tag "fix_id": "F-83473r2_fix"
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

Under \"Cookie Settings\", verify the \"Use Cookies\" mode is selected from the
\"Mode:\" drop-down list.

If the \"Use Cookies\" mode is selected, this is not a finding.

Alternative method:

Click the site name.

Select \"Configuration Editor\" under the \"Management\" section.

From the \"Section:\" drop-down list at the top of the configuration editor,
locate \"system.web/sessionState\".

Verify the \"cookieless\" is set to \"UseCookies\".

If the \"cookieless\" is not set to \"UseCookies\", this is a finding.
"
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
web server:

Open the IIS 8.5 Manager.

Click the site name.

Under the ASP.NET section, select \"Session State\".

Under \"Cookie Settings\", select the \"Use Cookies\" from the \"Mode:\"
drop-dowssn list.

Select \"Apply\" from the \"Actions\" pane.
"
  describe command('Get-WebConfigurationProperty -Filter system.web/sessionState -name * | select -expand cookieless').stdout.strip do
    it {should cmp "UseCookies"}
  end
end


control "V-76805" do
  title "The production website must configure the Global .NET Trust Level."
  desc  "A web server may host too many applications. Each application will
need certain system resources and privileged operations to operate correctly.
An application's trust level determines the permissions granted by the ASP.NET
Code Access Security (CAS) policy. An application with full trust permissions
may access all resource types on a server and perform privileged operations,
while applications running with partial trust have varying levels of operating
permissions and access to resources. The CAS determines the permissions granted
to the application on the server. Setting a level of trust compatible with the
applications will limit the potential harm a compromised application could
cause to a system. The web server must be configured to contain and control the
applications and protect the system resources and privileged operations from
those not needed by the application for operation.

    Limiting the application will confine the potential harm a compromised
application could cause to a system.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000141-WSR-000086"
  tag "gid": "V-76805"
  tag "rid": "SV-91501r2_rule"
  tag "stig_id": "IISW-SI-000218"
  tag "fix_id": "F-83501r2_fix"
  tag "cci": ["CCI-000381"]
  tag "nist": ["CM-7 a", "Rev_4"]
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
  tag "check": "Note: If the server being reviewed is a non-production website,
this is Not Applicable.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click the \".NET Trust Level\" icon.

If the \".NET Trust Level\" is not set to Full or less, this is a finding.
"
  tag "fix": "Note: If the server being reviewed is a non-production website,
this is Not Applicable.

Follow the procedures below for each site hosted on the IIS 8.5 web server:

Open the IIS 8.5 Manager.

Click the site name under review.

Double-click the \".NET Trust Level\" icon.

Set the \".NET Trust Level\" to Full or less and click “Apply”.

Select \"Apply\" from the \"Actions\" pane.
"
end


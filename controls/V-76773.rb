control "V-76773" do
  title "The IIS 8.5 websites MaxConnections setting must be configured to
limit the number of allowed simultaneous session requests."
  desc  "Resource exhaustion can occur when an unlimited number of concurrent
requests are allowed on a website, facilitating a Denial of Service attack.
Mitigating this kind of attack will include limiting the number of concurrent
HTTP/HTTPS requests per IP address and may include, where feasible, limiting
parameter values associated with keepalive (i.e., a parameter used to limit the
amount of time a connection may be inactive)."
  impact 0.7
  tag "gtitle": "SRG-APP-000001-WSR-000001"
  tag "gid": "V-76773"
  tag "rid": "SV-91469r1_rule"
  tag "stig_id": "IISW-SI-000200"
  tag "fix_id": "F-83469r1_fix"
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
  tag "check": "Access the IIS 8.5 IIS Manager.

Click the IIS 8.5 server.

Select \"Configuration Editor\" under the \"Management\" section.

From the \"Section:\" drop-down list at the top of the configuration editor,
locate \"system.applicationHost/sites\".

Expand \"siteDefaults\".
Expand \"limits\".

Review the results and verify the value is greater than zero for the
\"maxconnections\" parameter.

If the maxconnections parameter is set to zero, this is a finding."
  tag "fix": "Access the IIS 8.5 IIS Manager.

Click the IIS 8.5 server.

Select \"Configuration Editor\" under the \"Management\" section.

From the \"Section:\" drop-down list at the top of the configuration editor,
locate \"system.applicationHost/sites\".

Expand \"siteDefaults\".
Expand \"limits\".

Set the \"maxconnections\" parameter to a value greater than zero."
describe command('Get-WebConfigurationProperty -Filter system.applicationHost/sites -name * | select -expand siteDefaults | select -expand limits | select -expand MaxConnections').stdout.strip do
  it {should cmp > 0 }
end
end


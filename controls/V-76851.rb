control "V-76851" do
  title "The IIS 8.5 private website must employ cryptographic mechanisms (TLS)
and require client certificates."
  desc  "When data is written to digital media, such as hard drives, mobile
computers, external/removable hard drives, personal digital assistants,
flash/thumb drives, etc., there is risk of data loss and data compromise. User
identities and passwords stored on the hard drive of the hosting hardware must
be encrypted to protect the data from easily being discovered and used by an
unauthorized user to access the hosted applications. The cryptographic
libraries and functionality used to store and retrieve the user identifiers and
passwords must be part of the web server.

    Preventing the disclosure of transmitted information requires that the web
server take measures to employ some form of cryptographic mechanism in order to
protect the information during transmission. This is usually achieved through
the use of Transport Layer Security (TLS).

    Transmission of data can take place between the web server and a large
number of devices/applications external to the web server. Examples are a web
client used by a user, a backend database, an audit server, or other web
servers in a web cluster.

    If data is transmitted unencrypted, the data then becomes vulnerable to
disclosure. The disclosure may reveal user identifier/password combinations,
website code revealing business logic, or other user personal information.

    Also satisfies: SRG-APP-000439-WSR-000151
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000429-WSR-000113"
  tag "gid": "V-76851"
  tag "rid": "SV-91547r3_rule"
  tag "stig_id": "IISW-SI-000242"
  tag "fix_id": "F-83547r1_fix"
  tag "cci": ["CCI-002476"]
  tag "nist": ["SC-28 (1)", "Rev_4"]
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

Double-click the \"SSL Settings\" icon under the \"IIS\" section.
 
Verify \"Require SSL\" is checked.

Verify \"Client Certificates Required\" is selected.

Click the site under review.

Select \"Configuration Editor\" under the \"Management\" section.

From the \"Section:\" drop-down list at the top of the configuration editor,
locate system.webServer/security/access.

The value for \"sslFlags\" set must include \"ssl128\".

If the \"Require SSL\" is not selected, this is a finding.

If the \"Client Certificates Required\" is not selected, this is a finding.

If the \"sslFlags\" is not set to \"ssl128\", this is a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
web server:

Open the IIS 8.5 Manager.

Double-click the \"SSL Settings\" icon under the \"IIS\" section.

Select the \"Require SSL\" setting.

Select the \"Client Certificates Required\" setting.

Click \"Apply\" in the \"Actions\" pane.

Click the site under review.

Select \"Configuration Editor\" under the \"Management\" section.

From the \"Section:\" drop-down list at the top of the configuration editor,
locate system.webServer/security/access.

Click on the drop-down list for \"sslFlags\".

Select the \"Ssl128\" check box.

Click \"Apply\" in the \"Actions\" pane."
  describe command('Get-WebConfigurationProperty -Filter system.webServer/security/access -name * | select -expand sslFlags').stdout.strip do
    it {should include 'Ssl'}
  end
  describe command('Get-WebConfigurationProperty -Filter system.webServer/security/access -name * | select -expand sslFlags').stdout.strip do
    it {should include 'Ssl128'}
  end
end
 

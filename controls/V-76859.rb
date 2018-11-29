control "V-76859" do
  title "Cookies exchanged between the IIS 8.5 website and the client must use
  SSL/TLS, have cookie properties set to prohibit client-side scripts from
  reading the cookie data and must not be compressed."
  desc  "A cookie is used when a web server needs to share data with the
  client's browser. The data is often used to remember the client when the client
  returns to the hosted application at a later date. A session cookie is a
  special type of cookie used to remember the client during the session. The
  cookie will contain the session identifier (ID) and may contain authentication
  data to the hosted application. To protect this data from easily being
  compromised, the cookie must be encrypted.

      When a cookie is sent encrypted via SSL/TLS, an attacker must spend a great
  deal of time and resources to decrypt the cookie. If, along with encryption,
  the cookie is compressed, the attacker can now use a combination of plaintext
  injection and inadvertent information leakage through data compression to
  reduce the time needed to decrypt the cookie. This attack is called Compression
  Ratio Info-leak Made Easy (CRIME).

      Cookies shared between the web server and the client when encrypted should
  not also be compressed.

      A cookie can be read by client-side scripts easily if cookie properties are
  not set properly. By allowing cookies to be read by the client-side scripts,
  information such as session identifiers could be compromised and used by an
  attacker who intercepts the cookie. Setting cookie properties (i.e. HttpOnly
  property) to disallow client-side scripts from reading cookies better protects
  the information inside the cookie.
  "
  impact 0.7
  tag "gtitle": "SRG-APP-000439-WSR-000154"
  tag "satisfies": ["SRG-APP-000439-WSR-000154", "SRG-APP-000439-SSR-000155",
  "SRG-APP-000439-WSR-000153"]
  tag "gid": "V-76859"
  tag "rid": "SV-91555r2_rule"
  tag "stig_id": "IISW-SI-000246"
  tag "fix_id": "F-83555r1_fix"
  tag "cci": ["CCI-002418"]
  tag "nist": ["SC-8", "Rev_4"]
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

  Access the IIS 8.5 Manager.

  Under \"Management\" section, double-click the \"Configuration Editor\" icon.

  From the \"Section:\" drop-down list, select \"system.web/httpCookies\".

  Verify the \"require SSL\" is set to \"True\".

  From the \"Section:\" drop-down list, select \"system.web/sessionState\".

  Verify the \"compressionEnabled\" is set to \"False\".

  If both the \"system.web/httpCookies:require SSL\" is set to \"True\" and the
  \"system.web/sessionState:compressionEnabled\" is set to \"False\", this is not
  a finding."
  tag "fix": "Follow the procedures below for each site hosted on the IIS 8.5
  web server:

  Access the IIS 8.5 Manager.

  Under \"Management\" section, double-click the \"Configuration Editor\" icon.

  From the \"Section:\" drop-down list, select \"system.web/httpCookies\".

  Set the \"require SSL\" to \"True\".

  From the \"Section:\" drop-down list, select \"system.web/sessionState\".

  Set the \"compressionEnabled\" to \"False\".

  Select \"Apply\" from the \"Actions\" pane."
 
  get_names = command("Get-Website | select name | findstr /v 'name ---'").stdout.strip.split("\r\n")
  get_compressionEnabled = command('Get-WebConfigurationProperty -pspath "IIS:\Sites\*" -Filter system.web/sessionState -name * | select -expand compressionEnabled').stdout.strip.split("\r\n")


  get_compressionEnabled.zip(get_names).each do |compressionEnabled, names|
    n = names.strip

    describe "The IIS site: #{n} website compressionEnabled enabled setting" do
      subject { compressionEnabled }
      it {should cmp 'False'}
    end
  end
  if get_names.empty?
    describe "There are no IIS sites configured" do
      impact 0.0
      skip "Control not applicable"
    end
  end
end

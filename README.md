# iis_site_baseline

InSpec profile testing secure configuration of Internet Information Server Site version 8.5.

## Description

This InSpec compliance profile is a collection of automated tests for secure configuration of IIS Site 8.5 .

InSpec is an open-source run-time framework and rule language used to specify compliance, security, and policy requirements for testing any node in your infrastructure.

## Requirements

- [ruby](https://www.ruby-lang.org/en/) version 2.4  or greater
- [InSpec](http://inspec.io/) version 2.1  or greater
    - Install via ruby gem: `gem install inspec`

## Usage
InSpec makes it easy to run tests wherever you need. More options listed here: [InSpec cli](http://inspec.io/docs/reference/cli/)

### Run with remote profile:
You may choose to run the profile via a remote url, this has the advantage of always being up to date.
The disadvantage is you may wish to modify controls, which is only possible when downloaded.
Also, the remote profile is unintuitive for passing in attributes, which modify the default values of the profile.
``` bash
inspec exec https://github.com/aaronlippold/iis-site-baseline/archive/master.tar.gz
```

Another option is to download the profile then run it, this allows you to edit specific instructions and view the profile code.
``` bash
# Clone Inspec Profile
$ git clone https://github.com/aaronlippold/iis-site-baseline.git

# Run profile locally (assuming you have not changed directories since cloning)
# This will display compliance level at the prompt, and generate a JSON file 
# for export called output.json
$ inspec exec iis-site-baseline --reporter cli json:output.json

# Run profile with custom settings defined in attributes.yml against the target 
# server example.com. 
$ inspec exec iis-site-baseline -t ssh://user@password:example.com --attrs attributes.yml --reporter cli json:output.json

# Run profile with: custom attributes, ssh keyed into a custom target, and sudo.
$ inspec exec iis-site-baseline -t ssh://user@hostname -i /path/to/key --sudo --attrs attributes.yml --reporter cli json:output.json
```


## Contributors + Kudos

- Aaron Lippold
- The MITRE InSpec Team

## License and Author

### Authors

- Author:: Aaron Lippold

### License 

* This project is licensed under the terms of the Apache license 2.0 (apache-2.0)

### Progress report

|Control|Auto/Manual|Describe|in-progress|Review-RDY|Reviewed|Tested|Automated Unit Tests|
|--------|----------|----------|----------|----------|----------|----------|------------|
|V-76797|   auto   |yes|   |yes| | | |
|V-76867|   auto   |yes|   |yes| | | |
|V-76877|   auto   |yes|   |yes| | | |
|V-76787|  manual  |yes|   |yes| | | |
|V-76843|   auto   |yes|   |yes| | | |
|V-76847|   auto   |yes|   |yes| | | |
|V-76873|   auto   |yes|   |yes| | | |
|V-76783|   auto   |yes|   |yes| | | |
|V-76891|  manual  |yes|   |yes| | | |
|V-76807|   auto   |yes|   |yes| | | |
|V-76817|   auto   |yes|   |yes| | | |
|V-76823|   auto   |yes|   |yes| | | |
|V-76881|   auto   |yes|   |yes| | | |
|V-76803|   auto   |yes|   |yes| | | |
|V-76837|   auto   |yes|   |yes| | | |
|V-76827|   auto   |yes|   |yes| | | |
|V-76775|   auto   |yes|   |yes| | | |
|V-76885|  manual  |yes|   |yes| | | |
|V-76813|   auto   |yes|   |yes| | | |
|V-76859|   auto   |yes|   |yes| | | |
|V-76849|   auto   |yes|   |yes| | | |
|V-76869|   auto   |yes|   |yes| | | |
|V-76799|   auto   |yes|   |yes| | | |
|V-76789|   auto   |yes|   |yes| | | |
|V-76879|   auto   |yes|   |yes| | | |
|V-76839|   auto   |yes|   |yes| | | |
|V-76829|   auto   |yes|   |yes| | | |
|V-76809|   auto   |yes|   |yes| | | |
|V-76819|   auto   |yes|   |yes| | | |
|V-76779|   auto   |yes|   |yes| | | |
|V-76889|  manual  |yes|   |yes| | | |
|V-76861|   auto   |yes|   |yes| | | |
|V-76791|   auto   |yes|   |yes| | | |
|V-76855|   auto   |yes|   |yes| | | |
|V-76845|   auto   |yes|   |yes| | | |
|V-76781|   auto   |yes|   |yes| | | |
|V-76871|   auto   |yes|   |yes| | | |
|V-76851|   auto   |yes|   |yes| | | |
|V-76865|  manual  |yes|   |yes| | | |
|V-76795|   auto   |yes|   |yes| | | |
|V-76785|   auto   |yes|   |yes| | | |
|V-76875|   auto   |yes|   |yes| | | |
|V-76841|   auto   |yes|   |yes| | | |
|V-76801|   auto   |yes|   |yes| | | |
|V-76835|   auto   |yes|   |yes| | | |
|V-76887|  manual  |yes|   |yes| | | |
|V-76777|   auto   |yes|   |yes| | | |
|V-76825|   auto   |yes|   |yes| | | |
|V-76811|   auto   |yes|   |yes| | | |
|V-76831|   auto   |yes|   |yes| | | |
|V-76805|   auto   |yes|   |yes| | | |
|V-76815|   auto   |yes|   |yes| | | |
|V-76883|   auto   |yes|   |yes| | | |
|V-76821|   auto   |yes|   |yes| | | |
|V-76773|   auto   |yes|   |yes| | | |


Legend
- Describe: Control has been evaluated and categorized as candidate for automated tests. Describe block has been written.
- Auto/Manual: Control has been evaluated and categorized as candidate for type that needs a manual review. Describe block has been written.
- Awaiting Review: Control is ready for peer review.
- in-progress: Initial evaluation has been completed, describe statements are being worked on.
- Reviewed: Control has been peer reviewed.
- Tested: Control has been peer reviewed and improved ( if needed ) and the improvements have been peer-tested.
- Automated Unit Tested: Automation of unit testing has been developed to the final point where creation, destruction and configuration of the resources has been automated fully.

# NOTICE

© 2018 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.
# NOTICE
This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation. 

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.

# NOTICE

DISA STIGs are published by DISA IASE, see: https://iase.disa.mil/Pages/privacy_policy.aspx   
LICENSE

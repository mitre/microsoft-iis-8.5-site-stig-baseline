# microsoft-iis-8.5-site-stig-baseline

InSpec Profile to validate the secure configuration of Microsoft IIS 8.5 Site against the [Microsoft IIS 8.5 Site STIG - Ver 1, Rel 5](https://iasecontent.disa.mil/stigs/zip/U_MS_IIS_8-5_Site_V1R5_STIG.zip).


## Getting Started  
It is intended and recommended that InSpec run this profile from a __"runner"__ host (such as a DevOps orchestration server, an administrative management system, or a developer's workstation/laptop) against the target remotely over __winrm__.

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

Latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

## Running This Profile

    inspec exec https://github.com/mitre/microsoft-iis-8.5-site-stig-baseline/archive/master.tar.gz -t winrm://<hostip> --user '<admin-account>' --password=<password> --reporter cli json:<filename>.json

Runs this profile over winrm to the host at IP address <hostip> as a privileged user account (i.e., an account with administrative privileges), reporting results to both the command line interface (cli) and to a machine-readable JSON file. 

    NOTE: Provide a usable example based on instructions above. 
    Example:
    inspec exec https://github.com/mitre/stig-microsoft-iis-8.5-site-baseline/archive/master.tar.gz -t winrm://$winhostip --user 'Administrator --password=Pa55w0rd --reporter cli json:my-iis-site.json

## Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://mitre.github.io/heimdall-lite/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __full heimdall server__, allowing for additional functionality such as to store and compare multiple profile runs.

## Contributors + Kudos

- Aaron Lippold
- The MITRE InSpec Team

## License and Author

### Authors
- Rony Xavier
- Alicia Sturtevant

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

### NOTICE  

© 2018 The MITRE Corporation.  

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.  

### NOTICE
MITRE hereby grants express written permission to use, reproduce, distribute, modify, and otherwise leverage this software to the extent permitted by the licensed terms provided in the LICENSE.md file included with this project.

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation. 

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.  

### NOTICE  

DISA STIGs are published by DISA IASE, see: https://iase.disa.mil/Pages/privacy_policy.aspx

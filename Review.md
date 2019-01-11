# Release Review
| Check          | Sub-check                                                                         | Who | Completion Date | Issue #'s |
|----------------|-----------------------------------------------------------------------------------|-----|-----------------|-----------|
|Logical checks| Proper profile directory structure							|Eugene Aronne|11/26/2018|*|
||JSON output review (e.g., pass/fail on ,<br>hardened, not hardened, edge cases, etc.)|Rony Xavier|11/30/2018|*|
||InSpec syntax checker|Rony Xavier|11/30/2018|*|
||Local commands focused on target not the runner|Rony Xavier|11/30/2018|*|
|Quality checks|Alignment (including tagging) to original<br> standard (i.e. STIG, CIS Benchmark, NIST Tags)|Rony Xavier|11/30/2018|*|
||Descriptive output for findings details|Rony Xavier|11/30/2018|*|
||Documentation quality (i.e. README)<br> novice level instructions including prerequisites|Rony Xavier|11/30/2018|*|
||Consistency across other profile conventions |Rony Xavier|11/30/2018|*|
||Spelling grammar|Eugene Aronne|11/26/2018|*|
||Removing debugging documentation and code|Rony Xavier|11/30/2018|*|
| Error handling |“Profile Error” containment: “null” responses <br>should only happen if InSpec is run with incorrect privileges|Rony Xavier|11/30/2018|*|
||Slowing the target (e.g. filling up disk, CPU spikes)|Rony Xavier|11/30/2018|*|
||Check for risky commands (e.g. rm, del, purge, etc.)|Eugene Aronne|11/26/2018|*|
||Check for “stuck” situations (e.g., profile goes on forever)|Rony Xavier|11/30/2018|*|


Note
-------------------------------------------------------------------------------
*** A completion date is entered in a row when all non-enhancement issues are resolved for that review row.

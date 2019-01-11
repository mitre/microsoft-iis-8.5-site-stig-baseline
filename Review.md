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

# Progress report

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
-------------------------------------------------------------------------------
- Describe: Control has been evaluated and categorized as candidate for automated tests. Describe block has been written.
- Auto/Manual: Control has been evaluated and categorized as candidate for type that needs a manual review. Describe block has been written.
- Awaiting Review: Control is ready for peer review.
- in-progress: Initial evaluation has been completed, describe statements are being worked on.
- Reviewed: Control has been peer reviewed.
- Tested: Control has been peer reviewed and improved ( if needed ) and the improvements have been peer-tested.
- Automated Unit Tested: Automation of unit testing has been developed to the final point where creation, destruction and configuration of the resources has been automated fully.

# `testFramework_JUnitXMLWriter`

*File: `lua/common/testFramework/JUnitXMLWriter.lua` · VM: Common (GE + vehicle) · 101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("testFramework/JUnitXMLWriter")`

JUnit XML test result writer for testFramework/TestManager. Builds a DOM (testsuites > testsuite > testcase, with a failure element for each failed test) with libs/slaxml/slaxdom, serializes it with 2-space indentation and writes it with writeFile.

## Notes

- The suite name is `suiteName`, or `results.suiteName`, or "LuaUnitTests" by default.
- A failed test carries a <failure type="ExpectedFailure"|"Failure"> element whose text is errorMessage.
- Called by TestManager:run only if options.writeXml == true and an output file is given.

## Functions

| Function | Description | Line |
|---|---|---|
| `testFramework_JUnitXMLWriter.write(results, outputFile, suiteName)` | Writes the test results to a JUnit XML file and logs the path. | 23 |

### Parameter details

#### `testFramework_JUnitXMLWriter.write(results, outputFile, suiteName)`

Writes the test results to a JUnit XML file and logs the path.

- `results` (*table*) : {testResults = {{name, duration, passed, expectedToFail, errorMessage}}, testFailCount, totalDuration, suiteName?}.
- `outputFile` (*string*) : XML file path (writeFile).
- `suiteName` (*string|nil*) : Test suite name.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/testFramework/JUnitXMLWriter.lua`.*

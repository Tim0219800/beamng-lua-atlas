# `libs_xlsxlib_tests_JUnitXMLWriter`

*File: `lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua` · VM: Common (GE + vehicle) · 96 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/xlsxlib/tests/JUnitXMLWriter")`

JUnit XML test result writer for the xlsxlib tests. Builds a DOM (testsuites > testsuite > testcase, with a failure element for each failed test) then serializes it and writes it with writeFile. Used by libs/xlsxlib/tests/TestManager.

## Notes

- The file requires `libs/slaxml/slaxml` (not slaxdom) but calls `SLAXML:xml`, which is only defined by slaxdom; this works only if slaxdom has already been loaded somewhere (it is, via xlsxlib). In isolation, the call would fail.
- The suite name is fixed to "LuaUnitTests". Failed tests have type "ExpectedFailure" if the test was supposed to fail, otherwise "Failure".

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_xlsxlib_tests_JUnitXMLWriter.write(results, outputFile)` | Writes the results to a JUnit XML file (indentation 2) and logs the path. | 19 |

### Parameter details

#### `libs_xlsxlib_tests_JUnitXMLWriter.write(results, outputFile)`

Writes the results to a JUnit XML file (indentation 2) and logs the path.

- `results` (*table*) : {testResults = {{name, duration, passed, expectedToFail, errorMessage}}, testFailCount, totalDuration}.
- `outputFile` (*string*) : Path of the XML file to write (writeFile).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua`.*

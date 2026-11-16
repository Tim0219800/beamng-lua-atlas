---@meta
-- tim19Atlas stub generated from lua/common/testFramework/JUnitXMLWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- JUnit XML test result writer for testFramework/TestManager. Builds a DOM (testsuites > testsuite > testcase, with a failure element for each failed test) with libs/slaxml/slaxdom, serializes it with 2-space indentation and writes it with writeFile.
--- Access: `require("testFramework/JUnitXMLWriter")`
---@class testFramework_JUnitXMLWriter
local testFramework_JUnitXMLWriter = {}

--- Writes the test results to a JUnit XML file and logs the path.
---Source: lua/common/testFramework/JUnitXMLWriter.lua:23
---@param results table {testResults = {{name, duration, passed, expectedToFail, errorMessage}}, testFailCount, totalDuration, suiteName?}.
---@param outputFile string XML file path (writeFile).
---@param suiteName string|nil Test suite name.
function testFramework_JUnitXMLWriter.write(results, outputFile, suiteName) end

return testFramework_JUnitXMLWriter

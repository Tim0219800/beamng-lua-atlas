---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- JUnit XML test result writer for the xlsxlib tests. Builds a DOM (testsuites > testsuite > testcase, with a failure element for each failed test) then serializes it and writes it with writeFile. Used by libs/xlsxlib/tests/TestManager.
--- Access: `require("libs/xlsxlib/tests/JUnitXMLWriter")`
---@class libs_xlsxlib_tests_JUnitXMLWriter
local libs_xlsxlib_tests_JUnitXMLWriter = {}

--- Writes the results to a JUnit XML file (indentation 2) and logs the path.
---Source: lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua:19
---@param results table {testResults = {{name, duration, passed, expectedToFail, errorMessage}}, testFailCount, totalDuration}.
---@param outputFile string Path of the XML file to write (writeFile).
function libs_xlsxlib_tests_JUnitXMLWriter.write(results, outputFile) end

return libs_xlsxlib_tests_JUnitXMLWriter

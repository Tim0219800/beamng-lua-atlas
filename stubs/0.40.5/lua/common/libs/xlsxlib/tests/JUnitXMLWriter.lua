---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- JUnit XML Writer for test results
---   This module provides functionality to write test results to a JUnit-compatible XML file using slaxdom.
---
---   Usage:
---     - Call JUnitXMLWriter.write(results, outputFile) to write the results to a file.
--- Accès : `require("libs/xlsxlib/tests/JUnitXMLWriter")`
---@class libs_xlsxlib_tests_JUnitXMLWriter
local libs_xlsxlib_tests_JUnitXMLWriter = {}

--- Writes the test results to a JUnit XML file using slaxdom.
---
---   @param results A table containing the test results.
---   @param outputFile The file path to output the test results.
---Source : lua/common/libs/xlsxlib/tests/JUnitXMLWriter.lua:19
---@param results any
---@param outputFile any
function libs_xlsxlib_tests_JUnitXMLWriter.write(results, outputFile) end

return libs_xlsxlib_tests_JUnitXMLWriter

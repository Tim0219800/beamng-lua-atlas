---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/tests/TestManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Minimal unit test manager (Thomas Fischer, 2024) specific to the xlsxlib tests; it is the ancestor of testFramework/TestManager. It collects the functions whose name starts with "test" into a table, runs them in alphabetical order, logs PASSED/FAILED, and writes a JUnit XML report if an output file is given. A test whose name ends with `_shouldFail` must fail to be considered successful.
--- Access: `require("libs/xlsxlib/tests/TestManager")`
---@class libs_xlsxlib_tests_TestManager
local libs_xlsxlib_tests_TestManager = {}

--- Runs the tests of the `tests` table (keys starting with "test", sorted), logs the result of each, displays the counters, then writes the JUnit XML if `outputFile` is given. (dynamically assigned)
---Source: lua/common/libs/xlsxlib/tests/TestManager.lua:dyn
---@param self table TestManager.
---@param tests table<string, function> Test functions; keys not matching "test*" cause an "Unknown test function" error message.
---@param outputFile string|nil Path of the JUnit XML report.
function libs_xlsxlib_tests_TestManager.run(self, tests, outputFile) end

--- Sets the default log level (internal field LogDefault; not used afterwards by run). (dynamically assigned)
---Source: lua/common/libs/xlsxlib/tests/TestManager.lua:dyn
---@param self table TestManager (call with a colon).
---@param logLevel integer LogAlways, LogErrors or LogFails.
function libs_xlsxlib_tests_TestManager.setLogDefault(self, logLevel) end

return libs_xlsxlib_tests_TestManager

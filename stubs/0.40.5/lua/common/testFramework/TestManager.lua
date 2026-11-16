---@meta
-- tim19Atlas stub generated from lua/common/testFramework/TestManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- The game's unit test manager (BeamNG GmbH, Thomas Fischer, 2024). It runs test functions grouped in a table (keys starting with "test", sorted), gives each test a rich `ctx` context (assert, assertEqual, assertNear, fail, success, setDescription, garbage collector checks), measures the duration and allocated memory, and returns a summary. `runTestFiles` discovers all the `*.test.lua` files in /lua/common/ and /lua/<vm>/ and runs them (e.g. mathlib.test.lua, utils.test.lua).
--- Access: `require("testFramework/TestManager")`
---@class testFramework_TestManager
local testFramework_TestManager = {}

--- Reads the frame log (Engine.getFrameLog, under pcall) and converts it into a list {timestamp, level, origin, message}. Used to capture the logs of a test. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager.
---@return table[]  Log entries (empty list on failure).
function testFramework_TestManager.drainFrameLogs(self) end

--- Indicates whether a list of logs contains an error-level entry (first character of the level = E). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager.
---@param logs table[]|nil Entries produced by drainFrameLogs.
---@return boolean  true if there is at least one error.
function testFramework_TestManager.logsContainErrors(self, logs) end

--- Runs the tests of the `tests` table and returns the results. Logs each test (duration, garbage bytes), a final summary, and optionally writes a JUnit XML. (dynamically assigned)
---Source: lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager (call with a colon).
---@param tests table<string, function> Test functions (name starting with "test").
---@param outputFile string|nil Path of the JUnit XML report (used only if options.writeXml).
---@param options table|nil {resultNamePrefix, resultNameSeparator, writeXml, suppressLogs, captureLogs, failOnErrorLogs, testPattern, context, enableJit}.
---@return table  {testPassCount, testFailCount, testResults, totalDuration (s), totalGarbageBytes}. Each result: {name, passed, description, duration, garbageBytes, allowedGarbageBytes, expectedToFail?, errorMessage?, successMessage?, logs?}.
function testFramework_TestManager.run(self, tests, outputFile, options) end

--- Finds all the `*.test.lua` files under /lua/common/ and /lua/<vm>/ (vm "game" -> ge folder), loads them and runs the tests of those whose path (or a test name) matches `pattern`. Aggregates the results. (dynamically assigned)
---Source: lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager.
---@param pattern string|nil Lua pattern applied to the file path then to the test names; nil = run everything.
---@param options table|nil {writeResults = boolean}: writes <file>.results.json next to each test file.
---@return table  {testPassCount, testFailCount, totalDuration, files = {{file, results}}}.
function testFramework_TestManager.runTestFiles(self, pattern, options) end

--- Sets the default log level (internal field LogDefault; not used afterwards by run). (dynamically assigned)
---Source: lua/common/testFramework/TestManager.lua:dyn
---@param self table TestManager.
---@param logLevel integer LogAlways, LogErrors or LogFails.
function testFramework_TestManager.setLogDefault(self, logLevel) end

return testFramework_TestManager

---@meta
-- tim19Atlas stub generated from lua/common/testFramework/ExtensionTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Automatic test runner for the game's Lua extensions (folders /lua/common/extensions/ and /lua/<vm>/extensions/). For each selected extension, it plays 8 checks: file parsing (loadfile), execution in a sandbox without global leaks, loading via extensions.load, tests provided by the extension (table `_unittests`), call of all its `onXxx` hooks with mock data (testFramework/MockGenerators), coverage of the mock generators, serialization stability, unloading. Writes a detailed results JSON (by default /junit-results/lua-extension-tests.json) and logs a summary.
--- Access: `require("testFramework/ExtensionTest")`
---@class testFramework_ExtensionTest
local testFramework_ExtensionTest = {}

--- Discovers the extensions (according to options.pattern), runs the series of 8 tests for each via testManager:run, aggregates the results, writes <outputPrefix>.json and logs the summary. Returns the summary.
---Source: lua/common/testFramework/ExtensionTest.lua:322
---@param testManager table Test manager, normally require('testFramework/TestManager').
---@param options table|nil {pattern = string[], outputPrefix = string, serializationIterations = integer, writeAutoLog = boolean}.
---@return table  Summary {vm, namespace, serializationIterations, extensions, testPassCount, testFailCount, failedExtensionCount, results, outputFiles}.
function testFramework_ExtensionTest.run(testManager, options) end

--- Shortcut: tests the extensions whose name matches the pattern (with wildcards). Logs an error and returns nil if none match.
---Source: lua/common/testFramework/ExtensionTest.lua:395
---@param pattern string Extension name pattern (e.g. "gameplay_*").
---@param options table|nil Options passed to run.
---@return table|nil  Summary like run, or nil.
function testFramework_ExtensionTest.testExtensions(pattern, options) end

return testFramework_ExtensionTest

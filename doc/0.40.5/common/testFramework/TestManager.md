# `testFramework_TestManager`

*File: `lua/common/testFramework/TestManager.lua` · VM: Common (GE + vehicle) · 528 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("testFramework/TestManager")`

The game's unit test manager (BeamNG GmbH, Thomas Fischer, 2024). It runs test functions grouped in a table (keys starting with "test", sorted), gives each test a rich `ctx` context (assert, assertEqual, assertNear, fail, success, setDescription, garbage collector checks), measures the duration and allocated memory, and returns a summary. `runTestFiles` discovers all the `*.test.lua` files in /lua/common/ and /lua/<vm>/ and runs them (e.g. mathlib.test.lua, utils.test.lua).

## Example

```lua
-- GE console:
require('testFramework/TestManager'):runTestFiles()          -- all the *.test.lua
require('testFramework/TestManager'):runTestFiles('mathlib')  -- filter by pattern
```

## Notes

- Context `ctx` passed to each test: fail(message, withTraceback?), success(message), setDescription(text), assert(cond, msg), assertEqual(actual, expected, msg), assertNear(actual, expected, tolerance=0.001, msg), resetGarbageCheckpoint(), checkGarbage(maxBytes=0, msg), allowGarbage(bytes), buildFailureMessage(kind, message). A test is defined as `function M.testXxx(ctx)` (a single parameter: ctx).
- A test name ending in `_shouldFail` must fail to be considered successful.
- Options of `run`: resultNamePrefix, writeXml (writes the JUnit XML if outputFile is also given), suppressLogs, captureLogs (captures Engine.getFrameLog), failOnErrorLogs, testPattern (filter on the name), context, enableJit. By default the JIT is turned off (`jit.off()`, permanently for the session) for reproducibility.
- Each test runs with setfenv(func, _G), a collectgarbage("collect") then `collectgarbage("stop")`: the memory allocated during the test (garbageBytes) is measured between the start and the end, then the GC is restarted.
- The example at the end of the file calls `testManager:run(tests, 'test-results.xml')`; without `options.writeXml = true`, no file is written.
- The tests use engine APIs: HighPerfTimer/hptimer, os.clockhp, Engine.getFrameLog, FS:findFiles, jsonWriteFile, log.
- ExtensionTest.lua expects a `runSandboxedFunction` method on this manager that does not exist there, and the local function getLuaNamespacesForVmType is not exported.

## Functions

| Function | Description | Line |
|---|---|---|
| `testFramework_TestManager.drainFrameLogs(self)` | Reads the frame log (Engine.getFrameLog, under pcall) and converts it into a list {timestamp, level, origin, message}. Used to capture the logs of a test. (dynamically assigned) *(internal)* | dyn |
| `testFramework_TestManager.logsContainErrors(self, logs)` | Indicates whether a list of logs contains an error-level entry (first character of the level = E). (dynamically assigned) *(internal)* | dyn |
| `testFramework_TestManager.run(self, tests, outputFile, options)` | Runs the tests of the `tests` table and returns the results. Logs each test (duration, garbage bytes), a final summary, and optionally writes a JUnit XML. (dynamically assigned) | dyn |
| `testFramework_TestManager.runTestFiles(self, pattern, options)` | Finds all the `*.test.lua` files under /lua/common/ and /lua/<vm>/ (vm "game" -> ge folder), loads them and runs the tests of those whose path (or a test name) matches `pattern`. Aggregates the results. (dynamically assigned) | dyn |
| `testFramework_TestManager.setLogDefault(self, logLevel)` | Sets the default log level (internal field LogDefault; not used afterwards by run). (dynamically assigned) | dyn |

### Parameter details

#### `testFramework_TestManager.drainFrameLogs(self)`

Reads the frame log (Engine.getFrameLog, under pcall) and converts it into a list {timestamp, level, origin, message}. Used to capture the logs of a test. (dynamically assigned)

- `self` (*table*) : TestManager.
- **returns**: table[] Log entries (empty list on failure).

#### `testFramework_TestManager.logsContainErrors(self, logs)`

Indicates whether a list of logs contains an error-level entry (first character of the level = E). (dynamically assigned)

- `self` (*table*) : TestManager.
- `logs` (*table[]|nil*) : Entries produced by drainFrameLogs.
- **returns**: boolean true if there is at least one error.

#### `testFramework_TestManager.run(self, tests, outputFile, options)`

Runs the tests of the `tests` table and returns the results. Logs each test (duration, garbage bytes), a final summary, and optionally writes a JUnit XML. (dynamically assigned)

- `self` (*table*) : TestManager (call with a colon).
- `tests` (*table<string, function>*) : Test functions (name starting with "test").
- `outputFile` (*string|nil*) : Path of the JUnit XML report (used only if options.writeXml).
- `options` (*table|nil*) : {resultNamePrefix, resultNameSeparator, writeXml, suppressLogs, captureLogs, failOnErrorLogs, testPattern, context, enableJit}.
- **returns**: table {testPassCount, testFailCount, testResults, totalDuration (s), totalGarbageBytes}. Each result: {name, passed, description, duration, garbageBytes, allowedGarbageBytes, expectedToFail?, errorMessage?, successMessage?, logs?}.

#### `testFramework_TestManager.runTestFiles(self, pattern, options)`

Finds all the `*.test.lua` files under /lua/common/ and /lua/<vm>/ (vm "game" -> ge folder), loads them and runs the tests of those whose path (or a test name) matches `pattern`. Aggregates the results. (dynamically assigned)

- `self` (*table*) : TestManager.
- `pattern` (*string|nil*) : Lua pattern applied to the file path then to the test names; nil = run everything.
- `options` (*table|nil*) : {writeResults = boolean}: writes <file>.results.json next to each test file.
- **returns**: table {testPassCount, testFailCount, totalDuration, files = {{file, results}}}.

#### `testFramework_TestManager.setLogDefault(self, logLevel)`

Sets the default log level (internal field LogDefault; not used afterwards by run). (dynamically assigned)

- `self` (*table*) : TestManager.
- `logLevel` (*integer*) : LogAlways, LogErrors or LogFails.

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/testFramework/TestManager.lua`.*

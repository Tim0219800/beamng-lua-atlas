# `libs_xlsxlib_tests_TestManager`

*File: `lua/common/libs/xlsxlib/tests/TestManager.lua` · VM: Common (GE + vehicle) · 195 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/xlsxlib/tests/TestManager")`

Minimal unit test manager (Thomas Fischer, 2024) specific to the xlsxlib tests; it is the ancestor of testFramework/TestManager. It collects the functions whose name starts with "test" into a table, runs them in alphabetical order, logs PASSED/FAILED, and writes a JUnit XML report if an output file is given. A test whose name ends with `_shouldFail` must fail to be considered successful.

## Example

```lua
local tm = require('libs/xlsxlib/tests/TestManager')
local tests = {}
function tests:testExemple(ctx) ctx:success('ok') end
tm:run(tests, '/junit-results/exemple.xml')
```

## Notes

- `run` calls each test with `func(tests, ctx)`: tests must therefore be written with the syntax `function Tests:test_x(context)` (the context is the second argument). The file's example (`function tests.testExampleSuccess(context)`) is incorrect: `context` receives the tests table there.
- Provided context: `ctx:fail(message)` (raises an error), `ctx:success(message)` (message displayed if the test succeeds).
- The file does `require('socket')` for `socket.gettime` (durations) and `require('json')`, `libs.xlsxlib.xlsxlib`.
- The counters (`__internal.testPassCount/testFailCount/testResults`) are reset after each run.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_xlsxlib_tests_TestManager.run(self, tests, outputFile)` | Runs the tests of the `tests` table (keys starting with "test", sorted), logs the result of each, displays the counters, then writes the JUnit XML if `outputFile` is given. (dynamically assigned) | dyn |
| `libs_xlsxlib_tests_TestManager.setLogDefault(self, logLevel)` | Sets the default log level (internal field LogDefault; not used afterwards by run). (dynamically assigned) | dyn |

### Parameter details

#### `libs_xlsxlib_tests_TestManager.run(self, tests, outputFile)`

Runs the tests of the `tests` table (keys starting with "test", sorted), logs the result of each, displays the counters, then writes the JUnit XML if `outputFile` is given. (dynamically assigned)

- `self` (*table*) : TestManager.
- `tests` (*table<string, function>*) : Test functions; keys not matching "test*" cause an "Unknown test function" error message.
- `outputFile` (*string|nil*) : Path of the JUnit XML report.

#### `libs_xlsxlib_tests_TestManager.setLogDefault(self, logLevel)`

Sets the default log level (internal field LogDefault; not used afterwards by run). (dynamically assigned)

- `self` (*table*) : TestManager (call with a colon).
- `logLevel` (*integer*) : LogAlways, LogErrors or LogFails.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/xlsxlib/tests/TestManager.lua`.*

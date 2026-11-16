# `testFramework_ExtensionTest`

*File: `lua/common/testFramework/ExtensionTest.lua` · VM: Common (GE + vehicle) · 409 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("testFramework/ExtensionTest")`

Automatic test runner for the game's Lua extensions (folders /lua/common/extensions/ and /lua/<vm>/extensions/). For each selected extension, it plays 8 checks: file parsing (loadfile), execution in a sandbox without global leaks, loading via extensions.load, tests provided by the extension (table `_unittests`), call of all its `onXxx` hooks with mock data (testFramework/MockGenerators), coverage of the mock generators, serialization stability, unloading. Writes a detailed results JSON (by default /junit-results/lua-extension-tests.json) and logs a summary.

## Example

```lua
-- GE console:
local et = require('testFramework/ExtensionTest')
et.testExtensions('core_*')   -- extensions whose name matches the pattern (wildcard *)
```

## Notes

- Bug: `M.run` calls `getLuaNamespacesForVmType()`, a local function of testFramework/TestManager.lua and not defined here; the call raises "attempt to call a nil value".
- Bug: test 2 calls `testManager:runSandboxedFunction(...)`, a method that does not exist in testFramework/TestManager.lua of this version.
- These two calls indicate that the runner is incomplete in version 0.40.5: it probably does not work as is.
- Extension name patterns accept the wildcard `*` (converted to an anchored Lua pattern); the extension list is sorted by name.
- An extension is selected only once even if it exists in common and in the current VM (common takes priority).
- Options of `run`: pattern (list of wildcards), outputPrefix (default /junit-results/lua-extension-tests), serializationIterations (default 3), writeAutoLog (calls extensions/test/util/autoTest if present).

## Functions

| Function | Description | Line |
|---|---|---|
| `testFramework_ExtensionTest.run(testManager, options)` | Discovers the extensions (according to options.pattern), runs the series of 8 tests for each via testManager:run, aggregates the results, writes <outputPrefix>.json and logs the summary. Returns the summary. | 322 |
| `testFramework_ExtensionTest.testExtensions(pattern, options)` | Shortcut: tests the extensions whose name matches the pattern (with wildcards). Logs an error and returns nil if none match. | 395 |

### Parameter details

#### `testFramework_ExtensionTest.run(testManager, options)`

Discovers the extensions (according to options.pattern), runs the series of 8 tests for each via testManager:run, aggregates the results, writes <outputPrefix>.json and logs the summary. Returns the summary.

- `testManager` (*table*) : Test manager, normally require('testFramework/TestManager').
- `options` (*table|nil*) : {pattern = string[], outputPrefix = string, serializationIterations = integer, writeAutoLog = boolean}.
- **returns**: table Summary {vm, namespace, serializationIterations, extensions, testPassCount, testFailCount, failedExtensionCount, results, outputFiles}.

#### `testFramework_ExtensionTest.testExtensions(pattern, options)`

Shortcut: tests the extensions whose name matches the pattern (with wildcards). Logs an error and returns nil if none match.

- `pattern` (*string*) : Extension name pattern (e.g. "gameplay_*").
- `options` (*table|nil*) : Options passed to run.
- **returns**: table|nil Summary like run, or nil.

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/testFramework/ExtensionTest.lua`.*

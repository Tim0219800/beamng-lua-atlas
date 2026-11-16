# `libs_xlsxlib_tests_tests`

*File: `lua/common/libs/xlsxlib/tests/tests.lua` · VM: Common (GE + vehicle) · 131 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/xlsxlib/tests/tests")`

Unit tests of xlsxlib (Thomas Fischer, 2024). Each test loads `test_input_1.xlsx`, reads a sheet or a range and compares the result to the expected JSON file located in lua/common/libs/xlsxlib/tests/. If the expected file does not exist, it is created from the current result (with a warning: to be checked by hand). Launch: `rerequire('libs/xlsxlib/tests/tests').runTests()`.

## Example

```lua
rerequire('libs/xlsxlib/tests/tests').runTests()
```

## Notes

- `runTests` creates the /junit-results/ folder and writes the report to /junit-results/xlsxlib-results.xml.
- The tests use the libs/xlsxlib/tests/TestManager manager; names ending in `_shouldFail` must fail.
- Uses the game's global functions serialize, jsonEncodePretty, writeFile, jsonReadFile, dumps, log and the engine's FS:fileExists.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_xlsxlib_tests_tests.runTests()` | Creates /junit-results/ then runs all the tests of the Tests table via TestManager and writes /junit-results/xlsxlib-results.xml. | 123 |

## Class `Tests`

Table of test cases (methods called by TestManager with a `context`).

| Method | Description | Line |
|---|---|---|
| `Tests:test_firstSheet(context)` | Reads the first sheet of the workbook (without a sheet name). | 81 |
| `Tests:test_nonExistentSheet_shouldFail(context)` | Requests a nonexistent sheet; must fail ("Sheet not found" error). | 77 |
| `Tests:test_selectCellRange(context)` | Selects a range of cells. | 105 |
| `Tests:test_selectColumnRange(context)` | Selects a range of columns. | 97 |
| `Tests:test_selectEntireColumn(context)` | Selects a whole column. | 89 |
| `Tests:test_selectEntireRow(context)` | Selects a whole row. | 93 |
| `Tests:test_selectEntireSheet(context)` | Selects the whole "Sheet1" sheet. | 117 |
| `Tests:test_selectInvalidRange_shouldFail(context)` | Invalid range; must fail. | 113 |
| `Tests:test_selectMixedAbsoluteRelative(context)` | Selects a range mixing absolute and relative references. | 109 |
| `Tests:test_selectRowRange(context)` | Selects a range of rows. | 101 |
| `Tests:test_selectSingleCell(context)` | Selects a single cell. | 85 |

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/xlsxlib/tests/tests.lua`.*

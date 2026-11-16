---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/tests/tests.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of xlsxlib (Thomas Fischer, 2024). Each test loads `test_input_1.xlsx`, reads a sheet or a range and compares the result to the expected JSON file located in lua/common/libs/xlsxlib/tests/. If the expected file does not exist, it is created from the current result (with a warning: to be checked by hand). Launch: `rerequire('libs/xlsxlib/tests/tests').runTests()`.
--- Access: `require("libs/xlsxlib/tests/tests")`
---@class libs_xlsxlib_tests_tests
local libs_xlsxlib_tests_tests = {}

--- Creates /junit-results/ then runs all the tests of the Tests table via TestManager and writes /junit-results/xlsxlib-results.xml.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:123
function libs_xlsxlib_tests_tests.runTests() end

--- Table of test cases (methods called by TestManager with a `context`).
---@class libs_xlsxlib_tests_tests_Tests
local libs_xlsxlib_tests_tests_Tests = {}

--- Reads the first sheet of the workbook (without a sheet name).
---Source: lua/common/libs/xlsxlib/tests/tests.lua:81
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_firstSheet(context) end

--- Requests a nonexistent sheet; must fail ("Sheet not found" error).
---Source: lua/common/libs/xlsxlib/tests/tests.lua:77
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_nonExistentSheet_shouldFail(context) end

--- Selects a range of cells.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:105
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_selectCellRange(context) end

--- Selects a range of columns.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:97
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_selectColumnRange(context) end

--- Selects a whole column.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:89
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_selectEntireColumn(context) end

--- Selects a whole row.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:93
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_selectEntireRow(context) end

--- Selects the whole "Sheet1" sheet.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:117
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_selectEntireSheet(context) end

--- Invalid range; must fail.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:113
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_selectInvalidRange_shouldFail(context) end

--- Selects a range mixing absolute and relative references.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:109
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_selectMixedAbsoluteRelative(context) end

--- Selects a range of rows.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:101
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_selectRowRange(context) end

--- Selects a single cell.
---Source: lua/common/libs/xlsxlib/tests/tests.lua:85
---@param context table Test context.
function libs_xlsxlib_tests_tests_Tests:test_selectSingleCell(context) end

return libs_xlsxlib_tests_tests

---@meta
-- tim19Atlas stub generated from lua/common/libs/xlsxlib/tests/tests.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests for the xlsx library
---  Copyright 2024 BeamNG GmbH, Thomas Fischer <tfischer@beamng.gmbh>
---  how to use:
---  rerequire('libs/xlsxlib/tests/tests').runTests()
--- Accès : `require("libs/xlsxlib/tests/tests")`
---@class libs_xlsxlib_tests_tests
local libs_xlsxlib_tests_tests = {}

---Source : lua/common/libs/xlsxlib/tests/tests.lua:123
function libs_xlsxlib_tests_tests.runTests() end

--- Classe locale `Tests` de lua/common/libs/xlsxlib/tests/tests.lua
---@class libs_xlsxlib_tests_tests_Tests
local libs_xlsxlib_tests_tests_Tests = {}

---Source : lua/common/libs/xlsxlib/tests/tests.lua:81
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_firstSheet(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:77
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_nonExistentSheet_shouldFail(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:105
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_selectCellRange(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:97
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_selectColumnRange(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:89
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_selectEntireColumn(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:93
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_selectEntireRow(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:117
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_selectEntireSheet(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:113
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_selectInvalidRange_shouldFail(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:109
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_selectMixedAbsoluteRelative(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:101
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_selectRowRange(context) end

---Source : lua/common/libs/xlsxlib/tests/tests.lua:85
---@param context any
function libs_xlsxlib_tests_tests_Tests:test_selectSingleCell(context) end

return libs_xlsxlib_tests_tests

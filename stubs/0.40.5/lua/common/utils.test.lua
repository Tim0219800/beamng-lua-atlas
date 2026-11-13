---@meta
-- tim19Atlas stub generated from lua/common/utils.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : `require("utils.test")`
---@class utils_test
local utils_test = {}

--- Tests array concatenation behavior.
---Source : lua/common/utils.test.lua:575
---@param ctx any
function utils_test.testArrayConcat(ctx) end

--- Tests array value index lookup helper.
---Source : lua/common/utils.test.lua:692
---@param ctx any
function utils_test.testArrayFindValueIndex(ctx) end

--- Tests array reverse helper.
---Source : lua/common/utils.test.lua:724
---@param ctx any
function utils_test.testArrayReverse(ctx) end

--- Tests array shuffle preserves members and size.
---Source : lua/common/utils.test.lua:702
---@param ctx any
function utils_test.testArrayShuffle(ctx) end

--- Tests byte-size formatting across units and edge cases.
---Source : lua/common/utils.test.lua:303
---@param ctx any
function utils_test.testBytesToString(ctx) end

--- Tests table datatype validation helper.
---Source : lua/common/utils.test.lua:804
---@param ctx any
function utils_test.testCheckTableDataTypes(ctx) end

--- Tests RGB/HSV and hex color conversion helpers.
---Source : lua/common/utils.test.lua:36
---@param ctx any
function utils_test.testColorConversion(ctx) end

--- Tests color constructors for RGBA and packed values.
---Source : lua/common/utils.test.lua:83
---@param ctx any
function utils_test.testColorCreation(ctx) end

--- Tests procedural color generators return valid color values.
---Source : lua/common/utils.test.lua:138
---@param ctx any
function utils_test.testColorGenerators(ctx) end

--- Tests deep copy behavior including shared-reference diamonds.
---Source : lua/common/utils.test.lua:777
---@param ctx any
function utils_test.testDeepCopy(ctx) end

--- Tests dumps string formatting for basic argument shapes.
---Source : lua/common/utils.test.lua:149
---@param ctx any
function utils_test.testDumps(ctx) end

--- Tests nested table flattening behavior.
---Source : lua/common/utils.test.lua:922
---@param ctx any
function utils_test.testFlattenTable(ctx) end

--- Tests current-time formatting helper output shape.
---Source : lua/common/utils.test.lua:325
---@param ctx any
function utils_test.testFormatTimeStringNow(ctx) end

--- Tests ASCII graph rendering for signs and clamping.
---Source : lua/common/utils.test.lua:332
---@param ctx any
function utils_test.testGraphs(ctx) end

--- Tests JSON handling for BeamNG vec3/quat cdata values.
---Source : lua/common/utils.test.lua:424
---@param ctx any
function utils_test.testJsonCdataRoundtrip(ctx) end

--- Tests decode->encodePretty roundtrip stability.
---Source : lua/common/utils.test.lua:403
---@param ctx any
function utils_test.testJsonDecodeEncodePrettyRoundtrip(ctx) end

--- Tests invalid JSON decode behavior and logging suppression.
---Source : lua/common/utils.test.lua:447
---@param ctx any
function utils_test.testJsonDecodeInvalid(ctx) end

--- Tests JSON encoding with optional output prefix.
---Source : lua/common/utils.test.lua:375
---@param ctx any
function utils_test.testJsonEncodePrefix(ctx) end

--- Tests pretty JSON encoding contains formatted keys.
---Source : lua/common/utils.test.lua:365
---@param ctx any
function utils_test.testJsonEncodePretty(ctx) end

--- Tests encodePretty->decode roundtrip stability.
---Source : lua/common/utils.test.lua:382
---@param ctx any
function utils_test.testJsonEncodePrettyDecodeRoundtrip(ctx) end

--- Tests JSON encode/decode roundtrip for plain tables.
---Source : lua/common/utils.test.lua:355
---@param ctx any
function utils_test.testJsonRoundtrip(ctx) end

--- Tests INI parsing and malformed line handling.
---Source : lua/common/utils.test.lua:883
---@param ctx any
function utils_test.testLoadIni(ctx) end

--- Tests left/right padding helpers.
---Source : lua/common/utils.test.lua:189
---@param ctx any
function utils_test.testLpadRpad(ctx) end

--- Tests dumps GC budgets for single-shot common call paths.
---Source : lua/common/utils.test.lua:161
---@param ctx any
function utils_test.testNoGarbageDumpDumpsSingleShot(ctx) end

--- Tests parseColor for hex, table input, and invalid values.
---Source : lua/common/utils.test.lua:119
---@param ctx any
function utils_test.testParseColor(ctx) end

--- Tests path and level-name parsing helpers.
---Source : lua/common/utils.test.lua:828
---@param ctx any
function utils_test.testPathUtils(ctx) end

--- Tests rainbow color generation at range boundaries.
---Source : lua/common/utils.test.lua:70
---@param ctx any
function utils_test.testRainbowColor(ctx) end

--- Tests serialization and deserialization helpers.
---Source : lua/common/utils.test.lua:869
---@param ctx any
function utils_test.testSerialization(ctx) end

--- Tests set-like table helpers for membership and updates.
---Source : lua/common/utils.test.lua:472
---@param ctx any
function utils_test.testSetOperations(ctx) end

--- Tests shallow copy preserves first-level references.
---Source : lua/common/utils.test.lua:768
---@param ctx any
function utils_test.testShallowCopy(ctx) end

--- Tests shuffledPairs yields each pair exactly once.
---Source : lua/common/utils.test.lua:946
---@param ctx any
function utils_test.testShuffledPairs(ctx) end

--- Tests deterministic iteration order via sortedPairs.
---Source : lua/common/utils.test.lua:934
---@param ctx any
function utils_test.testSortedPairs(ctx) end

--- Tests split behavior for limits and delimiter edge cases.
---Source : lua/common/utils.test.lua:203
---@param ctx any
function utils_test.testSplit(ctx) end

--- Tests deterministic string hashing outputs.
---Source : lua/common/utils.test.lua:281
---@param ctx any
function utils_test.testStringHash(ctx) end

--- Tests sentence-case conversion helper.
---Source : lua/common/utils.test.lua:275
---@param ctx any
function utils_test.testStringSentenceCase(ctx) end

--- Tests string.split API variants and limits.
---Source : lua/common/utils.test.lua:259
---@param ctx any
function utils_test.testStringSplit(ctx) end

--- Tests string startswith/endswith helpers.
---Source : lua/common/utils.test.lua:235
---@param ctx any
function utils_test.testStringStartEnd(ctx) end

--- Tests string strip with explicit character classes.
---Source : lua/common/utils.test.lua:248
---@param ctx any
function utils_test.testStringStrip(ctx) end

--- Tests case-insensitive table value membership.
---Source : lua/common/utils.test.lua:685
---@param ctx any
function utils_test.testTableContainsCaseInsensitive(ctx) end

--- Tests recursive table depth calculation.
---Source : lua/common/utils.test.lua:739
---@param ctx any
function utils_test.testTableDepth(ctx) end

--- Tests C-side table end helper wrapper.
---Source : lua/common/utils.test.lua:657
---@param ctx any
function utils_test.testTableEndC(ctx) end

--- Tests finding a key by value in a table.
---Source : lua/common/utils.test.lua:676
---@param ctx any
function utils_test.testTableFindKey(ctx) end

--- Tests common table utility helpers.
---Source : lua/common/utils.test.lua:505
---@param ctx any
function utils_test.testTableHelpers(ctx) end

--- Tests C-side table insert helper wrapper.
---Source : lua/common/utils.test.lua:665
---@param ctx any
function utils_test.testTableInsertC(ctx) end

--- Tests tableIsArray classification.
---Source : lua/common/utils.test.lua:527
---@param ctx any
function utils_test.testTableIsArray(ctx) end

--- Tests table emptiness checks.
---Source : lua/common/utils.test.lua:538
---@param ctx any
function utils_test.testTableIsEmpty(ctx) end

--- Tests sorted key extraction from tables.
---Source : lua/common/utils.test.lua:548
---@param ctx any
function utils_test.testTableKeysSorted(ctx) end

--- Tests shallow table merge behavior.
---Source : lua/common/utils.test.lua:591
---@param ctx any
function utils_test.testTableMerge(ctx) end

--- Tests read-only table protection behavior.
---Source : lua/common/utils.test.lua:641
---@param ctx any
function utils_test.testTableReadOnly(ctx) end

--- Tests recursive table merge semantics.
---Source : lua/common/utils.test.lua:600
---@param ctx any
function utils_test.testTableRecursive(ctx) end

--- Tests recursive merge behavior with array values.
---Source : lua/common/utils.test.lua:622
---@param ctx any
function utils_test.testTableRecursiveArray(ctx) end

--- Tests round-robin key selection helper.
---Source : lua/common/utils.test.lua:752
---@param ctx any
function utils_test.testTableRoundRobinKey(ctx) end

--- Tests C-side table size helper wrapper.
---Source : lua/common/utils.test.lua:650
---@param ctx any
function utils_test.testTableSizeC(ctx) end

--- Tests table-to-color conversion with nil handling.
---Source : lua/common/utils.test.lua:111
---@param ctx any
function utils_test.testTableToColor(ctx) end

--- Tests conversion of values array into lookup dictionary.
---Source : lua/common/utils.test.lua:562
---@param ctx any
function utils_test.testTableValuesAsLookupDict(ctx) end

--- Tests whitespace trimming behavior.
---Source : lua/common/utils.test.lua:195
---@param ctx any
function utils_test.testTrim(ctx) end

return utils_test

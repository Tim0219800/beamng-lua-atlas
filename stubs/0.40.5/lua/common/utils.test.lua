---@meta
-- tim19Atlas stub generated from lua/common/utils.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of the global utility functions of `utils` (colors, strings, tables, JSON, serialization, copying, paths, sorted/shuffled iterators), to run with testFramework/TestManager. Launch: `require('testFramework/TestManager'):runTestFiles('utils')` in the GE console. Useful to a modder as examples of the expected behavior (edge cases included) of the global helpers.
--- Access: `require("utils.test")`
---@class utils_test
local utils_test = {}

--- Tests array concatenation.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:575
---@param ctx table Test context.
function utils_test.testArrayConcat(ctx) end

--- Tests looking up the index of a value in an array.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:692
---@param ctx table Test context.
function utils_test.testArrayFindValueIndex(ctx) end

--- Tests array reversal.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:724
---@param ctx table Test context.
function utils_test.testArrayReverse(ctx) end

--- Tests that shuffling an array preserves its elements and size.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:702
---@param ctx table Test context.
function utils_test.testArrayShuffle(ctx) end

--- Tests formatting of byte sizes across units and edge cases.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:303
---@param ctx table Test context.
function utils_test.testBytesToString(ctx) end

--- Tests the helper that validates the data types of a table.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:804
---@param ctx table Test context.
function utils_test.testCheckTableDataTypes(ctx) end

--- Tests RGB/HSV and hexadecimal color conversions.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:36
---@param ctx table Test context.
function utils_test.testColorConversion(ctx) end

--- Tests the RGBA color constructors and packed value constructors.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:83
---@param ctx table Test context.
function utils_test.testColorCreation(ctx) end

--- Tests that the procedural color generators return valid colors.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:138
---@param ctx table Test context.
function utils_test.testColorGenerators(ctx) end

--- Tests the deep copy, including shared diamond-shaped references.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:777
---@param ctx table Test context.
function utils_test.testDeepCopy(ctx) end

--- Tests the dumps format for a few argument shapes (table, several arguments, none).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:149
---@param ctx table Test context.
function utils_test.testDumps(ctx) end

--- Tests flattening of nested tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:922
---@param ctx table Test context.
function utils_test.testFlattenTable(ctx) end

--- Tests the shape of the output of the current-time formatting helper.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:325
---@param ctx table Test context.
function utils_test.testFormatTimeStringNow(ctx) end

--- Tests ASCII graph rendering (signs, clipping).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:332
---@param ctx table Test context.
function utils_test.testGraphs(ctx) end

--- Tests the JSON handling of BeamNG vec3/quat cdata values.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:424
---@param ctx table Test context.
function utils_test.testJsonCdataRoundtrip(ctx) end

--- Tests the stability of decode followed by encodePretty.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:403
---@param ctx table Test context.
function utils_test.testJsonDecodeEncodePrettyRoundtrip(ctx) end

--- Tests the behavior of invalid JSON decoding and log suppression.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:447
---@param ctx table Test context.
function utils_test.testJsonDecodeInvalid(ctx) end

--- Tests JSON encoding with an optional output prefix.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:375
---@param ctx table Test context.
function utils_test.testJsonEncodePrefix(ctx) end

--- Tests that pretty (readable) JSON encoding contains formatted keys.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:365
---@param ctx table Test context.
function utils_test.testJsonEncodePretty(ctx) end

--- Tests the stability of encodePretty followed by decode.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:382
---@param ctx table Test context.
function utils_test.testJsonEncodePrettyDecodeRoundtrip(ctx) end

--- Tests the JSON encode/decode round trip on simple tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:355
---@param ctx table Test context.
function utils_test.testJsonRoundtrip(ctx) end

--- Tests INI file parsing and the handling of malformed lines.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:883
---@param ctx table Test context.
function utils_test.testLoadIni(ctx) end

--- Tests the left padding (lpad) and right padding (rpad) helpers.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:189
---@param ctx table Test context.
function utils_test.testLpadRpad(ctx) end

--- Tests the garbage budget (12288 bytes) of dump/dumps for the common call paths, in a single call.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:161
---@param ctx table Test context.
function utils_test.testNoGarbageDumpDumpsSingleShot(ctx) end

--- Tests parseColor with a hexadecimal, a table and invalid values.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:119
---@param ctx table Test context.
function utils_test.testParseColor(ctx) end

--- Tests the path helpers and level name extraction.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:828
---@param ctx table Test context.
function utils_test.testPathUtils(ctx) end

--- Tests rainbow color generation at the range bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:70
---@param ctx table Test context.
function utils_test.testRainbowColor(ctx) end

--- Tests the serialization and deserialization helpers.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:869
---@param ctx table Test context.
function utils_test.testSerialization(ctx) end

--- Tests the set-like helpers: membership and updates.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:472
---@param ctx table Test context.
function utils_test.testSetOperations(ctx) end

--- Tests that the shallow copy preserves first-level references.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:768
---@param ctx table Test context.
function utils_test.testShallowCopy(ctx) end

--- Tests that shuffledPairs returns each pair exactly once.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:946
---@param ctx table Test context.
function utils_test.testShuffledPairs(ctx) end

--- Tests the deterministic iteration order of sortedPairs.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:934
---@param ctx table Test context.
function utils_test.testSortedPairs(ctx) end

--- Tests split: limits and delimiter edge cases.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:203
---@param ctx table Test context.
function utils_test.testSplit(ctx) end

--- Tests that string hashing is deterministic.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:281
---@param ctx table Test context.
function utils_test.testStringHash(ctx) end

--- Tests conversion to sentence case.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:275
---@param ctx table Test context.
function utils_test.testStringSentenceCase(ctx) end

--- Tests the variants of the string.split API and its limits.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:259
---@param ctx table Test context.
function utils_test.testStringSplit(ctx) end

--- Tests the string startswith/endswith helpers.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:235
---@param ctx table Test context.
function utils_test.testStringStartEnd(ctx) end

--- Tests string.strip with explicit character classes.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:248
---@param ctx table Test context.
function utils_test.testStringStrip(ctx) end

--- Tests whether a value belongs to a table, ignoring case.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:685
---@param ctx table Test context.
function utils_test.testTableContainsCaseInsensitive(ctx) end

--- Tests the recursive computation of a table's depth.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:739
---@param ctx table Test context.
function utils_test.testTableDepth(ctx) end

--- Tests the wrapper of the C-side "table end" helper.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:657
---@param ctx table Test context.
function utils_test.testTableEndC(ctx) end

--- Tests looking up a key from a value.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:676
---@param ctx table Test context.
function utils_test.testTableFindKey(ctx) end

--- Tests common table helpers.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:505
---@param ctx table Test context.
function utils_test.testTableHelpers(ctx) end

--- Tests the wrapper of the C-side insertion helper.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:665
---@param ctx table Test context.
function utils_test.testTableInsertC(ctx) end

--- Tests the classification of tableIsArray.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:527
---@param ctx table Test context.
function utils_test.testTableIsArray(ctx) end

--- Tests empty table detection.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:538
---@param ctx table Test context.
function utils_test.testTableIsEmpty(ctx) end

--- Tests the sorted extraction of a table's keys.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:548
---@param ctx table Test context.
function utils_test.testTableKeysSorted(ctx) end

--- Tests the shallow merge of tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:591
---@param ctx table Test context.
function utils_test.testTableMerge(ctx) end

--- Tests read-only table protection.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:641
---@param ctx table Test context.
function utils_test.testTableReadOnly(ctx) end

--- Tests the semantics of the recursive table merge.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:600
---@param ctx table Test context.
function utils_test.testTableRecursive(ctx) end

--- Tests the recursive merge when the values are arrays.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:622
---@param ctx table Test context.
function utils_test.testTableRecursiveArray(ctx) end

--- Tests the round-robin key selection helper.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:752
---@param ctx table Test context.
function utils_test.testTableRoundRobinKey(ctx) end

--- Tests the wrapper of the C-side table size helper.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:650
---@param ctx table Test context.
function utils_test.testTableSizeC(ctx) end

--- Tests table to color conversion, including with nil values.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:111
---@param ctx table Test context.
function utils_test.testTableToColor(ctx) end

--- Tests converting an array of values into a lookup dictionary.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:562
---@param ctx table Test context.
function utils_test.testTableValuesAsLookupDict(ctx) end

--- Tests removal of spaces at the start and end of a string.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.test.lua:195
---@param ctx table Test context.
function utils_test.testTrim(ctx) end

return utils_test

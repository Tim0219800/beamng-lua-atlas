# `utils_test`

*File: `lua/common/utils.test.lua` · VM: Common (GE + vehicle) · 955 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils.test")`

Unit tests of the global utility functions of `utils` (colors, strings, tables, JSON, serialization, copying, paths, sorted/shuffled iterators), to run with testFramework/TestManager. Launch: `require('testFramework/TestManager'):runTestFiles('utils')` in the GE console. Useful to a modder as examples of the expected behavior (edge cases included) of the global helpers.

## Example

```lua
require('testFramework/TestManager'):runTestFiles('utils')
```

## Notes

- Each function takes a context `ctx` provided by TestManager and is not meant to be called directly; the file does `require('utils')` to load the helpers.
- Several "NoGarbage"/"single-shot" tests check an allocation budget (ctx:allowGarbage / checkGarbage).
- The table tests testTableEndC, testTableInsertC and testTableSizeC cover the engine's C function wrappers (table.new-like).

## Functions

| Function | Description | Line |
|---|---|---|
| `utils_test.testArrayConcat(ctx)` | Tests array concatenation. *(internal)* | 575 |
| `utils_test.testArrayFindValueIndex(ctx)` | Tests looking up the index of a value in an array. *(internal)* | 692 |
| `utils_test.testArrayReverse(ctx)` | Tests array reversal. *(internal)* | 724 |
| `utils_test.testArrayShuffle(ctx)` | Tests that shuffling an array preserves its elements and size. *(internal)* | 702 |
| `utils_test.testBytesToString(ctx)` | Tests formatting of byte sizes across units and edge cases. *(internal)* | 303 |
| `utils_test.testCheckTableDataTypes(ctx)` | Tests the helper that validates the data types of a table. *(internal)* | 804 |
| `utils_test.testColorConversion(ctx)` | Tests RGB/HSV and hexadecimal color conversions. *(internal)* | 36 |
| `utils_test.testColorCreation(ctx)` | Tests the RGBA color constructors and packed value constructors. *(internal)* | 83 |
| `utils_test.testColorGenerators(ctx)` | Tests that the procedural color generators return valid colors. *(internal)* | 138 |
| `utils_test.testDeepCopy(ctx)` | Tests the deep copy, including shared diamond-shaped references. *(internal)* | 777 |
| `utils_test.testDumps(ctx)` | Tests the dumps format for a few argument shapes (table, several arguments, none). *(internal)* | 149 |
| `utils_test.testFlattenTable(ctx)` | Tests flattening of nested tables. *(internal)* | 922 |
| `utils_test.testFormatTimeStringNow(ctx)` | Tests the shape of the output of the current-time formatting helper. *(internal)* | 325 |
| `utils_test.testGraphs(ctx)` | Tests ASCII graph rendering (signs, clipping). *(internal)* | 332 |
| `utils_test.testJsonCdataRoundtrip(ctx)` | Tests the JSON handling of BeamNG vec3/quat cdata values. *(internal)* | 424 |
| `utils_test.testJsonDecodeEncodePrettyRoundtrip(ctx)` | Tests the stability of decode followed by encodePretty. *(internal)* | 403 |
| `utils_test.testJsonDecodeInvalid(ctx)` | Tests the behavior of invalid JSON decoding and log suppression. *(internal)* | 447 |
| `utils_test.testJsonEncodePrefix(ctx)` | Tests JSON encoding with an optional output prefix. *(internal)* | 375 |
| `utils_test.testJsonEncodePretty(ctx)` | Tests that pretty (readable) JSON encoding contains formatted keys. *(internal)* | 365 |
| `utils_test.testJsonEncodePrettyDecodeRoundtrip(ctx)` | Tests the stability of encodePretty followed by decode. *(internal)* | 382 |
| `utils_test.testJsonRoundtrip(ctx)` | Tests the JSON encode/decode round trip on simple tables. *(internal)* | 355 |
| `utils_test.testLoadIni(ctx)` | Tests INI file parsing and the handling of malformed lines. *(internal)* | 883 |
| `utils_test.testLpadRpad(ctx)` | Tests the left padding (lpad) and right padding (rpad) helpers. *(internal)* | 189 |
| `utils_test.testNoGarbageDumpDumpsSingleShot(ctx)` | Tests the garbage budget (12288 bytes) of dump/dumps for the common call paths, in a single call. *(internal)* | 161 |
| `utils_test.testParseColor(ctx)` | Tests parseColor with a hexadecimal, a table and invalid values. *(internal)* | 119 |
| `utils_test.testPathUtils(ctx)` | Tests the path helpers and level name extraction. *(internal)* | 828 |
| `utils_test.testRainbowColor(ctx)` | Tests rainbow color generation at the range bounds. *(internal)* | 70 |
| `utils_test.testSerialization(ctx)` | Tests the serialization and deserialization helpers. *(internal)* | 869 |
| `utils_test.testSetOperations(ctx)` | Tests the set-like helpers: membership and updates. *(internal)* | 472 |
| `utils_test.testShallowCopy(ctx)` | Tests that the shallow copy preserves first-level references. *(internal)* | 768 |
| `utils_test.testShuffledPairs(ctx)` | Tests that shuffledPairs returns each pair exactly once. *(internal)* | 946 |
| `utils_test.testSortedPairs(ctx)` | Tests the deterministic iteration order of sortedPairs. *(internal)* | 934 |
| `utils_test.testSplit(ctx)` | Tests split: limits and delimiter edge cases. *(internal)* | 203 |
| `utils_test.testStringHash(ctx)` | Tests that string hashing is deterministic. *(internal)* | 281 |
| `utils_test.testStringSentenceCase(ctx)` | Tests conversion to sentence case. *(internal)* | 275 |
| `utils_test.testStringSplit(ctx)` | Tests the variants of the string.split API and its limits. *(internal)* | 259 |
| `utils_test.testStringStartEnd(ctx)` | Tests the string startswith/endswith helpers. *(internal)* | 235 |
| `utils_test.testStringStrip(ctx)` | Tests string.strip with explicit character classes. *(internal)* | 248 |
| `utils_test.testTableContainsCaseInsensitive(ctx)` | Tests whether a value belongs to a table, ignoring case. *(internal)* | 685 |
| `utils_test.testTableDepth(ctx)` | Tests the recursive computation of a table's depth. *(internal)* | 739 |
| `utils_test.testTableEndC(ctx)` | Tests the wrapper of the C-side "table end" helper. *(internal)* | 657 |
| `utils_test.testTableFindKey(ctx)` | Tests looking up a key from a value. *(internal)* | 676 |
| `utils_test.testTableHelpers(ctx)` | Tests common table helpers. *(internal)* | 505 |
| `utils_test.testTableInsertC(ctx)` | Tests the wrapper of the C-side insertion helper. *(internal)* | 665 |
| `utils_test.testTableIsArray(ctx)` | Tests the classification of tableIsArray. *(internal)* | 527 |
| `utils_test.testTableIsEmpty(ctx)` | Tests empty table detection. *(internal)* | 538 |
| `utils_test.testTableKeysSorted(ctx)` | Tests the sorted extraction of a table's keys. *(internal)* | 548 |
| `utils_test.testTableMerge(ctx)` | Tests the shallow merge of tables. *(internal)* | 591 |
| `utils_test.testTableReadOnly(ctx)` | Tests read-only table protection. *(internal)* | 641 |
| `utils_test.testTableRecursive(ctx)` | Tests the semantics of the recursive table merge. *(internal)* | 600 |
| `utils_test.testTableRecursiveArray(ctx)` | Tests the recursive merge when the values are arrays. *(internal)* | 622 |
| `utils_test.testTableRoundRobinKey(ctx)` | Tests the round-robin key selection helper. *(internal)* | 752 |
| `utils_test.testTableSizeC(ctx)` | Tests the wrapper of the C-side table size helper. *(internal)* | 650 |
| `utils_test.testTableToColor(ctx)` | Tests table to color conversion, including with nil values. *(internal)* | 111 |
| `utils_test.testTableValuesAsLookupDict(ctx)` | Tests converting an array of values into a lookup dictionary. *(internal)* | 562 |
| `utils_test.testTrim(ctx)` | Tests removal of spaces at the start and end of a string. *(internal)* | 195 |

### Parameter details

#### `utils_test.testArrayConcat(ctx)`

Tests array concatenation.

- `ctx` (*table*) : Test context.

#### `utils_test.testArrayFindValueIndex(ctx)`

Tests looking up the index of a value in an array.

- `ctx` (*table*) : Test context.

#### `utils_test.testArrayReverse(ctx)`

Tests array reversal.

- `ctx` (*table*) : Test context.

#### `utils_test.testArrayShuffle(ctx)`

Tests that shuffling an array preserves its elements and size.

- `ctx` (*table*) : Test context.

#### `utils_test.testBytesToString(ctx)`

Tests formatting of byte sizes across units and edge cases.

- `ctx` (*table*) : Test context.

#### `utils_test.testCheckTableDataTypes(ctx)`

Tests the helper that validates the data types of a table.

- `ctx` (*table*) : Test context.

#### `utils_test.testColorConversion(ctx)`

Tests RGB/HSV and hexadecimal color conversions.

- `ctx` (*table*) : Test context.

#### `utils_test.testColorCreation(ctx)`

Tests the RGBA color constructors and packed value constructors.

- `ctx` (*table*) : Test context.

#### `utils_test.testColorGenerators(ctx)`

Tests that the procedural color generators return valid colors.

- `ctx` (*table*) : Test context.

#### `utils_test.testDeepCopy(ctx)`

Tests the deep copy, including shared diamond-shaped references.

- `ctx` (*table*) : Test context.

#### `utils_test.testDumps(ctx)`

Tests the dumps format for a few argument shapes (table, several arguments, none).

- `ctx` (*table*) : Test context.

#### `utils_test.testFlattenTable(ctx)`

Tests flattening of nested tables.

- `ctx` (*table*) : Test context.

#### `utils_test.testFormatTimeStringNow(ctx)`

Tests the shape of the output of the current-time formatting helper.

- `ctx` (*table*) : Test context.

#### `utils_test.testGraphs(ctx)`

Tests ASCII graph rendering (signs, clipping).

- `ctx` (*table*) : Test context.

#### `utils_test.testJsonCdataRoundtrip(ctx)`

Tests the JSON handling of BeamNG vec3/quat cdata values.

- `ctx` (*table*) : Test context.

#### `utils_test.testJsonDecodeEncodePrettyRoundtrip(ctx)`

Tests the stability of decode followed by encodePretty.

- `ctx` (*table*) : Test context.

#### `utils_test.testJsonDecodeInvalid(ctx)`

Tests the behavior of invalid JSON decoding and log suppression.

- `ctx` (*table*) : Test context.

#### `utils_test.testJsonEncodePrefix(ctx)`

Tests JSON encoding with an optional output prefix.

- `ctx` (*table*) : Test context.

#### `utils_test.testJsonEncodePretty(ctx)`

Tests that pretty (readable) JSON encoding contains formatted keys.

- `ctx` (*table*) : Test context.

#### `utils_test.testJsonEncodePrettyDecodeRoundtrip(ctx)`

Tests the stability of encodePretty followed by decode.

- `ctx` (*table*) : Test context.

#### `utils_test.testJsonRoundtrip(ctx)`

Tests the JSON encode/decode round trip on simple tables.

- `ctx` (*table*) : Test context.

#### `utils_test.testLoadIni(ctx)`

Tests INI file parsing and the handling of malformed lines.

- `ctx` (*table*) : Test context.

#### `utils_test.testLpadRpad(ctx)`

Tests the left padding (lpad) and right padding (rpad) helpers.

- `ctx` (*table*) : Test context.

#### `utils_test.testNoGarbageDumpDumpsSingleShot(ctx)`

Tests the garbage budget (12288 bytes) of dump/dumps for the common call paths, in a single call.

- `ctx` (*table*) : Test context.

#### `utils_test.testParseColor(ctx)`

Tests parseColor with a hexadecimal, a table and invalid values.

- `ctx` (*table*) : Test context.

#### `utils_test.testPathUtils(ctx)`

Tests the path helpers and level name extraction.

- `ctx` (*table*) : Test context.

#### `utils_test.testRainbowColor(ctx)`

Tests rainbow color generation at the range bounds.

- `ctx` (*table*) : Test context.

#### `utils_test.testSerialization(ctx)`

Tests the serialization and deserialization helpers.

- `ctx` (*table*) : Test context.

#### `utils_test.testSetOperations(ctx)`

Tests the set-like helpers: membership and updates.

- `ctx` (*table*) : Test context.

#### `utils_test.testShallowCopy(ctx)`

Tests that the shallow copy preserves first-level references.

- `ctx` (*table*) : Test context.

#### `utils_test.testShuffledPairs(ctx)`

Tests that shuffledPairs returns each pair exactly once.

- `ctx` (*table*) : Test context.

#### `utils_test.testSortedPairs(ctx)`

Tests the deterministic iteration order of sortedPairs.

- `ctx` (*table*) : Test context.

#### `utils_test.testSplit(ctx)`

Tests split: limits and delimiter edge cases.

- `ctx` (*table*) : Test context.

#### `utils_test.testStringHash(ctx)`

Tests that string hashing is deterministic.

- `ctx` (*table*) : Test context.

#### `utils_test.testStringSentenceCase(ctx)`

Tests conversion to sentence case.

- `ctx` (*table*) : Test context.

#### `utils_test.testStringSplit(ctx)`

Tests the variants of the string.split API and its limits.

- `ctx` (*table*) : Test context.

#### `utils_test.testStringStartEnd(ctx)`

Tests the string startswith/endswith helpers.

- `ctx` (*table*) : Test context.

#### `utils_test.testStringStrip(ctx)`

Tests string.strip with explicit character classes.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableContainsCaseInsensitive(ctx)`

Tests whether a value belongs to a table, ignoring case.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableDepth(ctx)`

Tests the recursive computation of a table's depth.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableEndC(ctx)`

Tests the wrapper of the C-side "table end" helper.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableFindKey(ctx)`

Tests looking up a key from a value.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableHelpers(ctx)`

Tests common table helpers.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableInsertC(ctx)`

Tests the wrapper of the C-side insertion helper.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableIsArray(ctx)`

Tests the classification of tableIsArray.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableIsEmpty(ctx)`

Tests empty table detection.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableKeysSorted(ctx)`

Tests the sorted extraction of a table's keys.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableMerge(ctx)`

Tests the shallow merge of tables.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableReadOnly(ctx)`

Tests read-only table protection.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableRecursive(ctx)`

Tests the semantics of the recursive table merge.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableRecursiveArray(ctx)`

Tests the recursive merge when the values are arrays.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableRoundRobinKey(ctx)`

Tests the round-robin key selection helper.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableSizeC(ctx)`

Tests the wrapper of the C-side table size helper.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableToColor(ctx)`

Tests table to color conversion, including with nil values.

- `ctx` (*table*) : Test context.

#### `utils_test.testTableValuesAsLookupDict(ctx)`

Tests converting an array of values into a lookup dictionary.

- `ctx` (*table*) : Test context.

#### `utils_test.testTrim(ctx)`

Tests removal of spaces at the start and end of a string.

- `ctx` (*table*) : Test context.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils.test.lua`.*

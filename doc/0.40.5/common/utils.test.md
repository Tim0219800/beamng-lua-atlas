# `utils_test`

*Fichier : `lua/common/utils.test.lua` · VM : Commun (GE + véhicule) · 955 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils.test")`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_test.testArrayConcat(ctx)` | Tests array concatenation behavior. | 575 |
| `utils_test.testArrayFindValueIndex(ctx)` | Tests array value index lookup helper. | 692 |
| `utils_test.testArrayReverse(ctx)` | Tests array reverse helper. | 724 |
| `utils_test.testArrayShuffle(ctx)` | Tests array shuffle preserves members and size. | 702 |
| `utils_test.testBytesToString(ctx)` | Tests byte-size formatting across units and edge cases. | 303 |
| `utils_test.testCheckTableDataTypes(ctx)` | Tests table datatype validation helper. | 804 |
| `utils_test.testColorConversion(ctx)` | Tests RGB/HSV and hex color conversion helpers. | 36 |
| `utils_test.testColorCreation(ctx)` | Tests color constructors for RGBA and packed values. | 83 |
| `utils_test.testColorGenerators(ctx)` | Tests procedural color generators return valid color values. | 138 |
| `utils_test.testDeepCopy(ctx)` | Tests deep copy behavior including shared-reference diamonds. | 777 |
| `utils_test.testDumps(ctx)` | Tests dumps string formatting for basic argument shapes. | 149 |
| `utils_test.testFlattenTable(ctx)` | Tests nested table flattening behavior. | 922 |
| `utils_test.testFormatTimeStringNow(ctx)` | Tests current-time formatting helper output shape. | 325 |
| `utils_test.testGraphs(ctx)` | Tests ASCII graph rendering for signs and clamping. | 332 |
| `utils_test.testJsonCdataRoundtrip(ctx)` | Tests JSON handling for BeamNG vec3/quat cdata values. | 424 |
| `utils_test.testJsonDecodeEncodePrettyRoundtrip(ctx)` | Tests decode->encodePretty roundtrip stability. | 403 |
| `utils_test.testJsonDecodeInvalid(ctx)` | Tests invalid JSON decode behavior and logging suppression. | 447 |
| `utils_test.testJsonEncodePrefix(ctx)` | Tests JSON encoding with optional output prefix. | 375 |
| `utils_test.testJsonEncodePretty(ctx)` | Tests pretty JSON encoding contains formatted keys. | 365 |
| `utils_test.testJsonEncodePrettyDecodeRoundtrip(ctx)` | Tests encodePretty->decode roundtrip stability. | 382 |
| `utils_test.testJsonRoundtrip(ctx)` | Tests JSON encode/decode roundtrip for plain tables. | 355 |
| `utils_test.testLoadIni(ctx)` | Tests INI parsing and malformed line handling. | 883 |
| `utils_test.testLpadRpad(ctx)` | Tests left/right padding helpers. | 189 |
| `utils_test.testNoGarbageDumpDumpsSingleShot(ctx)` | Tests dumps GC budgets for single-shot common call paths. | 161 |
| `utils_test.testParseColor(ctx)` | Tests parseColor for hex, table input, and invalid values. | 119 |
| `utils_test.testPathUtils(ctx)` | Tests path and level-name parsing helpers. | 828 |
| `utils_test.testRainbowColor(ctx)` | Tests rainbow color generation at range boundaries. | 70 |
| `utils_test.testSerialization(ctx)` | Tests serialization and deserialization helpers. | 869 |
| `utils_test.testSetOperations(ctx)` | Tests set-like table helpers for membership and updates. | 472 |
| `utils_test.testShallowCopy(ctx)` | Tests shallow copy preserves first-level references. | 768 |
| `utils_test.testShuffledPairs(ctx)` | Tests shuffledPairs yields each pair exactly once. | 946 |
| `utils_test.testSortedPairs(ctx)` | Tests deterministic iteration order via sortedPairs. | 934 |
| `utils_test.testSplit(ctx)` | Tests split behavior for limits and delimiter edge cases. | 203 |
| `utils_test.testStringHash(ctx)` | Tests deterministic string hashing outputs. | 281 |
| `utils_test.testStringSentenceCase(ctx)` | Tests sentence-case conversion helper. | 275 |
| `utils_test.testStringSplit(ctx)` | Tests string.split API variants and limits. | 259 |
| `utils_test.testStringStartEnd(ctx)` | Tests string startswith/endswith helpers. | 235 |
| `utils_test.testStringStrip(ctx)` | Tests string strip with explicit character classes. | 248 |
| `utils_test.testTableContainsCaseInsensitive(ctx)` | Tests case-insensitive table value membership. | 685 |
| `utils_test.testTableDepth(ctx)` | Tests recursive table depth calculation. | 739 |
| `utils_test.testTableEndC(ctx)` | Tests C-side table end helper wrapper. | 657 |
| `utils_test.testTableFindKey(ctx)` | Tests finding a key by value in a table. | 676 |
| `utils_test.testTableHelpers(ctx)` | Tests common table utility helpers. | 505 |
| `utils_test.testTableInsertC(ctx)` | Tests C-side table insert helper wrapper. | 665 |
| `utils_test.testTableIsArray(ctx)` | Tests tableIsArray classification. | 527 |
| `utils_test.testTableIsEmpty(ctx)` | Tests table emptiness checks. | 538 |
| `utils_test.testTableKeysSorted(ctx)` | Tests sorted key extraction from tables. | 548 |
| `utils_test.testTableMerge(ctx)` | Tests shallow table merge behavior. | 591 |
| `utils_test.testTableReadOnly(ctx)` | Tests read-only table protection behavior. | 641 |
| `utils_test.testTableRecursive(ctx)` | Tests recursive table merge semantics. | 600 |
| `utils_test.testTableRecursiveArray(ctx)` | Tests recursive merge behavior with array values. | 622 |
| `utils_test.testTableRoundRobinKey(ctx)` | Tests round-robin key selection helper. | 752 |
| `utils_test.testTableSizeC(ctx)` | Tests C-side table size helper wrapper. | 650 |
| `utils_test.testTableToColor(ctx)` | Tests table-to-color conversion with nil handling. | 111 |
| `utils_test.testTableValuesAsLookupDict(ctx)` | Tests conversion of values array into lookup dictionary. | 562 |
| `utils_test.testTrim(ctx)` | Tests whitespace trimming behavior. | 195 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils.test.lua`.*

# `utils`

*File: `lua/common/utils.lua` · VM: Common (GE + vehicle) · 1511 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("utils")`

Common toolbox (GE and vehicle) loaded at the startup of each Lua VM. This file does not return a table M: it directly defines hundreds of GLOBAL functions (dump, deepcopy, tableMerge, jsonReadFile, jsonWriteFile, readFile, split, colors, serialization, etc.), extends the `string` library (string.startswith, string.split...), creates the global table `path` and assigns the global `lpack`. A modder calls them directly, without require. It also loads `filters`, `inputFilters`, `lpack` and `libs/inspect/inspect`.

## Example

```lua
local data = jsonReadFile('/settings/monfichier.json') or {}
data.compteur = (data.compteur or 0) + 1
jsonWriteFile('/settings/monfichier.json', data, true)
dump(tableKeysSorted(data))
local parties = split('a,b,c', ',')  -- {'a','b','c'}
local copie = deepcopy(data)
```

## Notes

- File paths are those of the game's virtual file system (e.g. '/settings/...', '/levels/...') or disk paths for io.open.
- Colors: color(r,g,b,a) returns a 32-bit RGBA integer (r*2^24 + g*2^16 + b*2^8 + a), components 0..255; hueColor/jetColor/ironbowColor/greyColor take x in [0..1].
- tableSize/tableDepth/deepcopy are slow (they walk the whole table): avoid them in a per-frame loop.
- Many functions return a shared buffer (jsonEncodeWorkBuffer, serializeWorkBuffer, concatWorkBuffer, stringFormatWorkBuffer): the content is overwritten on the next call, so it must be converted (tostring) immediately.
- jsonEncode and jsonEncodeWorkBuffer share the same internal buffer as serialize: do not nest these calls.
- Bug/inconsistency: getCurrentLevelIdentifier(raw) -> the raw parameter changes nothing (the result of string.gsub is ignored when raw is true, the returned value is always lowercase).
- Bug/inconsistency: concatWorkBuffer, in the table branch, tests `vtype == 'boolean'` instead of `vtype1` and puts `v` (the table) instead of `v1` in the buffer for non-numeric elements: this raises an error if an element of the table is not a number.
- Bug/inconsistency: dumpToFile calls inspect(...) with all the arguments: the optional second argument is interpreted as the inspect options table, not as a second value to write.
- Inconsistency: arrayFindValueIndex returns false (and not nil) when the value is absent.
- Inconsistency: saveIni returns nothing (neither true nor false), whereas loadIni returns nil on failure.
- Inconsistency: string.rstripchars and string.stripchars return two values (the result of gsub: text then number of replacements).
- Inconsistency: dump and dumpz log with level 'A' and origin 'lua.utils'; dumpNotNil goes through Lua:log with an empty origin.
- The commented-out code `pairs = sortedPairs` at the bottom of the file shows how to make pairs loops deterministic (the real pairs function is kept in the local `unsortedPairs`).

## Class `path`

Global table `path` defined in this file: file path utilities (separator '/').

| Method | Description | Line |
|---|---|---|
| `path:dirname(filename)` | Returns the folder of a path, with the trailing '/' ('.' if no folder). | dyn |
| `path:getCurrentPath()` | Returns the folder of the caller's Lua file (debug.getinfo(2).short_src). | dyn |
| `path:getPathLevelInfo(levelName)` | Path of a level's info.json file, normalized by sanitizePath. | dyn |
| `path:getPathLevelMain(levelName)` | Path of a level's main.level.json file, normalized by sanitizePath. | dyn |
| `path:is_file(filename)` | Tests whether the file can be opened for reading (io.open). | dyn |
| `path:levelFromPath(filepath)` | Extracts from a path the level name (under 'levels/') and the rest of the path. | dyn |
| `path:split(path, compositeExtension)` | Splits a path into folder, file name (WITH extension) and extension. Without an extension, ext is ''. | dyn |
| `path:splitWithoutExt(filepath, compositeExtension)` | Like split but the returned file name has no extension. Warning: removes it via gsub('.'..ext) (the dot is a pattern wildcard). | dyn |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `HSVtoRGB(h, s, v)` | Converts an HSV color to RGB, components in [0..1]. | 43 |
| `RGBtoHSV(r, g, b)` | Converts an RGB color to HSV. The r,g,b inputs are in [0..1] (inferred from code: no 255 scaling). | 30 |
| `_kv(kv)` | Helper used by the text produced by serialize: builds a table from a flat list {k1, v1, k2, v2…}. A modder normally does not need to call it. | 1262 |
| `addLevelLog(object, logLevel, origin, uniqueErrorCode, message)` | Adds an entry to the engine level log (Engine.Debug.addLevelLogLua), with the caller's file and line (debug.getinfo(2)). Without an object, uses addLevelLogLuaNoObject. | 156 |
| `arrayConcat(dst, src)` | Appends to the end of dst all elements of the array src (includes index 0 of src if it exists). Modifies dst. | 645 |
| `arrayFindValueIndex(t, val)` | Returns the index of the first occurrence of val in the array t. | 773 |
| `arrayReverse(array)` | Reverses a pure array in place. | 792 |
| `arrayShuffle(array)` | Shuffles a pure array in place (Fisher-Yates, math.random). | 783 |
| `bytes_to_string(bytes)` | Converts a number of bytes to readable text with 2 decimals. Uses powers of 1000 (KB, MB, GB), not 1024. | 257 |
| `checkTableDataTypes(data, expectedTypes)` | Validates the types of a parameter array. Prefix an expected type with 'optional:' to allow nil. Pure arrays only. | 867 |
| `clearLevelLogs()` | Clears the level logs (Engine.Debug.clearLevelLogs). | 169 |
| `color(r, g, b, a)` | Builds a 32-bit RGBA color integer. Each component is rounded down to the integer and clamped to 0..255. | 50 |
| `colorGetRGBA(col)` | Inverse operation of color(): decomposes an RGBA integer. | 54 |
| `colorHex(rgbHex, a)` | Builds an RGBA color integer from an RGB hexadecimal (e.g. 0xff8800) and an alpha. | 58 |
| `concatWorkBuffer(...)` | Concatenates the arguments (numbers, strings, booleans, or arrays of numbers) into a shared buffer. Stops at the first nil argument. Infinite/NaN numbers are written as 9e999 / -9e999. | 550 |
| `deepcopy(object)` | Recursive copy of a table, handling circular/shared references and keeping the metatable. FFI structures (vec3, quat) are shallow-copied. Slow. | 854 |
| `deserialize(s)` | Reads back text produced by serialize() by executing loadstring('return '..s). Returns nil if s is nil. Crashes if the text is not valid Lua (e.g. non-serializable cdata). | 1271 |
| `deserializePackages(data, filter)` | Restores the state produced by serializePackages: calls extensions.deserialize, then for each concerned package calls onDeserialize(data) or merges the data (excluding functions) into M.state or M, then calls onDeserialized(data). | 1025 |
| `detectGlobalWrites()` | Debug tool: installs a metatable on _G that logs (level W, with trace) every creation of a new global variable. | 1298 |
| `dump(...)` | Prints to the log (level 'A', origin 'lua.utils') the result of dumps(...). The most common debug function for inspecting a table. | 135 |
| `dumpNotNil(x)` | Like dump, but prints nothing if x is nil (and takes only one value). | 150 |
| `dumpToFile(filename, ...)` | Writes to a file the text inspect(...) of the argument. | 889 |
| `dumps(...)` | Returns the text representation (via libs/inspect) of the arguments, separated by ', '. With no arguments returns ''. For a single userdata with a metatable, inspects the metatable. | 114 |
| `dumpsz(o, depth)` | Like inspect but with unlimited depth by default (depth = math.huge). | 142 |
| `dumpz(o, depth)` | Prints to the log (level 'A', origin 'lua.utils') the result of dumpsz(o, depth). | 146 |
| `fillActionLabelSimple(actionSimple)` | From a list of action names, builds {action=...} and then calls fillActionLabels. | 941 |
| `fillActionLabels(actionItems)` | For each item {action=...}, sets `missing` (true if the action is not active in core_input_actions) and `label` (the action's title, or its name if absent) if label is nil. | 949 |
| `flattenTable(tbl)` | Replaces in tbl, in place, multiple references to the same sub-table with a text token '>#>/path' (to serialize graphs). Keys are walked in sorted order. | 1373 |
| `formatTimeStringNow(res)` | Replaces in res the current local date/time tokens: {YYYY} {YY} {Y} {MM} {M} {DD} {D} {HH} {H} {mm} {m} {ss} {s} (the doubled forms use 2 digits, YYYY uses 4). | 269 |
| `gcprobe(printZero, omitPrint)` | Measures the bytes of garbage created between two calls. First call: stops the GC and remembers the memory. Second call: restarts the GC, prints (if > 0 or printZero) and returns the difference. | 1308 |
| `getAllLevelIdentifiers()` | Lists the folders under /levels/ (FS:findFiles) and returns their names in lowercase. | 1112 |
| `getCurrentLevelIdentifier(raw)` | Returns the identifier (folder) of the current level in lowercase, inferred from the path of getMissionFilename() under /levels/. Returns nil if the path has no folder. | 1104 |
| `getLevelLogs()` | Returns the accumulated level logs (Engine.Debug.getLevelLogsLua). | 165 |
| `graphs(v, len)` | Builds a small ASCII chart of a value: '[' + len signs (+ or - depending on the sign of v) + spaces + ']'. | 288 |
| `greyColor(x, a)` | Gray level. | 105 |
| `hex_dump(str)` | Prints (print) a hexadecimal dump of a string, 8 bytes per line with the ASCII column. | 1450 |
| `hueColor(x, a)` | Color from the full hue spectrum (maximum saturation and value). Useful for indexed colors: hueColor(indexedBlueNoise(i)). | 78 |
| `ironbowColor(x, a)` | Color from the 'ironbow' thermal palette. | 95 |
| `jetColor(x, a)` | Color from the 'jet' palette (blue, green, red). Recommended default palette for visualizing a value. | 100 |
| `jitprobe()` | Toggles the JIT compiler trace (jit.v): enabled on the first call, disabled on the next. | 1341 |
| `jsonDecode(content, context)` | Decodes JSON (json module) inside an xpcall. On error, logs the context and the error and returns nil. | 428 |
| `jsonEncode(v)` | Encodes a Lua value as compact JSON text. | 355 |
| `jsonEncodePrefix(prefix, v, postfix)` | Encodes v as compact JSON, preceded by prefix and optionally followed by postfix. | 359 |
| `jsonEncodePretty(v, lvl, numberPrecision)` | Encodes as indented JSON (2 spaces per level), object keys sorted. Recursive. | 369 |
| `jsonEncodeWorkBuffer(v)` | Encodes a value as JSON into a shared string.buffer (without copying into a string). Infinite/NaN numbers are written as 9e999 / -9e999; vec3/quat (cdata) become {x,y,z[,w]}; unsupported types become null. A table that has key 1 is written as an array. | 349 |
| `jsonReadFile(filename)` | Reads and decodes a JSON file. Returns nil if the file is unreadable (no log: the caller handles the error) or if the JSON is invalid (log E by jsonDecode). | 484 |
| `jsonWriteFile(filename, obj, pretty, numberPrecision, atomicWrite)` | Writes a table to a JSON file. Refuses (log E + false) if obj is not a table. With atomicWrite, writes to a temporary file first and then renames it (FS:renameFile). | 466 |
| `loadIni(filename)` | Reads a simple INI file (key = value, no sections). Ignores empty lines and those starting with #, ; or /. Converts values to number or boolean when possible; an unreadable line is logged as an error. | 1122 |
| `lpad(s, l, c)` | Pads s on the left with the character c up to length l. s is converted by tostring. | 173 |
| `objectTeleported(curPos, prevPos, prevVel, dt)` | Decides whether an object teleported between two frames, based on its previous position and velocity. No teleport if the displacement is less than 1.5 m or 277*dt (1000 km/h), or if the velocity is consistent with the previous one. Without previous data, returns true. | 1470 |
| `parseColor(v)` | Converts to a color integer a table {r,g,b,a}, a string '#RRGGBBAA' (at least 8 characters with the #) or nil (gives transparent 0,0,0,0). Any other type returns nil. | 66 |
| `rainbowColor(numOfSteps, step, format)` | Rainbow color for step `step` out of numOfSteps. The code recommends jetColor instead unless there is a reason not to. | 84 |
| `readDictJSONTable(filename)` | Reads a JSON of 'headers + rows' arrays: for each entry, the first row gives the column names, and each following row is turned into a named table; the header row is then removed (v[1] = nil). | 492 |
| `readFile(filename)` | Reads the whole content of a text file (io.open in mode 'r', with profiler event 'readFile'). | 900 |
| `rpad(s, l, c)` | Pads s on the right with the character c up to length l. s is converted by tostring. | 178 |
| `saveIni(filename, d)` | Writes a simple INI: 3 header comment lines (window title, game version, date), then the sorted keys in 'key = value' format. | 1151 |
| `serialize(v)` | Serializes a value as Lua text that deserialize() can read back. | 1258 |
| `serializePackages(reason)` | Collects the state to keep before a Lua reload: for each loaded package defining onSerialize or onDeserialized, calls onSerialize(reason), otherwise takes M.state, otherwise M. Adds the extensions data (extensions.getSerializationData). Errors are logged and ignored. Called by the engine during reloads. | 994 |
| `serializeWorkBuffer(v)` | Serializes a value as Lua code (reloadable by deserialize) into a shared buffer. Handles _noSerialize (writes nil), _serialize (table or true: restricts or not the keys, format _kv{...}), QuatF (userdata), cdata (tostring). Functions become nil. | 1252 |
| `setDifference(dst, src)` | Removes from dst all values present in src. Modifies dst and changes the order of its elements. | 534 |
| `setEqual(set1, set2)` | Tests whether two arrays contain the same values (length comparison, then membership; ignores order). | 512 |
| `setUnion(dst, src)` | Adds to dst all values of src that are absent from dst (modifies dst). | 522 |
| `shallowcopy(orig)` | Non-recursive copy of a table (sub-tables remain shared). Non-table values are returned as is. The metatable is not copied. | 825 |
| `shuffledPairs(t, ctx)` | Like pairs but in random order. | 1432 |
| `simpleDebugText3d(text, pos, radius, sphereColor, dir)` | Draws via debugDrawer a 3D text, a sphere and/or three small axis spheres oriented by dir. | 1497 |
| `sortedPairs(t, ctx, f)` | Like pairs but in sorted key order (mixed types accepted, or sort function f). Keys are frozen at the start; a value set to nil during the loop is skipped. | 1415 |
| `split(str, delim, nMax)` | Splits str on the delimiter delim (plain text search, not a regex). An empty string returns an empty array. Empty fields are kept. | 188 |
| `stringFormatWorkBuffer(...)` | Equivalent of string.format written into a shared buffer (buffer:putf), without string allocation. | 575 |
| `stringHash(text)` | Computes a numeric hash of a string (StringHash algorithm from the WoW wiki). | 242 |
| `tableContains(t, element)` | Tests whether the table contains the value element (non-recursive). | 758 |
| `tableContainsCaseInsensitive(table, element)` | Tests whether the table contains the string element, ignoring case. The table values must be strings. | 763 |
| `tableDepth(tbl, lookup)` | Computes the nesting depth of a table (table keys and values). Recursive and very slow; 0 for a non-table. | 802 |
| `tableEndC(tbl)` | Returns the index at which to insert the next element in a 0-based array: 0 if the table is empty, otherwise #tbl + 1. | 736 |
| `tableFindKey(t, element)` | Returns the first key associated with the value element (non-recursive, pairs order). | 749 |
| `tableInsertC(tbl, data)` | Inserts data at the end of a 0-based array: at tbl[0] if index 0 is free, otherwise table.insert. | 740 |
| `tableIsArraySlow(tbl)` | Strictly checks that all keys are integers from 1 to #tbl with no gaps. Walks the whole table. | 588 |
| `tableIsDict(tbl)` | Returns true if tbl is a table whose first element does not have key 1 (quick test: next(tbl) ~= 1). An empty table therefore counts as a dictionary. Returns false if it is not a table. | 581 |
| `tableIsEmpty(tbl)` | Returns true if tbl is not a table or if it is empty. | 601 |
| `tableKeys(tbl, target)` | Returns an array of all keys of tbl (order undefined). | 606 |
| `tableKeysSorted(tbl, target)` | Like tableKeys, but sorted. The sort accepts mixed types: first by type name, then by value (numbers, strings), true booleans first, others by tostring. | 629 |
| `tableMerge(dst, src)` | Copies all key/value pairs from src into dst (overwrites existing keys, non-recursive). | 654 |
| `tableMergeRecursive(t1, t2)` | Recursive merge of the sub-tables of t2 into t1. Warning: arrays are not concatenated, their elements overwrite each other by index. | 663 |
| `tableMergeRecursiveArray(t1, t2)` | Recursive merge that concatenates pure arrays (instead of overwriting them) and merges associative tables. Tables absent from t1 are copied. | 675 |
| `tableReadOnly(table)` | Returns a read-only proxy table (__index metatable pointing to the original; any write raises an error). Only the first level is protected. | 722 |
| `tableRoundRobinKey(tbl, lastKey)` | Iterates cyclically over the keys: returns the key following lastKey, or the first key if the end is reached or lastKey is nil/absent. | 819 |
| `tableSize(tbl)` | Counts the entries of a table (array or dictionary) by walking it entirely. Returns 0 for a non-table. | 706 |
| `tableSizeC(tbl)` | Size of an array, also counting the element at index 0 (C convention) if it exists. | 731 |
| `tableToColor(v)` | Converts a table {r,g,b,a} (0..255) into a color integer. Returns 0 if the table is nil. | 62 |
| `tableValuesAsLookupDict(tbl, target)` | Builds a value -> 1 dictionary from the values of tbl, to test membership in O(1). | 636 |
| `timeprobe(omitPrint)` | First call: starts the timer. Second call: prints the duration in milliseconds and returns it in seconds. | 1328 |
| `timeprobeStart()` | Always starts a timer (os.clockhp), even if a timeprobe was already running. | 1323 |
| `trim(s)` | Removes spaces at the start and end of a string. | 183 |
| `ui_message(msg, ttl, category, icon)` | Shows an on-screen message via guihooks.message. Shortcut used by many scripts. | 927 |
| `ui_toast(msg, title, type, _config)` | Shows a 'toast' notification in the UI (UI event toastrMsg). | 931 |
| `unflattenTable(tbl)` | Inverse of flattenTable: replaces the '>#>/path' tokens with the original sub-tables. Logs an error if the link does not exist. | 1396 |
| `writeFile(filename, data)` | Writes text to a file (mode 'w', overwrites). If opening fails, logs a warning. | 914 |

**Globals assigned:** `lpack`, `path`

**UI events (guihooks.trigger):** `toastrMsg`

## Calls into the engine (C++)

- `FS:` `findFiles`, `renameFile`
- `Lua:` `log`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/utils.lua`.*

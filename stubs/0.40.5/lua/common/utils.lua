---@meta
-- tim19Atlas stub generated from lua/common/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Global table `path` defined in this file: file path utilities (separator '/').
---@class utils_path
local utils_path = {}

--- Returns the folder of a path, with the trailing '/' ('.' if no folder).
---Source: lua/common/utils.lua:dyn
---@param filename string Path
---@return string  Folder
function utils_path:dirname(filename) end

--- Returns the folder of the caller's Lua file (debug.getinfo(2).short_src).
---Source: lua/common/utils.lua:dyn
---@return string|nil  Folder of the calling script
function utils_path:getCurrentPath() end

--- Path of a level's info.json file, normalized by sanitizePath.
---Source: lua/common/utils.lua:dyn
---@param levelName string Level name
---@return string  /levels/<name>/info.json
function utils_path:getPathLevelInfo(levelName) end

--- Path of a level's main.level.json file, normalized by sanitizePath.
---Source: lua/common/utils.lua:dyn
---@param levelName string Level name
---@return string  /levels/<name>/main.level.json
function utils_path:getPathLevelMain(levelName) end

--- Tests whether the file can be opened for reading (io.open).
---Source: lua/common/utils.lua:dyn
---@param filename string Path
---@return boolean  true if openable
function utils_path:is_file(filename) end

--- Extracts from a path the level name (under 'levels/') and the rest of the path.
---Source: lua/common/utils.lua:dyn
---@param filepath string Path containing 'levels/<name>...'
---@return string|nil  Level name
---@return string|nil  Rest of the path
function utils_path:levelFromPath(filepath) end

--- Splits a path into folder, file name (WITH extension) and extension. Without an extension, ext is ''.
---Source: lua/common/utils.lua:dyn
---@param path string Path
---@param compositeExtension boolean|nil true: the extension is everything after the first dot of the name (e.g. 'level.json')
---@return string|nil  Folder with trailing '/' (nil for a simple file name)
---@return string  Name with extension
---@return string  Extension without the dot
function utils_path:split(path, compositeExtension) end

--- Like split but the returned file name has no extension. Warning: removes it via gsub('.'..ext) (the dot is a pattern wildcard).
---Source: lua/common/utils.lua:dyn
---@param filepath string Path
---@param compositeExtension boolean|nil See path.split
---@return string|nil  Folder
---@return string  Name without extension
---@return string  Extension
function utils_path:splitWithoutExt(filepath, compositeExtension) end

--- Converts an HSV color to RGB, components in [0..1].
---Source: lua/common/utils.lua:43
---@param h number Hue [0..1]
---@param s number Saturation [0..1]
---@param v number Value [0..1]
---@return number  r [0..1]
---@return number  g [0..1]
---@return number  b [0..1]
function HSVtoRGB(h, s, v) end

--- Converts an RGB color to HSV. The r,g,b inputs are in [0..1] (inferred from code: no 255 scaling).
---Source: lua/common/utils.lua:30
---@param r number Red [0..1]
---@param g number Green [0..1]
---@param b number Blue [0..1]
---@return number  Hue h in [0..1]
---@return number  Saturation s in [0..1]
---@return number  Value v (= max(r,g,b))
function RGBtoHSV(r, g, b) end

--- Helper used by the text produced by serialize: builds a table from a flat list {k1, v1, k2, v2…}. A modder normally does not need to call it.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.lua:1262
---@param kv table Flat list key, value, key, value…
---@return table  Table {k1=v1, k2=v2…}
function _kv(kv) end

--- Adds an entry to the engine level log (Engine.Debug.addLevelLogLua), with the caller's file and line (debug.getinfo(2)). Without an object, uses addLevelLogLuaNoObject.
---Source: lua/common/utils.lua:156
---@param object any|nil Object to attach the log to, nil for none
---@param logLevel any Log level (passed as is to the engine)
---@param origin string Message origin
---@param uniqueErrorCode any Unique error code (passed to the engine)
---@param message string Message
function addLevelLog(object, logLevel, origin, uniqueErrorCode, message) end

--- Appends to the end of dst all elements of the array src (includes index 0 of src if it exists). Modifies dst.
---Source: lua/common/utils.lua:645
---@param dst table Modified array
---@param src table Array to append
---@return table  dst
function arrayConcat(dst, src) end

--- Returns the index of the first occurrence of val in the array t.
---Source: lua/common/utils.lua:773
---@param t table Array
---@param val any Value searched
---@return integer|boolean  Index, or false (not nil) if absent
function arrayFindValueIndex(t, val) end

--- Reverses a pure array in place.
---Source: lua/common/utils.lua:792
---@param array table Modified array
---@return table  array
function arrayReverse(array) end

--- Shuffles a pure array in place (Fisher-Yates, math.random).
---Source: lua/common/utils.lua:783
---@param array table Modified array
---@return table  array
function arrayShuffle(array) end

--- Converts a number of bytes to readable text with 2 decimals. Uses powers of 1000 (KB, MB, GB), not 1024.
---Source: lua/common/utils.lua:257
---@param bytes number Number of bytes
---@return string  E.g. '1.50 MB'
function bytes_to_string(bytes) end

--- Validates the types of a parameter array. Prefix an expected type with 'optional:' to allow nil. Pure arrays only.
---Source: lua/common/utils.lua:867
---@param data table Array to check
---@param expectedTypes table<integer, string> Expected Lua type names, e.g. {"string", "optional:number"}
---@return boolean  true if valid
---@return string|nil  Error message if invalid (too many parameters or wrong type)
function checkTableDataTypes(data, expectedTypes) end

--- Clears the level logs (Engine.Debug.clearLevelLogs).
---Source: lua/common/utils.lua:169
function clearLevelLogs() end

--- Builds a 32-bit RGBA color integer. Each component is rounded down to the integer and clamped to 0..255.
---Source: lua/common/utils.lua:50
---@param r number Red 0..255
---@param g number Green 0..255
---@param b number Blue 0..255
---@param a number|nil Alpha 0..255, 255 by default
---@return integer  r*16777216 + g*65536 + b*256 + a
function color(r, g, b, a) end

--- Inverse operation of color(): decomposes an RGBA integer.
---Source: lua/common/utils.lua:54
---@param col integer 32-bit RGBA color
---@return integer  r
---@return integer  g
---@return integer  b
---@return integer  a
function colorGetRGBA(col) end

--- Builds an RGBA color integer from an RGB hexadecimal (e.g. 0xff8800) and an alpha.
---Source: lua/common/utils.lua:58
---@param rgbHex integer Color 0xRRGGBB
---@param a number|nil Alpha 0..255, 255 by default
---@return integer  32-bit RGBA color
function colorHex(rgbHex, a) end

--- Concatenates the arguments (numbers, strings, booleans, or arrays of numbers) into a shared buffer. Stops at the first nil argument. Infinite/NaN numbers are written as 9e999 / -9e999.
---Source: lua/common/utils.lua:550
---@param ... any Values to concatenate
---@return userdata  Shared buffer (overwritten on the next call)
function concatWorkBuffer(...) end

--- Recursive copy of a table, handling circular/shared references and keeping the metatable. FFI structures (vec3, quat) are shallow-copied. Slow.
---Source: lua/common/utils.lua:854
---@param object any Value or table to copy
---@return any  Deep copy
function deepcopy(object) end

--- Reads back text produced by serialize() by executing loadstring('return '..s). Returns nil if s is nil. Crashes if the text is not valid Lua (e.g. non-serializable cdata).
---Source: lua/common/utils.lua:1271
---@param s string|nil Serialized text
---@return any  Rebuilt value
function deserialize(s) end

--- Restores the state produced by serializePackages: calls extensions.deserialize, then for each concerned package calls onDeserialize(data) or merges the data (excluding functions) into M.state or M, then calls onDeserialized(data).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.lua:1025
---@param data table|nil Data from serializePackages (nil: does nothing)
---@param filter string|nil If given, restores only that package
function deserializePackages(data, filter) end

--- Debug tool: installs a metatable on _G that logs (level W, with trace) every creation of a new global variable.
---Source: lua/common/utils.lua:1298
function detectGlobalWrites() end

--- Prints to the log (level 'A', origin 'lua.utils') the result of dumps(...). The most common debug function for inspecting a table.
---Source: lua/common/utils.lua:135
---@param ... any Values to print
function dump(...) end

--- Like dump, but prints nothing if x is nil (and takes only one value).
---Source: lua/common/utils.lua:150
---@param x any Value to print if not nil
function dumpNotNil(x) end

--- Writes to a file the text inspect(...) of the argument.
---Source: lua/common/utils.lua:889
---@param filename string Output file (overwritten)
---@param ... any Value to inspect (see notes: the 2nd argument is read as inspect options)
---@return boolean  true if the file was written, false if it could not be opened
function dumpToFile(filename, ...) end

--- Returns the text representation (via libs/inspect) of the arguments, separated by ', '. With no arguments returns ''. For a single userdata with a metatable, inspects the metatable.
---Source: lua/common/utils.lua:114
---@param ... any Values to convert to text
---@return string  Inspected text
function dumps(...) end

--- Like inspect but with unlimited depth by default (depth = math.huge).
---Source: lua/common/utils.lua:142
---@param o any Value to inspect
---@param depth number|nil Maximum depth, unlimited by default
---@return string  Inspected text
function dumpsz(o, depth) end

--- Prints to the log (level 'A', origin 'lua.utils') the result of dumpsz(o, depth).
---Source: lua/common/utils.lua:146
---@param o any Value to inspect
---@param depth number|nil Maximum depth, unlimited by default
function dumpz(o, depth) end

--- From a list of action names, builds {action=...} and then calls fillActionLabels.
---Source: lua/common/utils.lua:941
---@param actionSimple table<integer, string> Input action names
---@return table  List of items {action, label, missing}
function fillActionLabelSimple(actionSimple) end

--- For each item {action=...}, sets `missing` (true if the action is not active in core_input_actions) and `label` (the action's title, or its name if absent) if label is nil.
---Source: lua/common/utils.lua:949
---@param actionItems table List of items with the action field
---@return table  actionItems (modified)
function fillActionLabels(actionItems) end

--- Replaces in tbl, in place, multiple references to the same sub-table with a text token '>#>/path' (to serialize graphs). Keys are walked in sorted order.
---Source: lua/common/utils.lua:1373
---@param tbl table Modified table
---@return table|nil  tbl, or nil if it is not a table
function flattenTable(tbl) end

--- Replaces in res the current local date/time tokens: {YYYY} {YY} {Y} {MM} {M} {DD} {D} {HH} {H} {mm} {m} {ss} {s} (the doubled forms use 2 digits, YYYY uses 4).
---Source: lua/common/utils.lua:269
---@param res string Text template containing the tokens
---@return string  Text with the date/time inserted
function formatTimeStringNow(res) end

--- Measures the bytes of garbage created between two calls. First call: stops the GC and remembers the memory. Second call: restarts the GC, prints (if > 0 or printZero) and returns the difference.
---Source: lua/common/utils.lua:1308
---@param printZero boolean|nil Also print when the difference is 0
---@param omitPrint boolean|nil Print nothing
---@return number|nil  Bytes created (second call only)
function gcprobe(printZero, omitPrint) end

--- Lists the folders under /levels/ (FS:findFiles) and returns their names in lowercase.
---Source: lua/common/utils.lua:1112
---@return table<integer, string>  Level identifiers
function getAllLevelIdentifiers() end

--- Returns the identifier (folder) of the current level in lowercase, inferred from the path of getMissionFilename() under /levels/. Returns nil if the path has no folder.
---Source: lua/common/utils.lua:1104
---@param raw boolean|nil No real effect (see notes)
---@return string|nil  Level name in lowercase
function getCurrentLevelIdentifier(raw) end

--- Returns the accumulated level logs (Engine.Debug.getLevelLogsLua).
---Source: lua/common/utils.lua:165
---@return any  Engine result (inferred from code: list of logs)
function getLevelLogs() end

--- Builds a small ASCII chart of a value: '[' + len signs (+ or - depending on the sign of v) + spaces + ']'.
---Source: lua/common/utils.lua:288
---@param v number Value (only the integer part of |v| counts)
---@param len integer Width of the gauge in characters
---@return string  Text gauge
function graphs(v, len) end

--- Gray level.
---Source: lua/common/utils.lua:105
---@param x number Brightness [0..1]
---@param a number|nil Alpha 0..255 (255 by default)
---@return integer  32-bit RGBA color
function greyColor(x, a) end

--- Prints (print) a hexadecimal dump of a string, 8 bytes per line with the ASCII column.
---Source: lua/common/utils.lua:1450
---@param str string Data to display
function hex_dump(str) end

--- Color from the full hue spectrum (maximum saturation and value). Useful for indexed colors: hueColor(indexedBlueNoise(i)).
---Source: lua/common/utils.lua:78
---@param x number Hue [0..1]
---@param a number|nil Alpha 0..255 (255 by default)
---@return integer  32-bit RGBA color
function hueColor(x, a) end

--- Color from the 'ironbow' thermal palette.
---Source: lua/common/utils.lua:95
---@param x number Value [0..1]
---@param a number|nil Alpha 0..255 (255 by default)
---@return integer  32-bit RGBA color
function ironbowColor(x, a) end

--- Color from the 'jet' palette (blue, green, red). Recommended default palette for visualizing a value.
---Source: lua/common/utils.lua:100
---@param x number Value [0..1]
---@param a number|nil Alpha 0..255 (255 by default)
---@return integer  32-bit RGBA color
function jetColor(x, a) end

--- Toggles the JIT compiler trace (jit.v): enabled on the first call, disabled on the next.
---Source: lua/common/utils.lua:1341
function jitprobe() end

--- Decodes JSON (json module) inside an xpcall. On error, logs the context and the error and returns nil.
---Source: lua/common/utils.lua:428
---@param content string|userdata JSON text (or buffer)
---@param context any Text (often the file name) shown in the error message
---@return any|nil  Decoded value, nil on error
function jsonDecode(content, context) end

--- Encodes a Lua value as compact JSON text.
---Source: lua/common/utils.lua:355
---@param v any Value to encode
---@return string  JSON text
function jsonEncode(v) end

--- Encodes v as compact JSON, preceded by prefix and optionally followed by postfix.
---Source: lua/common/utils.lua:359
---@param prefix string Text placed before the JSON
---@param v any Value to encode
---@param postfix string|nil Text placed after the JSON
---@return string  prefix .. JSON .. postfix
function jsonEncodePrefix(prefix, v, postfix) end

--- Encodes as indented JSON (2 spaces per level), object keys sorted. Recursive.
---Source: lua/common/utils.lua:369
---@param v any Value to encode
---@param lvl integer|nil Current indentation level, 1 by default
---@param numberPrecision integer|nil If given, non-integer numbers are written with this number of decimals (format %N.Nf); nil = tostring
---@return string  Indented JSON text
function jsonEncodePretty(v, lvl, numberPrecision) end

--- Encodes a value as JSON into a shared string.buffer (without copying into a string). Infinite/NaN numbers are written as 9e999 / -9e999; vec3/quat (cdata) become {x,y,z[,w]}; unsupported types become null. A table that has key 1 is written as an array.
---Source: lua/common/utils.lua:349
---@param v any Value to encode
---@return userdata  Shared buffer (overwritten on the next call)
function jsonEncodeWorkBuffer(v) end

--- Reads and decodes a JSON file. Returns nil if the file is unreadable (no log: the caller handles the error) or if the JSON is invalid (log E by jsonDecode).
---Source: lua/common/utils.lua:484
---@param filename string File path
---@return any|nil  Decoded data or nil
function jsonReadFile(filename) end

--- Writes a table to a JSON file. Refuses (log E + false) if obj is not a table. With atomicWrite, writes to a temporary file first and then renames it (FS:renameFile).
---Source: lua/common/utils.lua:466
---@param filename string Destination file
---@param obj table Data to write
---@param pretty boolean|nil true: indented JSON (jsonEncodePretty), otherwise compact
---@param numberPrecision integer|nil Decimals for pretty mode (see jsonEncodePretty)
---@param atomicWrite boolean|string|nil Truthy: atomic write via a temporary file; if it is a string, it is used as the temporary file name, otherwise filename..'.tmp'
---@return boolean  true if the write succeeded
function jsonWriteFile(filename, obj, pretty, numberPrecision, atomicWrite) end

--- Reads a simple INI file (key = value, no sections). Ignores empty lines and those starting with #, ; or /. Converts values to number or boolean when possible; an unreadable line is logged as an error.
---Source: lua/common/utils.lua:1122
---@param filename string File path
---@return table<string, number|boolean|string>|nil  Key/value pairs, nil if the file cannot be opened
function loadIni(filename) end

--- Pads s on the left with the character c up to length l. s is converted by tostring.
---Source: lua/common/utils.lua:173
---@param s any Value to pad
---@param l integer Target length
---@param c string Padding character
---@return string  Padded text (unchanged if already long enough)
function lpad(s, l, c) end

--- Decides whether an object teleported between two frames, based on its previous position and velocity. No teleport if the displacement is less than 1.5 m or 277*dt (1000 km/h), or if the velocity is consistent with the previous one. Without previous data, returns true.
---Source: lua/common/utils.lua:1470
---@param curPos vec3 Current position (m)
---@param prevPos vec3 Position at the previous frame (m)
---@param prevVel vec3 Previous velocity (m/s)
---@param dt number Time step (s)
---@return boolean  true if teleport detected
function objectTeleported(curPos, prevPos, prevVel, dt) end

--- Converts to a color integer a table {r,g,b,a}, a string '#RRGGBBAA' (at least 8 characters with the #) or nil (gives transparent 0,0,0,0). Any other type returns nil.
---Source: lua/common/utils.lua:66
---@param v table|string|nil Table {r,g,b,a}, string '#RRGGBBAA' or nil
---@return integer|nil  32-bit RGBA color, nil if the format is not recognized
function parseColor(v) end

--- Rainbow color for step `step` out of numOfSteps. The code recommends jetColor instead unless there is a reason not to.
---Source: lua/common/utils.lua:84
---@param numOfSteps number Total number of steps
---@param step number Current step
---@param format number|nil 255 (default) for integer components 0..255, any other value for [0..1] components
---@return table  {r,g,b,a} (a is 255 or 1 depending on the format)
function rainbowColor(numOfSteps, step, format) end

--- Reads a JSON of 'headers + rows' arrays: for each entry, the first row gives the column names, and each following row is turned into a named table; the header row is then removed (v[1] = nil).
---Source: lua/common/utils.lua:492
---@param filename string JSON file path
---@return table|nil  Transformed data, nil if the read is impossible
function readDictJSONTable(filename) end

--- Reads the whole content of a text file (io.open in mode 'r', with profiler event 'readFile').
---Source: lua/common/utils.lua:900
---@param filename string File path
---@return string|nil  Content, nil if the file does not exist or cannot be opened
function readFile(filename) end

--- Pads s on the right with the character c up to length l. s is converted by tostring.
---Source: lua/common/utils.lua:178
---@param s any Value to pad
---@param l integer Target length
---@param c string Padding character
---@return string  Padded text
function rpad(s, l, c) end

--- Writes a simple INI: 3 header comment lines (window title, game version, date), then the sorted keys in 'key = value' format.
---Source: lua/common/utils.lua:1151
---@param filename string Output file
---@param d table Key/value pairs
function saveIni(filename, d) end

--- Serializes a value as Lua text that deserialize() can read back.
---Source: lua/common/utils.lua:1258
---@param v any Value to serialize
---@return string  Lua code
function serialize(v) end

--- Collects the state to keep before a Lua reload: for each loaded package defining onSerialize or onDeserialized, calls onSerialize(reason), otherwise takes M.state, otherwise M. Adds the extensions data (extensions.getSerializationData). Errors are logged and ignored. Called by the engine during reloads.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils.lua:994
---@param reason string|nil Reason for the reload, 'reload' by default
---@return table  Data keyed by package name
function serializePackages(reason) end

--- Serializes a value as Lua code (reloadable by deserialize) into a shared buffer. Handles _noSerialize (writes nil), _serialize (table or true: restricts or not the keys, format _kv{...}), QuatF (userdata), cdata (tostring). Functions become nil.
---Source: lua/common/utils.lua:1252
---@param v any Value to serialize
---@return userdata  Shared buffer (overwritten on the next call)
function serializeWorkBuffer(v) end

--- Removes from dst all values present in src. Modifies dst and changes the order of its elements.
---Source: lua/common/utils.lua:534
---@param dst table Modified array
---@param src table Values to remove
---@return table  dst
function setDifference(dst, src) end

--- Tests whether two arrays contain the same values (length comparison, then membership; ignores order).
---Source: lua/common/utils.lua:512
---@param set1 table First array
---@param set2 table Second array
---@return boolean  true if equal as sets
function setEqual(set1, set2) end

--- Adds to dst all values of src that are absent from dst (modifies dst).
---Source: lua/common/utils.lua:522
---@param dst table Modified array
---@param src table Source array
---@return table  dst
function setUnion(dst, src) end

--- Non-recursive copy of a table (sub-tables remain shared). Non-table values are returned as is. The metatable is not copied.
---Source: lua/common/utils.lua:825
---@param orig any Value or table to copy
---@return any  Copy
function shallowcopy(orig) end

--- Like pairs but in random order.
---Source: lua/common/utils.lua:1432
---@param t table Table to walk
---@param ctx table|nil Reusable working table
---@return function  Iterator
---@return table  Iterator state
function shuffledPairs(t, ctx) end

--- Draws via debugDrawer a 3D text, a sphere and/or three small axis spheres oriented by dir.
---Source: lua/common/utils.lua:1497
---@param text any|nil Text (converted by tostring)
---@param pos vec3 World position
---@param radius number|nil Sphere radius (m), nothing if nil or <= 0
---@param sphereColor ColorF|nil Sphere color (translucent white by default)
---@param dir quat|nil Orientation: draws the X (red), Y (green), Z (blue) axes at distance radius
function simpleDebugText3d(text, pos, radius, sphereColor, dir) end

--- Like pairs but in sorted key order (mixed types accepted, or sort function f). Keys are frozen at the start; a value set to nil during the loop is skipped.
---Source: lua/common/utils.lua:1415
---@param t table Table to walk
---@param ctx table|nil Reusable working table to avoid allocations
---@param f function|nil Key comparator (default: multi-type sort)
---@return function  Iterator
---@return table  Iterator state
function sortedPairs(t, ctx, f) end

--- Splits str on the delimiter delim (plain text search, not a regex). An empty string returns an empty array. Empty fields are kept.
---Source: lua/common/utils.lua:188
---@param str string Text to split
---@param delim string Literal separator
---@param nMax integer|nil Maximum number of splits (default -1 = unlimited); the rest of the string goes into the last element
---@return table<integer, string>  Array of pieces
function split(str, delim, nMax) end

--- Equivalent of string.format written into a shared buffer (buffer:putf), without string allocation.
---Source: lua/common/utils.lua:575
---@param ... any Format then values
---@return userdata  Shared buffer
function stringFormatWorkBuffer(...) end

--- Computes a numeric hash of a string (StringHash algorithm from the WoW wiki).
---Source: lua/common/utils.lua:242
---@param text string Text to hash
---@return number  Hash in [0..4294967291)
function stringHash(text) end

--- Tests whether the table contains the value element (non-recursive).
---Source: lua/common/utils.lua:758
---@param t table Table to walk
---@param element any Value searched
---@return boolean  true if present
function tableContains(t, element) end

--- Tests whether the table contains the string element, ignoring case. The table values must be strings.
---Source: lua/common/utils.lua:763
---@param table table Table of strings
---@param element string String searched
---@return boolean  true if present
function tableContainsCaseInsensitive(table, element) end

--- Computes the nesting depth of a table (table keys and values). Recursive and very slow; 0 for a non-table.
---Source: lua/common/utils.lua:802
---@param tbl any Table to measure
---@param lookup table|nil Internal recursion cache (leave nil)
---@return integer  Depth
function tableDepth(tbl, lookup) end

--- Returns the index at which to insert the next element in a 0-based array: 0 if the table is empty, otherwise #tbl + 1.
---Source: lua/common/utils.lua:736
---@param tbl table Array
---@return integer  Next index
function tableEndC(tbl) end

--- Returns the first key associated with the value element (non-recursive, pairs order).
---Source: lua/common/utils.lua:749
---@param t table Table to walk
---@param element any Value searched
---@return any|nil  Key found or nil
function tableFindKey(t, element) end

--- Inserts data at the end of a 0-based array: at tbl[0] if index 0 is free, otherwise table.insert.
---Source: lua/common/utils.lua:740
---@param tbl table Modified array
---@param data any Element to insert
function tableInsertC(tbl, data) end

--- Strictly checks that all keys are integers from 1 to #tbl with no gaps. Walks the whole table.
---Source: lua/common/utils.lua:588
---@param tbl table Table to test
---@return boolean  true if pure array
function tableIsArraySlow(tbl) end

--- Returns true if tbl is a table whose first element does not have key 1 (quick test: next(tbl) ~= 1). An empty table therefore counts as a dictionary. Returns false if it is not a table.
---Source: lua/common/utils.lua:581
---@param tbl any Value to test
---@return boolean  true if dictionary
function tableIsDict(tbl) end

--- Returns true if tbl is not a table or if it is empty.
---Source: lua/common/utils.lua:601
---@param tbl any Value to test
---@return boolean  true if empty or not a table
function tableIsEmpty(tbl) end

--- Returns an array of all keys of tbl (order undefined).
---Source: lua/common/utils.lua:606
---@param tbl table Source table
---@param target table|nil Array reused as output (created otherwise)
---@return table  Array of keys
function tableKeys(tbl, target) end

--- Like tableKeys, but sorted. The sort accepts mixed types: first by type name, then by value (numbers, strings), true booleans first, others by tostring.
---Source: lua/common/utils.lua:629
---@param tbl table Source table
---@param target table|nil Array reused as output
---@return table  Sorted array of keys
function tableKeysSorted(tbl, target) end

--- Copies all key/value pairs from src into dst (overwrites existing keys, non-recursive).
---Source: lua/common/utils.lua:654
---@param dst table Modified table
---@param src table Source table
---@return table  dst
function tableMerge(dst, src) end

--- Recursive merge of the sub-tables of t2 into t1. Warning: arrays are not concatenated, their elements overwrite each other by index.
---Source: lua/common/utils.lua:663
---@param t1 table Modified table
---@param t2 table Source table
---@return table  t1
function tableMergeRecursive(t1, t2) end

--- Recursive merge that concatenates pure arrays (instead of overwriting them) and merges associative tables. Tables absent from t1 are copied.
---Source: lua/common/utils.lua:675
---@param t1 table Modified table
---@param t2 table Source table
---@return table  t1
function tableMergeRecursiveArray(t1, t2) end

--- Returns a read-only proxy table (__index metatable pointing to the original; any write raises an error). Only the first level is protected.
---Source: lua/common/utils.lua:722
---@param table table Table to protect
---@return table  Read-only proxy
function tableReadOnly(table) end

--- Iterates cyclically over the keys: returns the key following lastKey, or the first key if the end is reached or lastKey is nil/absent.
---Source: lua/common/utils.lua:819
---@param tbl table Table to walk
---@param lastKey any|nil Key returned by the previous call
---@return any|nil  Next key (nil if the table is empty)
function tableRoundRobinKey(tbl, lastKey) end

--- Counts the entries of a table (array or dictionary) by walking it entirely. Returns 0 for a non-table.
---Source: lua/common/utils.lua:706
---@param tbl any Table to count
---@return integer  Number of entries
function tableSize(tbl) end

--- Size of an array, also counting the element at index 0 (C convention) if it exists.
---Source: lua/common/utils.lua:731
---@param tbl table Array
---@return integer  #tbl + 1 if tbl[0] exists, otherwise #tbl
function tableSizeC(tbl) end

--- Converts a table {r,g,b,a} (0..255) into a color integer. Returns 0 if the table is nil.
---Source: lua/common/utils.lua:62
---@param v table|nil Table with the fields r, g, b, a
---@return integer  32-bit RGBA color
function tableToColor(v) end

--- Builds a value -> 1 dictionary from the values of tbl, to test membership in O(1).
---Source: lua/common/utils.lua:636
---@param tbl table Table whose values are taken
---@param target table|nil Table reused as output
---@return table<any, integer>  Dictionary {value = 1}
function tableValuesAsLookupDict(tbl, target) end

--- First call: starts the timer. Second call: prints the duration in milliseconds and returns it in seconds.
---Source: lua/common/utils.lua:1328
---@param omitPrint boolean|nil Print nothing
---@return number|nil  Duration in seconds (second call only)
function timeprobe(omitPrint) end

--- Always starts a timer (os.clockhp), even if a timeprobe was already running.
---Source: lua/common/utils.lua:1323
function timeprobeStart() end

--- Removes spaces at the start and end of a string.
---Source: lua/common/utils.lua:183
---@param s string String to clean
---@return string  String without spaces at the ends
function trim(s) end

--- Shows an on-screen message via guihooks.message. Shortcut used by many scripts.
---Source: lua/common/utils.lua:927
---@param msg string Text (or translation key)
---@param ttl number|nil Display duration in seconds, 5 by default
---@param category string|nil Message category, '' by default
---@param icon string|nil Icon, 'info' by default
function ui_message(msg, ttl, category, icon) end

--- Shows a 'toast' notification in the UI (UI event toastrMsg).
---Source: lua/common/utils.lua:931
---@param msg string Text
---@param title string|nil Title
---@param type string|nil 'info' (default), 'success', 'warning' or 'error'
---@param _config table|nil Additional options copied into config
function ui_toast(msg, title, type, _config) end

--- Inverse of flattenTable: replaces the '>#>/path' tokens with the original sub-tables. Logs an error if the link does not exist.
---Source: lua/common/utils.lua:1396
---@param tbl table Modified table
---@return table|nil  tbl, or nil if it is not a table
function unflattenTable(tbl) end

--- Writes text to a file (mode 'w', overwrites). If opening fails, logs a warning.
---Source: lua/common/utils.lua:914
---@param filename string File path
---@param data string Text to write
---@return boolean|nil  true if written, nil if it could not be opened
function writeFile(filename, data) end

---@type any
lpack = nil
---@type table
path = nil

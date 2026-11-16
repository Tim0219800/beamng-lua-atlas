---@meta
-- tim19Atlas stub generated from lua/common/lpack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fast serializer/deserializer of Lua values (tables, numbers, strings, booleans, vec3, quat) to compact strings, used to exchange data between VMs (GE <-> vehicle) and for saving. Three formats: proprietary text ('a...~'), binary based on string.buffer ('b...'), and Lua source (encodeLua). decode automatically recognizes text or binary. An array of doubles can also be packed at 8 bytes per value.
--- Access: global `lpack`
---@class lpack
lpack = {}

--- Deserializes a value produced by encode or encodeBin (detects the format from the first character: 'b' = binary). Accepts a string or a string.buffer.
---Source: lua/common/lpack.lua:268
---@param is string|table|nil serialized string or string.buffer
---@param target table|vec3|quat|nil object to fill in place (binary format only)
---@return any  decoded value, nil if input is empty
function lpack.decode(is, target) end

--- Converts a string of doubles (8 bytes each, little-endian) into a Lua array. Fills tbl if given.
---Source: lua/common/lpack.lua:76
---@param sda string binary string
---@param tbl table|nil destination table, new table if nil
---@return number[]  decoded values starting at index 1
function lpack.decodeDoubleArray(sda, tbl) end

--- Evaluates a string produced by encodeLua (loadstring('return '..s)()). Dangerous with untrusted data. Returns nil if s is nil.
---Source: lua/common/lpack.lua:91
---@param s string|nil Lua source of a value
---@return any  value
function lpack.decodeLua(s) end

--- Serializes v in the compact text format (start 'a', end '~'). Returns '' if v is nil.
---Source: lua/common/lpack.lua:96
---@param v any Lua value (table, number, string, boolean, vec3, quat)
---@return string  serialized string
function lpack.encode(v) end

--- Serializes v in binary format (string.buffer encode, prefix 'b') with special types for vec3 and quat. Returns '' if nil.
---Source: lua/common/lpack.lua:105
---@param v any Lua value
---@return string  binary string
function lpack.encodeBin(v) end

--- Like encodeBin but returns the module's shared work buffer instead of a string (zero copy). The content is overwritten on the next call.
---Source: lua/common/lpack.lua:112
---@param v any Lua value
---@return string.buffer|string  work buffer (or '' if v is nil)
function lpack.encodeBinWorkBuffer(v) end

--- Converts an array of numbers into a binary string of doubles (8 bytes per value, via ffi).
---Source: lua/common/lpack.lua:71
---@param tbl number[] array of numbers (index 0 included if it exists)
---@return string  binary string
function lpack.encodeDoubleArray(tbl) end

--- Serializes v as Lua source text (strings with %q, tables with brackets for non-sequential keys) to be read back with decodeLua.
---Source: lua/common/lpack.lua:85
---@param v any Lua value
---@return string  Lua source
function lpack.encodeLua(v) end


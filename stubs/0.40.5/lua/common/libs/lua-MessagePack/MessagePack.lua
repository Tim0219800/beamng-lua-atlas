---@meta
-- tim19Atlas stub generated from lua/common/libs/lua-MessagePack/MessagePack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- lua-MessagePack (François Perrad, MIT license, base version 0.5.1, adapted by BeamNG in 2022): MessagePack binary serialization. This version uses LuaJIT's string.buffer and a shared work buffer; it can also serialize vec3 and quat (cdata). A modder uses it to encode/decode Lua tables into compact binary strings (network exchange, files).
--- Access: `require("libs/lua-MessagePack/MessagePack")`
---@class libs_lua_MessagePack_MessagePack
local libs_lua_MessagePack_MessagePack = {}

--- Hook called for each extension value read; the default implementation returns nil. Replace it to decode your extension types.
---Source: lua/common/libs/lua-MessagePack/MessagePack.lua:457
---@param tag integer Extension number.
---@param data string Extension bytes.
---@return any  Value built.
function libs_lua_MessagePack_MessagePack.build_ext(tag, data) end

--- Serializes a Lua value into a MessagePack string.
---Source: lua/common/libs/lua-MessagePack/MessagePack.lua:255
---@param data any nil, boolean, number, string, table, vec3, quat, string.buffer.
---@return string  Binary data.
function libs_lua_MessagePack_MessagePack.pack(data) end

--- Serializes data preceded by the string prefix.
---Source: lua/common/libs/lua-MessagePack/MessagePack.lua:265
---@param prefix string Bytes to write before the data.
---@param data any Value.
---@return string  prefix followed by the data.
function libs_lua_MessagePack_MessagePack.packPrefix(prefix, data) end

--- Like packPrefix, but returns the shared work buffer.
---Source: lua/common/libs/lua-MessagePack/MessagePack.lua:259
---@param prefix string Prefix.
---@param data any Value.
---@return userdata  Internal string.buffer.
function libs_lua_MessagePack_MessagePack.packPrefixWorkBuffer(prefix, data) end

--- Like pack, but returns the shared work buffer without converting it to a string (avoids a copy).
---Source: lua/common/libs/lua-MessagePack/MessagePack.lua:249
---@param data any Value to serialize.
---@return userdata  Internal string.buffer, reused on each call.
function libs_lua_MessagePack_MessagePack.packWorkBuffer(data) end

--- Chooses how Lua tables are serialized: 'without_hole' (array if consecutive indices without holes, otherwise map), 'with_hole' (array up to the max index if all keys are positive numbers), 'always_as_map' (always a map). Any other value raises an error.
---Source: lua/common/libs/lua-MessagePack/MessagePack.lua:130
---@param array string 'without_hole', 'with_hole' or 'always_as_map'.
function libs_lua_MessagePack_MessagePack.set_array(array) end

--- Deserializes a string containing exactly one MessagePack value. Raises a 'missing bytes' error if it is truncated and 'extra bytes' if bytes remain.
---Source: lua/common/libs/lua-MessagePack/MessagePack.lua:558
---@param s string Data.
---@return any  Decoded value.
function libs_lua_MessagePack_MessagePack.unpack(s) end

--- Decodes the next value from a cursor {s, i, j, underflow}, advancing c.i.
---Source: lua/common/libs/lua-MessagePack/MessagePack.lua:271
---@param c table Cursor on the source string.
---@return any  Decoded value.
function libs_lua_MessagePack_MessagePack.unpack_cursor(c) end

--- Returns an iterator that successively decodes several values: from a string (returns the position and the value) or from a function supplying chunks of data (returns true and the value).
---Source: lua/common/libs/lua-MessagePack/MessagePack.lua:568
---@param src string|function String, or function returning the next chunk (or nil).
---@return function  Iterator.
function libs_lua_MessagePack_MessagePack.unpacker(src) end

---@type number
k = nil
return libs_lua_MessagePack_MessagePack

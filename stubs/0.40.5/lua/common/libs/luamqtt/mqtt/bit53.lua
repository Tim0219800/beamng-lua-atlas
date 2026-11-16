---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/bit53.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fallback implementation of a few BitOp functions (lshift, rshift, bor, band) with Lua 5.3's native operators (<<, >>, |, &). Loaded by bitwrap only if the interpreter is neither Lua 5.1/LuaJIT nor Lua 5.2. In BeamNG (LuaJIT) it is never loaded.
--- Access: `require("libs/luamqtt/mqtt/bit53")`
---@class libs_luamqtt_mqtt_bit53
local libs_luamqtt_mqtt_bit53 = {}

--- Bitwise AND.
---Source: lua/common/libs/luamqtt/mqtt/bit53.lua:13
---@param x1 integer Value.
---@param x2 integer Value.
---@return integer  x1 & x2.
function libs_luamqtt_mqtt_bit53.band(x1, x2) end

--- Bitwise OR.
---Source: lua/common/libs/luamqtt/mqtt/bit53.lua:10
---@param x1 integer Value.
---@param x2 integer Value.
---@return integer  x1 | x2.
function libs_luamqtt_mqtt_bit53.bor(x1, x2) end

--- Left shift.
---Source: lua/common/libs/luamqtt/mqtt/bit53.lua:4
---@param x integer Value.
---@param n integer Number of bits.
---@return integer  x << n.
function libs_luamqtt_mqtt_bit53.lshift(x, n) end

--- Right shift.
---Source: lua/common/libs/luamqtt/mqtt/bit53.lua:7
---@param x integer Value.
---@param n integer Number of bits.
---@return integer  x >> n.
function libs_luamqtt_mqtt_bit53.rshift(x, n) end

return libs_luamqtt_mqtt_bit53

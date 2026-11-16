---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/tools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Two small luamqtt utilities: string-to-hexadecimal conversion and integer division. Used by protocol.lua and for debugging.
--- Access: `require("libs/luamqtt/mqtt/tools")`
---@class libs_luamqtt_mqtt_tools
local libs_luamqtt_mqtt_tools = {}

--- Integer division: math.floor(x / y).
---Source: lua/common/libs/luamqtt/mqtt/tools.lua:28
---@param x number Dividend.
---@param y number Divisor.
---@return integer  Quotient rounded down.
function libs_luamqtt_mqtt_tools.div(x, y) end

--- Encodes each byte of the string as two uppercase hexadecimal digits.
---Source: lua/common/libs/luamqtt/mqtt/tools.lua:19
---@param str string Source string.
---@return string  Hexadecimal string.
function libs_luamqtt_mqtt_tools.hex(str) end

return libs_luamqtt_mqtt_tools

---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/protocol5.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Here is a MQTT v5.0 protocol implementation
---
--- MQTT v5.0 documentation (DOC):
--- 	http://docs.oasis-open.org/mqtt/mqtt/v5.0/mqtt-v5.0.html
---  module table
--- Accès : `require("libs/luamqtt/mqtt/protocol5")`
---@class libs_luamqtt_mqtt_protocol5
local libs_luamqtt_mqtt_protocol5 = {}

--- Create packet of given {type: number} in args
---Source : lua/common/libs/luamqtt/mqtt/protocol5.lua:687
---@param args any
function libs_luamqtt_mqtt_protocol5.make_packet(args) end

--- Parse packet using given read_func
---  Returns packet on success or false and error message on failure
---Source : lua/common/libs/luamqtt/mqtt/protocol5.lua:806
---@param read_func any
function libs_luamqtt_mqtt_protocol5.parse_packet(read_func) end

return libs_luamqtt_mqtt_protocol5

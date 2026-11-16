# `libs_luamqtt_mqtt_bitwrap`

*File: `lua/common/libs/luamqtt/mqtt/bitwrap.lua` · VM: Common (GE + vehicle) · 12 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/luamqtt/mqtt/bitwrap")`

Wrapper around the bit module: directly returns require('bit') (BitOp) under Lua 5.1 or LuaJIT, require('bit32') under Lua 5.2, otherwise the bit53 module. Under BeamNG (LuaJIT), it is the 'bit' library. Used by protocol.lua for band, bor, lshift, rshift. No functions of its own.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/luamqtt/mqtt/bitwrap.lua`.*

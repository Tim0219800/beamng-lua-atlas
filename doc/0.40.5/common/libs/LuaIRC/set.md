# `libs_LuaIRC_set`

*File: `lua/common/libs/LuaIRC/set.lua` · VM: Common (GE + vehicle) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/LuaIRC/set")`

Part of the third-party LuaIRC library. Module "irc.set": a set of IRC connections monitored together with socket.select. Allows managing several clients and processing only those that have data to read.

## Notes

- In set:remove, self.connections is indexed both by socket and by position; removal by position (remove(self.connections, k)) assumes that sockets and connections remain aligned.
- The object passed to new can define a timeout field, used by select.

## Class `set`

Set of IRC connections.

| Method | Description | Line |
|---|---|---|
| `set:add(connection)` | Adds a connection (its socket is added to the monitored list). | 20 |
| `set:poll()` | Like select, but on timeout returns all the connections (so that they can do their periodic work). | 53 |
| `set:remove(connection)` | Removes a connection from the set. | 28 |
| `set:select()` | Calls socket.select on the sockets with self.timeout and returns the list of connections ready to read. | 40 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `new(t)` | Turns the table t into a set (connections and sockets fields created empty, set metatable). | 14 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/LuaIRC/set.lua`.*

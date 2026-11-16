# `libs_LuaIRC_asyncoperations`

*File: `lua/common/libs/LuaIRC/asyncoperations.lua` · VM: Common (GE + vehicle) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/LuaIRC/asyncoperations")`

Part of the third-party LuaIRC library (IRC client in Lua). Adds to the connection metatable `irc._META` the sending commands: raw message, PRIVMSG, NOTICE, JOIN, PART, MODE and enabling user tracking. File loaded by libs/LuaIRC/init via require "irc.asyncoperations"; it uses the `module "irc"` form (Lua 5.1) and returns nothing.

## Notes

- The methods are only accessible after a successful connect() (before that, the meta_preconnect metatable raises an error).
- Command parameters are validated by verify(): a string starting with ':' (or containing a space followed by a NUL) causes a 'malformed parameter' error.
- Probable bug: in meta:send, error(err, errlevel) uses a variable `errlevel` that is never defined (nil, so default level).

## Class `meta`

Metatable of connected IRC connections (the methods are called with ':' on the object returned by irc.new).

| Method | Description | Line |
|---|---|---|
| `meta:join(channel, key)` | Joins a channel, with an optional key (password). | 48 |
| `meta:part(channel)` | Leaves a channel. If user tracking is active, removes the channel from self.channels. | 56 |
| `meta:send(msg, ...)` | Sends a raw line to the server (suffixed with \r\n). If extra arguments are given, msg is passed to string.format. Fires the OnSend hook before sending; on a socket error other than timeout/wantwrite, fires OnDisconnect, closes the connection and raises the error. | 11 |
| `meta:sendChat(target, msg)` | Sends a PRIVMSG message to a channel or a user. A multi-line message is split into one command per line. | 34 |
| `meta:sendNotice(target, msg)` | Like sendChat but with the NOTICE command (one command per line of the message). | 41 |
| `meta:setMode(t)` | Sends a MODE command. The table can contain add (modes to add) and/or remove (modes to remove); at least one of the two is required (assert). | 73 |
| `meta:trackUsers(b)` | Enables or disables per-channel user tracking (self.track_users). When disabling, empties self.channels. | 64 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/LuaIRC/asyncoperations.lua`.*

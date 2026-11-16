# `libs_LuaIRC_init`

*File: `lua/common/libs/LuaIRC/init.lua` · VM: Common (GE + vehicle) · 280 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/LuaIRC/init")`

Entry point of the third-party LuaIRC library (IRC client in Lua, adapted for BeamNG). Defines the global module `irc` (`module "irc"` form, Lua 5.1): irc.new(data) creates a client, connect() opens the TCP socket (SSL possible via libs/luasec/ssl), sends CAP/NICK/USER and loops until authentication. Loads irc.util, irc.asyncoperations and irc.handlers. Events are attached with hook(name, id, f); think() must be called regularly to read incoming messages.

## Example

```lua
local irc = require("libs/LuaIRC/init")
local c = irc.new({nick = "MyBot"})
c:hook("OnChat", function(user, channel, msg) print(user.nick, msg) end)
c:connect("irc.example.org", 6667)
c:join("#test")
-- then call c:think() every frame
```

## Notes

- Before connect(), the object has the meta_preconnect metatable: only hook, unhook and connect are usable, any other access to meta methods raises an error.
- connect() blocks (30 s timeout by default, then a wait loop with a 0.1 s pause) until the server has replied 001; it returns nothing. On TCP connection failure, it logs an error and returns without raising an error.
- In connect(), `success` is assigned without `local` (global variable). If LuaSec is missing, the log passes a useless 4th argument (2).
- meta:handle prints unknown IRC commands and their parameters with print.
- A hook that returns a truthy value interrupts the chain of the following hooks for that event (invoke returns true).

## Class `meta`

Metatable of an established IRC connection (after connect()). The sending methods are in asyncoperations.lua.

| Method | Description | Line |
|---|---|---|
| `meta:disconnect(message)` | Clean disconnect: fires OnDisconnect (message, false), sends QUIT then closes the socket. | 153 |
| `meta:handle(prefix, cmd, params)` | Runs the irc.handlers handler matching the received command; prints the command if it is unknown. | 228 |
| `meta:hook(name, id, f)` | Registers a function for an event (e.g. OnChat, OnJoin, OnRaw, OnSend, PreRegister, OnConnect, OnDisconnect). If f is omitted, id is used as the function. Returns id (or f). | 51 |
| `meta:invoke(name, ...)` | Calls the hooks of an event; stops at the first one that returns a truthy value. | 70 |
| `meta:shutdown()` | Closes the socket and removes the metatable from the object (it is no longer usable). | 162 |
| `meta:think()` | Reads all available lines on the socket (non-blocking), fires the OnRaw hook then, if it does not return true, processes the line via handle. To be called regularly. Raises an error if the socket is cut. | 179 |
| `meta:topic(channel)` | Requests a channel's topic (TOPIC command); the reply arrives via the OnTopic hook. | 276 |
| `meta:unhook(name, id)` | Removes a hook; assert fails if the event has no hook or if the id is unknown. | 60 |
| `meta:whois(nick)` | Sends WHOIS and reads the replies in a blocking way until code 318. Returns a table with userinfo, node, channels, account/registered depending on the server's replies; the other lines received are processed by handle. | 246 |

## Class `meta_preconnect`

Metatable of a client created by irc.new but not yet connected.

| Method | Description | Line |
|---|---|---|
| `meta_preconnect.__index(o, k)` | Returns hook, unhook or connect; raises an error for any other field that exists in meta (accessible only after connecting). | 29 |
| `meta_preconnect:connect(_host, _port)` | Opens the TCP connection (optional SSL), sends CAP REQ multi-prefix, fires PreRegister, sends PASS/NICK/USER, then loops on think() until 001 is received before firing OnConnect. Accepts either (host, port), or a table. | 81 |

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `new(data)` | Creates an unconnected IRC client. data.nick is required (assert) and validated by checkNick; username is "lua" and realname "Lua owns" by default; nickGenerator is defaultNickGenerator; track_users is true by default. | 38 |

**Globals assigned:** `_META`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/LuaIRC/init.lua`.*

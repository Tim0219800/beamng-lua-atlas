# `libs_LuaIRC_handlers`

*File: `lua/common/libs/LuaIRC/handlers.lua` · VM: Common (GE + vehicle) · 180 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/LuaIRC/handlers")`

Part of the third-party LuaIRC library (IRC client in Lua). Defines the global table `irc.handlers` (module "irc"): one handler per received IRC command or numeric code (PING, 001, PRIVMSG, NOTICE, JOIN, PART, QUIT, NICK, 432/433, 353, 366, 331/332/333, TOPIC, KICK, 221, 324, 474, MODE, ERROR). Each handler updates the connection state (nickname, channels, users) then fires the corresponding hook (OnChat, OnNotice, OnJoin, OnPart, OnQuit, NickChange, NameList, OnTopic, OnTopicInfo, OnKick, OnUserMode, OnChannelMode, OnBan, OnModeChange, OnDisconnect). Called by meta:handle in libs/LuaIRC/init.

## Notes

- Common handler signature: function(o, prefix, ...params) where o is the connection.
- PING automatically replies PONG; 001 marks the connection as authenticated (o.authed) and stores o.nick; 432/433 (invalid or taken nickname) resend NICK with o.nickGenerator(badnick).
- ERROR fires OnDisconnect, closes the socket then raises a Lua error (error(message, 3)).
- With track_users active, JOIN/MODE access o.channels[channel].users without checking: a Lua error is possible if the channel or user is unknown.

**Globals assigned:** `handlers`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/LuaIRC/handlers.lua`.*

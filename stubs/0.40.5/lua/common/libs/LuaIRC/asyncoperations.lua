---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/asyncoperations.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Metatable of connected IRC connections (the methods are called with ':' on the object returned by irc.new).
---@class libs_LuaIRC_asyncoperations_meta
local libs_LuaIRC_asyncoperations_meta = {}

--- Joins a channel, with an optional key (password).
---Source: lua/common/libs/LuaIRC/asyncoperations.lua:48
---@param channel string Channel name (e.g. #beamng)
---@param key string|nil Channel key, if protected
function libs_LuaIRC_asyncoperations_meta:join(channel, key) end

--- Leaves a channel. If user tracking is active, removes the channel from self.channels.
---Source: lua/common/libs/LuaIRC/asyncoperations.lua:56
---@param channel string Channel name
function libs_LuaIRC_asyncoperations_meta:part(channel) end

--- Sends a raw line to the server (suffixed with \r\n). If extra arguments are given, msg is passed to string.format. Fires the OnSend hook before sending; on a socket error other than timeout/wantwrite, fires OnDisconnect, closes the connection and raises the error.
---Source: lua/common/libs/LuaIRC/asyncoperations.lua:11
---@param msg string IRC line, or string.format format if arguments follow
---@param ... any Format arguments (optional)
function libs_LuaIRC_asyncoperations_meta:send(msg, ...) end

--- Sends a PRIVMSG message to a channel or a user. A multi-line message is split into one command per line.
---Source: lua/common/libs/LuaIRC/asyncoperations.lua:34
---@param target string Destination channel or nickname
---@param msg string Text to send
function libs_LuaIRC_asyncoperations_meta:sendChat(target, msg) end

--- Like sendChat but with the NOTICE command (one command per line of the message).
---Source: lua/common/libs/LuaIRC/asyncoperations.lua:41
---@param target string Destination channel or nickname
---@param msg string Text to send
function libs_LuaIRC_asyncoperations_meta:sendNotice(target, msg) end

--- Sends a MODE command. The table can contain add (modes to add) and/or remove (modes to remove); at least one of the two is required (assert).
---Source: lua/common/libs/LuaIRC/asyncoperations.lua:73
---@param t table {target = target (default: its own nickname), add = 'mode string', remove = 'mode string'}
function libs_LuaIRC_asyncoperations_meta:setMode(t) end

--- Enables or disables per-channel user tracking (self.track_users). When disabling, empties self.channels.
---Source: lua/common/libs/LuaIRC/asyncoperations.lua:64
---@param b boolean true to track, false to stop
function libs_LuaIRC_asyncoperations_meta:trackUsers(b) end


---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/init.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Metatable of an established IRC connection (after connect()). The sending methods are in asyncoperations.lua.
---@class libs_LuaIRC_init_meta
local libs_LuaIRC_init_meta = {}

--- Clean disconnect: fires OnDisconnect (message, false), sends QUIT then closes the socket.
---Source: lua/common/libs/LuaIRC/init.lua:153
---@param message string|nil Quit message (default "Bye!")
function libs_LuaIRC_init_meta:disconnect(message) end

--- Runs the irc.handlers handler matching the received command; prints the command if it is unknown.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/LuaIRC/init.lua:228
---@param prefix string|nil Line prefix (nick!user@host or server)
---@param cmd string Command or numeric code
---@param params table<integer, string> Line parameters
function libs_LuaIRC_init_meta:handle(prefix, cmd, params) end

--- Registers a function for an event (e.g. OnChat, OnJoin, OnRaw, OnSend, PreRegister, OnConnect, OnDisconnect). If f is omitted, id is used as the function. Returns id (or f).
---Source: lua/common/libs/LuaIRC/init.lua:51
---@param name string Event name
---@param id any Hook identifier (used by unhook) or the function itself
---@param f function|nil Function called with the event's arguments
---@return any  The hook identifier
function libs_LuaIRC_init_meta:hook(name, id, f) end

--- Calls the hooks of an event; stops at the first one that returns a truthy value.
---Source: lua/common/libs/LuaIRC/init.lua:70
---@param name string Event name
---@param ... any Arguments passed to the hooks
---@return boolean|nil  true if a hook answered true
function libs_LuaIRC_init_meta:invoke(name, ...) end

--- Closes the socket and removes the metatable from the object (it is no longer usable).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/LuaIRC/init.lua:162
function libs_LuaIRC_init_meta:shutdown() end

--- Reads all available lines on the socket (non-blocking), fires the OnRaw hook then, if it does not return true, processes the line via handle. To be called regularly. Raises an error if the socket is cut.
---Source: lua/common/libs/LuaIRC/init.lua:179
function libs_LuaIRC_init_meta:think() end

--- Requests a channel's topic (TOPIC command); the reply arrives via the OnTopic hook.
---Source: lua/common/libs/LuaIRC/init.lua:276
---@param channel string Channel name
function libs_LuaIRC_init_meta:topic(channel) end

--- Removes a hook; assert fails if the event has no hook or if the id is unknown.
---Source: lua/common/libs/LuaIRC/init.lua:60
---@param name string Event name
---@param id any Identifier returned by hook
function libs_LuaIRC_init_meta:unhook(name, id) end

--- Sends WHOIS and reads the replies in a blocking way until code 318. Returns a table with userinfo, node, channels, account/registered depending on the server's replies; the other lines received are processed by handle.
---Source: lua/common/libs/LuaIRC/init.lua:246
---@param nick string Nickname to query
---@return table  Fields userinfo, node, channels, registered, account
function libs_LuaIRC_init_meta:whois(nick) end

--- Metatable of a client created by irc.new but not yet connected.
---@class libs_LuaIRC_init_meta_preconnect
local libs_LuaIRC_init_meta_preconnect = {}

--- Returns hook, unhook or connect; raises an error for any other field that exists in meta (accessible only after connecting).
---*(internal: called by the engine or the main loop)*
---Source: lua/common/libs/LuaIRC/init.lua:29
---@param o table The client
---@param k string Requested key
function libs_LuaIRC_init_meta_preconnect.__index(o, k) end

--- Opens the TCP connection (optional SSL), sends CAP REQ multi-prefix, fires PreRegister, sends PASS/NICK/USER, then loops on think() until 001 is received before firing OnConnect. Accepts either (host, port), or a table.
---Source: lua/common/libs/LuaIRC/init.lua:81
---@param _host string|table Host name, or table {host, port, timeout, password, secure}
---@param _port integer|nil Port (default 6667)
function libs_LuaIRC_init_meta_preconnect:connect(_host, _port) end

--- Creates an unconnected IRC client. data.nick is required (assert) and validated by checkNick; username is "lua" and realname "Lua owns" by default; nickGenerator is defaultNickGenerator; track_users is true by default.
---Source: lua/common/libs/LuaIRC/init.lua:38
---@param data table {nick, username?, realname?, nickGenerator?}
---@return table  Client with the meta_preconnect metatable
function new(data) end

---@type any
_META = nil

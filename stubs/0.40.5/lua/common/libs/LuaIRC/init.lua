---@meta
-- tim19Atlas stub generated from lua/common/libs/LuaIRC/init.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `meta` de lua/common/libs/LuaIRC/init.lua
---@class libs_LuaIRC_init_meta
local libs_LuaIRC_init_meta = {}

---Source : lua/common/libs/LuaIRC/init.lua:153
---@param message any
function libs_LuaIRC_init_meta:disconnect(message) end

---Source : lua/common/libs/LuaIRC/init.lua:228
---@param prefix any
---@param cmd any
---@param params any
function libs_LuaIRC_init_meta:handle(prefix, cmd, params) end

---Source : lua/common/libs/LuaIRC/init.lua:51
---@param name any
---@param id any
---@param f any
function libs_LuaIRC_init_meta:hook(name, id, f) end

---Source : lua/common/libs/LuaIRC/init.lua:70
---@param name any
---@param ... any
function libs_LuaIRC_init_meta:invoke(name, ...) end

---Source : lua/common/libs/LuaIRC/init.lua:162
function libs_LuaIRC_init_meta:shutdown() end

---Source : lua/common/libs/LuaIRC/init.lua:179
function libs_LuaIRC_init_meta:think() end

---Source : lua/common/libs/LuaIRC/init.lua:276
---@param channel any
function libs_LuaIRC_init_meta:topic(channel) end

---Source : lua/common/libs/LuaIRC/init.lua:60
---@param name any
---@param id any
function libs_LuaIRC_init_meta:unhook(name, id) end

---Source : lua/common/libs/LuaIRC/init.lua:246
---@param nick any
function libs_LuaIRC_init_meta:whois(nick) end

--- Classe locale `meta_preconnect` de lua/common/libs/LuaIRC/init.lua
---@class libs_LuaIRC_init_meta_preconnect
local libs_LuaIRC_init_meta_preconnect = {}

---Source : lua/common/libs/LuaIRC/init.lua:29
---@param o any
---@param k any
function libs_LuaIRC_init_meta_preconnect.__index(o, k) end

---Source : lua/common/libs/LuaIRC/init.lua:81
---@param _host any
---@param _port any
function libs_LuaIRC_init_meta_preconnect:connect(_host, _port) end

---Source : lua/common/libs/LuaIRC/init.lua:38
---@param data any
function new(data) end

---@type any
_META = nil

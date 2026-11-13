---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/bit53.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Implémentation de secours de quelques fonctions de BitOp (lshift, rshift, bor, band) avec les opérateurs natifs de Lua 5.3 (<<, >>, |, &). Chargé par bitwrap uniquement si l'interpréteur n'est ni Lua 5.1/LuaJIT ni Lua 5.2. Dans BeamNG (LuaJIT) il n'est jamais chargé.
--- Accès : `require("libs/luamqtt/mqtt/bit53")`
---@class libs_luamqtt_mqtt_bit53
local libs_luamqtt_mqtt_bit53 = {}

--- ET bit à bit.
---Source : lua/common/libs/luamqtt/mqtt/bit53.lua:13
---@param x1 integer Valeur.
---@param x2 integer Valeur.
---@return integer  x1 & x2.
function libs_luamqtt_mqtt_bit53.band(x1, x2) end

--- OU bit à bit.
---Source : lua/common/libs/luamqtt/mqtt/bit53.lua:10
---@param x1 integer Valeur.
---@param x2 integer Valeur.
---@return integer  x1 | x2.
function libs_luamqtt_mqtt_bit53.bor(x1, x2) end

--- Décalage à gauche.
---Source : lua/common/libs/luamqtt/mqtt/bit53.lua:4
---@param x integer Valeur.
---@param n integer Nombre de bits.
---@return integer  x << n.
function libs_luamqtt_mqtt_bit53.lshift(x, n) end

--- Décalage à droite.
---Source : lua/common/libs/luamqtt/mqtt/bit53.lua:7
---@param x integer Valeur.
---@param n integer Nombre de bits.
---@return integer  x >> n.
function libs_luamqtt_mqtt_bit53.rshift(x, n) end

return libs_luamqtt_mqtt_bit53

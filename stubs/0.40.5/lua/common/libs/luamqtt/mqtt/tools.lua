---@meta
-- tim19Atlas stub generated from lua/common/libs/luamqtt/mqtt/tools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Deux petits utilitaires de luamqtt : conversion d'une chaîne en hexadécimal et division entière. Utilisés par protocol.lua et pour le débogage.
--- Accès : `require("libs/luamqtt/mqtt/tools")`
---@class libs_luamqtt_mqtt_tools
local libs_luamqtt_mqtt_tools = {}

--- Division entière : math.floor(x / y).
---Source : lua/common/libs/luamqtt/mqtt/tools.lua:28
---@param x number Dividende.
---@param y number Diviseur.
---@return integer  Quotient arrondi à l'inférieur.
function libs_luamqtt_mqtt_tools.div(x, y) end

--- Encode chaque octet de la chaîne en deux chiffres hexadécimaux majuscules.
---Source : lua/common/libs/luamqtt/mqtt/tools.lua:19
---@param str string Chaîne source.
---@return string  Chaîne hexadécimale.
function libs_luamqtt_mqtt_tools.hex(str) end

return libs_luamqtt_mqtt_tools

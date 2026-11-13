---@meta
-- tim19Atlas stub generated from lua/common/json.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fin enrobage de string.buffer de LuaJIT pour lire et écrire du JSON/SJSON (https://github.com/Autodesk/sjson). `json.decode` lit du texte ou un buffer ; `json.encode` est directement buffer.jsonencode. L'ancien parseur SJSON en Lua pur a été déplacé dans ljson.lua.
--- Accès : globale `json`
---@class json
---@field encode function string.buffer.jsonencode : sérialise une valeur Lua (table, nombre, chaîne, booléen) en texte JSON.
json = {}

--- Décode du JSON/SJSON. Accepte une chaîne ou un objet string.buffer (qui doit avoir une méthode jsondecode). Renvoie nil si l'argument est nil.
---Source : lua/common/json.lua:25
---@param si string|table|nil texte JSON ou string.buffer
---@return any  valeur Lua décodée (table, nombre, chaîne, booléen…) ; erreur levée si JSON invalide (comportement de string.buffer)
function json.decode(si) end


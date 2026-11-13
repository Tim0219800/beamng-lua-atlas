---@meta
-- tim19Atlas stub generated from lua/common/ljson.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ancien parseur SJSON écrit en Lua pur (Lua 5.1), conservé quand json.lua est passé à string.buffer de LuaJIT. Il décode le format SJSON d'Autodesk (JSON étendu) utilisé par les fichiers jbeam et de configuration. Rarement utile à un moddeur (préférer json.decode, plus rapide), mais il tolère les mêmes extensions et produit des erreurs avec numéro de ligne.
--- Accès : `require("ljson")`
---@class ljson
local ljson = {}

--- Décode un texte SJSON/JSON en table Lua. Renvoie nil si si est nil. Lève une erreur avec numéro de ligne si le texte est invalide.
---Source : lua/common/ljson.lua:233
---@param si string|nil texte SJSON
---@return table|nil  valeur décodée
function ljson.decode(si) end

return ljson

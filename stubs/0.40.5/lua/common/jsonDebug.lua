---@meta
-- tim19Atlas stub generated from lua/common/jsonDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Variante de ljson (parseur SJSON en Lua pur) qui, en plus de décoder, renvoie une liste d'avertissements, notamment les clés dupliquées avec numéro de ligne. Sert à valider des fichiers de données (jbeam, config) pendant le développement ; une extension peut passer un nom de contexte pour étiqueter ces avertissements.
--- Accès : `require("jsonDebug")`
---@class jsonDebug
local jsonDebug = {}

--- Décode du SJSON et renvoie la valeur avec la liste des avertissements (clés dupliquées).
---Source : lua/common/jsonDebug.lua:250
---@param si string|nil texte SJSON
---@param context string|nil étiquette (par ex. nom de fichier) préfixée aux avertissements
---@return table|nil  valeur décodée
---@return string[]  avertissements
function jsonDebug.decode(si, context) end

return jsonDebug

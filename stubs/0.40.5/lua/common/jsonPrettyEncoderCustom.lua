---@meta
-- tim19Atlas stub generated from lua/common/jsonPrettyEncoderCustom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Encodeur JSON 'joli' personnalisable : trie les clés par poids (tableWeights), et laisse un callback décider quelles tables sont repliées sur une seule ligne et lesquelles sont indentées. Sert à écrire des fichiers de configuration lisibles (ex. fichiers de contrôles/bindings).
--- Accès : `require("jsonPrettyEncoderCustom")`
---@class jsonPrettyEncoderCustom
local jsonPrettyEncoderCustom = {}

--- Encode v en texte JSON avec clés triées par poids et repliement piloté par foldingCallback. Les trois derniers arguments sont facultatifs ; _levelPath est interne (récursion).
---Source : lua/common/jsonPrettyEncoderCustom.lua:76
---@param v any valeur à encoder (nil -> 'null')
---@param lvl integer|nil niveau d'indentation de départ, défaut 1
---@param numberPrecision integer|nil nombre de décimales des non-entiers ; nil = %.10g
---@param tableWeights table<string, number>|nil poids de tri des clés (minuscules), défaut 50 ; la valeur nil provoque une erreur dans le tri car weights est indexé (fournir au moins {})
---@param foldingCallback fun(item: table, lvl: integer, path: string): boolean|nil renvoie true pour replier la table sur une ligne, false pour l'indenter
---@param _levelPath string|nil interne : chemin courant
---@return string  texte JSON
function jsonPrettyEncoderCustom.encode(v, lvl, numberPrecision, tableWeights, foldingCallback, _levelPath) end

return jsonPrettyEncoderCustom

---@meta
-- tim19Atlas stub generated from lua/common/utils/torqueScriptParser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Preuve de concept d'analyseur (parser PEG, via libs/lua-luaepnf/epnf) de fichiers TorqueScript : déclarations 'new/singleton/datablock', propriétés, fonctions (corps ignoré). Le fichier lui-même annonce 'pas complètement fonctionnel, loin d'être prêt'. Se charge avec require('utils/torqueScriptParser').
--- Accès : `require("utils/torqueScriptParser")`
---@class utils_torqueScriptParser
local utils_torqueScriptParser = {}

--- Analyse un texte TorqueScript avec la grammaire interne (epnf.parsestring) dans un pcall.
---Source : lua/common/utils/torqueScriptParser.lua:95
---@param s string Texte TorqueScript
---@return boolean  true si l'analyse a réussi
---@return table|string  Arbre syntaxique si succès, message d'erreur sinon
function utils_torqueScriptParser.parse(s) end

return utils_torqueScriptParser

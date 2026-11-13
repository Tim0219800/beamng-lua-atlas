---@meta
-- tim19Atlas stub generated from lua/common/utils/calltracer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de profilage/diagnostic : enregistre, grâce à un hook debug.sethook sur les appels de fonctions, qui appelle qui pendant une période, puis exporte le graphe d'appels au format TGF (ouvrable dans yEd). Se charge avec require('utils/calltracer'). Réservé au débogage.
--- Accès : `require("utils/calltracer")`
---@class utils_calltracer
local utils_calltracer = {}

--- Efface tous les noeuds et arêtes enregistrés.
---Source : lua/common/utils/calltracer.lua:86
function utils_calltracer.reset() end

--- Écrit le graphe d'appels enregistré au format TGF (liste de noeuds numérotés, ligne '#', puis les arêtes) dans un fichier.
---Source : lua/common/utils/calltracer.lua:61
---@param filename string Fichier de sortie, ex. 'callgraph.tgf'
function utils_calltracer.save(filename) end

--- Installe le hook d'appels (debug.sethook(trace, 'c')) : les appels sont enregistrés dès cet instant.
---Source : lua/common/utils/calltracer.lua:52
function utils_calltracer.start() end

--- Retire le hook (debug.sethook()). Les noeuds déjà enregistrés sont conservés.
---Source : lua/common/utils/calltracer.lua:56
function utils_calltracer.stop() end

return utils_calltracer

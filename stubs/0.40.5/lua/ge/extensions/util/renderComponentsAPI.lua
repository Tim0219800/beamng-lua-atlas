---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/renderComponentsAPI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit module d'aide pour l'interface des composants de rendu : liste les fichiers PNG de correction colorimétrique (LUT) présents dans art/postfx, utilisables pour le post-traitement.
--- Accès : extension `util_renderComponentsAPI` : `extensions.load("util_renderComponentsAPI")`, puis la globale `util_renderComponentsAPI`
---@class util_renderComponentsAPI
util_renderComponentsAPI = {}

--- Liste les fichiers *.png du dossier art/postfx (non récursif).
---Source : lua/ge/extensions/util/renderComponentsAPI.lua:7
---@return table[]  Liste de tables {filename = chemin du PNG}
function util_renderComponentsAPI.getColorCorrections() end


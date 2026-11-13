---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/photomode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit module du mode photo : liste les images PNG d'overlays disponibles dans ui/modules/photomode/ui-overlays (cadres, filigranes) que l'interface propose à l'utilisateur. Un moddeur peut y déposer ses propres PNG pour les rendre disponibles.
--- Accès : extension `util_photomode` : `extensions.load("util_photomode")`, puis la globale `util_photomode`
---@class util_photomode
util_photomode = {}

--- Liste les fichiers *.png de ui/modules/photomode/ui-overlays (non récursif).
---Source : lua/ge/extensions/util/photomode.lua:7
---@return table[]  Liste de tables {filename = chemin du PNG}
function util_photomode.getPhotomodeOverlays() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/mainUpdate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boucle de mise à jour de l'éditeur, appelée à chaque frame via onUpdate quand l'éditeur est actif. Elle met à jour et dessine les icônes d'objets, diffuse les changements de préférences (et les sauvegarde), appelle l'onUpdate du mode d'édition courant, puis présente l'interface (GUI, menus contextuels, boîtes modales, dialogue de sauvegarde des outils modifiés).
--- Accès : extension `editor_mainUpdate` : `extensions.load("editor_mainUpdate")`, puis la globale `editor_mainUpdate`
---@class editor_mainUpdate
---@field onEditorInitialized any
editor_mainUpdate = {}

--- Hook de chargement. Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainUpdate.lua:37
function editor_mainUpdate.onExtensionLoaded() end

--- Hook de déchargement. Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainUpdate.lua:40
function editor_mainUpdate.onExtensionUnloaded() end

--- Boucle par frame de l'éditeur : icônes d'objets, préférences modifiées, editMode.onUpdate, gizmos (si editor.hideObjectIcons est faux) puis editor.guiModule.presentGui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainUpdate.lua:13
---@param dtReal number Delta de temps réel de la frame (s), transmis au mode d'édition et à presentGui.
---@param dtSim number Delta de temps de simulation (s).
---@param dtRaw number Delta de temps brut (s).
function editor_mainUpdate.onUpdate(dtReal, dtSim, dtRaw) end


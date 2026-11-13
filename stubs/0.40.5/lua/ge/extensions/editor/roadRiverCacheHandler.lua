---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadRiverCacheHandler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit gestionnaire de l'éditeur qui maintient le cache des sommets des DecalRoad : il l'initialise pour tous les DecalRoad du niveau au démarrage de l'éditeur, et le met à jour quand un prefab est « explosé » (déballé) dans la scène. Aucune fonction n'est destinée à être appelée par un moddeur.
--- Accès : extension `editor_roadRiverCacheHandler` : `extensions.load("editor_roadRiverCacheHandler")`, puis la globale `editor_roadRiverCacheHandler`
---@class editor_roadRiverCacheHandler
editor_roadRiverCacheHandler = {}

--- Hook appelé à l'initialisation de l'éditeur : initialise les sommets de toutes les routes du niveau (editor.initializeLevelRoadsVertices).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadRiverCacheHandler.lua:18
function editor_roadRiverCacheHandler.onEditorInitialized() end

--- Hook appelé quand un ou plusieurs prefabs sont explosés dans l'éditeur. Pour chaque objet de chaque groupe, si c'est un DecalRoad, recalcule ses sommets avec editor.updateRoadVertices.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadRiverCacheHandler.lua:7
---@param groups table Liste de groupes (SimGroup) issus du prefab ; chaque groupe expose getObjects() (déduit du code).
function editor_roadRiverCacheHandler.onEditorPrefabExploded(groups) end


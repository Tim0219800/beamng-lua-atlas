---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadRiverGui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éléments d'interface partagés par les éditeurs de routes (DecalRoad) et de rivières : palette de couleurs de surbrillance (survol, sélection, nœuds, duplication…), facteur de taille des nœuds, et le bouton de barre d'outils « Add Road/Nodes » qui active le mode création. Utilisé notamment par editor_roadEditor.
--- Accès : extension `editor_roadRiverGui` : `extensions.load("editor_roadRiverGui")`, puis la globale `editor_roadRiverGui`
---@class editor_roadRiverGui
---@field highlightColors table<string, ColorF> Couleurs de surbrillance : hover, lightHover, hoverSelectNotAllowed, lightHoverSelectNotAllowed, selected, darkSelected, duplicated, nearby, cursor, createModeCursor, selectedNode, hoveredNode, node, nodeTransparent.
---@field nodeSizeFactor number Facteur de taille d'affichage des nœuds (0.012).
editor_roadRiverGui = {}

--- Dessine dans la barre d'outils le bouton icône « Add Road/Nodes » (info-bulle incluse), bascule l'état du bouton au clic et met à jour M.createMode (bouton actif ou Alt enfoncé). Appelée par l'interface de l'éditeur de routes ou de rivières.
---Source : lua/ge/extensions/editor/roadRiverGui.lua:36
function editor_roadRiverGui.editModeToolbar() end


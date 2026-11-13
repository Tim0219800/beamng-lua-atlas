---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Interface ImGui de l'onglet Features du Hero Road Editor, pour les éléments posables sur la route : passages piétons, amas de réparations, nids-de-poule, élargissements, carrefours et barrières. Elle affiche une liste unifiée (renommage, bouton « aller à » qui déplace la caméra, suppression), une rangée de boutons de placement (mode via roadPlaceables.setPlaceMode) puis les curseurs de l'élément sélectionné. Les modifications passent par groupMgr (copie profonde du groupe) et editor.history pour l'annulation.
--- Accès : extension `editor_heroRoadEditor_placeablesUI` : `extensions.load("editor_heroRoadEditor_placeablesUI")`, puis la globale `editor_heroRoadEditor_placeablesUI`
---@class editor_heroRoadEditor_placeablesUI
editor_heroRoadEditor_placeablesUI = {}

--- Indique si un curseur 'live' était maintenu à la frame précédente et remet le drapeau à false. La fenêtre d'outil est dessinée après le pipeline de glissement, donc heroRoadEditor l'appelle en début de frame suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua:31
---@return boolean  true si un curseur live était tenu.
function editor_heroRoadEditor_placeablesUI.consumeLiveDrag() end

--- Dessine tout l'onglet Features pour la route sélectionnée : liste unifiée des éléments posables (crossings, repairs, potholes, widenings, junctions, barriers), rangée de boutons d'ajout, puis les contrôles de l'élément sélectionné.
---Source : lua/ge/extensions/editor/heroRoadEditor/placeablesUI.lua:377
---@param selGroup table|nil Groupe Hero Road sélectionné ; nil affiche une liste vide ('No features yet.').
---@param selectedGroupIdx integer Indice du groupe sélectionné, comparé à la sélection de roadPlaceables.
function editor_heroRoadEditor_placeablesUI.draw(selGroup, selectedGroupIdx) end


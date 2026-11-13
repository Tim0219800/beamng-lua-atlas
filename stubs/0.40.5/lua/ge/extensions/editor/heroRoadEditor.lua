---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Éditeur « Hero Road » : création et édition de routes par splines (groupes de routes avec nœuds, profils, couches, mesh, trottoirs, barrières, éclairages et objets placés, terraformage, peinture, export). Les modules associés sont dans editor/heroRoadEditor/ (groupMgr, layerMgr, profile, mesh, exportMgr, sidewalkMgr, barrierMgr, placeablesUI, import) et editor/toolUtilities/. Il enregistre le mode d'édition « Hero Road » et un menu contextuel du scene tree « Convert to Hero Road » pour importer des DecalRoad sélectionnés. L'état des routes survit à un rechargement Lua via onSerialize/onDeserialized.
--- Accès : extension `editor_heroRoadEditor` : `extensions.load("editor_heroRoadEditor")`, puis la globale `editor_heroRoadEditor`
---@class editor_heroRoadEditor
editor_heroRoadEditor = {}

--- Hook appelé quand on quitte la carte : supprime tous les groupes de routes et recalcule la table id vers indice.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:2888
function editor_heroRoadEditor.onClientEndMission() end

--- Hook de désérialisation après rechargement Lua : recrée les groupes de routes à partir des données et recalcule la table id vers indice. Accepte l'ancien format (tableau de groupes nu).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:270
---@param data table Table {groups = {...}} renvoyée par onSerialize, ou ancien tableau de groupes
function editor_heroRoadEditor.onDeserialized(data) end

--- Hook appelé chaque frame par l'éditeur : callback principal de l'outil. Gère le masquage pendant les glissements (nœud, passage piéton, poignée de coin, curseur « live »), la reconstruction des groupes modifiés, le rendu des splines et la fenêtre d'outil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:2618
function editor_heroRoadEditor.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre le mode d'édition « Hero Road », la fenêtre de l'outil, la fenêtre de sélection de matériau et l'entrée de menu « Convert to Hero Road » du scene tree.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:2862
function editor_heroRoadEditor.onEditorInitialized() end

--- Hook appelé avant un rechargement Lua : sérialise tous les groupes de routes, puis les supprime (removeAllGroups).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:258
---@return table  {groups = <groupes sérialisés>}
function editor_heroRoadEditor.onSerialize() end

--- Définit l'indice du nœud sélectionné (sélection entre outils).
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:233
---@param idx integer|nil Indice du nœud dans la spline sélectionnée
function editor_heroRoadEditor.setSelectedNodeIdx(idx) end

--- Définit l'indice de la spline (groupe de route) sélectionnée (sélection entre outils).
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:230
---@param idx integer|nil Indice du groupe dans la liste des groupes
function editor_heroRoadEditor.setSelectedSplineIdx(idx) end


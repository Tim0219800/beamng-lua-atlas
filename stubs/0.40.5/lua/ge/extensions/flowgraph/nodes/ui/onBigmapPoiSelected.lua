---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_onBigmapPoiSelected_C
local flowgraph_nodes_ui_onBigmapPoiSelected_C = {}

--- Initialise les drapeaux et la position.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua:26
function flowgraph_nodes_ui_onBigmapPoiSelected_C:init() end

--- Hook : POI sélectionné (poiId) ou nil si désélectionné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua:45
---@param poiId string|nil Identifiant du POI, nil si désélectionné.
function flowgraph_nodes_ui_onBigmapPoiSelected_C:onPoiSelectedFromBigmap(poiId) end

--- Hook : navigation vers pos, ou nil si annulée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua:54
---@param pos vec3|nil Position visée, nil si la navigation est annulée.
function flowgraph_nodes_ui_onBigmapPoiSelected_C:onSetBigmapNavFocus(pos) end

--- Remet les impulsions à false, applique les drapeaux enregistrés par les hooks puis les vide et écrit poiId et pos.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/onBigmapPoiSelected.lua:31
---@param args any Argument éventuel (non utilisé).
function flowgraph_nodes_ui_onBigmapPoiSelected_C:work(args) end


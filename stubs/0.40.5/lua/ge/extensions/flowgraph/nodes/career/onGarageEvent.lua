---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_onGarageEvent_C
local flowgraph_nodes_career_onGarageEvent_C = {}

--- Crée la table de drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:22
function flowgraph_nodes_career_onGarageEvent_C:init() end

--- Hook : lève beforeGarageVehicleSelected.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:39
---@param data any non utilisé
function flowgraph_nodes_career_onGarageEvent_C:onBeforeGarageVehicleSelected(data) end

--- Hook : lève beforeGarageInventoryOpened.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:35
---@param data any non utilisé
function flowgraph_nodes_career_onGarageEvent_C:onBeforeGarageVehicleSelectionMenuOpened(data) end

--- Hook : lève endMode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:43
---@param data any non utilisé
function flowgraph_nodes_career_onGarageEvent_C:onEndGarageMode(data) end

--- Chaque frame : remet à faux deux sorties, applique puis efface les drapeaux.
---Source : lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua:26
---@param args any non utilisé
function flowgraph_nodes_career_onGarageEvent_C:work(args) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_pursuitInformation_C
local flowgraph_nodes_gameplay_traffic_pursuitInformation_C = {}

--- Appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:40
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:_executionStopped() end

--- Appelle reset().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:36
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:init() end

--- Hook appelé par le système de police ; mémorise 'arrest' ou 'evade' si id correspond au véhicule suivi.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:79
---@param id any id du véhicule concerné
---@param action any action de poursuite ('arrest' ou 'evade')
---@param data table données associées à l'action
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:onPursuitAction(id, action, data) end

--- Remet à zéro le véhicule, les sorties flow et les flags.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:44
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:reset() end

--- Lit les données de poursuite et met à jour les sorties ; émet arrest/evade une frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua:53
function flowgraph_nodes_gameplay_traffic_pursuitInformation_C:work() end


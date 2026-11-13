---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_dragRace_dragTimes_C
local flowgraph_nodes_gameplay_dragRace_dragTimes_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua:42
function flowgraph_nodes_gameplay_dragRace_dragTimes_C:_executionStarted() end

--- Crée les pins flow_<id> et number <id> pour chaque chrono.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua:34
function flowgraph_nodes_gameplay_dragRace_dragTimes_C:postInit() end

--- Récupère les chronos du véhicule via le bridge ; signale une erreur de nœud si vehId est absent ou inconnu.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua:45
function flowgraph_nodes_gameplay_dragRace_dragTimes_C:updateInfos() end

--- Appelle updateInfos et recopie les chronos définis vers les pins.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/dragTimes.lua:70
function flowgraph_nodes_gameplay_dragRace_dragTimes_C:work() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_crash_onCrashDetected_C
local flowgraph_nodes_gameplay_crash_onCrashDetected_C = {}

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:24
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:_executionStopped() end

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:20
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:init() end

--- Hook : ajoute vehId à la file de fins de crash.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:55
---@param crashEndData table Contient vehId
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:onVehicleCrashEnded(crashEndData) end

--- Hook : ajoute vehId à la file de débuts de crash.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:51
---@param crashStartData table Contient vehId
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:onVehicleCrashStarted(crashStartData) end

--- Vide les files crashStartQueue et crashEndQueue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:28
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:reset() end

--- Dépile un crash début et un crash fin par frame et renseigne startCrash, endCrash, vehId.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/crash/onCrashDetected.lua:33
function flowgraph_nodes_gameplay_crash_onCrashDetected_C:work() end


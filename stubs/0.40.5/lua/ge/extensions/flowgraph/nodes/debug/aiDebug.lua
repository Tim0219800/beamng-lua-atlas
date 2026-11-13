---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_debug_aiDebug_C
local flowgraph_nodes_debug_aiDebug_C = {}

--- Trouve le véhicule (vehId ou joueur) et lui envoie ai.setVehicleDebugMode({debugMode = mode}) par queueLuaCommand.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua:42
function flowgraph_nodes_debug_aiDebug_C:SetAIDebugMode() end

--- Propose la liste des modes comme modèles du pin mode dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua:24
function flowgraph_nodes_debug_aiDebug_C:postInit() end

--- Si dynamicMode vaut 'repeat', réapplique le mode à chaque frame.
---Source : lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua:36
function flowgraph_nodes_debug_aiDebug_C:work() end

--- Applique le mode une fois.
---Source : lua/ge/extensions/flowgraph/nodes/debug/aiDebug.lua:32
function flowgraph_nodes_debug_aiDebug_C:workOnce() end


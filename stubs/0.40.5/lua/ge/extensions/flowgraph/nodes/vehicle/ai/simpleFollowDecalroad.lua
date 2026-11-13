---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C
local flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C = {}

--- Affiche bouton Load, état, nombre de nœuds, distance et tracé de debug si renderDebug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:129
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:drawMiddle(builder, style) end

--- Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:61
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:getVeh() end

--- Initialise les données (speed=5, loopMode=startReset, renderDebug=false) et demande à tous les véhicules d'émettre le hook onVehicleSubmitInfo avec leur ai.scriptState().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:33
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:init() end

--- Construit self.path depuis la DecalRoad (scenetree.findObject(roadName)) : un point par nœud avec le temps cumulé et la direction/haut du premier point.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:98
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:loadRecording() end

--- Hook appelé avec l'état du script IA d'un véhicule ; met à jour progress = scriptTime / endScriptTime et receivedInfo si l'id correspond à vehId.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:47
---@param id string|number Id du véhicule.
---@param info table|nil État du script IA (scriptTime, endScriptTime) ou nil.
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:onVehicleSubmitInfo(id, info) end

--- Charge la route, envoie ai.startFollowing(path, nil, loopCount ou -1, loopMode) et initialise les pins finished, active et progress.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:71
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:play() end

--- Envoie ai.stopFollowing() et met finished/active à false.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:87
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:stop() end

--- Appelle play sur start, ou stop sur stop.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/simpleFollowDecalroad.lua:121
function flowgraph_nodes_vehicle_ai_simpleFollowDecalroad_C:work() end


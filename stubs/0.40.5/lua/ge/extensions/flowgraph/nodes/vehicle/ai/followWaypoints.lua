---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_followWaypoints_C
local flowgraph_nodes_vehicle_ai_followWaypoints_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:34
function flowgraph_nodes_vehicle_ai_followWaypoints_C:_executionStopped() end

--- Affiche l'état, le nombre de waypoints et la cible finale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:108
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_vehicle_ai_followWaypoints_C:drawMiddle(builder, style) end

--- Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:47
function flowgraph_nodes_vehicle_ai_followWaypoints_C:getVeh() end

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:30
function flowgraph_nodes_vehicle_ai_followWaypoints_C:init() end

--- Vide le chemin, remet les compteurs de tours à zéro, efface finalWp et passe à l'état « inactive ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:38
function flowgraph_nodes_vehicle_ai_followWaypoints_C:onNodeReset() end

--- Pendant « started », compte un tour quand le véhicule passe dans le rayon du dernier waypoint, réarme quand il est plus proche du premier ; passe à « finished » quand lapsDone == lapCount.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:85
function flowgraph_nodes_vehicle_ai_followWaypoints_C:work() end

--- Lit le chemin, calcule lapCount, finalWp (dernier waypoint) et envoie ai.driveUsingPath({wpTargetList, wpSpeeds, noOfLaps, aggression = 1}) ; en multi-tours, ajoute le premier waypoint à la fin ; sans stopAtFinish, fixe la vitesse du dernier waypoint à 100. Passe l'état à « started ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/followWaypoints.lua:57
function flowgraph_nodes_vehicle_ai_followWaypoints_C:workOnce() end


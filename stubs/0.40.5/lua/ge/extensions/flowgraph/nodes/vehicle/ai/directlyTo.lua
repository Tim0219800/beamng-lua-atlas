---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_directlyTo_C
local flowgraph_nodes_vehicle_ai_directlyTo_C = {}

--- Appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:40
function flowgraph_nodes_vehicle_ai_directlyTo_C:_executionStopped() end

--- Affiche les états Complete et Started.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:124
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_vehicle_ai_directlyTo_C:drawMiddle(builder, style) end

--- Envoie au véhicule ai:scriptStop(handBrake, straightenWheels) selon les données du nœud.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:60
function flowgraph_nodes_vehicle_ai_directlyTo_C:endAI() end

--- Renvoie le véhicule de vehId, ou celui du joueur sans entrée.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:50
function flowgraph_nodes_vehicle_ai_directlyTo_C:getVeh() end

--- Initialise started/complete et les données par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:31
function flowgraph_nodes_vehicle_ai_directlyTo_C:init() end

--- Remet started/complete à false et appelle endAI.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:44
function flowgraph_nodes_vehicle_ai_directlyTo_C:reset() end

--- Construit un chemin de points espacés d'au plus maxStepDistance entre la position du véhicule et la cible (temps = distance / vitesse) et l'envoie par ai.startFollowing.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:67
function flowgraph_nodes_vehicle_ai_directlyTo_C:setupAI() end

--- Gère reset ; au premier flow lance setupAI ; ensuite teste la distance au carré à la cible et, sous minDistance, arrête l'IA, marque complete et active la sortie flow.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/directlyTo.lua:96
function flowgraph_nodes_vehicle_ai_directlyTo_C:work() end


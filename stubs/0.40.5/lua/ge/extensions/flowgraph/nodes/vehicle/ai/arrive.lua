---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_arrive_C
local flowgraph_nodes_vehicle_ai_arrive_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:46
function flowgraph_nodes_vehicle_ai_arrive_C:_executionStopped() end

--- Affiche l'état et si la commande a été envoyée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:50
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_vehicle_ai_arrive_C:drawMiddle(builder, style) end

--- Renvoie le véhicule de aiVehId, ou celui du joueur sans entrée.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:56
function flowgraph_nodes_vehicle_ai_arrive_C:getVeh() end

--- Initialise sentCommand, data.autoDisableOnArrive=true et l'état de durée « inactive ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:35
function flowgraph_nodes_vehicle_ai_arrive_C:init() end

--- Remet sentCommand à false et l'état à « inactive ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:41
function flowgraph_nodes_vehicle_ai_arrive_C:onNodeReset() end

--- Si flow est actif et pas terminé : vérifie le waypoint et le véhicule (erreur de nœud sinon), calcule la distance depuis le milieu de l'avant, passe à « finished » à l'arrivée (et désactive l'IA si autoDisableOnArrive), puis envoie une fois ai.setState manual et ai.setTarget.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/arrive.lua:66
function flowgraph_nodes_vehicle_ai_arrive_C:work() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_aiParams_C
local flowgraph_nodes_vehicle_ai_aiParams_C = {}

--- Configure le curseur de risk (0,1 à 2,0) et les modèles du pin routeMode (off, set, limit).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua:33
function flowgraph_nodes_vehicle_ai_aiParams_C:postInit() end

--- Retrouve le véhicule (getObjectByID ou getPlayerVehicle(0)) et envoie à chaque frame les commandes ai.* correspondant aux pins renseignés ; gère l'activation/désactivation du nitro (bascule du contrôleur nitrousOxideInjection seulement si son état armé diffère).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/aiParams.lua:48
function flowgraph_nodes_vehicle_ai_aiParams_C:work() end


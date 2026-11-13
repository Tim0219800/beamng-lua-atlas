---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_goToEndLine_C
local flowgraph_nodes_vehicle_ai_goToEndLine_C = {}

--- Appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:39
function flowgraph_nodes_vehicle_ai_goToEndLine_C:_executionStopped() end

--- Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:43
function flowgraph_nodes_vehicle_ai_goToEndLine_C:getVeh() end

--- Active autoDisableOnArrive et appelle onNodeReset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:29
function flowgraph_nodes_vehicle_ai_goToEndLine_C:init() end

--- Remet complete et sentCommand à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:34
function flowgraph_nodes_vehicle_ai_goToEndLine_C:onNodeReset() end

--- Gère reset ; si déjà arrivé, active flow. Sinon calcule la distance entre le milieu de l'avant du véhicule et endLinePosition, détermine l'arrivée (distance et vitesse) et désactive l'IA si autoDisableOnArrive ; envoie une fois ai.setState manual. Erreur de nœud si aucune position n'est donnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/goToEndLine.lua:53
function flowgraph_nodes_vehicle_ai_goToEndLine_C:work() end


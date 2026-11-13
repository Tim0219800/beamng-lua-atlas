---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_lightsController_C
local flowgraph_nodes_mission_lightsController_C = {}

--- Remet l'etat et les sorties a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua:46
function flowgraph_nodes_mission_lightsController_C:_executionStarted() end

--- Meme initialisation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua:54
function flowgraph_nodes_mission_lightsController_C:init() end

--- Recherche les lumieres de stage et du compte a rebours dans la scene.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua:23
function flowgraph_nodes_mission_lightsController_C:initLights() end

--- Sur reset : remet l'etat et cache les lumieres. Sinon fait avancer le minuteur, gere les ambres/vert, passe started=true, detecte le faux depart (velocity > 0,5) : disqualified=true, ambres et rouge droit allumes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/lightsController.lua:62
function flowgraph_nodes_mission_lightsController_C:work() end


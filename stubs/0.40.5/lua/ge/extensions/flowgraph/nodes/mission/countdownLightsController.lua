---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_countdownLightsController_C
local flowgraph_nodes_mission_countdownLightsController_C = {}

--- Remet l'etat (started, starttimer, jumpStarted, timerOn) et les sorties a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua:40
function flowgraph_nodes_mission_countdownLightsController_C:_executionStarted() end

--- Meme initialisation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua:49
function flowgraph_nodes_mission_countdownLightsController_C:init() end

--- Recherche les objets lumineux du compte a rebours dans la scene (Amberlight1-3, Greenlight, Redlight, gauche/droite).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua:23
function flowgraph_nodes_mission_countdownLightsController_C:initLights() end

--- Sur reset : remet l'etat et cache toutes les lumieres (initLights). Sinon fait avancer le minuteur (dtSim), allume/eteint les lumieres selon proTree, passe started=true au vert, detecte le faux depart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/countdownLightsController.lua:58
function flowgraph_nodes_mission_countdownLightsController_C:work() end


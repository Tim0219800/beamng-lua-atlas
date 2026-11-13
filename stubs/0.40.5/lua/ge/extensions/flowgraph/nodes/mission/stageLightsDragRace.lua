---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_stageLightsDragRace_C
local flowgraph_nodes_mission_stageLightsDragRace_C = {}

--- Vide la table lights.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:43
function flowgraph_nodes_mission_stageLightsDragRace_C:_executionStarted() end

--- Vide la table lights.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:47
function flowgraph_nodes_mission_stageLightsDragRace_C:init() end

--- Recherche les quatre objets lumineux dans la scene.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:32
function flowgraph_nodes_mission_stageLightsDragRace_C:initLights() end

--- Definit les valeurs proposees des pins side (left/right) et light (Pre Stage/Stage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:21
function flowgraph_nodes_mission_stageLightsDragRace_C:postInit() end

--- Sur reset : retrouve les lumieres et les cache. Sinon rend visible la lumiere choisie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua:51
function flowgraph_nodes_mission_stageLightsDragRace_C:work() end


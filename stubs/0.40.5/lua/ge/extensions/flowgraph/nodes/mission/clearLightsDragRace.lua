---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_clearLightsDragRace_C
local flowgraph_nodes_mission_clearLightsDragRace_C = {}

--- Vide la table lights et met flow a false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:71
function flowgraph_nodes_mission_clearLightsDragRace_C:_executionStarted() end

--- Cache les afficheurs display_time_i_l/r et display_speed_i_l/r (i de 1 a 5).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:55
function flowgraph_nodes_mission_clearLightsDragRace_C:clearDigits() end

--- Meme initialisation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:76
function flowgraph_nodes_mission_clearLightsDragRace_C:init() end

--- Recherche les objets lumineux dans la scene et les cache tous (setHidden(true)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:18
function flowgraph_nodes_mission_clearLightsDragRace_C:initLights() end

--- Appelle initLights et clearDigits a chaque frame de flux (pas de verification du flux d'entree) et met flow a true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua:81
function flowgraph_nodes_mission_clearLightsDragRace_C:work() end


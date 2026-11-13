---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_mission_knockAwayCheck_C
local flowgraph_nodes_mission_knockAwayCheck_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:35
function flowgraph_nodes_mission_knockAwayCheck_C:_executionStarted() end

--- Termine et libere les marqueurs (scenario/race_marker).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:44
function flowgraph_nodes_mission_knockAwayCheck_C:_executionStopped() end

--- Pour chaque BeamNGVehicle du prefab, enregistre position, rotation et vecteur haut, et ajoute le vehicule au module vehicle du gestionnaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:51
---@param data table donnees du prefab (allChildrenIds)
---@return table  transformations par id de vehicule
function flowgraph_nodes_mission_knockAwayCheck_C:getOriginalVehicleTransforms(data) end

--- data.zOffset=0, positions vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:39
function flowgraph_nodes_mission_knockAwayCheck_C:init() end

--- Dessine sur la minimap un pointeur (bord) ou un cercle pour chaque vehicule non encore renverse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:168
---@param td table donnees de dessin de la minimap
function flowgraph_nodes_mission_knockAwayCheck_C:onDrawOnMinimap(td) end

--- Appele chaque frame de rendu ; dessine les marqueurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:161
---@param dt number delta temps reel
---@param dtSim number delta temps simulation
function flowgraph_nodes_mission_knockAwayCheck_C:onPreRender(dt, dtSim) end

--- Sur reset, reinitialise. A la premiere frame de flux, initialise les compteurs, les points et les marqueurs ; ensuite teste chaque vehicule (inclinaison via dirVecUp, deplacement via pos) et met a jour les compteurs et les marqueurs ; ecrit count, total, points, done, flow.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua:68
function flowgraph_nodes_mission_knockAwayCheck_C:work() end


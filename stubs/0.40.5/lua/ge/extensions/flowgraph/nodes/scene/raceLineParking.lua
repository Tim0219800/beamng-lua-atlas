---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_raceLineParking_C
local flowgraph_nodes_scene_raceLineParking_C = {}

--- Remet stopTimer à nil au démarrage du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:44
function flowgraph_nodes_scene_raceLineParking_C:_executionStarted() end

--- Remet stopTimer à nil à l'arrêt du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:48
function flowgraph_nodes_scene_raceLineParking_C:_executionStopped() end

--- Ne restaure rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:268
---@param res any données sauvegardées
function flowgraph_nodes_scene_raceLineParking_C:_onDeserialized(res) end

--- Ne sauvegarde rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:264
---@param res any table de sauvegarde
function flowgraph_nodes_scene_raceLineParking_C:_onSerialize(res) end

--- Calcule les sorties (dotAngle, forward, sideDistance, forwardDistance, inside, stopping, stoppedPercent, stopped) pour le véhicule suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:151
function flowgraph_nodes_scene_raceLineParking_C:checkParking() end

--- Dessine avec debugDrawer des triangles semi-transparents (boîte de la place, côtés gauche/droit) colorés selon l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:272
function flowgraph_nodes_scene_raceLineParking_C:drawDebug() end

--- Dessine l'aperçu imgui 280x300 : bords de la place (vert/jaune/rouge), contour du véhicule, essieu avant et cercle de progression de l'arrêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:110
function flowgraph_nodes_scene_raceLineParking_C:drawImgui() end

--- Dessine une polyligne 2D dans la ImDrawList courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:90
---@param line any liste de points {x,y}
---@param color any couleur imgui U32 (blanc par défaut)
---@param thickness any épaisseur en pixels
function flowgraph_nodes_scene_raceLineParking_C:drawLine(line, color, thickness) end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:260
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_scene_raceLineParking_C:drawMiddle(builder, style) end

--- Renvoie le centre des deux roues les plus à l'avant, puis les positions de chaque roue (vec3), ou rien si vehicle/pos est nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:236
---@param vehicle any objet véhicule
---@param pos any vec3 (doit être non nil)
function flowgraph_nodes_scene_raceLineParking_C:getVehicleFrontwheelsCenterPosition(vehicle, pos) end

--- Rien à initialiser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:40
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_raceLineParking_C:init(mgr, ...) end

--- Hook de fin de mission : appelle _executionStopped.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:52
function flowgraph_nodes_scene_raceLineParking_C:onClientEndMission() end

--- Convertit une position monde en coordonnées 2D de l'aperçu imgui, relatives à la place.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:77
---@param pos any vec3 monde
function flowgraph_nodes_scene_raceLineParking_C:toInternal2d(pos) end

--- Sur clear, remet les sorties à nil ; sur flow, appelle checkParking, drawDebug et éventuellement drawImgui.
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:58
---@param args any non utilisé
function flowgraph_nodes_scene_raceLineParking_C:work(args) end

--- Convertit une liste de points monde en points 2D de l'aperçu (table réutilisée entre appels).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:101
---@param line any liste de vec3
function flowgraph_nodes_scene_raceLineParking_C:worldLineToMapLine(line) end


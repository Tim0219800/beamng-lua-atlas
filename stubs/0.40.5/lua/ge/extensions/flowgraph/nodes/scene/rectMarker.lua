---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_rectMarker_C
local flowgraph_nodes_scene_rectMarker_C = {}

--- Remet stopTimer à 1 et marque l'état comme changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:91
function flowgraph_nodes_scene_rectMarker_C:_executionStarted() end

--- Appelle clear à l'arrêt du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:96
function flowgraph_nodes_scene_rectMarker_C:_executionStopped() end

--- Ne restaure rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:404
---@param res any données sauvegardées
function flowgraph_nodes_scene_rectMarker_C:_onDeserialized(res) end

--- Ne sauvegarde rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:400
---@param res any table de sauvegarde
function flowgraph_nodes_scene_rectMarker_C:_onSerialize(res) end

--- Teste si les 8 coins de la boîte englobante du véhicule sont dans le trigger, colore les marqueurs et calcule les sorties (inside, partlyInside, distances, arrêt).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:132
function flowgraph_nodes_scene_rectMarker_C:checkParking() end

--- Supprime le trigger et les marqueurs créés et remet l'état à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:66
function flowgraph_nodes_scene_rectMarker_C:clear() end

--- Crée un TSStatic marqueur de coin enregistré sous le nom donné et l'ajoute au MissionGroup.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:240
---@param markerName any nom de l'objet
function flowgraph_nodes_scene_rectMarker_C:createCornerMarker(markerName) end

--- Crée les 4 marqueurs de coin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:266
function flowgraph_nodes_scene_rectMarker_C:createMarkers() end

--- Panneau de propriétés de l'éditeur (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:227
function flowgraph_nodes_scene_rectMarker_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:232
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_scene_rectMarker_C:drawMiddle(builder, style) end

--- Initialise trigger, marqueurs, debug=false et stopTimer=1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:56
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_rectMarker_C:init(mgr, ...) end

--- Crée le BeamNGTrigger (position, scale, rotation) au premier appel, puis le met à jour si les pins changent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:331
function flowgraph_nodes_scene_rectMarker_C:manageTrigger() end

--- Hook de fin de mission : appelle clear.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:100
function flowgraph_nodes_scene_rectMarker_C:onClientEndMission() end

--- Si la place a changé, replace chaque marqueur sur le sol (raycast) en alignant sa normale, ou à plat si staticMarkers.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:273
function flowgraph_nodes_scene_rectMarker_C:updateMarkerPositions() end

--- Sur clear, supprime tout et vide les sorties ; sur flow, gère le trigger, replace les marqueurs et vérifie le stationnement.
---Source : lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:105
---@param args any non utilisé
function flowgraph_nodes_scene_rectMarker_C:work(args) end


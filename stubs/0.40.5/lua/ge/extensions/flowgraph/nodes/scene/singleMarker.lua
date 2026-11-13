---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_singleMarker_C
local flowgraph_nodes_scene_singleMarker_C = {}

--- Après déclenchement : si flow est faux et le marqueur affiché, tente de le cacher.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:61
function flowgraph_nodes_scene_singleMarker_C:_afterTrigger() end

--- Réinitialise le cache de position/rayon.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:73
function flowgraph_nodes_scene_singleMarker_C:_executionStarted() end

--- Cache le marqueur à l'arrêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:67
function flowgraph_nodes_scene_singleMarker_C:_executionStopped() end

--- Vide (non utilisé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:100
function flowgraph_nodes_scene_singleMarker_C:blend() end

--- Appelé à la destruction du noeud : nettoie les objets créés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:148
function flowgraph_nodes_scene_singleMarker_C:destroy() end

--- Lit position (+ data.zOffset sur z), rayon (2 par défaut, 1er composant si table) et couleur ; renvoie true si position ou rayon ont changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:76
function flowgraph_nodes_scene_singleMarker_C:fillFields() end

--- Efface le marqueur (clearMarkers) et l'oublie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:54
function flowgraph_nodes_scene_singleMarker_C:hideMarker() end

--- Initialise l'état ; data.zOffset = 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:36
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_singleMarker_C:init(mgr, ...) end

--- Hook de fin de mission : nettoie les objets créés par le noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:144
function flowgraph_nodes_scene_singleMarker_C:onClientEndMission() end

--- Dessine un cercle avec pointeur de bord sur la minimap tant que le marqueur existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:138
---@param td any données de dessin de la minimap
function flowgraph_nodes_scene_singleMarker_C:onDrawOnMinimap(td) end

--- Propose les types de marqueur comme modèles du pin markerType.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:45
function flowgraph_nodes_scene_singleMarker_C:postInit() end

--- Sur reset, cache le marqueur ; sur flow, crée le marqueur si besoin, le met à jour (setToCheckpoint, couleur, update) et active flow en sortie.
---Source : lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:106
function flowgraph_nodes_scene_singleMarker_C:work() end


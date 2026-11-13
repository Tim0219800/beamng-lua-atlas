---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_particleEmitter_C
local flowgraph_nodes_scene_particleEmitter_C = {}

--- Apres le declenchement : si le flow d'entree est false et que l'emetteur est affiche, tente de le cacher.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:77
function flowgraph_nodes_scene_particleEmitter_C:_afterTrigger() end

--- A l'arret : retire l'objet de l'arbre de l'editeur si possible, le supprime et remet l'etat a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:83
function flowgraph_nodes_scene_particleEmitter_C:_executionStopped() end

--- Cree le ParticleEmitterNode (canSave = false) et l'enregistre sous le nom donne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:33
---@param objectName any nom de l'objet dans la scene
function flowgraph_nodes_scene_particleEmitter_C:createObject(objectName) end

--- Appele a la destruction du noeud : supprime l'emetteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:147
function flowgraph_nodes_scene_particleEmitter_C:destroy() end

--- Lit position/radius/color des pins avec des valeurs par defaut (rayon 2, couleur {1,0,0,0.8}).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:96
function flowgraph_nodes_scene_particleEmitter_C:fillFields() end

--- Cache l'objet (hidden = true) et met shown a false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:69
function flowgraph_nodes_scene_particleEmitter_C:hideObject() end

--- Initialise position, radius, clr, object et shown.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:24
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_particleEmitter_C:init(mgr, ...) end

--- Hook de fin de mission : supprime l'emetteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:142
function flowgraph_nodes_scene_particleEmitter_C:onClientEndMission() end

--- Positionne et met a l'echelle (radius, radius, 50) l'objet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:109
function flowgraph_nodes_scene_particleEmitter_C:setPosition() end

--- Affiche l'objet existant ou le cree (nom particles__<time>_<id>) et l'ajoute a scenetree.MissionGroup.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:49
function flowgraph_nodes_scene_particleEmitter_C:showObject() end

--- Cree/affiche l'emetteur ; sur flow, le montre et le positionne (flow sortie true) ; sur clear, le cache (flow sortie false).
---Source : lua/ge/extensions/flowgraph/nodes/scene/particleEmitter.lua:122
function flowgraph_nodes_scene_particleEmitter_C:work() end


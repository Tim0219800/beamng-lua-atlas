---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_scene_storeStatics_C
local flowgraph_nodes_scene_storeStatics_C = {}

--- Détecte si des objets stockés existent déjà dans la scène.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:224
function flowgraph_nodes_scene_storeStatics_C:_executionStarted() end

--- Supprime les objets sauf s'ils existaient avant le démarrage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:233
function flowgraph_nodes_scene_storeStatics_C:_executionStopped() end

--- Restaure storedObjects et oublie les ids courants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:321
---@param nodeData any données sauvegardées
function flowgraph_nodes_scene_storeStatics_C:_onDeserialized(nodeData) end

--- Sauvegarde storedObjects.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:317
---@param res any table de sauvegarde
function flowgraph_nodes_scene_storeStatics_C:_onSerialize(res) end

--- Supprime tous les objets créés et oublie leurs ids.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:239
function flowgraph_nodes_scene_storeStatics_C:clearObjects() end

--- Crée un TSStatic depuis les données stockées et renvoie son id.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:194
---@param pos any table {x,y,z}
---@param rot any table {x,y,z,w}
---@param scl any table {x,y,z}
---@param shape any chemin de la shape
function flowgraph_nodes_scene_storeStatics_C:createObject(pos, rot, scl, shape) end

--- Supprime les objets sauf s'ils existaient avant le démarrage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:309
function flowgraph_nodes_scene_storeStatics_C:destroy() end

--- Panneau de l'éditeur : liste des objets stockés, boutons Store Selected, Spawn All, Despawn All, Select All, Clear Storage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:33
function flowgraph_nodes_scene_storeStatics_C:drawCustomProperties() end

--- Initialise objets et storedObjects.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:28
---@param mgr any gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_scene_storeStatics_C:init(mgr, ...) end

--- Hook de fin de mission : nettoie les objets créés par le noeud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:305
function flowgraph_nodes_scene_storeStatics_C:onClientEndMission() end

--- Crée tous les objets stockés (si aucun n'existe ou si force).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:265
---@param force any boolean : recrée même s'ils existent
function flowgraph_nodes_scene_storeStatics_C:spawnObjects(force) end

--- Remplace le stockage par les TSStatic donnés (relève leur transformation), supprime les originaux puis les recrée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:145
---@param ids any liste d'ids d'objets de la scène
function flowgraph_nodes_scene_storeStatics_C:updateStoredObjects(ids) end

--- Sur reset, supprime ; sur flow, fait apparaître les objets stockés et active flow en sortie.
---Source : lua/ge/extensions/flowgraph/nodes/scene/storeStatics.lua:292
function flowgraph_nodes_scene_storeStatics_C:work() end


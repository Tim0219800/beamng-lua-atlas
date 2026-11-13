---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_dragRace_setDragVehicle_C
local flowgraph_nodes_gameplay_dragRace_setDragVehicle_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:35
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:_executionStarted() end

--- Restaure mode et count et recrée les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:130
---@param res table Données sauvegardées
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:_onDeserialized(res) end

--- Sauvegarde mode et count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:125
---@param res table Table de sérialisation
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:_onSerialize(res) end

--- Éditeur : champ count et choix de la fonction de fusion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:39
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:drawCustomProperties() end

--- Affiche le mode de fusion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:30
---@param builder any
---@param style any
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:drawMiddle(builder, style) end

--- count = 1, mode = 'first'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:25
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:init() end

--- Ajoute ou supprime les pins par voie pour passer de old à new.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:71
---@param old integer Ancien nombre
---@param new integer Nouveau nombre
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:updatePins(old, new) end

--- Construit la liste {id, isPlayable, dial, lane} et appelle dragBridge.setVehicles.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setDragVehicle.lua:107
function flowgraph_nodes_gameplay_dragRace_setDragVehicle_C:workOnce() end


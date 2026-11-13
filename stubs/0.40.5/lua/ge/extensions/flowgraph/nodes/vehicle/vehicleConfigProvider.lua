---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_vehicleConfigProvider_C
local flowgraph_nodes_vehicle_vehicleConfigProvider_C = {}

--- Restaure modèle, config, chemin, type et noms.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:65
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:_onDeserialized(nodeData) end

--- Sauvegarde modèle, config, chemin, type et noms.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:56
---@param res table Table de sauvegarde à remplir.
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:_onSerialize(res) end

--- Affiche le sélecteur de véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:36
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:drawCustomProperties() end

--- Affichage central vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:42
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle()).
---@param style any Style ImGui de l'éditeur.
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:drawMiddle(builder, style) end

--- Constructeur ; vide les champs modèle/config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:26
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:init() end

--- Écrit le modèle et la config choisis sur les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/vehicleConfigProvider.lua:49
function flowgraph_nodes_vehicle_vehicleConfigProvider_C:work() end


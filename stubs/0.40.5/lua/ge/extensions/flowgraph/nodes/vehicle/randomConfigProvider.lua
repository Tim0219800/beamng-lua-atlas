---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_randomConfigProvider_C
local flowgraph_nodes_vehicle_randomConfigProvider_C = {}

--- Construit la liste `options` des modèles/configs éligibles si elle n'existe pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:46
function flowgraph_nodes_vehicle_randomConfigProvider_C:_executionStarted() end

--- Fonction vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:92
---@param nodeData table Données sauvegardées du nœud.
function flowgraph_nodes_vehicle_randomConfigProvider_C:_onDeserialized(nodeData) end

--- Fonction vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:88
---@param res table Table de sauvegarde à remplir.
function flowgraph_nodes_vehicle_randomConfigProvider_C:_onSerialize(res) end

--- Ne dessine rien ; renvoie nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:34
function flowgraph_nodes_vehicle_randomConfigProvider_C:drawCustomProperties() end

--- Affichage ImGui au centre du nœud dans l'éditeur de flowgraph ; purement visuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:41
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle()).
---@param style any Style ImGui de l'éditeur.
function flowgraph_nodes_vehicle_randomConfigProvider_C:drawMiddle(builder, style) end

--- Constructeur ; initialise les champs modèle/config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:24
function flowgraph_nodes_vehicle_randomConfigProvider_C:init() end

--- Tire un modèle, une config et une peinture au hasard et les écrit sur les sorties.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/randomConfigProvider.lua:74
function flowgraph_nodes_vehicle_randomConfigProvider_C:workOnce() end


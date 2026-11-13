---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_sites_location_C
local flowgraph_nodes_gameplay_sites_location_C = {}

--- Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:118
function flowgraph_nodes_gameplay_sites_location_C:_executionStarted() end

--- Restaure les réglages propres au nœud à partir des données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:156
---@param nodeData table données sauvegardées du nœud
function flowgraph_nodes_gameplay_sites_location_C:_onDeserialized(nodeData) end

--- Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:152
---@param res table table de sérialisation à remplir
function flowgraph_nodes_gameplay_sites_location_C:_onSerialize(res) end

--- Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:69
function flowgraph_nodes_gameplay_sites_location_C:drawCustomProperties() end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:30
---@param mgr table gestionnaire flowgraph
---@param ... any
function flowgraph_nodes_gameplay_sites_location_C:init(mgr, ...) end

--- Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:34
function flowgraph_nodes_gameplay_sites_location_C:postInit() end

--- Reconstruit les pins de sortie dynamiques à partir de la liste d'options du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:38
function flowgraph_nodes_gameplay_sites_location_C:updateKeys() end

--- Quand la location d'entrée change, remplit les sorties (nom, position, infos de route via findClosestRoadInfo, champs personnalisés).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/sites/location.lua:122
---@param args table arguments transmis par le moteur (non utilisés)
function flowgraph_nodes_gameplay_sites_location_C:work(args) end


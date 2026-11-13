---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C
local flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C = {}

--- Appelé à l'arrêt de l'exécution du projet flowgraph ; libère l'état interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:36
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:_executionStopped() end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:22
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:init() end

--- Appelé lors de la réinitialisation du nœud ; remet son état interne à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:32
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:onNodeReset() end

--- Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:26
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:postInit() end

--- Au premier appel, résout le chemin, lit le fichier, génère les données si nécessaire et publie le groupe ; erreur de nœud si le fichier est introuvable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/fileVehicleGroup.lua:40
function flowgraph_nodes_gameplay_traffic_fileVehicleGroup_C:work() end


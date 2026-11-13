---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C
local flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C = {}

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:26
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:_executionStopped() end

--- Restaure aiPath (vide par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:94
---@param nodeData any
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:_onDeserialized(nodeData) end

--- Sauvegarde aiPath dans le projet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:90
---@param res any
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:_onSerialize(res) end

--- Affiche le nombre d'éléments, le chemin de debug, le bouton d'ouverture de ScriptAIManager, le sélecteur d'enregistrement et le bouton de chargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:50
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:drawCustomProperties() end

--- Dessine le chemin stocké avec debugDrawer:drawSquarePrism pour les points proches de la caméra (100 à 200 m).
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:33
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:drawDebugPath() end

--- Affiche le nombre d'éléments du chemin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:85
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:drawMiddle(builder, style) end

--- Initialise un chemin vide et l'identifiant « Select... ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:21
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:init() end

--- Publie {path = self.aiPath} sur la sortie path.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathStored.lua:81
function flowgraph_nodes_vehicle_ai_scriptAI_pathStored_C:work() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C
local flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C = {}

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:30
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:_executionStopped() end

--- Restaure le nom de fichier et recalcule le nom court.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:72
---@param nodeData any
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:_onDeserialized(nodeData) end

--- Sauvegarde le nom de fichier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:68
---@param res any
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:_onSerialize(res) end

--- Dessine le bouton « Refresh Files » et la liste déroulante des fichiers de piste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:33
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:drawCustomProperties() end

--- Affiche le nom court du fichier et son état de chargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:62
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:drawMiddle(builder, style) end

--- Liste les fichiers de piste (FS:findFiles) et initialise nom et fichier chargé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:23
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:init() end

--- Charge le fichier avec jsonReadFile s'il ne l'est pas encore et publie loadedFile.recording sur path.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua:54
function flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile_C:work() end


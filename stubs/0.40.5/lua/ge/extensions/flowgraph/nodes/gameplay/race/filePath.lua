---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_race_filePath_C
local flowgraph_nodes_gameplay_race_filePath_C = {}

--- Oublie le chemin chargé à l'arrêt du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:64
function flowgraph_nodes_gameplay_race_filePath_C:_executionStopped() end

--- Panneau de propriétés de l'éditeur : bouton d'ouverture du Race Editor, nom du fichier ouvert et bouton « Hardcode to File Pin ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:42
function flowgraph_nodes_gameplay_race_filePath_C:drawCustomProperties() end

--- Initialise self.path à nil et désactive clearOutPinsOnStart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:31
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_race_filePath_C:init(mgr, ...) end

--- Oublie le chemin chargé (self.path = nil) pour forcer un rechargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:60
function flowgraph_nodes_gameplay_race_filePath_C:onNodeReset() end

--- Restreint le sélecteur de fichier de la pin 'file' aux fichiers « Race Files » (.race.json).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:36
function flowgraph_nodes_gameplay_race_filePath_C:postInit() end

--- Charge le fichier de course s'il ne l'est pas encore, applique reverse/autoConfig et remplit toutes les pins de sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:68
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_race_filePath_C:work(args) end


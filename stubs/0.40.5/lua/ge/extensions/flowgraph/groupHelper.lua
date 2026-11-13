---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/groupHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur ; garde le manager dans self.mgr.
---@class flowgraph_groupHelper
local flowgraph_groupHelper = {}

--- Centre moveNodes sur le centre du rectangle englobant fixNodes.
---Source : lua/ge/extensions/flowgraph/groupHelper.lua:59
---@param fixNodes table[] nœuds de référence
---@param moveNodes table[] nœuds à déplacer
function flowgraph_groupHelper:centerMultiNodes(fixNodes, moveNodes) end

--- Replace un ensemble de nœuds autour d'une position en conservant leurs positions relatives (alignement sur la grille).
---Source : lua/ge/extensions/flowgraph/groupHelper.lua:39
---@param nodes table[] nœuds à déplacer
---@param pos number[] {x, y} centre cible
function flowgraph_groupHelper:centerNodes(nodes, pos) end

--- Groupe la sélection : groupStateNodes dans un graphe d'états, sinon groupFlowNodes.
---Source : lua/ge/extensions/flowgraph/groupHelper.lua:93
---@return table|nil  résultat du groupage
function flowgraph_groupHelper:createGroupingFromSelection() end

--- Calcule le rectangle englobant des nœuds et son centre.
---Source : lua/ge/extensions/flowgraph/groupHelper.lua:13
---@param nodes table[] nœuds
---@return number[]  {minX, minY, maxX, maxY}
---@return number[]  {centreX, centreY}
function flowgraph_groupHelper:getRectCenter(nodes) end

--- Clone la sélection dans un nouveau sous-graphe ou sous-macro, copie les variables du graphe, recrée les liens internes et remplace la sélection par un nœud macro/integrated relié aux liens entrants et sortants.
---Source : lua/ge/extensions/flowgraph/groupHelper.lua:172
---@return table  nœud integrated créé
function flowgraph_groupHelper:groupFlowNodes() end

--- Déplace les nœuds d'état sélectionnés (sauf entrée et sortie) dans un nouveau graphe d'état 'new group' et reconnecte les liens entrants et sortants via le nœud de groupe.
---Source : lua/ge/extensions/flowgraph/groupHelper.lua:101
function flowgraph_groupHelper:groupStateNodes() end

--- Mémorise le manager.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/groupHelper.lua:9
---@param mgr table manager flowgraph
function flowgraph_groupHelper:init(mgr) end

--- Dégroupe la sélection : ungroupStateNode dans un graphe d'états, sinon ungroupFlowNode (inexistante, voir notes).
---Source : lua/ge/extensions/flowgraph/groupHelper.lua:415
function flowgraph_groupHelper:ungroupSelection() end

--- Remonte les nœuds internes (hors entrée/sortie) d'un état de groupe sélectionné dans le graphe courant et rétablit les liens.
---Source : lua/ge/extensions/flowgraph/groupHelper.lua:423
function flowgraph_groupHelper:ungroupStateNode() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_garageComputerUtil_C
local flowgraph_nodes_career_garageComputerUtil_C = {}

--- Crée la table de drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:28
function flowgraph_nodes_career_garageComputerUtil_C:init() end

--- Hook : tuning appliqué.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:55
function flowgraph_nodes_career_garageComputerUtil_C:onCareerTuningApplied() end

--- Hook : tuning commencé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:51
function flowgraph_nodes_career_garageComputerUtil_C:onCareerTuningStarted() end

--- Hook : menu de l'ordinateur du garage ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:47
function flowgraph_nodes_career_garageComputerUtil_C:onComputerMenuOpened() end

--- Hook : pièce installée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:63
---@param data table données de la pièce (non utilisées)
function flowgraph_nodes_career_garageComputerUtil_C:onPartShoppingPartInstalled(data) end

--- Hook : achat de pièces ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:59
function flowgraph_nodes_career_garageComputerUtil_C:onPartShoppingStarted() end

--- Hook : transaction d'achat terminée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:67
function flowgraph_nodes_career_garageComputerUtil_C:onPartShoppingTransactionComplete() end

--- Chaque frame : met toutes les sorties à faux, applique les drapeaux reçus puis les efface.
---Source : lua/ge/extensions/flowgraph/nodes/career/garageComputerUtil.lua:33
---@param args any non utilisé
function flowgraph_nodes_career_garageComputerUtil_C:work(args) end


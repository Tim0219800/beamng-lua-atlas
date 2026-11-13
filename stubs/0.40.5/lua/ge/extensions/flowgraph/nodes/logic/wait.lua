---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/wait.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_wait_C
local flowgraph_nodes_logic_wait_C = {}

--- Remet timer et running a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/wait.lua:32
function flowgraph_nodes_logic_wait_C:_executionStarted() end

--- Migre l'ancien champ 'duration' vers le pin code en dur 'duration'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/wait.lua:37
---@param res any
function flowgraph_nodes_logic_wait_C:_onDeserialized(res) end

--- Barre de progression et bouton Reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/wait.lua:53
---@param builder any
---@param style any
function flowgraph_nodes_logic_wait_C:drawMiddle(builder, style) end

--- timer=0, running=false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/wait.lua:27
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_wait_C:init(mgr, ...) end

--- Si en cours, ajoute dtSim ou dtReal au timer ; a la fin arrete et emet l'impulsion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/wait.lua:44
function flowgraph_nodes_logic_wait_C:updateTimer() end

--- Gere flux/reset, appelle updateTimer ; flow = (timer >= duration) ET flux d'entree.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/wait.lua:64
---@param args any non utilise
function flowgraph_nodes_logic_wait_C:work(args) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/accumulator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_math_accumulator_C
local flowgraph_nodes_math_accumulator_C = {}

--- Remet la somme a resetValue et met a jour result.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:29
function flowgraph_nodes_math_accumulator_C:_executionStarted() end

--- Remet la somme a resetValue et met a jour result.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:34
function flowgraph_nodes_math_accumulator_C:_executionStopped() end

--- Remet la somme a resetValue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:56
function flowgraph_nodes_math_accumulator_C:_onDeserialized() end

--- Affiche la somme courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:60
---@param builder any
---@param style any
function flowgraph_nodes_math_accumulator_C:drawMiddle(builder, style) end

--- currentSum=0, resetValue=0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:24
function flowgraph_nodes_math_accumulator_C:init() end

--- Applique reset, puis ajoute value si add est actif (changed=true), ecrit result.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/accumulator.lua:39
function flowgraph_nodes_math_accumulator_C:work() end


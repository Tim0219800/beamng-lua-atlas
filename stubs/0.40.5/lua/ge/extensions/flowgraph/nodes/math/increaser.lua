---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/increaser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_math_increaser_C
local flowgraph_nodes_math_increaser_C = {}

--- Remet currentValue a resetValue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/increaser.lua:36
function flowgraph_nodes_math_increaser_C:_executionStopped() end

--- Affiche la valeur courante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/increaser.lua:60
---@param builder any
---@param style any
function flowgraph_nodes_math_increaser_C:drawMiddle(builder, style) end

--- currentValue=0, resetValue=0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/increaser.lua:31
function flowgraph_nodes_math_increaser_C:init() end

--- Applique clear, met a jour le maximum, ecrit result ; flow suit l'entree flow.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/increaser.lua:40
function flowgraph_nodes_math_increaser_C:work() end


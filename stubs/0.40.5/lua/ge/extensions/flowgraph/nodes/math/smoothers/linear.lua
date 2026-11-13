---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_math_smoothers_linear_C
local flowgraph_nodes_math_smoothers_linear_C = {}

--- Cree le lisseur (newTemporalSmoothing).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:31
function flowgraph_nodes_math_smoothers_linear_C:_executionStarted() end

--- Si 'set' a change, force l'etat du lisseur a cette valeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:36
function flowgraph_nodes_math_smoothers_linear_C:checkSetValue() end

--- Affiche l'etat du lisseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:63
---@param builder any
---@param style any
function flowgraph_nodes_math_smoothers_linear_C:drawMiddle(builder, style) end

--- Met C.oldSet=0 (au niveau de la classe).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:26
function flowgraph_nodes_math_smoothers_linear_C:init() end

--- Sans entree, sort l'etat courant ; sinon choisit le taux (upRate/downRate, defaut 1) et sort smoother:getWithRateUncapped(sample, dt, rate).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/linear.lua:44
function flowgraph_nodes_math_smoothers_linear_C:work() end


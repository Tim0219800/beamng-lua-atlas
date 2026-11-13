---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_math_smoothers_sigmoid_C
local flowgraph_nodes_math_smoothers_sigmoid_C = {}

--- Si 'set' a change, force l'etat du lisseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.lua:36
function flowgraph_nodes_math_smoothers_sigmoid_C:checkSetValue() end

--- Affiche l'etat du lisseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.lua:69
---@param builder any
---@param style any
function flowgraph_nodes_math_smoothers_sigmoid_C:drawMiddle(builder, style) end

--- Met C.oldSet=0 et C.smoother (au niveau de la classe).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.lua:30
function flowgraph_nodes_math_smoothers_sigmoid_C:init() end

--- Sans entree, sort l'etat ; sinon choisit limit/start/stop selon le sens (defaut 1) et sort smoother:getWithRateAccel(sample, dt, limit, start, stop).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/sigmoid.lua:44
function flowgraph_nodes_math_smoothers_sigmoid_C:work() end


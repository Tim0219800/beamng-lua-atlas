---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_math_smoothers_spring_C
local flowgraph_nodes_math_smoothers_spring_C = {}

--- Si 'set' a change, force l'etat du lisseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua:34
function flowgraph_nodes_math_smoothers_spring_C:checkSetValue() end

--- Affiche l'etat du lisseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua:64
---@param builder any
---@param style any
function flowgraph_nodes_math_smoothers_spring_C:drawMiddle(builder, style) end

--- Met C.oldSet=0 et C.smoother (classe) via newTemporalSigmoidSmoothing().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua:28
function flowgraph_nodes_math_smoothers_spring_C:init() end

--- Sans entree, sort l'etat ; sinon appelle smoother:getWithSpringDamp(sample, dt, spring, damp).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/smoothers/spring.lua:42
function flowgraph_nodes_math_smoothers_spring_C:work() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/math/ease.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_math_ease_C
local flowgraph_nodes_math_ease_C = {}

--- Relit easeFuncName et la fonction associee.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/ease.lua:88
---@param nodeData any
function flowgraph_nodes_math_ease_C:_onDeserialized(nodeData) end

--- Sauvegarde easeFuncName.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/ease.lua:84
---@param res any
function flowgraph_nodes_math_ease_C:_onSerialize(res) end

--- Liste deroulante des fonctions d'easing.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/ease.lua:69
function flowgraph_nodes_math_ease_C:drawCustomProperties() end

--- Affiche le nom de la fonction.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/ease.lua:102
---@param builder any
---@param style any
function flowgraph_nodes_math_ease_C:drawMiddle(builder, style) end

--- Fonction par defaut : linear.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/ease.lua:63
function flowgraph_nodes_math_ease_C:init() end

--- Si l'entree n'est pas nil/false, ecrit easeFunc(value) sur la sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/math/ease.lua:96
function flowgraph_nodes_math_ease_C:work() end


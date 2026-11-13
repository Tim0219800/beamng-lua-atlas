---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_states_transitionStack_C
local flowgraph_nodes_states_transitionStack_C = {}

--- Oublie la pile à l'arrêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:47
function flowgraph_nodes_states_transitionStack_C:_executionStopped() end

--- Prépare les modèles de pins si besoin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:90
function flowgraph_nodes_states_transitionStack_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:98
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_states_transitionStack_C:drawMiddle(builder, style) end

--- Libère le cache de modèles de pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:94
function flowgraph_nodes_states_transitionStack_C:hideProperties() end

--- savePins = true, allowCustomOutPins = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:37
function flowgraph_nodes_states_transitionStack_C:init() end

--- Construit les modèles de pins comme le noeud transition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:60
function flowgraph_nodes_states_transitionStack_C:makePinTemplates() end

--- Hook : à l'entrée dans l'état, mémorise state.transitionStack.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:42
---@param state any objet état démarré
function flowgraph_nodes_states_transitionStack_C:onStateStarted(state) end

--- Copie _stack[nom] sur chaque pin de sortie et recopie flow.
---Source : lua/ge/extensions/flowgraph/nodes/states/transitionStack.lua:51
function flowgraph_nodes_states_transitionStack_C:work() end


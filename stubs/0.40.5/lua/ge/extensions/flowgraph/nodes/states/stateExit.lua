---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/states/stateExit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_states_stateExit_C
local flowgraph_nodes_states_stateExit_C = {}

--- Restaure transitionName ('' par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:69
---@param data any données sauvegardées
function flowgraph_nodes_states_stateExit_C:_onDeserialized(data) end

--- Sauvegarde transitionName.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:65
---@param res any table de sauvegarde
function flowgraph_nodes_states_stateExit_C:_onSerialize(res) end

--- Liste déroulante « Transition Name » construite à partir des noms de transition du noeud état parent qui cible ce graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:30
function flowgraph_nodes_states_stateExit_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:59
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_states_stateExit_C:drawMiddle(builder, style) end

--- autoStart = false, savePins = true, transitionName = ''.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/stateExit.lua:24
---@param mgr any gestionnaire flowgraph
function flowgraph_nodes_states_stateExit_C:init(mgr) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/states/transition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_states_transition_C
local flowgraph_nodes_states_transition_C = {}

--- Restaure transitionName ('success' par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transition.lua:122
---@param data any données sauvegardées
function flowgraph_nodes_states_transition_C:_onDeserialized(data) end

--- Sauvegarde transitionName.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transition.lua:118
---@param res any table de sauvegarde
function flowgraph_nodes_states_transition_C:_onSerialize(res) end

--- Ajoute au menu contextuel « Go to target... » listant les graphes cibles de cette transition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transition.lua:126
function flowgraph_nodes_states_transition_C:customContextMenu() end

--- Liste déroulante « Transition Name » basée sur le noeud état parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transition.lua:72
function flowgraph_nodes_states_transition_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transition.lua:112
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_states_transition_C:drawMiddle(builder, style) end

--- Libère le cache de modèles de pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transition.lua:91
function flowgraph_nodes_states_transition_C:hideProperties() end

--- savePins = true, allowCustomInPins = true, transitionName = 'success'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transition.lua:36
function flowgraph_nodes_states_transition_C:init() end

--- Construit les modèles de pins (nom/type) à partir des autres noeuds transition et transitionStack du projet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/states/transition.lua:42
function flowgraph_nodes_states_transition_C:makePinTemplates() end

--- Si flow, déclenche la transition avec les données des pins (nil s'il n'y en a pas).
---Source : lua/ge/extensions/flowgraph/nodes/states/transition.lua:97
function flowgraph_nodes_states_transition_C:work() end


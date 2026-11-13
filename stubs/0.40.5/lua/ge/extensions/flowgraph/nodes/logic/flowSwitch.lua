---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_flowSwitch_C
local flowgraph_nodes_logic_flowSwitch_C = {}

--- Restaure l'etat sauvegarde (storedOn).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:46
function flowgraph_nodes_logic_flowSwitch_C:_executionStarted() end

--- Restaure l'etat sauvegarde (storedOn).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:42
function flowgraph_nodes_logic_flowSwitch_C:_executionStopped() end

--- Relit storedOn depuis le champ 'on'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:54
---@param nodeData any
function flowgraph_nodes_logic_flowSwitch_C:_onDeserialized(nodeData) end

--- Sauvegarde storedOn dans le champ 'on'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:50
---@param res any
function flowgraph_nodes_logic_flowSwitch_C:_onSerialize(res) end

--- Dessine une case a cocher cliquable ; un clic bascule l'etat et, si l'edition est autorisee, memorise storedOn.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:30
---@param builder any
---@param style any
function flowgraph_nodes_logic_flowSwitch_C:drawMiddle(builder, style) end

--- Etat initial : off.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:26
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_flowSwitch_C:init(mgr, ...) end

--- Si 'on' a du flux, passe a ON ; si 'off' a du flux, passe a OFF (off l'emporte si les deux). Sortie flow = etat ET flux d'entree.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/flowSwitch.lua:58
---@param args any non utilise
function flowgraph_nodes_logic_flowSwitch_C:work(args) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_thread_sendMessage_C
local flowgraph_nodes_thread_sendMessage_C = {}

--- done = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua:71
function flowgraph_nodes_thread_sendMessage_C:_executionStarted() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua:75
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_thread_sendMessage_C:drawMiddle(builder, style) end

--- savePins = true, allowCustomInPins = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua:41
function flowgraph_nodes_thread_sendMessage_C:init() end

--- Sur reset, done = false ; sinon, au flow avec un id, assemble les pins non fixes en table et envoie le message, puis recopie flow.
---Source : lua/ge/extensions/flowgraph/nodes/thread/sendMessage.lua:47
function flowgraph_nodes_thread_sendMessage_C:work() end


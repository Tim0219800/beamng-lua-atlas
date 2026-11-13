---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_thread_receiveMessage_C
local flowgraph_nodes_thread_receiveMessage_C = {}

--- done = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:74
function flowgraph_nodes_thread_receiveMessage_C:_executionStarted() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:78
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_thread_receiveMessage_C:drawMiddle(builder, style) end

--- savePins = true, allowCustomOutPins = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:42
function flowgraph_nodes_thread_receiveMessage_C:init() end

--- Hook : mémorise le message reçu s'il n'a pas déjà été traité (done = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:47
---@param message any table du message
function flowgraph_nodes_thread_receiveMessage_C:onThreadMessageProcess(message) end

--- Sur reset, remet à zéro ; sinon, si un message est en attente et name est donné, copie ses champs sur les pins, active receiving et received.
---Source : lua/ge/extensions/flowgraph/nodes/thread/receiveMessage.lua:55
function flowgraph_nodes_thread_receiveMessage_C:work() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/message.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_message_C
local flowgraph_nodes_ui_message_C = {}

--- Remet le minuteur à 0 si le flux d'entrée est coupé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/message.lua:41
function flowgraph_nodes_ui_message_C:_afterTrigger() end

--- Remet le minuteur à 0 et prépare la catégorie par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/message.lua:28
function flowgraph_nodes_ui_message_C:_executionStarted() end

--- Efface le message affiché.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/message.lua:33
function flowgraph_nodes_ui_message_C:_executionStopped() end

--- Bouton « Open Icons overview ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/message.lua:47
function flowgraph_nodes_ui_message_C:drawCustomProperties() end

--- Renvoie périodiquement le message à l'UI et propage le flux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/message.lua:55
function flowgraph_nodes_ui_message_C:work() end


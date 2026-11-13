---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/debug/log.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_debug_log_C
local flowgraph_nodes_debug_log_C = {}

--- Convertit la valeur en texte (dumps pour une table), appelle log(type, tag, msg) et mgr:logEvent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/log.lua:49
function flowgraph_nodes_debug_log_C:createLogEntry() end

--- Éditeur : affiche ('type','tag',...).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/log.lua:58
---@param builder table constructeur de nœud
---@param style table style
function flowgraph_nodes_debug_log_C:drawMiddle(builder, style) end

--- Prépare les modèles du pin logType, masque logType et logTag, et fixe le tag par défaut « Node #id ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/debug/log.lua:25
function flowgraph_nodes_debug_log_C:postInit() end

--- Si dynamicMode vaut 'repeat', écrit une entrée de log.
---Source : lua/ge/extensions/flowgraph/nodes/debug/log.lua:43
function flowgraph_nodes_debug_log_C:work() end

--- Écrit une entrée de log.
---Source : lua/ge/extensions/flowgraph/nodes/debug/log.lua:39
function flowgraph_nodes_debug_log_C:workOnce() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_events_onBeamNGTrigger_C
local flowgraph_nodes_events_onBeamNGTrigger_C = {}

--- Affiche le filtre actif dans le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua:65
---@param builder any
---@param style any
function flowgraph_nodes_events_onBeamNGTrigger_C:drawMiddle(builder, style) end

--- Initialise data.filterName = "" et les drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua:32
---@param mgr table Gestionnaire du flowgraph
---@param ... any
function flowgraph_nodes_events_onBeamNGTrigger_C:init(mgr, ...) end

--- Hook appelé par le moteur à chaque événement de BeamNGTrigger. Ignore l'événement si le nom ne correspond pas au filtre, remplit les pins de sortie, lève enterFlag/exitFlag et déclenche le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua:38
---@param data table Champs utilisés : subjectID, subjectName, triggerID, triggerName, event ('enter' ou 'exit')
function flowgraph_nodes_events_onBeamNGTrigger_C:onBeamNGTrigger(data) end

--- Copie enterFlag/exitFlag vers les pins enter/exit puis les remet à false.
---Source : lua/ge/extensions/flowgraph/nodes/events/onBeamNGTrigger.lua:57
---@param args table Arguments du flowgraph
function flowgraph_nodes_events_onBeamNGTrigger_C:work(args) end


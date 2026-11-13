---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/events.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre Event Log (windowName = 'fg_events').
---@class editor_flowgraph_events_C
local editor_flowgraph_events_C = {}

--- Désérialisation (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/events.lua:151
---@param data table Données.
function editor_flowgraph_events_C:_onDeserialized(data) end

--- Sérialisation (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/events.lua:147
---@param data table Données.
function editor_flowgraph_events_C:_onSerialize(data) end

--- Associe le manager flowgraph.
---Source : lua/ge/extensions/editor/flowgraph/events.lua:17
---@param mgr table Manager flowgraph.
function editor_flowgraph_events_C:attach(mgr) end

--- Dessine la fenêtre « Event Log » si elle est visible.
---Source : lua/ge/extensions/editor/flowgraph/events.lua:116
function editor_flowgraph_events_C:draw() end

--- Dessine les contrôles (Hide Duplicates, Time Format, Auto Scroll) et la liste à colonnes des évènements.
---Source : lua/ge/extensions/editor/flowgraph/events.lua:29
function editor_flowgraph_events_C:drawContent() end

--- Gère l'infobulle et le double-clic d'une entrée ayant des métadonnées (nœud ou graphe) : sélectionne le graphe et centre la vue.
---Source : lua/ge/extensions/editor/flowgraph/events.lua:123
---@param e table Évènement avec e.meta {type = 'node'|'graph', node/graph}.
function editor_flowgraph_events_C:handleMeta(e) end

--- Enregistre la fenêtre éditeur (150x300).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/events.lua:21
function editor_flowgraph_events_C:init() end


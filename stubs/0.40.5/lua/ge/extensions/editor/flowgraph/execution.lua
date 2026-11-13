---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/execution.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de la fenêtre Task Manager (windowName = 'fg_execution').
---@class editor_flowgraph_execution_C
local editor_flowgraph_execution_C = {}

--- Dessine le contenu : en-tête Projects, boutons Start All / Stop All, puis chaque projet.
---Source : lua/ge/extensions/editor/flowgraph/execution.lua:132
function editor_flowgraph_execution_C:ExecutionView() end

--- Dessine la fenêtre si elle est visible.
---Source : lua/ge/extensions/editor/flowgraph/execution.lua:189
function editor_flowgraph_execution_C:draw() end

--- Affiche la fenêtre hors du contexte d'un projet (self.mgr = nil).
---Source : lua/ge/extensions/editor/flowgraph/execution.lua:181
function editor_flowgraph_execution_C:drawAlone() end

--- Dessine la ligne d'un projet : icône d'état, visibilité, transitoire, nom et boutons.
---Source : lua/ge/extensions/editor/flowgraph/execution.lua:22
---@param mgr table Manager flowgraph.
function editor_flowgraph_execution_C:drawManager(mgr) end

--- Récupère core_flowgraphManager et enregistre la fenêtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/flowgraph/execution.lua:16
function editor_flowgraph_execution_C:init() end


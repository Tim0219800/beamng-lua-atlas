---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_setUILayout_C
local flowgraph_nodes_ui_setUILayout_C = {}

--- Sets active according to the input flow (name without underscore: probably never called).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:63
function flowgraph_nodes_ui_setUILayout_C:afterTrigger() end

--- Empty central area.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:59
---@param builder any Editor node builder (builder:Middle() opens the central area).
---@param style any Node display style provided by the editor.
function flowgraph_nodes_ui_setUILayout_C:drawMiddle(builder, style) end

--- useFreeroamMenuWhenUnrestricted = true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:29
function flowgraph_nodes_ui_setUILayout_C:init() end

--- Hook: reapplies the layout after the level starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:87
function flowgraph_nodes_ui_setUILayout_C:onClientPostStartMission() end

--- Hook: UI state change (cur, prev); in 'quickraceScenario' mode in the menu, triggers setQuickRaceMode and HotlappingResetApp.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:96
---@param cur string Current UI state.
---@param prev string Previous UI state.
function flowgraph_nodes_ui_setUILayout_C:onUiChangedState(cur, prev) end

--- Fills the layout, menu and appContainerContext templates.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:33
function flowgraph_nodes_ui_setUILayout_C:postInit() end

--- Applies the game state (layout/menu) and displays the requested container app.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/setUILayout.lua:71
function flowgraph_nodes_ui_setUILayout_C:workOnce() end


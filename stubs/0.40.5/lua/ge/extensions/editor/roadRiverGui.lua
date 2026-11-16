---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadRiverGui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UI elements shared by the road (DecalRoad) and river editors: highlight color palette (hover, selection, nodes, duplication...), node size factor, and the "Add Road/Nodes" toolbar button that activates creation mode. Used notably by editor_roadEditor.
--- Access: extension `editor_roadRiverGui`: `extensions.load("editor_roadRiverGui")`, then the global `editor_roadRiverGui`
---@class editor_roadRiverGui
---@field highlightColors table<string, ColorF> Highlight colors: hover, lightHover, hoverSelectNotAllowed, lightHoverSelectNotAllowed, selected, darkSelected, duplicated, nearby, cursor, createModeCursor, selectedNode, hoveredNode, node, nodeTransparent.
---@field nodeSizeFactor number Node display size factor (0.012).
editor_roadRiverGui = {}

--- Draws in the toolbar the "Add Road/Nodes" icon button (tooltip included), toggles the button state on click and updates M.createMode (button active or Alt pressed). Called by the road or river editor UI.
---Source: lua/ge/extensions/editor/roadRiverGui.lua:36
function editor_roadRiverGui.editModeToolbar() end


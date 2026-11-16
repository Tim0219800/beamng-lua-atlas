# `editor_roadRiverGui`

*File: `lua/ge/extensions/editor/roadRiverGui.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadRiverGui`: `extensions.load("editor_roadRiverGui")`, then the global `editor_roadRiverGui`

UI elements shared by the road (DecalRoad) and river editors: highlight color palette (hover, selection, nodes, duplication...), node size factor, and the "Add Road/Nodes" toolbar button that activates creation mode. Used notably by editor_roadEditor.

## Notes

- editModeToolbar reads M.isRoad (true = "Road", otherwise "River") and writes M.createMode; these two fields are not defined by this file, they must be set by the calling editor.
- Creation mode is active if the button has been activated OR if the Alt key is pressed (editor.keyModifiers.alt).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadRiverGui.editModeToolbar()` | Draws in the toolbar the "Add Road/Nodes" icon button (tooltip included), toggles the button state on click and updates M.createMode (button active or Alt pressed). Called by the road or river editor UI. | 36 |

## Fields

| Field | Type | Description |
|---|---|---|
| `highlightColors` | table<string, ColorF> | Highlight colors: hover, lightHover, hoverSelectNotAllowed, lightHoverSelectNotAllowed, selected, darkSelected, duplicated, nearby, cursor, createModeCursor, selectedNode, hoveredNode, node, nodeTransparent. |
| `nodeSizeFactor` | number | Node display size factor (0.012). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadRiverGui.lua`.*

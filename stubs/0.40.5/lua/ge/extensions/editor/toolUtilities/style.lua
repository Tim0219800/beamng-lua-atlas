---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/style.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Style settings of the editor's spline tools: 3D colors (cursor, nodes, junctions, splines, handles, preview wires) for debug drawing, and ImGui color palettes per theme. The available themes are blueRose, vapourStatic, canyonClay, terminalAurora, summerOfLove, deerPark, dreamMachine, headlights, crystal (default) and neoIndustrial.
--- Access: extension `editor_toolUtilities_style`: `extensions.load("editor_toolUtilities_style")`, then the global `editor_toolUtilities_style`
---@class editor_toolUtilities_style
editor_toolUtilities_style = {}

--- Returns the ImGui color palette of the requested theme.
---Source: lua/ge/extensions/editor/toolUtilities/style.lua:379
---@param theme string|nil Theme name (see module); 'crystal' by default.
---@return table  Palette of named colors (ImVec4).
function editor_toolUtilities_style.getImguiCols(theme) end

--- Returns the interface style properties: colors of cursor, nodes, junctions, splines (selected, faded, linked), handles, preview wires, and a few ImVec4 (greenD, blueB, blueD, redB, yellowB).
---Source: lua/ge/extensions/editor/toolUtilities/style.lua:14
---@return table  Table of named colors.
function editor_toolUtilities_style.getStyle() end


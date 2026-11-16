---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundPanel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- imgui panel of the shared terraforming settings (groundPass), drawn identically in the Terrain tab of each editor tool. It reads and writes groundPass.params (sliders with a reset-to-default button, checkboxes).
--- Access: extension `editor_toolUtilities_groundPanel`: `extensions.load("editor_toolUtilities_groundPanel")`, then the global `editor_toolUtilities_groundPanel`
---@class editor_toolUtilities_groundPanel
editor_toolUtilities_groundPanel = {}

--- Draws the Terraform checkbox (unchecked: restores the terrain) and, if checked, the sliders for blend, margin, falloff, smoothing, roughness, scale and bridge abutments.
---Source: lua/ge/extensions/editor/toolUtilities/groundPanel.lua:49
function editor_toolUtilities_groundPanel.draw() end

--- Draws the 'Networks:' row with the Roads and Rail checkboxes (networks covered by Build).
---Source: lua/ge/extensions/editor/toolUtilities/groundPanel.lua:41
function editor_toolUtilities_groundPanel.drawNetworks() end

--- Draws a row label (green text with tooltip) and places the imgui cursor at 90 px so that the following checkboxes sit on the same line.
---Source: lua/ge/extensions/editor/toolUtilities/groundPanel.lua:28
---@param text string Label text.
---@param tip string Tooltip.
function editor_toolUtilities_groundPanel.rowLabel(text, tip) end


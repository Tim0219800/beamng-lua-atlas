---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/regionStyles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road marking paint style for a region. For now only one region is defined: USA (right-hand traffic). Provides the materials and widths of center, lane, edge, stop and give-way lines, as well as of the hatched separation zone.
--- Access: extension `editor_toolUtilities_regionStyles`: `extensions.load("editor_toolUtilities_regionStyles")`, then the global `editor_toolUtilities_regionStyles`
---@class editor_toolUtilities_regionStyles
editor_toolUtilities_regionStyles = {}

--- Returns the marking style table of the current region (always USA): centerLineMaterial, centerLineWidthM, centerLineTexLen, laneLineMaterial, edgeLineMaterial, leftEdgeLineMaterial, stopLineMaterial, giveWayMaterial, stopLineWidthM, giveWayWidthM, goreSepMaterial, goreSepTexLen.
---Source: lua/ge/extensions/editor/toolUtilities/regionStyles.lua:25
---@return table  Style table (materials as strings, widths and texture lengths in meters).
function editor_toolUtilities_regionStyles.getRegion() end


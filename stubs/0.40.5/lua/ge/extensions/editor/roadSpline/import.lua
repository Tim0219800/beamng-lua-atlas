---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import of existing DecalRoads into the Road Spline tool. Estimates a reference centerline (nodes, widths, normals) from the chosen roads by searching for their edges (exponential search then bisection, up to 50 m laterally), simplifies it with RDP, creates a new Road Spline group "Import N" and recreates the original roads as layers relative to that line. The source DecalRoads are then deleted (undo possible).
--- Access: extension `editor_roadSpline_import`: `extensions.load("editor_roadSpline_import")`, then the global `editor_roadSpline_import`
---@class editor_roadSpline_import
editor_roadSpline_import = {}

--- Imports all DecalRoads with at least one node inside the polygon, then calls importSelectedIntoNewGroup with them.
---Source: lua/ge/extensions/editor/roadSpline/import.lua:425
---@param polygon table Selection polygon (list of points) drawn by the user.
function editor_roadSpline_import.importFromPolygon(polygon) end

--- Converts the given DecalRoads into a new Road Spline group: computes the reference spline, creates the group, generates the layers, deletes the DecalRoads (and their scene groups that became empty) and records an undo action. Returns without doing anything if the list is empty.
---Source: lua/ge/extensions/editor/roadSpline/import.lua:351
---@param decalRoads table List of DecalRoad objects (scenetree), e.g. the editor selection.
function editor_roadSpline_import.importSelectedIntoNewGroup(decalRoads) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import of existing DecalRoads into a new Hero Road group. From a selection of DecalRoads (or a selection polygon), the module estimates a reference centerline (middle of the left/right edges found by exponential search then bisection starting from the longest road), creates an 'Import N' group with these simplified (RDP) nodes and turns each DecalRoad into a layer (material, render priority, width, normalized lateral position, flip, fades). The used DecalRoads are deleted, with an undo/redo commit.
--- Access: extension `editor_heroRoadEditor_import`: `extensions.load("editor_heroRoadEditor_import")`, then the global `editor_heroRoadEditor_import`
---@class editor_heroRoadEditor_import
editor_heroRoadEditor_import = {}

--- Finds all DecalRoads with at least one node inside the polygon, then calls importSelectedIntoNewGroup with them.
---Source: lua/ge/extensions/editor/heroRoadEditor/import.lua:426
---@param polygon table Selection polygon (list of points) accepted by vec3:inPolygon.
function editor_heroRoadEditor_import.importFromPolygon(polygon) end

--- Imports the given DecalRoads into a new Hero Road group: computes the reference spline, creates the group, generates the layers, deletes the DecalRoads (and their parent groups that became empty) and records the 'Import DecalRoads into Hero Road' action in the history. Does nothing if the list is empty.
---Source: lua/ge/extensions/editor/heroRoadEditor/import.lua:351
---@param decalRoads table Array of scene DecalRoad objects.
function editor_heroRoadEditor_import.importSelectedIntoNewGroup(decalRoads) end


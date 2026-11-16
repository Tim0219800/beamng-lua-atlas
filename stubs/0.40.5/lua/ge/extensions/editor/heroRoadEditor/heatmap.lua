---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/heatmap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Compliance heat map (slope and corner radius) of the Hero Road Editor. compute() scores each station of the group's centerline from 0 (compliant) to 1 (total violation) according to the chosen road class (group.roadClass) and stores the result in group.heatGrade / group.heatRadius. draw() paints a blue-to-red colored ribbon on the roadway of the selected road.
--- Access: extension `editor_heroRoadEditor_heatmap`: `extensions.load("editor_heroRoadEditor_heatmap")`, then the global `editor_heroRoadEditor_heatmap`
---@class editor_heroRoadEditor_heatmap
---@field classOrder string[] Display order of the classes: highway, rural, urban, mountain, rally.
---@field classes table<string, table> Road classes keyed by id ('highway', 'rural', 'urban', 'mountain', 'rally'), each with label, minRadiusM (m), maxGradePct (%) and desc.
editor_heroRoadEditor_heatmap = {}

--- Fills group.heatGrade[i] and group.heatRadius[i] (0 compliant to 1 total violation) for each station of group.divPoints. To be called when the geometry changes or every display frame.
---Source: lua/ge/extensions/editor/heroRoadEditor/heatmap.lua:40
---@param group table Hero Road group (divPoints, divCurv, divWidths, nodes, discMap, roadClass).
function editor_heroRoadEditor_heatmap.compute(group) end

--- Draws the solid violation ribbon for the selected road: two half-panels per segment (left edge to crown, crown to right edge), colored by util.getHueBasedColour255 (alpha 210) according to the metric.
---Source: lua/ge/extensions/editor/heroRoadEditor/heatmap.lua:159
---@param group table Hero Road group after compute().
---@param metric string 'grade' or 'radius'; any other value is treated as 'grade'.
function editor_heroRoadEditor_heatmap.draw(group, metric) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/heatmap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_heatmap` : `extensions.load("editor_heroRoadEditor_heatmap")`, puis la globale `editor_heroRoadEditor_heatmap`
---@class editor_heroRoadEditor_heatmap
---@field classOrder table
---@field classes table
editor_heroRoadEditor_heatmap = {}

--- Fills group.heatGrade[i] / group.heatRadius[i] (0 = compliant .. 1 = full violation).
---Source : lua/ge/extensions/editor/heroRoadEditor/heatmap.lua:40
---@param group any
function editor_heroRoadEditor_heatmap.compute(group) end

--- Draws the filled violation ribbon for the selected road only (matches Master Spline; bounds cost). Two half-panels per
---  segment (outer-left -> crown, crown -> outer-right) so it hugs the cambered/banked deck. Colour per near station via
---  Master Spline's blue->red ramp; both windings so it reads from any angle. `metric` is 'grade' or 'radius'.
---Source : lua/ge/extensions/editor/heroRoadEditor/heatmap.lua:159
---@param group any
---@param metric any
function editor_heroRoadEditor_heatmap.draw(group, metric) end


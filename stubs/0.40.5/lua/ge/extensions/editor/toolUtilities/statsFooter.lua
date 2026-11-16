---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/statsFooter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Statistics footer shared by the editor's "kit" tools: displays "Label N" stats in ImGui and the dynamic row of drawn triangles, distance and number of displayed pieces (computed by triLive). Uses the 'crystal' palette from style.lua.
--- Access: extension `editor_toolUtilities_statsFooter`: `extensions.load("editor_toolUtilities_statsFooter")`, then the global `editor_toolUtilities_statsFooter`
---@class editor_toolUtilities_statsFooter
editor_toolUtilities_statsFooter = {}

--- Draws a "Label N" stat: dim label, colored number, dimmed "|" bar in front (except at the start of a line).
---Source: lua/ge/extensions/editor/toolUtilities/statsFooter.lua:16
---@param label string Label.
---@param val any Value displayed via tostring; 0 if nil/false.
---@param col ImVec4 Number color.
---@param lead boolean|nil True: start of line, no bar.
---@param tip string|nil Tooltip.
function editor_toolUtilities_statsFooter.item(label, val, col, lead, tip) end

--- Displays drawn triangles ("Drawn tris"), range ("Range", in meters) and drawn pieces out of placed ones ("Drawing"). `unique` is added as is to the triangles because it has no LOD. Updates triLive (note if fresh, scanStep, update).
---Source: lua/ge/extensions/editor/toolUtilities/statsFooter.lua:26
---@param instances table triLive entries.
---@param unique number Triangles of the unique geometry, added in full.
---@param fresh boolean|nil The list has changed since last time (may contain a shape never measured).
function editor_toolUtilities_statsFooter.liveRow(instances, unique, fresh) end


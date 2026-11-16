---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/fenceStyles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Declarative fence styles for the editor tools (fences, railings). Each style gives the post height (which chooses the baked shape fence_post_sq_*), the height band of the rails, the number of rails and the default post spacing. Also provides the computation of rail heights according to a layout preset.
--- Access: extension `editor_toolUtilities_fenceStyles`: `extensions.load("editor_toolUtilities_fenceStyles")`, then the global `editor_toolUtilities_fenceStyles`
---@class editor_toolUtilities_fenceStyles
---@field styleOrder string[] Display order of the styles: { 'postrail', 'deck' }.
---@field styles table<string, table> Style definitions keyed by id ('postrail', 'deck'). Fields: id, name, postHeight, railCountDefault/Min/Max, railBottom, railTop, spacingDefault.
editor_toolUtilities_fenceStyles = {}

--- Returns the style with the given id, or the 'postrail' style if the id is unknown.
---Source: lua/ge/extensions/editor/toolUtilities/fenceStyles.lua:84
---@param id string Style id ('postrail' or 'deck').
---@return table  Style table.
function editor_toolUtilities_fenceStyles.get(id) end

--- Computes the fractional positions of the rails in [0,1] (0 = bottom, 1 = top) for a layout preset. With a single rail, it is at 0.5. Group layouts cap pitchFrac at 0.9/max(1,count-2).
---Source: lua/ge/extensions/editor/toolUtilities/fenceStyles.lua:41
---@param count integer Number of rails (minimum 1).
---@param layout string|nil 'pinned' (default, spread from 0 to 1), 'even', 'topGroup', 'bottomGroup' or 'split'.
---@param out table Output array, cleared then filled.
---@param pitchFrac number|nil Fractional pitch between grouped rails (default 0.18).
---@return table  The out array.
function editor_toolUtilities_fenceStyles.railFractions(count, layout, out, pitchFrac) end

--- Computes the Z heights (m) of the rail centers for a style, a rail count and a layout. For group layouts, the top of the band is raised so that the top rail ends up just under the post cap.
---Source: lua/ge/extensions/editor/toolUtilities/fenceStyles.lua:71
---@param style table Style (see get).
---@param count integer|nil Number of rails; default style.railCountDefault.
---@param layout string|nil Layout preset (see railFractions).
---@param out table Output array.
---@param railH number|nil Height of a rail (m); used to compute the group pitch (railH * 1.25).
---@param postH number|nil Post height (m); used to raise the top of the band for group layouts.
---@return table  The out array, filled with Z heights.
function editor_toolUtilities_fenceStyles.railHeights(style, count, layout, out, railH, postH) end


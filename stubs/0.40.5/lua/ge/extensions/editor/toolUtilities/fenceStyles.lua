---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/fenceStyles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_fenceStyles` : `extensions.load("editor_toolUtilities_fenceStyles")`, puis la globale `editor_toolUtilities_fenceStyles`
---@class editor_toolUtilities_fenceStyles
---@field styleOrder table
---@field styles table
editor_toolUtilities_fenceStyles = {}

---Source : lua/ge/extensions/editor/toolUtilities/fenceStyles.lua:84
---@param id any
function editor_toolUtilities_fenceStyles.get(id) end

--- Fractional rail positions in [0,1] (0 = bottom, 1 = top) for a layout preset.
---Source : lua/ge/extensions/editor/toolUtilities/fenceStyles.lua:41
---@param count any
---@param layout any
---@param out any
---@param pitchFrac any
function editor_toolUtilities_fenceStyles.railFractions(count, layout, out, pitchFrac) end

--- Rail centre heights (Z, metres) for a style at a rail count + layout preset.
---Source : lua/ge/extensions/editor/toolUtilities/fenceStyles.lua:71
---@param style any
---@param count any
---@param layout any
---@param out any
---@param railH any
---@param postH any
function editor_toolUtilities_fenceStyles.railHeights(style, count, layout, out, railH, postH) end


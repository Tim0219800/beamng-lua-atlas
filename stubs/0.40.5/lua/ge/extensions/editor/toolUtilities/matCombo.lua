---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/matCombo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui terrain material layer selector (dropdown) for editor tools. Layers are 0-based, like the paint index; -1 means "auto", resolved via util.findMaterialIdx. A button resets to the default value.
--- Access: extension `editor_toolUtilities_matCombo`: `extensions.load("editor_toolUtilities_matCombo")`, then the global `editor_toolUtilities_matCombo`
---@class editor_toolUtilities_matCombo
editor_toolUtilities_matCombo = {}

--- Draws a selector row (reset button, then dropdown). Returns the new value if the user changed the selection or reset the default, otherwise nil.
---Source: lua/ge/extensions/editor/toolUtilities/matCombo.lua:28
---@param cur integer|string|nil Current value (layer index, -1 = auto); converted by tonumber, otherwise opts.default.
---@param opts table id (required, imgui id), label, default (default value), allowAuto (offers the Auto entry), autoNames (names to look up for auto), tooltip.
---@return integer|nil  New chosen index, or nil if nothing changed.
function editor_toolUtilities_matCombo.draw(cur, opts) end


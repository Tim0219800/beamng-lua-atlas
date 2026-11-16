---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/uiColors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UI color palette for the rally: one theme color for the loop and one for the stage, with an NGRC mode variant. The functions write the color into the theme field of a target table (data sent to the UI). A global theme color can override all the others.
--- Access: extension `gameplay_rally_loop_uiColors`: `extensions.load("gameplay_rally_loop_uiColors")`, then the global `gameplay_rally_loop_uiColors`
---@class gameplay_rally_loop_uiColors
gameplay_rally_loop_uiColors = {}

--- Returns the current normalized override.
---Source: lua/ge/extensions/gameplay/rally/loop/uiColors.lua:30
---@return string|nil  '#RRGGBB' color or nil.
function gameplay_rally_loop_uiColors.getThemeOverride() end

--- Sets (or clears with nil / invalid value) a theme color that replaces the default colors.
---Source: lua/ge/extensions/gameplay/rally/loop/uiColors.lua:26
---@param hexOrNil string|nil Hexadecimal color, with or without '#', 6 digits.
function gameplay_rally_loop_uiColors.setThemeOverride(hexOrNil) end

--- Writes target.theme with the loop color (or the override if it exists). Does nothing if target is nil.
---Source: lua/ge/extensions/gameplay/rally/loop/uiColors.lua:43
---@param target table|nil Table to modify.
---@param isNgrcMode boolean true for the NGRC variant.
function gameplay_rally_loop_uiColors.updateForLoop(target, isNgrcMode) end

--- Same for the stage color.
---Source: lua/ge/extensions/gameplay/rally/loop/uiColors.lua:47
---@param target table|nil Table to modify.
---@param isNgrcMode boolean true for the NGRC variant.
function gameplay_rally_loop_uiColors.updateForStage(target, isNgrcMode) end


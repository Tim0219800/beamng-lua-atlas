---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameBlur.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages fullscreen blur rectangles drawn behind the interface (scenetree.ScreenBlurFX effect). The rectangles are stored in groups in M.blurRects; at each onPreRender they are sent to addFrameBlurRect. Normalized coordinates: (0,0) at top left, (1,1) at bottom right.
--- Access: extension `ui_gameBlur`: `extensions.load("ui_gameBlur")`, then the global `ui_gameBlur`
---@class ui_gameBlur
---@field onExtensionLoaded nil Always nil (reference to an undefined variable).
---@field onExtensionUnloaded nil Always nil (reference to an undefined variable).
---@field setColor nil Always nil (reference to an undefined variable).
ui_gameBlur = {}

--- Pre-render hook: sends each rectangle to the ScreenBlurFX (addFrameBlurRect) if the UI is visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameBlur.lua:48
function ui_gameBlur.onPreRender() end

--- Removes all the blur rectangle groups.
---Source: lua/ge/extensions/ui/gameBlur.lua:39
function ui_gameBlur.removeAllGroups() end

--- Removes a group of rectangles.
---Source: lua/ge/extensions/ui/gameBlur.lua:35
---@param group string Group name.
function ui_gameBlur.removeGroup(group) end

--- Replaces all the rectangles of a group with the given list.
---Source: lua/ge/extensions/ui/gameBlur.lua:31
---@param group string Group name.
---@param data table List of rectangles {x, y, w, h, alpha}.
function ui_gameBlur.replaceGroup(group, data) end


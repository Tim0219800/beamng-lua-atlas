---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/visibility.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shows or hides the game interface: the web UI (CEF) and the imgui windows. Useful for screenshots, videos or tools. It stores the state in M.state (cefVisible, imguiVisible) and broadcasts the CEF visibility change.
--- Access: extension `ui_visibility`: `extensions.load("ui_visibility")`, then the global `ui_visibility`
---@class ui_visibility
ui_visibility = {}

--- Returns the general visibility state, which is that of the web UI (CEF).
---Source: lua/ge/extensions/ui/visibility.lua:46
---@return boolean  true if visible.
function ui_visibility.get() end

--- Returns whether the web UI (CEF) is visible.
---Source: lua/ge/extensions/ui/visibility.lua:10
---@return boolean  true if visible.
function ui_visibility.getCef() end

--- Returns whether imgui is enabled.
---Source: lua/ge/extensions/ui/visibility.lua:35
---@return boolean  true if visible.
function ui_visibility.getImgui() end

--- Shows or hides the web UI and imgui at the same time.
---Source: lua/ge/extensions/ui/visibility.lua:40
---@param visible boolean true to show.
function ui_visibility.set(visible) end

--- Shows or hides the web UI; emits 'onCefVisibilityChanged' (UI and extensions) only if the state changes.
---Source: lua/ge/extensions/ui/visibility.lua:13
---@param visible boolean true to show.
function ui_visibility.setCef(visible) end

--- Enables or disables imgui (Engine.imgui.setEnabled) if the state changes.
---Source: lua/ge/extensions/ui/visibility.lua:27
---@param visible boolean true to enable.
function ui_visibility.setImgui(visible) end

--- Toggles the general visibility (according to get(), so the CEF state) and applies it to CEF and imgui.
---Source: lua/ge/extensions/ui/visibility.lua:50
function ui_visibility.toggle() end

--- Toggles the web UI visibility.
---Source: lua/ge/extensions/ui/visibility.lua:22
function ui_visibility.toggleCef() end


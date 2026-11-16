---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/messagesDebugger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui debug window for on-screen messages ("Message" UI events). It lets you compose a message (text, category, icon, duration in seconds), send it via guihooks.message, clear a category or all messages, and enable a TTL bypass on the UI side. Useful for testing the display of messages and [action=...] bindings.
--- Access: extension `ui_messagesDebugger`: `extensions.load("ui_messagesDebugger")`, then the global `ui_messagesDebugger`
---@class ui_messagesDebugger
---@field dependencies table<integer, string> Extensions loaded before: ui_imgui.
ui_messagesDebugger = {}

--- Closes the window.
---Source: lua/ge/extensions/ui/messagesDebugger.lua:38
function ui_messagesDebugger.hide() end

--- Hook called every frame; draws the window if it is open (nothing otherwise).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/messagesDebugger.lua:42
---@param dtReal number Elapsed real time (s), unused.
---@param dtSim number Elapsed simulation time (s), unused.
---@param dtRaw number Raw elapsed time (s), unused.
function ui_messagesDebugger.onUpdate(dtReal, dtSim, dtRaw) end

--- Opens the "Messages Debugger" window.
---Source: lua/ge/extensions/ui/messagesDebugger.lua:37
function ui_messagesDebugger.show() end

--- Toggles the window's open state.
---Source: lua/ge/extensions/ui/messagesDebugger.lua:39
function ui_messagesDebugger.toggle() end


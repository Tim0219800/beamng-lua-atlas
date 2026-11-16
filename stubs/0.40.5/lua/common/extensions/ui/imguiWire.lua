---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/imguiWire.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui "cable" prototype: loads ui_imgui then replaces each ui_imgui function with a wrapper that, instead of calling ImGui, records the call (name + arguments) in a buffer. clear() then executes the whole buffer via ui_imgui and stores the return values, which are returned at the next cycle to identical calls. Designed to send ImGui calls from one VM to another (comments "send buf to GE / GE: execute").
--- Access: extension `ui_imguiWire`: `extensions.load("ui_imguiWire")`, then the global `ui_imguiWire`
---@class ui_imguiWire
ui_imguiWire = {}

--- Executes all stored ImGui calls in order on ui_imgui, keeps the non-empty return values for the calls of the next cycle, then empties the buffer and the identifier cache.
---Source: lua/common/extensions/ui/imguiWire.lua:61
function ui_imguiWire.clear() end


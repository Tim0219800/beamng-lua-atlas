---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleUiTextureDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor debug tool (Window > Vehicles > "Vehicle UI Textures" menu). It lists the vehicles, then the active HTML UI texture tags (CEF screens drawn on vehicles) of the chosen vehicle. For a tag, it lets you open/close the texture's console, export the texture as PNG and show the debug info (fps, size, usage mode, start URL).
--- Access: extension `editor_vehicleUiTextureDebug`: `extensions.load("editor_vehicleUiTextureDebug")`, then the global `editor_vehicleUiTextureDebug`
---@class editor_vehicleUiTextureDebug
---@field dependencies table<integer, string> {'ui_imgui'}: extension loaded before this one.
editor_vehicleUiTextureDebug = {}

--- Editor hook called every frame: draws the vehicle and tag dropdown lists, the console/dump buttons and the debug information.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleUiTextureDebug.lua:62
function editor_vehicleUiTextureDebug.onEditorGui() end

--- Editor hook called at initialization. Gets ui_imgui, registers the 'Vehicle UI Textures' window (520x420) and adds the menu entry in the 'Vehicles' group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleUiTextureDebug.lua:56
function editor_vehicleUiTextureDebug.onEditorInitialized() end


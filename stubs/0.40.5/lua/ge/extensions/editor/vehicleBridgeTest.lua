---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleBridgeTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small test window for `core_vehicleBridge` in the editor (menu Window > Vehicles > 'Vehicle Bridge Test'). You choose a vehicle (ID or list of BeamNGVehicle), enter a key (default 'ignition') and the 'Get Value!' button calls core_vehicleBridge.requestValue; the asynchronous reply is displayed with dumps().
--- Access: extension `editor_vehicleBridgeTest`: `extensions.load("editor_vehicleBridgeTest")`, then the global `editor_vehicleBridgeTest`
---@class editor_vehicleBridgeTest
editor_vehicleBridgeTest = {}

--- Receives the reply of core_vehicleBridge.requestValue and stores all its arguments in a table displayed in the window.
---Source: lua/ge/extensions/editor/vehicleBridgeTest.lua:53
---@param ... any Values returned by the bridge for the requested key.
function editor_vehicleBridgeTest.callback(...) end

--- Editor GUI render hook: draws the window (vehicle ID input, vehicle combo, key, Get Value! button, result).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleBridgeTest.lua:13
function editor_vehicleBridgeTest.onEditorGui() end

--- Registers the 'Vehicle Bridge Test' window (400x600), adds its menu entry (Vehicles group) and loads the core_vehicleBridge extension.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleBridgeTest.lua:44
function editor_vehicleBridgeTest.onEditorInitialized() end


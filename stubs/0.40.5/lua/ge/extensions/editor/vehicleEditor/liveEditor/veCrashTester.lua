---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'Other/Crash Tester' tool of the live Vehicle Editor. You choose a starting point on the terrain (wheel = rotation in 5° steps), a number of vehicles (1 to 15) and a target speed (10 to 200 km/h). 'Run Test!' spawns randomly picked cars/trucks (core_vehicles.getVehicleList, Type Car or Truck), spaced 10 m apart, handbrake released and launched at the target speed via applyClusterVelocityScaleAdd. 'Stop Test!' deletes the vehicles.
--- Access: extension `editor_vehicleEditor_liveEditor_veCrashTester`: `extensions.load("editor_vehicleEditor_liveEditor_veCrashTester")`, then the global `editor_vehicleEditor_liveEditor_veCrashTester`
---@class editor_vehicleEditor_liveEditor_veCrashTester
---@field menuEntry string 'Other/Crash Tester' ('Other' submenu).
editor_vehicleEditor_liveEditor_veCrashTester = {}

--- Restores the open state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua:151
---@param data table onSerialize table.
function editor_vehicleEditor_liveEditor_veCrashTester.onDeserialized(data) end

--- Returns {windowOpen}.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua:145
---@return table  {windowOpen = boolean}
function editor_vehicleEditor_liveEditor_veCrashTester.onSerialize() end

--- Called every frame: draws the window (sliders, buttons) and the start markers (red triangles via debugDrawer:drawTriSolid).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua:111
function editor_vehicleEditor_liveEditor_veCrashTester.onUpdate() end

--- Opens the window.
---Source: lua/ge/extensions/editor/vehicleEditor/liveEditor/veCrashTester.lua:141
function editor_vehicleEditor_liveEditor_veCrashTester.open() end


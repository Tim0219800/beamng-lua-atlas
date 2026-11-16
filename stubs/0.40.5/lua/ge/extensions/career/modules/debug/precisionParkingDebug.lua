---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Precision Parking" career debug tab. A button toggles the debug; when active, the module looks (every 0.1 s) for the delivery parking spot nearest to the player vehicle (accessPointsByName of the deliveryProviders), computes parking precision data and displays it in ImGui, with 3D drawings (spheres, lines, arrows via debugDrawer).
--- Access: extension `career_modules_debug_precisionParkingDebug`: `extensions.load("career_modules_debug_precisionParkingDebug")`, then the global `career_modules_debug_precisionParkingDebug`
---@class career_modules_debug_precisionParkingDebug
---@field debugName string 'Precision Parking'.
---@field debugOrder number Sort order (10).
career_modules_debug_precisionParkingDebug = {}

--- Draws the toggle button and, if active, updates then displays the parking precision data.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua:154
function career_modules_debug_precisionParkingDebug.drawDebugMenu() end

--- Draws the 3D debug visualization if the mode is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua:396
function career_modules_debug_precisionParkingDebug.drawDebugVisualization() end

--- Cleanup when the debug is disabled: turns off the mode and clears debugData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/debug/precisionParkingDebug.lua:403
function career_modules_debug_precisionParkingDebug.onDebugDisabled() end


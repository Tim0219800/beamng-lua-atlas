---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/test/testRouteFix.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Development test extension for the gameplay/route/route module: on load, it creates a Route with a small hard-coded 3-point path, then every frame draws the path (spheres, prisms, numbers) via debugDrawer and makes the player vehicle follow it with route:trackVehicle. Loaded with extensions.load('gameplay_rally_test_testRouteFix'). Of no use in normal gameplay.
--- Access: extension `gameplay_rally_test_testRouteFix`: `extensions.load("gameplay_rally_test_testRouteFix")`, then the global `gameplay_rally_test_testRouteFix`
---@class gameplay_rally_test_testRouteFix
gameplay_rally_test_testRouteFix = {}

--- Hook called when the extension loads: creates the Route and calls setupPathMulti on the test path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/test/testRouteFix.lua:72
function gameplay_rally_test_testRouteFix.onExtensionLoaded() end

--- Hook called when the extension unloads; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/test/testRouteFix.lua:77
function gameplay_rally_test_testRouteFix.onExtensionUnloaded() end

--- Hook called every frame: draws the route and calls route:trackVehicle on player vehicle 0 if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/test/testRouteFix.lua:56
function gameplay_rally_test_testRouteFix.onUpdate() end

--- Hook called when a vehicle is put back in place; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/test/testRouteFix.lua:69
function gameplay_rally_test_testRouteFix.onVehicleResetted() end


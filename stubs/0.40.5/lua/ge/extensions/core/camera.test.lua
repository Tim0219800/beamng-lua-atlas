---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/camera.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of the camera system, for the game's test framework. Run from the GE Lua console: extensions.testFramework_TestManager:runTestFiles('camera'). Each testXxx function receives a context ctx (assert, assertEqual). Among other things it checks the camera group ring, the membership of free cameras in the 'world' group, the Drone Chase camera, the 'occupant' driver camera and the presence of the free camera configuration API. Useful as a usage example of core_camera.
--- Access: extension `core_camera.test`: `extensions.load("core_camera.test")`, then the global `core_camera.test`
---@class core_camera.test
core_camera.test = {}

--- Tests core_camera.nextCameraGroup: game cameras to free cameras to game cameras.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.test.lua:11
---@param ctx table Test context (assert, assertEqual)
function core_camera.test.testCameraGroupRing(ctx) end

--- Checks the core/cameraModes/droneChase mode: not global, not hidden, disabled by default.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.test.lua:25
---@param ctx table Test context
function core_camera.test.testDroneIsRegularCamera(ctx) end

--- Checks that core_camera exposes getFreeCameraConfigurationReadOnly, changeFreeCameraOrder, toggleFreeCameraEnabledById and setCameraByNameFromOptions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.test.lua:43
---@param ctx table Test context
function core_camera.test.testFreeCameraConfigurationApi(ctx) end

--- Checks that the free, smoothFree and steadycam cameras belong to the 'world' group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.test.lua:18
---@param ctx table Test context
function core_camera.test.testFreeCameraModes(ctx) end

--- Checks the conversion of a legacy 'driver' camera into an occupant mode (node 5, 'right' side, right shoulder at 0.6 m).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/camera.test.lua:32
---@param ctx table Test context
function core_camera.test.testLegacyDriverIsOccupant(ctx) end


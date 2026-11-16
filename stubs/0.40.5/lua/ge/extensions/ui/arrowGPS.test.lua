---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/arrowGPS.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests of the ui_arrowGPS extension (floating on-screen GPS arrow). The file loads arrowGPS.lua in a simulated environment (fake TSStatic createObject, fake core_camera, GFXDevice, scenetree) via loadfile + setfenv, then checks the lazy creation of the arrow, its reuse, its color, its rotation toward the highest-priority target and its recreation after the object is deleted. Useful to a modder to understand the ui_arrowGPS contract (setTarget, removeTarget, setScale, setDepth, setAppScreenPos, onPreRender).
--- Access: extension `ui_arrowGPS.test`: `extensions.load("ui_arrowGPS.test")`, then the global `ui_arrowGPS.test`
---@class ui_arrowGPS.test
ui_arrowGPS.test = {}

--- Checks that no object is created as long as no valid target (with pos) is set: onPreRender, setTarget without pos, removeTarget and onExtensionUnloaded create nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.test.lua:54
---@param ctx table TestManager test context.
function ui_arrowGPS.test.testIdleExtensionDoesNotCreateArrow(ctx) end

--- Checks that the lowest-priority target (1) dictates the arrow's color and direction, that removeTarget switches to the next target, and that the arrow is hidden when there is no target left.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.test.lua:97
---@param ctx table TestManager test context.
function ui_arrowGPS.test.testPriorityColorAndTargetRemoval(ctx) end

--- Checks the default color and shape, that the arrow is hidden when the player disappears then shown again, without recreation (a single object created).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.test.lua:81
---@param ctx table TestManager test context.
function ui_arrowGPS.test.testRenderedArrowIsReusedAndHidesWithoutPlayer(ctx) end

--- Checks that if the scene object is deleted, onPreRender recreates the arrow keeping color and scale (setScale), without a new call to setTarget.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.test.lua:115
---@param ctx table TestManager test context.
function ui_arrowGPS.test.testSceneDeletionRecreatesArrowWithoutTargetUpdate(ctx) end

--- Checks that setScale, setDepth and setAppScreenPos called before the arrow is created are taken into account from the first render (scale 0.08, depth 0.3, screen position 0.75/0.25).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.test.lua:145
---@param ctx table TestManager test context.
function ui_arrowGPS.test.testSettingsBeforeCreationAffectFirstRender(ctx) end

--- Checks that a setTarget/setScale after the object's deletion does not access the old object (the fake object raises an error otherwise) and that the recreation happens at the next onPreRender.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.test.lua:131
---@param ctx table TestManager test context.
function ui_arrowGPS.test.testTargetUpdateAfterSceneDeletionDoesNotUseOldObject(ctx) end

--- Checks that the arrow waits for a player vehicle and an onPreRender: without a player nothing is created, as soon as the player exists the arrow is created and visible.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.test.lua:68
---@param ctx table TestManager test context.
function ui_arrowGPS.test.testTargetWaitsForPlayerAndRender(ctx) end

--- Checks that onExtensionUnloaded deletes the object and empties the targets state, and that the extension remains usable afterwards with new targets.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/arrowGPS.test.lua:162
---@param ctx table TestManager test context.
function ui_arrowGPS.test.testUnloadClearsObjectAndTargetState(ctx) end


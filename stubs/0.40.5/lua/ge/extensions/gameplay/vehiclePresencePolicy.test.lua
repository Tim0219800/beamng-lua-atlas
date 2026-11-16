---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Unit tests for gameplay/vehiclePresencePolicy. Each testXxx function receives a test context `ctx` (with assert and assertEqual) provided by the game's test runner; this is not a gameplay extension to load.
--- Access: extension `gameplay_vehiclePresencePolicy.test`: `extensions.load("gameplay_vehiclePresencePolicy.test")`, then the global `gameplay_vehiclePresencePolicy.test`
---@class gameplay_vehiclePresencePolicy.test
gameplay_vehiclePresencePolicy.test = {}

--- Checks allowsActionMap: driver only on "driving", passenger never, unrestricted always.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua:25
---@param ctx table Test context.
function gameplay_vehiclePresencePolicy.test.testActionMapPermissions(ctx) end

--- Checks defaultUnseatedMode: unrestricted only in freeroam without multiseat, passenger in all other cases (multiplayer, career, nil).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua:17
---@param ctx table Test context.
function gameplay_vehiclePresencePolicy.test.testDefaultUnseatedMode(ctx) end

--- Checks isValidMode (driver, passenger, unrestricted valid; observer invalid) and normalizeMode (fallback, default value "passenger").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua:7
---@param ctx table Test context with assert and assertEqual.
function gameplay_vehiclePresencePolicy.test.testModeValidationAndNormalization(ctx) end


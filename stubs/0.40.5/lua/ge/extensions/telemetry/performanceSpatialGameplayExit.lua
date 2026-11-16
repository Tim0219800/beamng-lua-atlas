---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Telemetry helper: determines which gameplay activity is in progress (mission, scenario, delivery, test drive, certification, drag/drift/crawl in freeroam, career delivery) and builds the "gameplayActivityExit" event when the player leaves it (abort, world exit or game exit), with the level and the player's rounded position. Inputs are strictly validated (types, length, characters); a `source` parameter allows injecting fake modules for tests (default _G).
--- Access: extension `telemetry_performanceSpatialGameplayExit`: `extensions.load("telemetry_performanceSpatialGameplayExit")`, then the global `telemetry_performanceSpatialGameplayExit`
---@class telemetry_performanceSpatialGameplayExit
telemetry_performanceSpatialGameplayExit = {}

--- Builds the activity exit event: name = "gameplayActivityExit", exitKind, level, position {x,y,z}, positionSource, plus activityType/activityId.
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua:146
---@param exitKind string abort, worldExit or gameExit.
---@param currentActivity table|nil Already resolved activity ({activityType, activityId}); otherwise resolveActivity(source) is called.
---@param trackedLevels table<string, boolean>|nil Set of tracked levels; outside this set, nothing is captured.
---@param source table|nil Injectable module source (_G by default).
---@return table|nil  Event ready to send, or nil if a validation fails.
function telemetry_performanceSpatialGameplayExit.capture(exitKind, currentActivity, trackedLevels, source) end

--- Identifies the current gameplay activity according to the priority order described in the notes.
---Source: lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua:52
---@param source table|nil Table whose fields play the role of the game modules (_G by default); used for tests.
---@return table|nil  {activityType, activityId} or nil if no activity is in progress.
function telemetry_performanceSpatialGameplayExit.resolveActivity(source) end


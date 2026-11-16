# `telemetry_performanceSpatialGameplayExit`

*File: `lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua` · VM: Game Engine (GE) · 172 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `telemetry_performanceSpatialGameplayExit`: `extensions.load("telemetry_performanceSpatialGameplayExit")`, then the global `telemetry_performanceSpatialGameplayExit`

Telemetry helper: determines which gameplay activity is in progress (mission, scenario, delivery, test drive, certification, drag/drift/crawl in freeroam, career delivery) and builds the "gameplayActivityExit" event when the player leaves it (abort, world exit or game exit), with the level and the player's rounded position. Inputs are strictly validated (types, length, characters); a `source` parameter allows injecting fake modules for tests (default _G).

## Notes

- Activity types: mission, scenario, careerDelivery, testDrive, vehicleCertification, freeformDelivery, freeroamDrag, freeroamDrift, freeroamCrawl. Exit types: abort, worldExit, gameExit.
- Priority order of resolveActivity: foreground mission, unfinished scenario (state other than finished/post), free delivery, career road test, certification test, unfinished freeroam drag, freeroam drift outside the conclusion phase, freeroam crawl (outside a mission, not finished/disqualified), finally career delivery.
- An activity identifier is only kept if it is at most 256 characters, has no control character or leading/trailing space and only contains letters, digits, _ . / : + - and spaces; otherwise it is omitted (the event is still emitted).
- The level must match ^[%w_.-]+$ (128 characters max) and, if trackedLevels is provided, be in it; otherwise capture returns nil.
- The position is rounded to 0.1 m; it comes from player 0's vehicle, failing that from the camera (positionSource = vehicle or camera). Without a valid position, capture returns nil.
- All calls to the other modules are protected by pcall: an error simply gives nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `telemetry_performanceSpatialGameplayExit.capture(exitKind, currentActivity, trackedLevels, source)` | Builds the activity exit event: name = "gameplayActivityExit", exitKind, level, position {x,y,z}, positionSource, plus activityType/activityId. | 146 |
| `telemetry_performanceSpatialGameplayExit.resolveActivity(source)` | Identifies the current gameplay activity according to the priority order described in the notes. | 52 |

### Parameter details

#### `telemetry_performanceSpatialGameplayExit.capture(exitKind, currentActivity, trackedLevels, source)`

Builds the activity exit event: name = "gameplayActivityExit", exitKind, level, position {x,y,z}, positionSource, plus activityType/activityId.

- `exitKind` (*string*) : abort, worldExit or gameExit.
- `currentActivity` (*table|nil*) : Already resolved activity ({activityType, activityId}); otherwise resolveActivity(source) is called.
- `trackedLevels` (*table<string, boolean>|nil*) : Set of tracked levels; outside this set, nothing is captured.
- `source` (*table|nil*) : Injectable module source (_G by default).
- **returns**: table|nil Event ready to send, or nil if a validation fails.

#### `telemetry_performanceSpatialGameplayExit.resolveActivity(source)`

Identifies the current gameplay activity according to the priority order described in the notes.

- `source` (*table|nil*) : Table whose fields play the role of the game modules (_G by default); used for tests.
- **returns**: table|nil {activityType, activityId} or nil if no activity is in progress.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua`.*

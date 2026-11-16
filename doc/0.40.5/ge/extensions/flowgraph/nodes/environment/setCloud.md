# `flowgraph_nodes_environment_setCloud`

*File: `lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua` · VM: Game Engine (GE) · 79 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/setCloud")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Clouds" (category dynamic_instant). Sets the cloud parameters. Input pins: objectId (optional id of a cloud object), coverage (0 to 1), exposure, windSpeed, height. Executed once (workOnce) or every frame in repeat mode.

## Notes

- Without objectId, only coverage (setCloudCover) and windSpeed (setWindSpeed) are applied to the default clouds; exposure and height are ignored.
- data.restoreCloud = true is defined but _executionStarted/_executionStopped are empty: nothing is restored (unused value).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Empty. | 37 |
| `C:_executionStopped()` | Empty. | 45 |
| `C:init(mgr)` | Sets data.restoreCloud = true. | 24 |
| `C:postInit()` | Configures the coverage pin as a 0 to 1 slider. | 28 |
| `C:setCloudParameters()` | Calls core_environment.setCloudCoverByID/ExposureByID/WindByID/HeightByID if objectId is provided, otherwise setCloudCover and setWindSpeed. | 64 |
| `C:work()` | In repeat mode, applies the parameters every frame. | 58 |
| `C:workOnce()` | Applies the parameters once. | 54 |

## Calls into the engine (C++)

- `core_environment.` `setCloudCover`, `setCloudCoverByID`, `setCloudExposureByID`, `setCloudHeightByID`, `setCloudWindByID`, `setWindSpeed`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/setCloud.lua`.*

# `flowgraph_nodes_environment_getCloud`

*File: `lua/ge/extensions/flowgraph/nodes/environment/getCloud.lua` · VM: Game Engine (GE) · 40 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/getCloud")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Clouds" (category repeat_instant, tags environment/weather/cloud). Reads the parameters of a cloud object via core_environment. Input: objectId (number, optional). Outputs: coverage (sky coverage), exposure (brightness), windSpeed (texture scroll speed), height (height). Without objectId, uses the default clouds: only coverage (getCloudCover) and windSpeed (getWindSpeed) are available, exposure and height are 0.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame, fills the outputs from core_environment (getCloud*ByID if objectId, otherwise default values). | 24 |

## Calls into the engine (C++)

- `core_environment.` `getCloudCover`, `getCloudCoverByID`, `getCloudExposureByID`, `getCloudHeightByID`, `getCloudWindByID`, `getWindSpeed`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/getCloud.lua`.*

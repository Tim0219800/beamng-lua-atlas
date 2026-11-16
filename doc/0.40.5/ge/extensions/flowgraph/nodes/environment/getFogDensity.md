# `flowgraph_nodes_environment_getFogDensity`

*File: `lua/ge/extensions/flowgraph/nodes/environment/getFogDensity.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/environment/getFogDensity")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Fog" (category provider, tags environment/tod). Reads the current fog parameters: outputs density (core_environment.getFogDensity) and atmosphereHeight (getFogAtmosphereHeight).

## Notes

- legacyPins declares a rename fog -> density in _in while density is an output here (leftover from the Set Fog node); no effect.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Every frame, writes the fog density and atmosphere height to the outputs. | 28 |

## Calls into the engine (C++)

- `core_environment.` `getFogAtmosphereHeight`, `getFogDensity`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/environment/getFogDensity.lua`.*

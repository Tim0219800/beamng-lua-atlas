# `gameplay_rally_driveline_util`

*File: `lua/ge/extensions/gameplay/rally/driveline/util.lua` · VM: Game Engine (GE) · 16 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_driveline_util`: `extensions.load("gameplay_rally_driveline_util")`, then the global `gameplay_rally_driveline_util`

Editing constants of the rally driveline (editable spline built from the recce recording). Used by drivelineV3: default node width, RDP simplification tolerance, minimum number of subdivisions and minimum spline spacing.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultSimplificationTolerance` | number | RDP algorithm tolerance when simplifying the recorded points: 1.0 (m). |
| `defaultSplineWidth` | number | Default width of a spline node: 10.0 m. |
| `minSplineDivisions` | number | Minimum number of spline subdivisions: 10. |
| `minSplineSpacing` | number | Minimum spacing between subdivided points: 2.0 m. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/driveline/util.lua`.*

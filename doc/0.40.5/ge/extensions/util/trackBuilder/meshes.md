# `util_trackBuilder_meshes`

*File: `lua/ge/extensions/util/trackBuilder/meshes.lua` · VM: Game Engine (GE) · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_trackBuilder_meshes`: `extensions.load("util_trackBuilder_meshes")`, then the global `util_trackBuilder_meshes`

Table of predefined cross-section profiles for the Track Builder: side walls, tilted walls and tubes. Each profile is a table {crossPoints, cap, uv, material, flipUVRight, [sharp]} meant to be extruded along a track segment. All use the 'track_editor_border' material. The file returns the table directly (no M); the names indicate the size: sideWall10 = 1 m high, tube5m = 5 m radius.

## Notes

- createSideWall(height, angle): 3-point profile; angle (rad, 0 by default) tilts the wall. sideWallNN: height NN/10 m (01 = 0.1 m, 10 = 1 m, 50 = 5 m, 100 = 10 m). rotWallNN: height 2 m, tilt of NN degrees.
- createTube(radius, steps, wallHeight): circular-arc profile (steps segments) of radius radius, with a thickness of 1 m. The 'High' variants have a taller wall; 'Full' (20 steps, no wall) makes a complete tube.
- The tube wall is added only if wallHeight > 0 and steps == 10.
- Field types are inferred from the code: each one is a profile table.

## Fields

| Field | Type | Description |
|---|---|---|
| `rotWall15` | table | 2 m wall tilted by 15° (pi/12). |
| `rotWall30` | table | 2 m wall tilted by 30° (pi/6). |
| `rotWall45` | table | 2 m wall tilted by 45° (pi/4). |
| `rotWall90` | table | 2 m wall tilted by 90° (pi/2). |
| `sideWall01` | table | Side wall 0.1 m high. |
| `sideWall03` | table | Side wall 0.3 m high. |
| `sideWall05` | table | Side wall 0.5 m high. |
| `sideWall10` | table | Side wall 1 m high. |
| `sideWall100` | table | Side wall 10 m high. |
| `sideWall50` | table | Side wall 5 m high. |
| `tube10m` | table | Tube of radius 10 m with a 2 m wall. |
| `tube10mFull` | table | Complete tube of radius 10 m (20 steps). |
| `tube10mHigh` | table | Tube of radius 10 m with a 10 m wall. |
| `tube5m` | table | Tube of radius 5 m with a 1 m wall. |
| `tube5mFull` | table | Complete tube of radius 5 m (20 steps). |
| `tube5mHigh` | table | Tube of radius 5 m with a 5 m wall. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/trackBuilder/meshes.lua`.*

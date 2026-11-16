# `gameplay_rally_recce_drivelineRecording`

*File: `lua/ge/extensions/gameplay/rally/recce/drivelineRecording.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_recce_drivelineRecording`: `extensions.load("gameplay_rally_recce_drivelineRecording")`, then the global `gameplay_rally_recce_drivelineRecording`

Loader of the "driveline" file recorded during a rally recce. A driveline is a sequence of timestamped points (position, orientation) of the driven route. The module reads the mission's JSONL file and builds a PointList with relationships between points and normals. Extension gameplay_rally_recce_drivelineRecording, used by the recce class.

## Notes

- Each JSONL line must contain pos (vec3), quat and ts (timestamp); they are passed to PointList():createPoint.
- At least 3 points are required, otherwise loading fails (E log, nil return).
- The loading time is logged (rallyUtil.getTime()).

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_rally_recce_drivelineRecording.load(missionDir)` | Loads the mission's driveline file and returns a ready-to-use PointList (setupPointRelationships and setupPointNormals already called). | 17 |

### Parameter details

#### `gameplay_rally_recce_drivelineRecording.load(missionDir)`

Loads the mission's driveline file and returns a ready-to-use PointList (setupPointRelationships and setupPointNormals already called).

- `missionDir` (*string*) : Mission folder containing the driveline file (rallyUtil.drivelineFile)
- **returns**: table|nil PointList, or nil if the file is absent, unreadable or has fewer than 3 points

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/recce/drivelineRecording.lua`.*

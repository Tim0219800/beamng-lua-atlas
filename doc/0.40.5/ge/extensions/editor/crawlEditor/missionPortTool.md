# `editor_crawlEditor_missionPortTool`

*File: `lua/ge/extensions/editor/crawlEditor/missionPortTool.lua` · VM: Game Engine (GE) · 502 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_crawlEditor_missionPortTool`: `extensions.load("editor_crawlEditor_missionPortTool")`, then the global `editor_crawlEditor_missionPortTool`

Migration tool of the crawl editor: converts old crawl missions (folder /gameplay/missions/<level>/crawl/<mission>/ containing bounds.sites.json and race.race.json) to the new crawl system. For each mission it generates a .boundary.json file (zone from bounds.sites.json), a .path.json (nodes from the pathnodes of race.race.json, with recovery flags), a .startingPosition.json (starting position) in /levels/<level>/crawls/, then a .trail.json in the mission folder, which links everything. Goes through gameplay/crawl/saveSystem (saveBoundary, savePath, saveStartingPosition, saveTrail).

## Example

```lua
extensions.load('editor_crawlEditor_missionPortTool')
editor_crawlEditor_missionPortTool.portMission('/gameplay/missions/west_coast_usa/crawl/myMission', 'west_coast_usa')
```

## Notes

- Required files: bounds.sites.json and race.race.json (otherwise failure, returns false); missing info.json = simple warning.
- Only the first zone (zones[1]) of bounds.sites.json is converted; it must have at least 3 vertices. If top/bot are missing, default inactive planes are created (top z=10 normal +Z, bottom z=-10 normal -Z).
- Each pathnode becomes a node {name, pos, radius (default 6), flags}. Flags: normal, recovery, reverseRecovery, sidePadding; isRecoveryCheckpoint = true if recovery or reverseRecovery is anything other than -1. recovery/reverseRecovery point to an oldId of startPositions, not a pathnode index.
- Starting position: startPositions whose oldId == defaultStartPosition, otherwise the first entry (warning). Rotation = direction toward the first node (identity if distance <= 0.001), radius 10, icon 2 m above.
- The created trail has isFromMission = true, pathReversed = false, rules {isPointsBased = false, isTimed = false}, empty prefabs.
- The target level is getCurrentLevelIdentifier() if targetLevel is nil. Passwords are not concerned; existing files of the same name are rewritten (portAllMissions does not check whether a mission is already ported).
- The local functions convertBoundsToBoundary, convertRaceToPath, extractMissionName, scanMissions and portAllMissions are not exported; the "Port All Missions" button goes through all levels (getAllLevelIdentifiers) then calls editor_crawlEditor.loadAllObjects().

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_crawlEditor_missionPortTool.openPortingDialog()` | Rescans the missions of the current level and opens the porting window. | 492 |
| `editor_crawlEditor_missionPortTool.portMission(missionDir, targetLevel)` | Converts a crawl mission: reads bounds.sites.json, race.race.json, creates boundary/path/startingPosition in /levels/<level>/crawls/ and the trail in the mission folder. Logs each error with the tag mission_port_tool. | 132 |
| `editor_crawlEditor_missionPortTool.showPortingDialog()` | Draws the imgui window "Mission Port Tool" (Port All Missions, list of convertible missions of the current level with one button per mission, Refresh, Close) if the dialog is open. To be called every frame (from the editor). *(internal)* | 409 |

### Parameter details

#### `editor_crawlEditor_missionPortTool.portMission(missionDir, targetLevel)`

Converts a crawl mission: reads bounds.sites.json, race.race.json, creates boundary/path/startingPosition in /levels/<level>/crawls/ and the trail in the mission folder. Logs each error with the tag mission_port_tool.

- `missionDir` (*string*) : Path of the mission folder (the mission name is its last segment)
- `targetLevel` (*string|nil*) : Destination level identifier; defaults to the loaded level
- **returns**: boolean true if boundary, path and trail were saved; false on failure (the starting position is optional)

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/crawlEditor/missionPortTool.lua`.*

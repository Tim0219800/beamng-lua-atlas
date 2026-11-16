# `ui_oneshotRaceSelector_quickRaceTrackDescriptor`

*File: `lua/ge/extensions/ui/oneshotRaceSelector/quickRaceTrackDescriptor.lua` · VM: Game Engine (GE) · 104 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_oneshotRaceSelector_quickRaceTrackDescriptor`: `extensions.load("ui_oneshotRaceSelector_quickRaceTrackDescriptor")`, then the global `ui_oneshotRaceSelector_quickRaceTrackDescriptor`

gridSelector back-end descriptor shared by quickrace and lightRunner. Both draw their lists of levels and tracks from scenario_quickRaceLoader.getQuickraceList() and differ only by the back-end name (vehicle restrictions and start behavior are handled elsewhere). The result of build is meant for ui_oneshotRaceSelector_core.createBackend.

## Example

```lua
local descriptor = ui_oneshotRaceSelector_quickRaceTrackDescriptor.build("quickraceSelector")
local backend = ui_oneshotRaceSelector_core.createBackend(descriptor)
```

## Notes

- level.name takes levelInfo.title: translation id for normal levels, raw text for the synthetic "Procedural Tracks" / "Track Editor Tracks" entries. _tr lets unknown ids through, so the call is systematic.
- Track specifications display difficulty (via difficultyLabel), reversible, rolling start, laps, authors and length (in m).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_oneshotRaceSelector_quickRaceTrackDescriptor.build(backendName)` | Returns the descriptor table (backendName, middlePathKey = "tracks", quickrace title keys, getLevels, getMiddleItems, middleName, display names, levelToTile, middleToTile, getLevelDetails, getMiddleDetails) for the named back-end. | 21 |

### Parameter details

#### `ui_oneshotRaceSelector_quickRaceTrackDescriptor.build(backendName)`

Returns the descriptor table (backendName, middlePathKey = "tracks", quickrace title keys, getLevels, getMiddleItems, middleName, display names, levelToTile, middleToTile, getLevelDetails, getMiddleDetails) for the named back-end.

- `backendName` (*string*) : Back-end name; also serves as the base of the display options save file.
- **returns**: table Descriptor to pass to ui_oneshotRaceSelector_core.createBackend.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/oneshotRaceSelector/quickRaceTrackDescriptor.lua`.*

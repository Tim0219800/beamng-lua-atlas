# `editor_multiSpawnManager`

*File: `lua/ge/extensions/editor/multiSpawnManager.lua` · VM: Game Engine (GE) · 879 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_multiSpawnManager`: `extensions.load("editor_multiSpawnManager")`, then the global `editor_multiSpawnManager`

Editor tool "Vehicle Groups Manager" (Gameplay menu) to create, edit, load and save vehicle groups (.vehGroup.json files) and make them spawn in the world via core_multiSpawn. A group is of type "custom" (hand-picked list of vehicles: model, config, paints) or "generator" (parameters: amount, allMods, allConfigs, minPop, modelPopPower, configPopPower, popDecreaseFactor, maxYear, with which core_multiSpawn.createGroup generates the vehicles). The groups found in vehicleGroups/ and settings/editor/vehicleGroups/ are loaded automatically on first display.

## Example

```lua
extensions.load('editor_multiSpawnManager')
editor_multiSpawnManager.loadGroup('vehicleGroups/traffic.vehGroup.json')
editor_multiSpawnManager.onWindowMenuItem()
```

## Notes

- Spawn modes offered: road, traffic, lineAhead/Behind/Left/Right/Above, raceGrid, raceGridAlt.
- On save, the group is cleaned: "custom" groups lose generator, vehicles without a model are removed, paint tables are only kept if the paint is "(Custom)"; generator groups lose data. The old type "locked" is converted to "generator".
- saveGroup ignores its first parameter (file); only filePath is used. It assumes that options.groupListIdx designates an existing group in the list.
- The "Delete" button calls core_multiSpawn.deleteVehicles(amount); "Set Scene Vehicles to Group" replaces the group's data with core_multiSpawn.spawnedVehsToGroup().
- The spawn state (spawnState) goes back to 0 when core_multiSpawn emits onVehicleGroupSpawned (hook called with vehIds, groupId, name).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_multiSpawnManager.loadGroup(filePath)` | Reads a .vehGroup.json file, makes it the current group (after cleaning), selects its first vehicle and adds it to the groups list if it is not already there. Writes a warning to the log if the read fails. | 192 |
| `editor_multiSpawnManager.onEditorGui(dt)` | Editor hook called every frame: draws the "Vehicle Groups Manager" window (File and Tools menus, groups list, group editing, spawn options). *(internal)* *(hook)* | 757 |
| `editor_multiSpawnManager.onEditorInitialized()` | Hook called at editor initialization: registers the main window and three modal windows (generator, custom paint, group replacement) and the "Gameplay" menu entry. *(internal)* *(hook)* | 863 |
| `editor_multiSpawnManager.onVehicleGroupSpawned()` | Hook emitted by core_multiSpawn once the group has spawned; sets spawnState back to 0 (makes "Please wait..." disappear). *(internal)* *(hook)* | 853 |
| `editor_multiSpawnManager.onWindowMenuItem()` | Menu entry handler: initializes the tables if needed, clears the editor's object selection and shows the window. *(internal)* *(hook)* | 857 |
| `editor_multiSpawnManager.saveGroup(file, filePath)` | Writes the current group (processed by processGroup) to a JSON file and remembers the folder and the file path. | 223 |

### Parameter details

#### `editor_multiSpawnManager.loadGroup(filePath)`

Reads a .vehGroup.json file, makes it the current group (after cleaning), selects its first vehicle and adds it to the groups list if it is not already there. Writes a warning to the log if the read fails.

- `filePath` (*string*) : Path of the .vehGroup.json file.

#### `editor_multiSpawnManager.onEditorGui(dt)`

Editor hook called every frame: draws the "Vehicle Groups Manager" window (File and Tools menus, groups list, group editing, spawn options).

- `dt` (*number*) : Frame duration in seconds.

#### `editor_multiSpawnManager.saveGroup(file, filePath)`

Writes the current group (processed by processGroup) to a JSON file and remembers the folder and the file path.

- `file` (*any*) : Unused (inferred from code).
- `filePath` (*string*) : Destination path.

## Fields

| Field | Type | Description |
|---|---|---|
| `filePaths` | string[] | Folders explored to automatically load the groups: {"vehicleGroups/", "settings/editor/vehicleGroups/"}. Modifiable before the tool's first display. |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/multiSpawnManager.lua`.*

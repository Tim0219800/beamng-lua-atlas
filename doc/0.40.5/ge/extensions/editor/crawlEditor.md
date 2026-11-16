# `editor_crawlEditor`

*File: `lua/ge/extensions/editor/crawlEditor.lua` · VM: Game Engine (GE) · 1444 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_crawlEditor`: `extensions.load("editor_crawlEditor")`, then the global `editor_crawlEditor`

World Editor "crawl" (rock crawling) data editor, "Crawl Data Editor" window (Gameplay menu). It loads, edits and saves four kinds of objects via gameplay/crawl/saveSystem: trails (routes linking a path, a boundary and a starting position), paths (nodes), boundaries (zones) and starting positions. It also lists objects coming from missions (/gameplay/missions/<level>/crawl/<mission>/). It delegates editing to the submodules crawlEditor/paths, boundaries, trails, startingPositions, input and missionPortTool, registers four edit modes (pathEditMode, boundaryEditMode, startingPositionEditMode, trailEditMode) and permanently draws the selected nodes, boundaries and starting positions. Useful to a modder who creates crawl routes for a level or wants to read the loaded data from another extension.

## Example

```lua
extensions.load('editor_crawlEditor')
local trails = editor_crawlEditor.getAllTrails()
local p = editor_crawlEditor.getSelectedPath()
```

## Notes

- Selection indices (selectedTrailIndex...) start at 1; 0 or -1 = no selection. For trails, paths and boundaries, indices > #allX designate mission objects (missionX[index - #allX]); starting positions have no mission equivalent.
- markAsDirty(objectType, index) sets the _dirty flag on the object; its valid types are "trail", "path", "boundary" and "startingPosition". An out-of-range index is ignored without error.
- Mission objects are marked _isFromMission = true and _missionName. A trail's Save button moves the trail between the mission folder and the level folder according to the difference between isFromMission (wanted) and _isFromMission (current); moveTrailToMission is local, only moveTrailToLevel is exported.
- renameObjectFile refuses to rename if the target already exists, renames the file with FS:renameFile, updates the pathId/boundaryId/startingPositionId(/Reversed) references of the level's trails then resaves the renamed object.
- Folders: level files in /levels/<level>/crawls/ (*.trail.json, *.path.json, *.boundary.json, *.startingPosition.json); mission files in /gameplay/missions/<level>/crawl/<mission>/. Loading only happens the first time the window is opened when a level is loaded, or by calling loadAllObjects().
- onSerialize/onDeserialized preserve across Lua reloads: currentFileDir, currentFileName, crawlData, currentTab and the four selection indices.
- Inconsistency: getAllX() returns the internal (modifiable) tables; the getSelectedX() getters return nil if the index is out of range.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_crawlEditor.getAllBoundaries()` | Returns the list of level boundaries. | 1419 |
| `editor_crawlEditor.getAllMissionBoundaries()` | Returns the list of boundaries coming from missions. | 1420 |
| `editor_crawlEditor.getAllMissionPaths()` | Returns the list of paths coming from missions. | 1418 |
| `editor_crawlEditor.getAllMissionTrails()` | Returns the list of trails coming from the crawl missions of the current level. | 1416 |
| `editor_crawlEditor.getAllPaths()` | Returns the list of level paths. | 1417 |
| `editor_crawlEditor.getAllStartingPositions()` | Returns the list of starting positions. | 1421 |
| `editor_crawlEditor.getAllTrails()` | Returns the list of loaded level trails. | 1415 |
| `editor_crawlEditor.getSelectedBoundary()` | Returns the selected boundary (level or mission). | 280 |
| `editor_crawlEditor.getSelectedBoundaryIndex()` | Returns the index of the selected boundary. | 1424 |
| `editor_crawlEditor.getSelectedPath()` | Returns the selected path (level or mission). | 271 |
| `editor_crawlEditor.getSelectedPathIndex()` | Returns the index of the selected path. | 1423 |
| `editor_crawlEditor.getSelectedStartingPosition()` | Returns the selected starting position. | 289 |
| `editor_crawlEditor.getSelectedStartingPositionIndex()` | Returns the index of the selected starting position. | 1425 |
| `editor_crawlEditor.getSelectedTrail()` | Returns the selected trail (level or mission). | 262 |
| `editor_crawlEditor.getSelectedTrailIndex()` | Returns the index of the selected trail. | 1422 |
| `editor_crawlEditor.loadAllObjects()` | Reloads from disk the trails, paths, boundaries and starting positions (via saveSystem.getAll...Files / get...ById), as well as those of the crawl missions of the current level. First clears the in-memory lists. | 167 |
| `editor_crawlEditor.markAsDirty(objectType, index)` | Marks an object as modified (unsaved). | 304 |
| `editor_crawlEditor.moveTrailToLevel(trail)` | Moves a mission trail to /levels/<level>/crawls/: rewrites pathId and boundaryId to point to this folder, saves the trail, deletes the old file, then reloads everything. Fails if the trail is not from a mission, if no level is loaded or if the file already exists. | 456 |
| `editor_crawlEditor.onDeserialized(data)` | Restores the state returned by onSerialize (indices default to -1). *(internal)* *(hook)* | 860 |
| `editor_crawlEditor.onEditorGui()` | Called every frame: updates the mouse (crawlEditor/input), draws the permanent overlays (nodes, boundaries, starting positions), the window (File menu with Save All, lists on the left, details on the right, Save/Delete buttons) and the mission porting window. *(internal)* *(hook)* | 873 |
| `editor_crawlEditor.onEditorInitialized()` | Registers the "Crawl Data Editor" window (1800x900), the menu entry (Gameplay group) and the four edit modes with their auxiliary shortcuts. Called once at editor initialization. *(internal)* *(hook)* | 781 |
| `editor_crawlEditor.onSerialize()` | Serialization hook before Lua reload: returns the current folder/file name, crawlData, current tab and selection indices. *(internal)* *(hook)* | 846 |
| `editor_crawlEditor.renameObjectFile(oldFilePath, newFilePath, objectType)` | Renames the file of a crawl object and updates the trails' references. | 74 |
| `editor_crawlEditor.setSelectedBoundaryIndex(index)` | Sets the index of the selected boundary. | 1428 |
| `editor_crawlEditor.setSelectedPathIndex(index)` | Sets the index of the selected path. | 1427 |
| `editor_crawlEditor.setSelectedStartingPositionIndex(index)` | Sets the index of the selected starting position. | 1429 |
| `editor_crawlEditor.setSelectedTrailIndex(index)` | Sets the index of the selected trail without touching the other selections. | 1426 |

### Parameter details

#### `editor_crawlEditor.getAllBoundaries()`

Returns the list of level boundaries.

- **returns**: table List of boundaries

#### `editor_crawlEditor.getAllMissionBoundaries()`

Returns the list of boundaries coming from missions.

- **returns**: table List of mission boundaries

#### `editor_crawlEditor.getAllMissionPaths()`

Returns the list of paths coming from missions.

- **returns**: table List of mission paths

#### `editor_crawlEditor.getAllMissionTrails()`

Returns the list of trails coming from the crawl missions of the current level.

- **returns**: table List of mission trails

#### `editor_crawlEditor.getAllPaths()`

Returns the list of level paths.

- **returns**: table List of paths

#### `editor_crawlEditor.getAllStartingPositions()`

Returns the list of starting positions.

- **returns**: table List of starting positions

#### `editor_crawlEditor.getAllTrails()`

Returns the list of loaded level trails.

- **returns**: table List of trails (internal table)

#### `editor_crawlEditor.getSelectedBoundary()`

Returns the selected boundary (level or mission).

- **returns**: table|nil Boundary or nil

#### `editor_crawlEditor.getSelectedBoundaryIndex()`

Returns the index of the selected boundary.

- **returns**: integer Index

#### `editor_crawlEditor.getSelectedPath()`

Returns the selected path (level or mission).

- **returns**: table|nil Path or nil

#### `editor_crawlEditor.getSelectedPathIndex()`

Returns the index of the selected path.

- **returns**: integer Index

#### `editor_crawlEditor.getSelectedStartingPosition()`

Returns the selected starting position.

- **returns**: table|nil Starting position or nil

#### `editor_crawlEditor.getSelectedStartingPositionIndex()`

Returns the index of the selected starting position.

- **returns**: integer Index

#### `editor_crawlEditor.getSelectedTrail()`

Returns the selected trail (level or mission).

- **returns**: table|nil Trail or nil

#### `editor_crawlEditor.getSelectedTrailIndex()`

Returns the index of the selected trail.

- **returns**: integer Index (> 0 if selected)

#### `editor_crawlEditor.markAsDirty(objectType, index)`

Marks an object as modified (unsaved).

- `objectType` (*string*) : "trail", "path", "boundary" or "startingPosition"
- `index` (*integer*) : Global index (mission objects included except for startingPosition)

#### `editor_crawlEditor.moveTrailToLevel(trail)`

Moves a mission trail to /levels/<level>/crawls/: rewrites pathId and boundaryId to point to this folder, saves the trail, deletes the old file, then reloads everything. Fails if the trail is not from a mission, if no level is loaded or if the file already exists.

- `trail` (*table*) : Trail with _isFromMission = true
- **returns**: boolean true if moved

#### `editor_crawlEditor.onDeserialized(data)`

Restores the state returned by onSerialize (indices default to -1).

- `data` (*table|nil*) : Data from onSerialize

#### `editor_crawlEditor.onSerialize()`

Serialization hook before Lua reload: returns the current folder/file name, crawlData, current tab and selection indices.

- **returns**: table Data to restore

#### `editor_crawlEditor.renameObjectFile(oldFilePath, newFilePath, objectType)`

Renames the file of a crawl object and updates the trails' references.

- `oldFilePath` (*string*) : Old path
- `newFilePath` (*string*) : New path (must not exist)
- `objectType` (*string*) : "trail", "path", "boundary" or "startingPosition"
- **returns**: boolean true if renamed; false if identical/nil paths, existing target or failure

#### `editor_crawlEditor.setSelectedBoundaryIndex(index)`

Sets the index of the selected boundary.

- `index` (*integer*) : Index

#### `editor_crawlEditor.setSelectedPathIndex(index)`

Sets the index of the selected path.

- `index` (*integer*) : Index

#### `editor_crawlEditor.setSelectedStartingPositionIndex(index)`

Sets the index of the selected starting position.

- `index` (*integer*) : Index

#### `editor_crawlEditor.setSelectedTrailIndex(index)`

Sets the index of the selected trail without touching the other selections.

- `index` (*integer*) : Index (1 = first)

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `removeFile`, `renameFile`, `stat`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/crawlEditor.lua`.*

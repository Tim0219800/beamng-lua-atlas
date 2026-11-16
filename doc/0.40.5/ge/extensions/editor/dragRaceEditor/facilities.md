# `editor_dragRaceEditor_facilities`

*File: `lua/ge/extensions/editor/dragRaceEditor/facilities.lua` · VM: Game Engine (GE) · 394 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor_facilities`: `extensions.load("editor_dragRaceEditor_facilities")`, then the global `editor_dragRaceEditor_facilities`

Manages facilities (drag installations) in the drag race editor: list loaded via gameplay_drag_saveSystem, selection, creation, deletion, saving as <id>.facility.json in the level's dragstrips folder (with file renaming if the id changes), and ImGui panels (list, details, adding/removing strips). A facility groups strip file paths (stripIds).

## Notes

- Each facility has internal editing fields: _filePath (file path) and _dirty (modified, unsaved).
- selectFacility deselects strip and settings and writes into the current settings facilityId = "/levels/<level>/dragstrips/<id>.facility.json" (or the id alone without a level).
- In the list, facility.stripIds is assumed non-nil; the detail creates it if missing.
- drawFacilitiesPreview only writes the facility name at the origin (0,0,0).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dragRaceEditor_facilities.addFacility()` | Creates a "New Facility" facility (id new_facility_N, empty stripIds, _dirty=true), adds it and selects it. | 91 |
| `editor_dragRaceEditor_facilities.drawFacilitiesList()` | Draws the ImGui list with Add, Remove, Save, Refresh buttons; unsaved entries are shown in orange. *(internal)* | 197 |
| `editor_dragRaceEditor_facilities.drawFacilitiesPreview()` | Draws the name of the selected facility at the origin as 3D debug. *(internal)* | 386 |
| `editor_dragRaceEditor_facilities.drawFacilityDetails()` | Draws the editing UI for the selected facility: id, name, description, adding (dropdown with search) and removing strips. *(internal)* | 248 |
| `editor_dragRaceEditor_facilities.getAllFacilities()` | Returns the list of facilities. | 32 |
| `editor_dragRaceEditor_facilities.getSelectedFacility()` | Returns the selected facility. | 53 |
| `editor_dragRaceEditor_facilities.getSelectedFacilityIndex()` | Index (1-based) of the selected facility, -1 if none. | 45 |
| `editor_dragRaceEditor_facilities.hasSavedFacilities()` | Indicates whether at least one facility has a file and is not modified. | 36 |
| `editor_dragRaceEditor_facilities.loadAllFacilities()` | Loads all facilities with dragSaveSystem.getAllFacilities(), resets _dirty to false and fills in _filePath from the level's drag folder. | 18 |
| `editor_dragRaceEditor_facilities.removeSelectedFacility()` | Removes the selected facility from the list (the file on disk is not deleted) and adjusts the selection. | 111 |
| `editor_dragRaceEditor_facilities.saveAllFacilities()` | Saves all modified facilities in the level's drag folder, creating it if needed. | 125 |
| `editor_dragRaceEditor_facilities.saveFacility(facility)` | Saves a facility to <level>/<id>.facility.json. If the id changed, first renames the old file (fails if the new one already exists). | 154 |
| `editor_dragRaceEditor_facilities.selectFacility(index)` | Selects a facility: leaves zone editing, deselects strip and settings, puts facilityId in the current drag settings and marks unsaved changes. | 60 |
| `editor_dragRaceEditor_facilities.setSelectedFacilityIndex(index)` | Sets the selected index without side effects. | 49 |

### Parameter details

#### `editor_dragRaceEditor_facilities.getAllFacilities()`

Returns the list of facilities.

- **returns**: table array of facilities

#### `editor_dragRaceEditor_facilities.getSelectedFacility()`

Returns the selected facility.

- **returns**: table|nil facility or nil

#### `editor_dragRaceEditor_facilities.getSelectedFacilityIndex()`

Index (1-based) of the selected facility, -1 if none.

- **returns**: integer index

#### `editor_dragRaceEditor_facilities.hasSavedFacilities()`

Indicates whether at least one facility has a file and is not modified.

- **returns**: boolean result

#### `editor_dragRaceEditor_facilities.saveAllFacilities()`

Saves all modified facilities in the level's drag folder, creating it if needed.

- **returns**: boolean false if there is no level or the folder cannot be created, otherwise true (even if an individual save failed)

#### `editor_dragRaceEditor_facilities.saveFacility(facility)`

Saves a facility to <level>/<id>.facility.json. If the id changed, first renames the old file (fails if the new one already exists).

- `facility` (*table*) : facility to save
- **returns**: boolean success

#### `editor_dragRaceEditor_facilities.selectFacility(index)`

Selects a facility: leaves zone editing, deselects strip and settings, puts facilityId in the current drag settings and marks unsaved changes.

- `index` (*integer*) : 1-based index

#### `editor_dragRaceEditor_facilities.setSelectedFacilityIndex(index)`

Sets the selected index without side effects.

- `index` (*integer*) : 1-based index

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `renameFile`
- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor/facilities.lua`.*

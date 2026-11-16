# `editor_sitesEditor`

*File: `lua/ge/extensions/editor/sitesEditor.lua` · VM: Game Engine (GE) · 404 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_sitesEditor`: `extensions.load("editor_sitesEditor")`, then the global `editor_sitesEditor`

Editor for 'sites' files (*.sites.json): locations, zones and parking spots (parkingSpots), with their tags. It opens the 'Sites: Locations and Zones Editor' window with a File menu (New, Load, Save, Save as, Sites in Manager) and a Tools menu (sort by name, spot numbering, naming by zone), and one tab per sub-editor (editor/sitesEditor/*). It creates the 'Edit Sites' edit mode. A map modder uses it to place locations and parking spots.

## Notes

- Default files: current mission folder or /gameplay/sites/, name newSite.sites.json.
- Tools menu: 'Enumerate Parking Spots' suffixes duplicate names with a counter (1 to 4 digits depending on the count); 'Parkingspot Names by Zone Containment' renames each spot with the name of the last zone that contains it (can be slow).
- BUG: M.onExtensionLoaded = onExtensionLoaded references a local variable that is never defined, so M.onExtensionLoaded is nil.
- Internal windows: Locations, Zones, Parking Spots, Location Tags, Zone Tags, Parking Spot Tags.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_sitesEditor.allowGizmo()` | Tells whether the active edit mode is 'Edit Sites' (hence whether gizmos and clicks are allowed). | 387 |
| `editor_sitesEditor.getCurrentLocation()` | Returns the location selected in the Locations tab. | 389 |
| `editor_sitesEditor.getCurrentParkingSpot()` | Returns the parking spot selected in the Parking Spots tab. | 391 |
| `editor_sitesEditor.getCurrentSites()` | Returns the sites object being edited. | 388 |
| `editor_sitesEditor.getCurrentZone()` | Returns the zone selected in the Zones tab. | 390 |
| `editor_sitesEditor.loadSites(loadPath)` | Loads a sites file via gameplay_sites_sitesManager.loadSites, makes it current, passes it to all sub-editors and resets their selection. | 30 |
| `editor_sitesEditor.managerSites()` | Draws the 'Sites in Manager...' submenu: list of the sites per level and those of /gameplay, with Refresh, and loads the chosen one. | 216 |
| `editor_sitesEditor.onDeserialized(data)` | Restore hook after a Lua reload: reinjects data.path into the current sites. *(internal)* *(hook)* | 364 |
| `editor_sitesEditor.onEditorGui()` | Hook called every frame of the editor UI: draws the window, the menus, the tabs, updates the mouse info (camera ray) and draws the sites in debug. *(internal)* *(hook)* | 79 |
| `editor_sitesEditor.onEditorInitialized()` | Editor initialization hook: registers the window, the sitesEditMode edit mode, the menu entry (Gameplay group) and creates the six sub-editors. *(internal)* *(hook)* | 307 |
| `editor_sitesEditor.onEditorToolWindowGotFocus(windowName)` | Hook: if the tool window gains focus, activates the sitesEditMode edit mode. *(internal)* *(hook)* | 378 |
| `editor_sitesEditor.onEditorToolWindowHide(windowName)` | Hook: if the tool window is hidden, goes back to objectSelect mode. *(internal)* *(hook)* | 372 |
| `editor_sitesEditor.onSerialize()` | Serialization hook (Lua reload): returns {path = serialization of the current sites}. *(internal)* *(hook)* | 357 |
| `editor_sitesEditor.saveSites(sites, savePath)` | Serializes a sites object and writes it as JSON to the given path; updates sites.dir and sites.name and remembers the folder as the last path. | 21 |
| `editor_sitesEditor.selectZone(elem, mode)` | Selects a zone in the Zones tab (used by the click in the world). | 392 |
| `editor_sitesEditor.show()` | Clears the object selection, shows the tool window and activates the sitesEditMode edit mode. | 284 |

### Parameter details

#### `editor_sitesEditor.allowGizmo()`

Tells whether the active edit mode is 'Edit Sites' (hence whether gizmos and clicks are allowed).

- **returns**: boolean true if Edit Sites mode is active.

#### `editor_sitesEditor.getCurrentLocation()`

Returns the location selected in the Locations tab.

- **returns**: table|nil Selected location or nil.

#### `editor_sitesEditor.getCurrentParkingSpot()`

Returns the parking spot selected in the Parking Spots tab.

- **returns**: table|nil Selected spot or nil.

#### `editor_sitesEditor.getCurrentSites()`

Returns the sites object being edited.

- **returns**: table Current sites.

#### `editor_sitesEditor.getCurrentZone()`

Returns the zone selected in the Zones tab.

- **returns**: table|nil Selected zone or nil.

#### `editor_sitesEditor.loadSites(loadPath)`

Loads a sites file via gameplay_sites_sitesManager.loadSites, makes it current, passes it to all sub-editors and resets their selection.

- `loadPath` (*string*) : Path of the .sites.json file.
- **returns**: table The current sites (the old object if loading failed).

#### `editor_sitesEditor.onDeserialized(data)`

Restore hook after a Lua reload: reinjects data.path into the current sites.

- `data` (*table*) : Data returned by onSerialize.

#### `editor_sitesEditor.onEditorToolWindowGotFocus(windowName)`

Hook: if the tool window gains focus, activates the sitesEditMode edit mode.

- `windowName` (*string*) : Window name.

#### `editor_sitesEditor.onEditorToolWindowHide(windowName)`

Hook: if the tool window is hidden, goes back to objectSelect mode.

- `windowName` (*string*) : Name of the hidden window.

#### `editor_sitesEditor.onSerialize()`

Serialization hook (Lua reload): returns {path = serialization of the current sites}.

- **returns**: table Data to restore.

#### `editor_sitesEditor.saveSites(sites, savePath)`

Serializes a sites object and writes it as JSON to the given path; updates sites.dir and sites.name and remembers the folder as the last path.

- `sites` (*table*) : Sites object (gameplay/sites/sites).
- `savePath` (*string*) : Full path of the .sites.json file.

#### `editor_sitesEditor.selectZone(elem, mode)`

Selects a zone in the Zones tab (used by the click in the world).

- `elem` (*integer*) : Zone id (inferred from code).
- `mode` (*string|nil*) : 'toggle' to toggle, nil to replace the selection.

## Fields

| Field | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Exported field but always nil (local variable not defined in the file). ⚠ reference `onExtensionLoaded` not defined in the file (probably nil) |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/sitesEditor.lua`.*

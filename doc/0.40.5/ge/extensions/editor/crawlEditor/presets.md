# `editor_crawlEditor_presets`

*File: `lua/ge/extensions/editor/crawlEditor/presets.lua` · VM: Game Engine (GE) · 979 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/crawlEditor/presets")` (file under extensions/ but not a regular extension)

Preset and component manager of the Crawl editor (trails, boundaries, paths/pathnodes). The module returns a class C (constructor) and is not a classic extension. Presets are stored in one JSON file per level (/levels/<level>/crawls/presets.json, or settings/cloud/crawls/presets.json if no level is loaded); "components" are delegated to the gameplay/crawl/saveSystem module. Also provides the ImGui "Components" menu and the save/management dialogs.

## Notes

- The presets file path (self.PRESETS_FILE) is computed only once in init() from the current level; if the level changes, the object must be recreated.
- The save/delete/import/export functions return (boolean, path|nil); the load*Preset functions return (object|nil, file path|nil).
- A stored preset is a table {name, category, data, created, modified}; category is "trails", "boundaries" or "pathnodes" (self.PRESET_CATEGORIES).
- Individual export/import file: expected extension self.PRESET_EXTENSION = ".preset.json".

## Class `C`

Presets object of the Crawl editor. Main fields: presets (categories + metadata), PRESETS_FILE, PRESET_CATEGORIES, showSave*Dialog, showPresetManager(Ptr), *PresetName (256-character ImGui buffers).

The module returns a constructor: `local obj = require("editor_crawlEditor_presets")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:deleteBoundaryComponent(id)` | Deletes a boundary component via saveSystem. | 632 |
| `C:deleteBoundaryPreset(name)` | Deletes the boundary preset and saves the file. Returns false, nil if the preset does not exist. | 469 |
| `C:deletePathnodeComponent(id)` | Deletes a path component via saveSystem. | 636 |
| `C:deletePathnodePreset(name)` | Deletes the path preset and saves the file. | 484 |
| `C:deleteTrailComponent(id)` | Deletes a trail component via saveSystem. | 628 |
| `C:deleteTrailPreset(name)` | Deletes the trail preset and saves the file. | 499 |
| `C:drawDialogs()` | Draws the ImGui save windows (boundary, path, trail) and the component manager; called every frame by the Crawl editor. | 791 |
| `C:drawMenu(crawlData, trails, waypoints)` | Draws the ImGui submenus listing the trail, boundary and path components (click = load into crawlData) and the "Manage Components..." entry. Stores crawlData, trails and waypoints for the dialogs. | 697 |
| `C:exportPreset(category, name, filepath)` | Writes a preset (complete table) to an independent JSON file. | 640 |
| `C:getAllBoundaryComponents()` | Lists the boundary components of the current level via saveSystem. | 543 |
| `C:getAllPathnodeComponents()` | Lists the path components of the current level via saveSystem. | 548 |
| `C:getAllTrailComponents()` | Lists the trail components of the current level via saveSystem (folder /levels/<level>/crawls/). | 538 |
| `C:getBoundaryPresetName()` | Returns the ImGui buffer (256 characters) of the name entered for a boundary. | 693 |
| `C:getBoundaryPresets()` | Lists the boundary presets as an array {name, preset} (order not guaranteed, from pairs). | 514 |
| `C:getPathnodePresetName()` | Returns the ImGui buffer of the name entered for a path. | 694 |
| `C:getPathnodePresets()` | Lists the path presets as {name, preset}. | 522 |
| `C:getShowPresetManager()` | Indicates whether the component management window is displayed. | 687 |
| `C:getShowPresetManagerPtr()` | Returns the ImGui BoolPtr linked to the management window. | 692 |
| `C:getShowSaveBoundaryDialog()` | Indicates whether the boundary save dialog is displayed. | 681 |
| `C:getShowSavePathnodeDialog()` | Indicates whether the path save dialog is displayed. | 683 |
| `C:getShowSaveTrailDialog()` | Indicates whether the trail save dialog is displayed. | 685 |
| `C:getTrailPresetName()` | Returns the ImGui buffer of the name entered for a trail. | 695 |
| `C:getTrailPresets()` | Lists the trail presets as {name, preset}. | 530 |
| `C:importPreset(filepath, category)` | Reads a preset file, checks name, category and data, adds it to the category (overwrites a preset of the same name) and saves. | 657 |
| `C:init()` | Initializes the empty presets table, the dialog states and the ImGui buffers, computes the presets file path for the current level then calls loadPresets(). | 36 |
| `C:loadBoundaryComponent(id)` | Loads a boundary component by id via saveSystem. | 558 |
| `C:loadBoundaryPreset(name)` | Validates then deserializes the named boundary preset. | 400 |
| `C:loadPathnodeComponent(id)` | Loads a path component by id via saveSystem. | 563 |
| `C:loadPathnodePreset(name)` | Validates then deserializes the named path preset. | 423 |
| `C:loadPresets()` | Reads the presets JSON file; if it does not exist, immediately writes an empty file via savePresets(). | 280 |
| `C:loadTrailComponent(id)` | Loads a trail component by id via saveSystem. | 553 |
| `C:loadTrailPreset(name)` | Validates then deserializes the named trail preset. | 446 |
| `C:saveBoundaryComponent(name, boundary)` | Renames the boundary then records it as a component via saveSystem. | 588 |
| `C:saveBoundaryPreset(name, boundary)` | Serializes a boundary (boundary:onSerialize) and records it as a preset of category boundaries, then saves the file. Fails if the name is empty or the boundary has no vertex. | 307 |
| `C:savePathnodeComponent(name, path)` | Renames the path then records it as a component via saveSystem. | 608 |
| `C:savePathnodePreset(name, path)` | Records a path (name, description, nodes with position, rotation, default radius 6.0, flags) as a pathnodes preset. | 338 |
| `C:savePresets()` | Updates the modification date, creates the folder if needed (FS:directoryCreate) and writes the whole presets file. | 289 |
| `C:saveTrailComponent(name, trail)` | Renames the trail (trail.name = name) then records it as a component via saveSystem. | 568 |
| `C:saveTrailPreset(name, trail)` | Serializes a complete trail (path + boundary) and records it as a trails preset. | 369 |
| `C:setShowPresetManager(show)` | Shows/hides the management window and synchronizes the ImGui pointer. | 688 |
| `C:setShowSaveBoundaryDialog(show)` | Shows/hides the boundary save dialog. | 682 |
| `C:setShowSavePathnodeDialog(show)` | Shows/hides the path save dialog. | 684 |
| `C:setShowSaveTrailDialog(show)` | Shows/hides the trail save dialog. | 686 |

## Calls into the engine (C++)

- `FS:` `directoryCreate`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/crawlEditor/presets.lua`.*

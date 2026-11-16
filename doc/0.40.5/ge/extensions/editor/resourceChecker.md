# `editor_resourceChecker`

*File: `lua/ge/extensions/editor/resourceChecker.lua` · VM: Game Engine (GE) · 1841 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_resourceChecker`: `extensions.load("editor_resourceChecker")`, then the global `editor_resourceChecker`

Editor "Resources Checker" window (Assets menu) to audit the current level's resources. Three tabs: "Materials Verification" (material version, duplicates, pid removal, PNG conversion, verification of texture maps/files, missing or dummy materials), "Resources Explorer" (loaded TSStatics, ForestItems, terrains, used or unused materials/meshes/textures, collision data) and "Asset Stats" (file scan, treemap and list by size). Also allows image preview, resolving duplicates and deleting unused files. The heavy computations are done by resourceUtil (extensions.editor_resourceChecker_resourceUtil) which returns its results through jobData.

## Notes

- resourceUtil is read at file initialization (extensions.editor_resourceChecker_resourceUtil): it is nil if that extension is not already loaded at that moment.
- jobData(type, data): type 2 stores the material checker result, type 3 that of the resources explorer; the other types are ignored.
- onEditorActivated and onEditorDeactivated are empty.
- Some actions of this panel delete level files ("Remove selected files", "Remove all unused files"): use with caution.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_resourceChecker.jobData(type, data)` | Receives the result of an asynchronous resourceUtil job and stores it for display. *(internal)* | 1805 |
| `editor_resourceChecker.onEditorActivated()` | Hook on editor activation; empty. *(internal)* *(hook)* | 1818 |
| `editor_resourceChecker.onEditorDeactivated()` | Hook on editor deactivation; empty. *(internal)* *(hook)* | 1822 |
| `editor_resourceChecker.onEditorGui()` | Hook: draws the tabbed window, the image preview and the duplicate resolver. *(internal)* *(hook)* | 1778 |
| `editor_resourceChecker.onEditorInitialized()` | Hook: adds the "Resources Checker" menu entry (Assets group) and registers the three windows (main, image preview, duplicates). *(internal)* *(hook)* | 1826 |
| `editor_resourceChecker.onWindowMenuItem()` | Shows the "resourceChecker" window (called by the menu entry). *(internal)* *(hook)* | 17 |
| `editor_resourceChecker.updateDuplicateTable(data)` | Replaces the duplicates table displayed in the duplicate resolver. *(internal)* | 1814 |

### Parameter details

#### `editor_resourceChecker.jobData(type, data)`

Receives the result of an asynchronous resourceUtil job and stores it for display.

- `type` (*integer*) : 2 = material verification results, 3 = resources explorer results.
- `data` (*any*) : Job data.

#### `editor_resourceChecker.updateDuplicateTable(data)`

Replaces the duplicates table displayed in the duplicate resolver.

- `data` (*table*) : Duplicates table computed by resourceUtil (inferred from code).

## Calls into the engine (C++)

- `FS:` `fileExists`, `stat`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/resourceChecker.lua`.*

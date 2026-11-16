# `editor_roadArchitect_importFile`

*File: `lua/ge/extensions/editor/roadArchitect/importFile.lua` · VM: Game Engine (GE) · 136 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_importFile`: `extensions.load("editor_roadArchitect_importFile")`, then the global `editor_roadArchitect_importFile`

File import utilities for Road Architect, designed for headless use (tech/BeamNGpy bridge). They read a file from a virtual or native path, copy it if needed into /temp/roadArchitectImport, prepare the editor APIs (history, preferences) without opening the UI, then finalize the roads (DecalRoads, collisions, navgraph).

## Example

```lua
local imp = extensions.editor_roadArchitect_importFile
local chemin, stage = imp.stageText('C:/x/route.json', contenu)
local data = imp.readTextFile(chemin)
imp.ensureEditorHistory()
imp.maybeFinalise({finalize = true})
```

## Notes

- readTextFile tries in order: readFile with normalized separators, readFile with the raw path, FS:native2Virtual conversion, then io.open in binary mode.
- stageText copies nothing if fileContent is nil or empty: it then returns the original path and false.
- maybeFinalise returns false, nil when options.finalize is not exactly true, doing nothing.
- ensureEditorHistory raises an error (error) if editor_main, editor.history or editor.getPreference remain unavailable.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_importFile.ensureEditorHistory()` | Prepares the World Editor APIs needed for import and finalization without opening the UI: loads editor_main if needed, calls editor.initializeModules to create the history, then editor.ensurePreferencesApi or editor.loadPreferences for the preferences (needed by roadRiver.getPreference when finalizing DecalRoads). | 84 |
| `editor_roadArchitect_importFile.maybeFinalise(options)` | If options.finalize is true, places the DecalRoads and meshes, reloads collisions and rebuilds the navgraph, like the Render/finalise toggle of Road Architect. Already finalized ("Road Architect" object exists): first calls roads.unfinalise() to avoid duplicates. | 114 |
| `editor_roadArchitect_importFile.readTextFile(filePath)` | Reads the content of a file from an absolute virtual or native path. Tries readFile, the native-to-virtual conversion, then io.open in binary. Returns nil if the path is invalid or the file is not found. | 16 |
| `editor_roadArchitect_importFile.stageText(filePath, fileContent)` | Writes the given content to /temp/roadArchitectImport/<file name> (folder created if needed) so that the game can read it in its virtual file system. Converts fileContent to a string with tostring if it is not one. Raises an error if the write fails. | 60 |

### Parameter details

#### `editor_roadArchitect_importFile.maybeFinalise(options)`

If options.finalize is true, places the DecalRoads and meshes, reloads collisions and rebuilds the navgraph, like the Render/finalise toggle of Road Architect. Already finalized ("Road Architect" object exists): first calls roads.unfinalise() to avoid duplicates.

- `options` (*table|nil*) : Import options; only the finalize field (boolean) is read.
- **returns**: boolean true if finalization took place.
- **returns**: string|nil Error message, for example "finalize requires a loaded level (MissionGroup missing)".

#### `editor_roadArchitect_importFile.readTextFile(filePath)`

Reads the content of a file from an absolute virtual or native path. Tries readFile, the native-to-virtual conversion, then io.open in binary. Returns nil if the path is invalid or the file is not found.

- `filePath` (*string*) : Virtual or native path (backslashes are normalized to /).
- **returns**: string|nil File content, or nil.

#### `editor_roadArchitect_importFile.stageText(filePath, fileContent)`

Writes the given content to /temp/roadArchitectImport/<file name> (folder created if needed) so that the game can read it in its virtual file system. Converts fileContent to a string with tostring if it is not one. Raises an error if the write fails.

- `filePath` (*string*) : Original path, of which only the file name is kept (import.bin by default).
- `fileContent` (*string|nil*) : Content to write; if nil or empty, nothing is written.
- **returns**: string Usable path: the staged file, or filePath if nothing was written.
- **returns**: boolean true if the file was staged.

## Calls into the engine (C++)

- `FS:` `directoryCreate`, `native2Virtual`
- `scenetree.` `findObject`

**Loads extensions:** `editor_main`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/importFile.lua`.*

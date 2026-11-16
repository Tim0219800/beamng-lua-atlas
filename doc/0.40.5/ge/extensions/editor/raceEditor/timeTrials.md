# `editor_raceEditor_timeTrials`

*File: `lua/ge/extensions/editor/raceEditor/timeTrials.lua` · VM: Game Engine (GE) · 250 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/raceEditor/timeTrials")` (file under extensions/ but not a regular extension)

"Time Trials" sub-window of the race editor: track metadata (name, description, authors, difficulty Easy/Medium/Hard/Very Hard), classification flags (Reversible, Rolling Start, computed by path:classify()), presence of a preview image <name>.jpg next to the race file, and three prefab lists (prefabs, forwardPrefabs, reversePrefabs) to load with the track. Each change goes through editor.history. The module returns a constructor: require('/lua/ge/extensions/editor/raceEditor/timeTrials')(raceEditor).

## Notes

- Difficulty: stored as an integer; the list choice writes (i-1)*25+12 (12, 37, 62, 87); the display reverses it with floor(d/25)+1 clamped between 1 and 4.
- Automatic prefab: <file name>.prefab, <name>_forward.prefab, <name>_reverse.prefab (loaded if they exist). Forward prefabs only load in the normal direction, reverse ones only in the reverse direction (code tooltips).
- Bug: in C:existsIcon, "local levelPath" is redeclared inside the "if lvl" block, which shadows the outer variable; the inPathFolder parameter therefore has no effect and the tested path stays the race path folder.
- In prefabData, the name of the third group displays "ReversePrefabs" with a leading space (typo).

## Class `C`

Time Trials window (windowDescription = 'Time Trials'). Instantiated with init(raceEditor); the module is stored in self.pathEditor.

The module returns a constructor: `local obj = require("editor_raceEditor_timeTrials")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:changeField(field, new, add)` | If the new value differs from path[field], commits a history action that modifies this path field. | 65 |
| `C:displayClassification(classification, name, field, tt)` | Displays a "name:" line with a check or cross icon depending on classification[field]. | 148 |
| `C:draw()` | Called every frame: draws the general information. | 58 |
| `C:drawGeneralInfo()` | Draws the whole form: text fields, difficulty, classification, preview indicator (hover = image, click = refresh) and prefab lists. | 74 |
| `C:drawPrefabs(fieldName, default)` | Draws the prefab list of a field: read-only automatic entry, then for each prefab delete, input, file picker and existence icon, and an Add button. | 195 |
| `C:existsIcon(f, inPathFolder)` | Displays a check icon (file found) or error icon (not found) for a prefab, testing several paths (with/without .prefab, .prefab.json, .json, level or path folder). The tooltip lists the file found or the paths tried. | 159 |
| `C:findPreview()` | Looks for <folder><file name>.jpg; if present, loads it as the preview texture, otherwise clears the preview. | 48 |
| `C:init(raceEditor)` | Stores the raceEditor module in self.pathEditor. | 24 |
| `C:selected()` | Reloads name, description, authors and prefab lists from the path, then looks for the preview image. | 32 |
| `C:setPath(path)` | Sets the race path being edited and reloads the window fields (calls selected()). | 28 |
| `C:unselect()` | Called when the tab is left; does nothing. | 56 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/raceEditor/timeTrials.lua`.*

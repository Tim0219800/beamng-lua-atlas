# `editor_levelValidator`

*File: `lua/ge/extensions/editor/levelValidator.lua` · VM: Game Engine (GE) · 993 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_levelValidator`: `extensions.load("editor_levelValidator")`, then the global `editor_levelValidator`

Editor "Level Validator" tool (Window > Debug menu). The "Find issues" button starts a job that searches the level for duplicated objects, floating objects (not planted on the terrain), misconfigured splines (fewer than 2 nodes) and zero or near-zero scales, for scene objects and forest items. The results are sortable, ignorable, and some are fixable (deleting duplicates, no undo possible). The results can be read by other modules via getLevelLogs.

## Example

```lua
editor_levelValidator.startLevelValidation()
local agg = editor_levelValidator.getLevelLogsAggregated()
```

## Notes

- Preference levelValidator.general.extendedLogs: displays additional errors in the list.
- In startLevelValidation, getLevelLogs() is called but this local function is defined further down in the file (line ~894): at that point the global getLevelLogs is targeted, hence nil. With extendedLogs enabled, the call fails (probable game bug).
- Log levels: I, W, E, D. Internal types: duplicate, floating, spline, scale.
- onEditorAfterSaveLevel is empty (the automatic call to startLevelValidation is commented out).

**Dependencies (loaded first):** `core_forest`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_levelValidator.getLevelLogs()` | Returns the raw list of issues found (entries with logLevel, type, objectId, message...). | 894 |
| `editor_levelValidator.getLevelLogsAggregated()` | Returns the issues grouped by readable type (Duplicated Object, Floating Object, Spline Misconfigured, Duplicated Forest Item, Floating Forest Item, and "Zero or Near-Zero Scale"). Each entry is enriched with the object's name and position, and a camera position/rotation (15 m behind the object). | 897 |
| `editor_levelValidator.onClientStartMission()` | Called when a level starts: resets the terrain dimensions, the logs and the check state. *(internal)* *(hook)* | 876 |
| `editor_levelValidator.onEditorAfterSaveLevel(state)` | Called after the level is saved. Empty body. *(internal)* *(hook)* | 884 |
| `editor_levelValidator.onEditorGui()` | Draws the tool window (Find issues button, filterable and sortable list, actions). *(internal)* *(hook)* | 578 |
| `editor_levelValidator.onEditorInitialized()` | Registers the "levelValidator" window and the "Level Validator" menu entry (Debug group). *(internal)* *(hook)* | 856 |
| `editor_levelValidator.onEditorPreferenceValueChanged(path, value)` | If extendedLogs changes, clears the results and resets the check state. *(internal)* *(hook)* | 888 |
| `editor_levelValidator.onEditorRegisterPreferences(prefsRegistry)` | Registers the levelValidator.general preferences category (extendedLogs, hidden columnSizes). *(internal)* *(hook)* | 865 |
| `editor_levelValidator.onExtensionLoaded()` | Load hook: writes a Debug log "initialized". *(internal)* *(hook)* | 861 |
| `editor_levelValidator.startLevelValidation()` | Starts the level validation in a job (core_jobsystem, period 0.04) and sets the state to "search in progress". | 567 |

### Parameter details

#### `editor_levelValidator.getLevelLogs()`

Returns the raw list of issues found (entries with logLevel, type, objectId, message...).

- **returns**: table levelLogs.

#### `editor_levelValidator.getLevelLogsAggregated()`

Returns the issues grouped by readable type (Duplicated Object, Floating Object, Spline Misconfigured, Duplicated Forest Item, Floating Forest Item, and "Zero or Near-Zero Scale"). Each entry is enriched with the object's name and position, and a camera position/rotation (15 m behind the object).

- **returns**: table {elementsByType = {[i] = {type, count, elements}}}.

#### `editor_levelValidator.onEditorAfterSaveLevel(state)`

Called after the level is saved. Empty body.

- `state` (*any*) : Not used.

#### `editor_levelValidator.onEditorPreferenceValueChanged(path, value)`

If extendedLogs changes, clears the results and resets the check state.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_levelValidator.onEditorRegisterPreferences(prefsRegistry)`

Registers the levelValidator.general preferences category (extendedLogs, hidden columnSizes).

- `prefsRegistry` (*table*) : Editor preferences registry.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {"core_forest"}. |

## Class `sortingFunctions`

Sort comparators for the result list columns (a and b are two log entries).

| Method | Description | Line |
|---|---|---|
| `sortingFunctions.Code(a, b)` | Sort by uniqueErrorCode (0 if absent). | 45 |
| `sortingFunctions.Description(a, b)` | Sort by message. | 51 |
| `sortingFunctions.File(a, b)` | Sort by filename field. | 71 |
| `sortingFunctions.Line(a, b)` | Sort by lineNumber field (0 if absent). | 77 |
| `sortingFunctions.LogLevel(a, b)` | Sort by logLevel (string). | 39 |
| `sortingFunctions.ObjectName(a, b)` | Sort by the name of object a.object (empty string if absent). | 63 |
| `sortingFunctions.Origin(a, b)` | Sort by origin field (empty string if absent). | 57 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onLevelValidationFinished`

## Calls into the engine (C++)

- `Sim.` `deserializeObjectsFromText`, `findObjectById`
- `obj:` `deleteObject`, `getId`, `getWorldBox`, `isSubClassOf`, `serialize`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/levelValidator.lua`.*

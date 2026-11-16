# `career_modules_log`

*File: `lua/ge/extensions/career/modules/log.lua` · VM: Game Engine (GE) · 42 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_log`: `extensions.load("career_modules_log")`, then the global `career_modules_log`

Small text log of the career. Modules call addLog to accumulate lines in memory; on each profile save, the lines are appended (append mode) to the career.log file of the save slot, then the list is emptied.

## Notes

- Line format: timestamp os.time()|severity|origin|message. Default severity "I", default origin empty string.
- The in-memory list is emptied on career activation (onCareerActive): lines not saved before are lost.

**Dependencies (loaded first):** `career_saveSystem`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_log.addLog(message, origin, severity)` | Adds a line to the in-memory log (written to career.log at the next save). | 11 |
| `career_modules_log.onCareerActive(active)` | Hook called when career becomes active: empties the list and adds "Loaded game <path>". *(internal)* *(hook)* | 30 |
| `career_modules_log.onSaveCurrentProfile(currentSavePath)` | Hook called when the profile is saved: adds a "Save game to ..." line then writes (append) all the lines to <saveRoot>/<slot>/career.log and empties the list. *(internal)* *(hook)* | 15 |

### Parameter details

#### `career_modules_log.addLog(message, origin, severity)`

Adds a line to the in-memory log (written to career.log at the next save).

- `message` (*string*) : Message text.
- `origin` (*string|nil*) : Name of the emitting module ("" by default).
- `severity` (*string|nil*) : Severity, "I" by default (the value is not validated).

#### `career_modules_log.onCareerActive(active)`

Hook called when career becomes active: empties the list and adds "Loaded game <path>".

- `active` (*boolean*) : true on activation; nothing is done if false.

#### `career_modules_log.onSaveCurrentProfile(currentSavePath)`

Hook called when the profile is saved: adds a "Save game to ..." line then writes (append) all the lines to <saveRoot>/<slot>/career.log and empties the list.

- `currentSavePath` (*string*) : Path of the current save.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_saveSystem. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/log.lua`.*

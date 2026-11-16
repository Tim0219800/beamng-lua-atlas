# `career_modules_playbookWriter`

*File: `lua/ge/extensions/career/modules/playbookWriter.lua` · VM: Game Engine (GE) · 52 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_playbookWriter`: `extensions.load("career_modules_playbookWriter")`, then the global `career_modules_playbookWriter`

Records the history of played missions (missionId and stars) in playbook.json in the save's career folder. Loaded only when the career is active.

## Notes

- The file is ignored (empty list) if the save's info.json has a version < moduleVersion (42).
- The list is never read by this module: it only appends and saves.

**Dependencies (loaded first):** `career_career`

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_playbookWriter.addMissionPlayedEntry(missionId, stars)` | Appends {missionId, stars} to the end of the in-memory playbook. | 14 |
| `career_modules_playbookWriter.onCareerActive(active)` | Hook: reloads the playbook when the career becomes active. *(internal)* *(hook)* | 37 |
| `career_modules_playbookWriter.onExtensionLoaded()` | Hook on extension load: loads the playbook if the career is active (returns false otherwise). *(internal)* *(hook)* | 32 |
| `career_modules_playbookWriter.onSaveCurrentProfile(currentSavePath)` | Save hook: writes the playbook to <save>/career/playbook.json. *(internal)* *(hook)* | 43 |

### Parameter details

#### `career_modules_playbookWriter.addMissionPlayedEntry(missionId, stars)`

Appends {missionId, stars} to the end of the in-memory playbook.

- `missionId` (*string*) : Mission identifier.
- `stars` (*any*) : Result in stars (inferred from code).

#### `career_modules_playbookWriter.onCareerActive(active)`

Hook: reloads the playbook when the career becomes active.

- `active` (*boolean*) : Nothing if false.

#### `career_modules_playbookWriter.onSaveCurrentProfile(currentSavePath)`

Save hook: writes the playbook to <save>/career/playbook.json.

- `currentSavePath` (*string*) : Save folder.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: career_career. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/playbookWriter.lua`.*

# `editor_missionPlaybook`

*File: `lua/ge/extensions/editor/missionPlaybook.lua` · VM: Game Engine (GE) · 471 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_missionPlaybook`: `extensions.load("editor_missionPlaybook")`, then the global `editor_missionPlaybook`

"Mission Playbook" editor extension (Missions menu). A playbook is a list of instructions (book.instructions) replayed on a career slot to test mission unlocking: each missionAttempt instruction gives a mission and the stars obtained, and is run via gameplay_missions_progress.generateAttempt. After each step, the hook onPlaybookLogAfterStep is emitted so the viewers (attributes, unlocked missions, tree) record their state in book.results. The window lets you save/load a playbook (.missionPlaybook.json, missionPlaybooks/ folder), replay on the current slot or an empty slot (playbookTestingSlot) and automatically generate playbooks (all missions, by tier, by branch, default or bonus stars).

## Example

```lua
extensions.load('editor_missionPlaybook')
editor_missionPlaybook.book.instructions[#editor_missionPlaybook.book.instructions+1] = {type = 'missionAttempt', missionId = 'italy/delivery/001-mattress', stars = {piecesBronze = true}}
editor_missionPlaybook.show()
```

## Notes

- The "Run" and "Util" menu entries are disabled as long as the career is not active (career_career.isActive()); you must load the career manually once first.
- "Clear Testing Slot" and "Play with Empty Slot" deactivate the career, DELETE the playbookTestingSlot profile (career_saveSystem.removeProfile) then recreate it.
- Bug: in the Load menu, a load failure assigns M.book = M.book.instructions (a list of instructions, not a book), which breaks M.book.page and M.book.results; "or M.book" is probably missing.
- onEditorRegisterPreferences does nothing (commented-out code).
- The generation (generateAndPlaybook) really runs the attempts on the current slot's progress, up to 10000 steps or until no stars are left; it modifies the career save.
- Debug code (dump) remains active in play and getAllRemainingStarCombos.

**Dependencies (loaded first):** `gameplay_missions_missions`, `editor_missionPlaybook_attributeViewer`, `editor_missionPlaybook_unlockedMissionsViewer`, `editor_missionPlaybook_missionTreeViewer`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_missionPlaybook.drawBookViewer()` | Draws the page slider (1 to #book.results) and the "Condensed" checkbox. Called by onEditorGui. *(internal)* | 430 |
| `editor_missionPlaybook.onDeserialized(data)` | Restores book and condensed after an extensions reload. *(internal)* *(hook)* | 454 |
| `editor_missionPlaybook.onEditorGui()` | Editor hook called every frame: draws the "Mission Playbook" window (File, Util, Run, Generate menus, list of instructions with Up/Down/Remove buttons outside condensed mode, "Add..." button). *(internal)* *(hook)* | 251 |
| `editor_missionPlaybook.onEditorInitialized()` | Hook called when the editor is initialized: registers the window (1500x700) and the "Missions" menu entry. *(internal)* *(hook)* | 408 |
| `editor_missionPlaybook.onEditorRegisterPreferences(prefsRegistry)` | Editor preferences registration hook; empty. *(internal)* *(hook)* | 415 |
| `editor_missionPlaybook.onSerialize()` | Called when the Lua extensions are reloaded: returns {book, condensed} to save the state. *(internal)* *(hook)* | 446 |
| `editor_missionPlaybook.show()` | Shows the "Mission Playbook" window. | 403 |

### Parameter details

#### `editor_missionPlaybook.onDeserialized(data)`

Restores book and condensed after an extensions reload.

- `data` (*table|nil*) : Data returned by onSerialize.

#### `editor_missionPlaybook.onEditorRegisterPreferences(prefsRegistry)`

Editor preferences registration hook; empty.

- `prefsRegistry` (*table*) : Preferences registry.

#### `editor_missionPlaybook.onSerialize()`

Called when the Lua extensions are reloaded: returns {book, condensed} to save the state.

- **returns**: table Data to keep.

## Fields

| Field | Type | Description |
|---|---|---|
| `book` | table | Current book: {page = integer, instructions = table[], results = table[]}. Serialized by onSerialize. |
| `dependencies` | string[] | Extensions loaded before: gameplay_missions_missions and the three playbook viewers. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onPlaybookLogAfterStep` — listened to by 3 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/missionPlaybook.lua`.*

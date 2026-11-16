# `editor_vehicleEditor_staticEditor_veJBeamSpellchecker`

*File: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua` · VM: Game Engine (GE) · 484 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_staticEditor_veJBeamSpellchecker`: `extensions.load("editor_vehicleEditor_staticEditor_veJBeamSpellchecker")`, then the global `editor_vehicleEditor_staticEditor_veJBeamSpellchecker`

"JBeam Spellchecker" app of the Static Editor. The "Start Analysis" button walks through all the *.jbeam files of the vehicles folder and checks that the modifiers (inline options or dictionary option lines) used in the flexbodies, props, nodes, beams, triangles, hydros, torsionbars, torsionHydros and variables sections are part of a whitelist hard-coded in the file. Any unknown modifier is reported by an error log "Section: X Modifier: 'Y' not valid!" with the file path.

## Example

```lua
extensions.load('editor_vehicleEditor_staticEditor_veJBeamSpellchecker')
editor_vehicleEditor_staticEditor_veJBeamSpellchecker.open()
```

## Notes

- The results are only written to the console/log. Sections absent from the whitelist (information, slots, powertrain, etc.) are ignored: their list is empty or commented out.
- The files are read with json.decode (strict JSON); an undecodable file is ignored with an error log, but parseFile then returns nil and analyzeJBeamFile(nil) would cause an error (pairs(nil)).
- If a section header is not a list, analyzeJBeamFile displays a warning and returns -1: the rest of the file is then no longer analyzed.
- The analysis removes the header (table.remove(sectionData, 1)) from the decoded data in memory; no effect on disk.
- The code contains an unused ::continue:: label before im.End().

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onDeserialized(data)` | Hook called after a Lua reload: restores the window state. *(internal)* *(hook)* | 473 |
| `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onSerialize()` | Hook called before a Lua reload: saves the window state. *(internal)* *(hook)* | 467 |
| `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onUpdate()` | Extension hook called every frame: draws the window with the "Start Analysis" button when it is open. *(internal)* *(hook)* | 450 |
| `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.open()` | Opens the app window (windowOpen[0] = true). | 463 |

### Parameter details

#### `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onDeserialized(data)`

Hook called after a Lua reload: restores the window state.

- `data` (*table*) : table produced by onSerialize

#### `editor_vehicleEditor_staticEditor_veJBeamSpellchecker.onSerialize()`

Hook called before a Lua reload: saves the window state.

- **returns**: table {windowOpen = boolean}

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | Text of the Apps menu entry: "JBeam Spellchecker". |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/staticEditor/veJBeamSpellchecker.lua`.*

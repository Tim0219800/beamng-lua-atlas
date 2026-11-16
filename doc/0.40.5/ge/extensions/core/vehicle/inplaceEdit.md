# `core_vehicle_inplaceEdit`

*File: `lua/ge/extensions/core/vehicle/inplaceEdit.lua` · VM: Game Engine (GE) · 424 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_inplaceEdit`: `extensions.load("core_vehicle_inplaceEdit")`, then the global `core_vehicle_inplaceEdit`

GE extension `core_vehicle_inplaceEdit`: rudimentary "in-game" parts editor ("ingame vehicle editor"): hides the CEF interface, displays as debug text (debugDrawer:drawTextAdvanced) the slot/part tree of player 0's vehicle and allows keyboard navigation (up/down/left/right), choosing a part for a slot and respawning the vehicle with the new config. Opened by core_vehicle_manager.toggleModifyKey. It is a development tool, not a gameplay API.

## Notes

- Keys arrive through onInput(type, value) with type among 'up', 'down', 'left', 'right', 'select' (e), 'back' (r); only values equal to 1 (press) are handled. Exit is done with the g key (through the mode's input actions).
- The code contains many debug dump{...} calls and a comment "the crude UI": the tool is visibly rough. The help displayed on screen is in English.
- The window is only active if player 0's vehicle exists (onUpdate returns otherwise); a short animation (0.1 s) precedes and follows activation, and the CEF interface is hidden during editing then restored.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_inplaceEdit.onInput(type, value)` | Input hook: receives the editor's navigation keys ('up', 'down', 'left', 'right', 'select', 'back') and moves the selection, descends/ascends in the parts or applies the choice of a part for a slot (vehicle respawn with the modified config). *(internal)* *(hook)* | 361 |
| `core_vehicle_inplaceEdit.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame hook: loads the vehicle data if needed, animates activation and, if the editor is active, draws the info and the slot/part list on screen. *(internal)* *(hook)* | 210 |
| `core_vehicle_inplaceEdit.setShowWindow(val)` | Enables or disables the editor (changes mode: hides/shows the CEF interface). | 345 |
| `core_vehicle_inplaceEdit.toggleShowWindow()` | Toggles the editor state and switches the edit mode (toggleEditMode) of player 0's vehicle. | 350 |

### Parameter details

#### `core_vehicle_inplaceEdit.onInput(type, value)`

Input hook: receives the editor's navigation keys ('up', 'down', 'left', 'right', 'select', 'back') and moves the selection, descends/ascends in the parts or applies the choice of a part for a slot (vehicle respawn with the modified config).

- `type` (*string*) : action name
- `value` (*number*) : 1 = press; other values are ignored

#### `core_vehicle_inplaceEdit.onUpdate(dtReal, dtSim, dtRaw)`

Per-frame hook: loads the vehicle data if needed, animates activation and, if the editor is active, draws the info and the slot/part list on screen.

- `dtReal` (*number*) : real time (s)
- `dtSim` (*number*) : simulation time (s)
- `dtRaw` (*number*) : raw time (s)

#### `core_vehicle_inplaceEdit.setShowWindow(val)`

Enables or disables the editor (changes mode: hides/shows the CEF interface).

- `val` (*boolean*) : true to show

## Calls into the engine (C++)

- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/inplaceEdit.lua`.*

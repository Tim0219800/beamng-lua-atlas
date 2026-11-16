# `gameplay_drag_dialPopup`

*File: `lua/ge/extensions/gameplay/drag/dialPopup.lua` · VM: Game Engine (GE) · 178 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_drag_dialPopup`: `extensions.load("gameplay_drag_dialPopup")`, then the global `gameplay_drag_dialPopup`

ImGui window "Drag - Set Dial" for bracket racing: the local player enters their dial (announced time, in seconds) in a decimal field, from 0 to 999 (10 by default, or the value stored in the vehicle's dial book). On confirmation, in solo the callback applies the dial; in multiplayer the value is sent to the host via drag.updateTimerValue(raceId, vehId, 'dial', val). Only shown if the track is of type bracketRace.

## Example

```lua
gameplay_drag_dialPopup.requestDial(be:getPlayerVehicleID(0), function(dial) gameplay_drag_core.setRacerDial(be:getPlayerVehicleID(0), dial) end)
```

## Notes

- Only one popup at a time: requestDial is ignored if it is already open or if vehId is nil/-1.
- The comment of tick() says it is called from core.lua, but no file in lua/ references dialPopup (neither core.lua nor dragBridge): in 0.40.5 this extension seems unused (the dial goes through dragBridge.showDialControl and the UI).
- An invalid entered value or one outside [0, 999] is replaced by 10 (DIAL_DEFAULT).
- The window closes by itself if dragData is absent or if dragType is not bracketRace.
- The window texts are hardcoded in English (no translation).

**Dependencies (loaded first):** `gameplay_drag_core`, `gameplay_drag_saveSystem`, `ui_imgui`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_drag_dialPopup.requestDial(vehId, callback)` | Opens the dial entry window for a vehicle. Pre-fills with the stored dial (key importantTimerId, otherwise time_1_4) or 10. | 59 |
| `gameplay_drag_dialPopup.tick(dtReal, dtSim, dtRaw)` | Draws the window if it is open (only once per frame). Meant to be called manually every frame, not as an extension hook. *(internal)* | 173 |

### Parameter details

#### `gameplay_drag_dialPopup.requestDial(vehId, callback)`

Opens the dial entry window for a vehicle. Pre-fills with the stored dial (key importantTimerId, otherwise time_1_4) or 10.

- `vehId` (*integer*) : Player's vehicle ID (ignored if nil or -1).
- `callback` (*function|nil*) : Called with the confirmed value (number) after validation.

#### `gameplay_drag_dialPopup.tick(dtReal, dtSim, dtRaw)`

Draws the window if it is open (only once per frame). Meant to be called manually every frame, not as an extension hook.

- `dtReal` (*number*) : Real delta time (s), unused.
- `dtSim` (*number*) : Simulated time delta (s), unused.
- `dtRaw` (*number*) : Raw delta (s), unused.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_saveSystem, ui_imgui. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/drag/dialPopup.lua`.*

# `gameplay_freeformDelivery_debug`

*File: `lua/ge/extensions/gameplay/freeformDelivery/debug.lua` · VM: Game Engine (GE) · 671 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_debug`: `extensions.load("gameplay_freeformDelivery_debug")`, then the global `gameplay_freeformDelivery_debug`

"Freeform Delivery Debug" imgui debug window of the freeform delivery mode. When enabled (setEnableDebugWindow(true)), it collects the current delivery's state every frame and displays sections: delivery state, setup state, couplings, vehicles, goals, target areas, routes, parking spots and vehicle sleep. Useful to a modder for debugging a delivery.json file.

## Example

```lua
gameplay_freeformDelivery_debug.setEnableDebugWindow(true)
```

## Notes

- The window is controlled only by enableDebugWindow (setEnableDebugWindow / getEnableDebugWindow). toggleDebugWindow only modifies debugWindowOpen, a variable that is never read: calling it (as gameplay_freeformDelivery_freeformDelivery.load does) therefore opens nothing.
- When debug is disabled, the collected data is cleared. Without a loaded delivery, the window displays "No delivery loaded".
- Collection and drawing happen in onPreRender, not in onUpdate.

**Dependencies (loaded first):** `ui_imgui`, `gameplay_freeformDelivery_utils`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_debug.clearDebugData()` | Clears the collected debug data. | 663 |
| `gameplay_freeformDelivery_debug.getEnableDebugWindow()` | Tells whether the debug window is enabled. | 654 |
| `gameplay_freeformDelivery_debug.onPreRender(dtReal, dtSim, dtRaw)` | Hook called before rendering each frame: if the window is enabled, updates the debug data from gameplay_freeformDelivery_freeformDelivery then draws the window. *(internal)* *(hook)* | 638 |
| `gameplay_freeformDelivery_debug.setEnableDebugWindow(enabled)` | Enables or disables the display of the debug window. Disabling clears the collected data. | 645 |
| `gameplay_freeformDelivery_debug.toggleDebugWindow()` | Inverts debugWindowOpen and logs the new state; no visible effect (see notes). | 658 |

### Parameter details

#### `gameplay_freeformDelivery_debug.getEnableDebugWindow()`

Tells whether the debug window is enabled.

- **returns**: boolean true if enabled.

#### `gameplay_freeformDelivery_debug.onPreRender(dtReal, dtSim, dtRaw)`

Hook called before rendering each frame: if the window is enabled, updates the debug data from gameplay_freeformDelivery_freeformDelivery then draws the window.

- `dtReal` (*number*) : Real time delta (unused).
- `dtSim` (*number*) : Simulated time delta (unused).
- `dtRaw` (*number*) : Raw time delta (unused).

#### `gameplay_freeformDelivery_debug.setEnableDebugWindow(enabled)`

Enables or disables the display of the debug window. Disabling clears the collected data.

- `enabled` (*boolean*) : true to display the window.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | ui_imgui and gameplay_freeformDelivery_utils. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/debug.lua`.*

# `ui_apps_missionControls`

*File: `lua/ge/extensions/ui/apps/missionControls.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_missionControls`: `extensions.load("ui_apps_missionControls")`, then the global `ui_apps_missionControls`

Manages the list of control hints shown by the missionControls interface app during a mission. Each hint is identified by a category, which makes it possible to add or remove one without touching the others (for example from a flowgraph node). The list sorted by order is sent to the interface via the SetMissionControls event.

## Example

```lua
ui_apps_missionControls.setControl({action='accelerate', label='Accelerate', order=1})
ui_apps_missionControls.setControl({action='accelerate', clear=true})
```

## Notes

- The default category is args.category, otherwise args.action, otherwise args.uiEvent; with none of the three, setControl does nothing.
- In setControls, if the hint has no category, action or uiEvent, the index in the list is used as the key; order defaults to the index.
- The extension stays loaded permanently (manual unload).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_missionControls.clearControls()` | Removes all hints and sends SetMissionControlsResetAll to the interface. | 54 |
| `ui_apps_missionControls.onInit()` | Initialization hook: sets the extension to manual unload. *(internal)* *(hook)* | 6 |
| `ui_apps_missionControls.sendAllData()` | Sends the current list back to the interface (useful when the app mounts). | 59 |
| `ui_apps_missionControls.setControl(args)` | Adds, updates or removes (clear=true) a hint, then sends the whole list back to the interface. | 22 |
| `ui_apps_missionControls.setControls(list)` | Replaces all hints with the supplied list, then sends it to the interface. | 40 |

### Parameter details

#### `ui_apps_missionControls.setControl(args)`

Adds, updates or removes (clear=true) a hint, then sends the whole list back to the interface.

- `args` (*table*) : {category|action|uiEvent, action=string|nil, uiEvent=string|nil, label=string|nil, order=number|nil (0 by default), clear=boolean|nil}.

#### `ui_apps_missionControls.setControls(list)`

Replaces all hints with the supplied list, then sends it to the interface.

- `list` (*table<integer, table>|nil*) : Hints in the same format as setControl.

**UI events (guihooks.trigger):** `SetMissionControls`, `SetMissionControlsResetAll`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/missionControls.lua`.*

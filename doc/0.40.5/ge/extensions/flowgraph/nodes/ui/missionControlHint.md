# `flowgraph_nodes_ui_missionControlHint`

*File: `lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua` · VM: Game Engine (GE) · 127 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/missionControlHint")` (file under extensions/ but not a regular extension)

Flowgraph node "Mission Control Hints" (category repeat_instant, author BeamNG, duration): displays control hints (shift gear, clutch, horn, etc.) in the Mission Controls HUD app (ui_apps_missionControls). Input "reset" (pulse that clears everything). For each hint i ("Hint Count"): "action_i" (input action with templates shiftUp, shiftDown, clutch, throttle, brake, parkingbrake, horn), "uiEvent_i" (UI navigation event, hidden), "label_i" (text or translation key).

## Notes

- Without an action or uiEvent, the hint is cleared (category flowgraph_<id>_<i>).

**Dependencies (loaded first):** `ui_apps_missionControls`

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:_onDeserialized(res)` | Restores count. | 92 |
| `C:_onSerialize(res)` | Saves count. | 88 |
| `C:drawCustomProperties()` | "Hint Count" field. | 71 |
| `C:init()` | count = 1. | 40 |
| `C:postInit()` | Creates the pins and loads the ui_apps_missionControls extension. | 44 |
| `C:updatePins(old, new)` | Adjusts the number of pin trios (action, uiEvent, label). | 49 |
| `C:work()` | Loads the extension if needed, clears if reset, otherwise sends or clears each hint via setControl. | 97 |

**Loads extensions:** `ui_apps_missionControls`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua`.*

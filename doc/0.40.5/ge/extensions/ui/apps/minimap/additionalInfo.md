# `ui_apps_minimap_additionalInfo`

*File: `lua/ge/extensions/ui/apps/minimap/additionalInfo.lua` · VM: Game Engine (GE) · 117 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_minimap_additionalInfo`: `extensions.load("ui_apps_minimap_additionalInfo")`, then the global `ui_apps_minimap_additionalInfo`

Computes the extra information shown by the minimap: remaining distance to the destination (routePlanner of core_groundMarkers), place name (highest-priority gameplay_city zone under the camera, otherwise the level title) and police pursuit state (disabled, visibleToPolice, hiddenFromPolice). Changes are sent to the 'minimap' stream via guihooks.queueStream.

## Notes

- A single send per frame, only if a value has changed (hasNewAdditionalInfo flag).
- The distance is formatted "%.1f unit" after translateDistance(…, 'auto') according to the unit settings.
- checkPolice calls gameplay_police.getPursuitData() without a test: the gameplay_police extension must be available.
- checkLocationName does nothing if gameplay_city is not loaded.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_minimap_additionalInfo.onClientEndMission()` | End-of-level hook: empties the info (visible reset to true) and forces a resend. *(internal)* *(hook)* | 100 |
| `ui_apps_minimap_additionalInfo.onReachedTargetPos()` | Hook called when the destination is reached: clears the distance to the target. *(internal)* *(hook)* | 42 |
| `ui_apps_minimap_additionalInfo.onSetBigmapNavFocus(pos)` | Hook called when the big map's navigation focus changes; if pos is nil, clears the distance to the target. *(internal)* *(hook)* | 106 |
| `ui_apps_minimap_additionalInfo.onUpdate()` | Frame hook: checks the route, the place name and the police, then sends the info if one has changed. *(internal)* *(hook)* | 89 |
| `ui_apps_minimap_additionalInfo.requestAdditionalInfo()` | Forces the information to be resent to the 'minimap' stream at the next update (called when the interface mounts). | 7 |
| `ui_apps_minimap_additionalInfo.setVisible(visible)` | Shows or hides the information block in the interface; returns nothing if the value does not change. Anything that is not false is treated as true. | 11 |

### Parameter details

#### `ui_apps_minimap_additionalInfo.onSetBigmapNavFocus(pos)`

Hook called when the big map's navigation focus changes; if pos is nil, clears the distance to the target.

- `pos` (*vec3|nil*) : Target position, or nil if the navigation is removed.

#### `ui_apps_minimap_additionalInfo.setVisible(visible)`

Shows or hides the information block in the interface; returns nothing if the value does not change. Anything that is not false is treated as true.

- `visible` (*boolean|nil*) : false to hide.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/minimap/additionalInfo.lua`.*

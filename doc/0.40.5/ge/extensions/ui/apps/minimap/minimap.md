# `ui_apps_minimap_minimap`

*File: `lua/ge/extensions/ui/apps/minimap/minimap.lua` · VM: Game Engine (GE) · 854 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_minimap_minimap`: `extensions.load("ui_apps_minimap_minimap")`, then the global `ui_apps_minimap_minimap`

Minimap displayed in ImGui (API marked experimental by BeamNG). It draws into a texture the roads, the player, the other vehicles, the compass, the playmode markers, etc., in a circle or rectangle shape (setting `minimapMode`). Another module activates it with setDrawTransform (position and size relative to the screen, between 0 and 1) and hides it with hide. Every frame, it emits the hook `onDrawOnMinimap(td)` so that other extensions draw on top. Also contains a debug settings window (profiling, garbage measurement, display options).

## Notes

- The file states: "This API is experimental and may change".
- `M.onUpdate` is nil on load: setDrawTransform hooks it to the drawing function and calls `extensions.hookUpdate("onUpdate")`; hide resets it to nil. The minimap therefore draws nothing until setDrawTransform has been called.
- setDrawTransform and setOcclusionTransform expect normalized values between 0 and 1; otherwise a warning is logged (setDrawTransform then hides the minimap, setOcclusionTransform ignores the zone).
- The mode read from the settings is forced to "rect" if it is neither "circle" nor "rect".
- Probable BUG: minimap.lua uses `ui_apps_sdfTopomap` (lines 311-312 and 605) while the 0.40.5 topography module is called `ui_apps_minimap_topomap`; this name is defined nowhere, so the contour lines are not drawn.
- Settings used: minimapMode, minimapOrientation ("rotateWithCamera"), minimapDrawGrid ("always"), minimapLookahead (disabled/low/medium/high).

**Dependencies (loaded first):** `ui_apps_minimap_topomap`, `ui_apps_minimap_additionalInfo`, `ui_apps_minimap_route`, `ui_apps_minimap_utils`, `ui_apps_minimap_roads`, `ui_apps_minimap_vehicles`, `gameplay_playmodeMarkers`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_minimap_minimap.drawDebugOverlay()` | Draws debug markers (corners, margins) and displays the sizes in ImGui. *(internal)* | 720 |
| `ui_apps_minimap_minimap.drawOcclusion(offsetX, offsetY)` | Draws the occlusion masks and the circular or rectangular cropping of the minimap into the texture. Called by the minimap's drawing loop. *(internal)* | 668 |
| `ui_apps_minimap_minimap.getDebugSettingsData()` | Returns the choice lists of the debug window (`lookaheadValue`, `profileEveryNthFrame`). | 832 |
| `ui_apps_minimap_minimap.getMode()` | Returns the minimap's shape. | 747 |
| `ui_apps_minimap_minimap.getScale()` | Returns the minimap's current scale. | 41 |
| `ui_apps_minimap_minimap.hide()` | Hides the minimap: resets the transform to 0 and unhooks onUpdate. | 812 |
| `ui_apps_minimap_minimap.onClientEndMission()` | Hook called at the end of a mission/level. Hides the minimap and resets the roads. *(internal)* *(hook)* | 836 |
| `ui_apps_minimap_minimap.onClientStartMission()` | Hook called at the start of a mission/level. Hides the minimap and resets the roads (`ui_apps_minimap_roads.reset`). *(internal)* *(hook)* | 844 |
| `ui_apps_minimap_minimap.onInit()` | Called on extension initialization. Switches to manual unload and reads the minimap settings. *(internal)* *(hook)* | 11 |
| `ui_apps_minimap_minimap.onMinimapSettingsChanged(m)` | Hook called when the minimap settings change. Rereads the mode, orientation, grid and lookahead and the state of the ImGui viewports. *(internal)* *(hook)* | 758 |
| `ui_apps_minimap_minimap.resetOcclusionTransform(id)` | Removes the occlusion zone with this id; if the id is not a non-empty string, removes all zones. | 803 |
| `ui_apps_minimap_minimap.setBuffers(left, right, top, bottom)` | Sets custom margins around the minimap (left, right, top, bottom). A nil value becomes 10. | 771 |
| `ui_apps_minimap_minimap.setDrawTransform(x, y, width, height)` | Positions the minimap and activates it (hooks onUpdate). The 4 values must be between 0 and 1, otherwise a warning and a call to hide. | 778 |
| `ui_apps_minimap_minimap.setOcclusionTransform(id, x, y, width, height)` | Declares a zone that masks part of the minimap (for example an interface element placed over it). Ignored with a warning if a value is outside 0..1. | 795 |
| `ui_apps_minimap_minimap.toggledebugSettings()` | Opens or closes the debug settings window. | 820 |

### Parameter details

#### `ui_apps_minimap_minimap.drawOcclusion(offsetX, offsetY)`

Draws the occlusion masks and the circular or rectangular cropping of the minimap into the texture. Called by the minimap's drawing loop.

- `offsetX` (*number*) : Horizontal drawing offset.
- `offsetY` (*number*) : Vertical drawing offset.

#### `ui_apps_minimap_minimap.getDebugSettingsData()`

Returns the choice lists of the debug window (`lookaheadValue`, `profileEveryNthFrame`).

- **returns**: table `{name, value}` tables per setting.

#### `ui_apps_minimap_minimap.getMode()`

Returns the minimap's shape.

- **returns**: string "circle" or "rect".

#### `ui_apps_minimap_minimap.getScale()`

Returns the minimap's current scale.

- **returns**: number Scale in pixels per meter.

#### `ui_apps_minimap_minimap.onMinimapSettingsChanged(m)`

Hook called when the minimap settings change. Rereads the mode, orientation, grid and lookahead and the state of the ImGui viewports.

- `m` (*any*) : Unused argument (inferred from code).

#### `ui_apps_minimap_minimap.resetOcclusionTransform(id)`

Removes the occlusion zone with this id; if the id is not a non-empty string, removes all zones.

- `id` (*string|nil*) : Zone identifier, or nil to clear everything.

#### `ui_apps_minimap_minimap.setBuffers(left, right, top, bottom)`

Sets custom margins around the minimap (left, right, top, bottom). A nil value becomes 10.

- `left` (*number|nil*) : Left margin.
- `right` (*number|nil*) : Right margin.
- `top` (*number|nil*) : Top margin.
- `bottom` (*number|nil*) : Bottom margin.

#### `ui_apps_minimap_minimap.setDrawTransform(x, y, width, height)`

Positions the minimap and activates it (hooks onUpdate). The 4 values must be between 0 and 1, otherwise a warning and a call to hide.

- `x` (*number*) : Relative horizontal position (0 to 1).
- `y` (*number*) : Relative vertical position (0 to 1).
- `width` (*number*) : Relative width (0 to 1).
- `height` (*number*) : Relative height (0 to 1).

#### `ui_apps_minimap_minimap.setOcclusionTransform(id, x, y, width, height)`

Declares a zone that masks part of the minimap (for example an interface element placed over it). Ignored with a warning if a value is outside 0..1.

- `id` (*string*) : Zone identifier.
- `x` (*number*) : Relative horizontal position (0 to 1).
- `y` (*number*) : Relative vertical position (0 to 1).
- `width` (*number*) : Relative width (0 to 1).
- `height` (*number*) : Relative height (0 to 1).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions loaded before: topomap, additionalInfo, route, utils, roads, vehicles of the minimap, and gameplay_playmodeMarkers. |
| `onUpdate` | function|nil | nil at start; set by setDrawTransform (drawing function), reset to nil by hide. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onDrawOnMinimap` — listened to by 2 module(s)
- `onUpdate` — listened to by 186 module(s)

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/minimap/minimap.lua`.*

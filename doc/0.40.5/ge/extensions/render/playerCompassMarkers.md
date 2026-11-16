# `render_playerCompassMarkers`

*File: `lua/ge/extensions/render/playerCompassMarkers.lua` · VM: Game Engine (GE) · 271 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `render_playerCompassMarkers`: `extensions.load("render_playerCompassMarkers")`, then the global `render_playerCompassMarkers`

Direction indicators of the other players for split screen (multiseat in freeroam). For each view, draws at the top of the view one colored dot per other player, positioned horizontally according to the direction they are in (like a compass), in a transparent ImGui texture. Driven by render_splitScreen (update called every frame). Depends on ui_imgui, core_gamestate, core_camera. Global: render_playerCompassMarkers.

## Notes

- Active only if: ui_multiseat_freeroam.isActive(), enabled true, TextureDrawPrimitiveRegistry available, at least 2 players, and not during a loading screen (suppressed until loading is finished, lifted by onLoadingScreenInactive(2)). Otherwise destroy() frees textures and states.
- A marker appears for a player only if they are more than 40 m away (hideDistance); always shown beyond 100 m (alwaysShowDistance); in between it is shown only if they are hidden from view (castRayStatic ray from the camera toward them, only if they are in the frustum). A state change must remain stable for 3 s (visibilityDelay) before taking effect, with a 0.5 s fade.
- The safety margin reproduces the UI's CSS variable --safezone (uiLayoutSafeArea setting, clamped to 0.8..1 default 0.98, area limited to 16:9).
- Each view provides a markerRect {x, y, width, height} in pixels; each player's color is a hexadecimal string '#RRGGBB' (playerInfo.color).
- Marker size: markerScale 0.4, background alpha 77, marker alpha 255 (local values).

**Dependencies (loaded first):** `ui_imgui`, `core_gamestate`, `core_camera`

## Functions

| Function | Description | Line |
|---|---|---|
| `render_playerCompassMarkers.destroy()` | Frees the registered direction textures and resets the states; no effect if already inactive. | 54 |
| `render_playerCompassMarkers.onLoadingScreenInactive(state)` | Loading screen hook: when state is 2, lifts the suppression of the markers. *(internal)* *(hook)* | 260 |
| `render_playerCompassMarkers.update(enabled, views, players, vehicleForPlayer)` | Updates and draws the direction markers for all split screen views (collection, texture, background-less, input-less ImGui window per view). *(internal)* | 179 |

### Parameter details

#### `render_playerCompassMarkers.onLoadingScreenInactive(state)`

Loading screen hook: when state is 2, lifts the suppression of the markers.

- `state` (*integer*) : Loading screen state (2 = finished, inferred from code).

#### `render_playerCompassMarkers.update(enabled, views, players, vehicleForPlayer)`

Updates and draws the direction markers for all split screen views (collection, texture, background-less, input-less ImGui window per view).

- `enabled` (*boolean*) : Enable the feature.
- `views` (*table[]*) : Views: {name, player, markerRect = {x, y, w, h}}.
- `players` (*table[]*) : Players: {player, color = '#RRGGBB'}.
- `vehicleForPlayer` (*function*) : function(player) -> vehicle object or nil.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/render/playerCompassMarkers.lua`.*

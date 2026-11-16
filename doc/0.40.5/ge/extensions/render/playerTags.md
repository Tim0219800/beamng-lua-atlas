# `render_playerTags`

*File: `lua/ge/extensions/render/playerTags.lua` · VM: Game Engine (GE) · 564 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `render_playerTags`: `extensions.load("render_playerTags")`, then the global `render_playerTags`

Floating name labels above players' vehicles (multiseat and split screen). Uses the Skia billboard system (WorldBillboardRenderer object registered "playerNameTags" in MissionGroup): each label is a static texture from a `.sktemplate.json` template, tinted with the player's color, turned toward the camera, following the car, growing with distance (up to a cap) and disappearing beyond 40 m. Driven by core_multiseat (rebuild, updatePositions, reset…). Global: render_playerTags.

## Example

```lua
extensions.render_playerTags.rebuild({
  {player = 0, label = 'Alice', color = {1, 0.4, 0.2}, icon = 'user', perspectivePlayer = 0},
  {player = 1, label = 'Bob',   color = {0.2, 0.6, 1}},
}, 'multiseat')
-- then every frame:
extensions.render_playerTags.updatePositions(dtReal)
```

## Notes

- Templates: 'default' = art/sktemplates/multiplayer-nametag.sktemplate.json; 'multiseat' = art/sktemplates/multiseat-player-tag.sktemplate.json. An unknown template name falls back to 'default'. Only 'multiseat' adds a persona icon (SVG from ui/ui-vue/src/assets/fonts/bngIcons/svg/<icon>.svg, filled in white); the icon name must be alphanumeric (^%w+$).
- Colors: {r,g,b} between 0 and 1, blended toward an anthracite gray (54,69,79) at 30% (top) and 60% (bottom of the gradient); tintAccent replaces the color of 'accent' role nodes with this gradient.
- Each rebuild entry: {player, label, color={r,g,b}, icon?, key?, perspectivePlayer?, hideInViews?}. The state is keyed by `key` (default player), which allows several labels per player (one per view in split screen). perspectivePlayer = the player who is looking: their own label only appears for 3 s (TAG_SHOW_TIME) after a change of vehicle occupancy or of vehicle; the others' labels stack vertically (0.33 m, 0.24 m with icon) above the vehicle.
- Local tuning values: scale 0.36, max distance 40 m, minimum scale reached at 3 m and maximum at 26.7 m, switch to the seat position under 7 m, position smoothing 10. When the game is paused (simTimeAuthority.getPause) the labels are forced visible; in photo mode (photoModeOpen) they are hidden.
- The base position is computed above the vehicle's oriented bounding box (OOBB), at the driver node level; otherwise 1.25 m above the vehicle's position. With multiple seats, gameplay_seatOccupants.getSeatExitData gives the position of each seat.
- If the C++ object playerNameTags disappears (reload), liveRenderer detects it and clears the local state; reset() is also bound to onExtensionUnloaded.

## Functions

| Function | Description | Line |
|---|---|---|
| `render_playerTags.clearHiddenPlayers()` | Shows all hidden players again. | 286 |
| `render_playerTags.clearPlayerColorOverrides()` | Removes the forced colors and rebuilds. | 298 |
| `render_playerTags.destroy()` | Destroys all current labels (billboards) and clears the local state, leaving the renderer in place. | 186 |
| `render_playerTags.hasTags()` | Indicates whether at least one label exists. | 208 |
| `render_playerTags.isLive()` | Indicates whether the billboard renderer exists in the scene. | 204 |
| `render_playerTags.onExtensionUnloaded()` | Alias of reset called when the extension is unloaded. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `render_playerTags.onVehicleSwitched(oldId, newId, player)` | Vehicle switch hook: updates the vehicle tracked by the player's labels; the label of the player who is looking is shown for 3 s. *(internal)* *(hook)* | 304 |
| `render_playerTags.rebuild(tags, templateName)` | Rebuilds all labels: stores the request (for reload and color overrides), destroys the old ones, creates the renderer if needed then one billboard per entry while keeping the previous smoothing state. | 212 |
| `render_playerTags.reload()` | Clears the template and SVG icon path caches then rebuilds the last requested labels (useful for tuning a .sktemplate.json). | 273 |
| `render_playerTags.reset()` | Destroys the labels, forgets the renderer reference and clears hidden players and color overrides. To be called before a Lua/GE reload that destroys the C++ object; also onExtensionUnloaded. | 196 |
| `render_playerTags.setPlayerColorOverride(player, color)` | Forces a color on a player and rebuilds the labels. | 291 |
| `render_playerTags.setPlayerHidden(player, hidden)` | Hides or shows a player's label. | 280 |
| `render_playerTags.updatePositions(dt)` | To be called every frame: computes position, (smoothed) scale and visibility of each label (grouping by vehicle, stacking, distance to the player's camera) and calls WorldBillboardRenderer:update. | 473 |

### Parameter details

#### `render_playerTags.hasTags()`

Indicates whether at least one label exists.

- **returns**: boolean true if labels are active.

#### `render_playerTags.isLive()`

Indicates whether the billboard renderer exists in the scene.

- **returns**: boolean true if the playerNameTags object exists.

#### `render_playerTags.onVehicleSwitched(oldId, newId, player)`

Vehicle switch hook: updates the vehicle tracked by the player's labels; the label of the player who is looking is shown for 3 s.

- `oldId` (*integer*) : Old vehicle.
- `newId` (*integer*) : New vehicle.
- `player` (*integer*) : Player.

#### `render_playerTags.rebuild(tags, templateName)`

Rebuilds all labels: stores the request (for reload and color overrides), destroys the old ones, creates the renderer if needed then one billboard per entry while keeping the previous smoothing state.

- `tags` (*table[]*) : List of entries {player, label, color, icon?, key?, perspectivePlayer?, hideInViews?}.
- `templateName` (*string|nil*) : 'default' or 'multiseat'.
- **returns**: boolean false if tags is not a table or if the renderer could not be created.

#### `render_playerTags.reload()`

Clears the template and SVG icon path caches then rebuilds the last requested labels (useful for tuning a .sktemplate.json).

- **returns**: boolean false if there is nothing to rebuild.

#### `render_playerTags.setPlayerColorOverride(player, color)`

Forces a color on a player and rebuilds the labels.

- `player` (*integer*) : Player.
- `color` (*table*) : {r,g,b} between 0 and 1.

#### `render_playerTags.setPlayerHidden(player, hidden)`

Hides or shows a player's label.

- `player` (*integer*) : Player.
- `hidden` (*boolean*) : true to hide.

#### `render_playerTags.updatePositions(dt)`

To be called every frame: computes position, (smoothed) scale and visibility of each label (grouping by vehicle, stacking, distance to the player's camera) and calls WorldBillboardRenderer:update.

- `dt` (*number*) : Frame duration (s).

## Calls into the engine (C++)

- `FS:` `fileExists`
- `be:` `getObjectOOBBAxisNormalizedXYZ`, `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfExtentsXYZ`, `getObjectOOBBIsInitialized`

**Loads extensions:** `core_skiaTemplate`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/render/playerTags.lua`.*

# `render_skiaIcons`

*File: `lua/ge/extensions/render/skiaIcons.lua` · VM: Game Engine (GE) · 617 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `render_skiaIcons`: `extensions.load("render_skiaIcons")`, then the global `render_skiaIcons`

3D icons (Skia billboards facing the camera) to mark world positions: missions, stations, race markers. Each icon is drawn with the bngIcons font in four layers (shape outline, fill, pattern edge, pattern). Icons with the same appearance share a billboard pool: releasing one puts it away for the next one of the same style instead of rebuilding a texture. A modder calls getIcon, then update every frame, and release at the end.

## Example

```lua
local icon = render_skiaIcons.getIcon('mission', pos)  -- preset from a *.skiaIcon.json file
local icon2 = render_skiaIcons.getIcon({shape = 'circle', motive = 'fuelPump', color = 'blue'})
icon2:setVisible(true)
-- every frame (onPreRender):
icon2:update(pos, render_skiaIcons.screenBoundedScale(pos, 0.8, 0.03, 0.12), dt)
-- at the end:
icon2:release()
```

## Notes

- Icon spec (all fields optional): shape, motive, text (short label like '3' or '9+' that replaces the motive), motiveScale, motiveOffset, outline (in font units per 24; default 1.5), color, borderColor, motiveColor, and preset (name of an entry of the /art/skiaIcons/*.skiaIcon.json files, key 'presets'). Color names are resolved by the iconMarkerConfig.json table, otherwise the value is taken as is.
- On load, the module reads ui/ui-vue/src/assets/fonts/bngIcons/iconMarkerConfig.json and bngIcons.js; if the config is unreadable, loading the extension fails (error).
- The engine offers no alpha on billboards: the fade is simulated by shrinking the size down to zero (below 0.005 m the icon is hidden). The size is a height in meters.
- The pool keeps at most 192 released billboards; beyond that they are destroyed.
- A billboard is only built on the first visible update, which avoids costing a texture for markers that are never seen.
- After release() the icon is "dead": request a new icon with getIcon.
- The renderer is a scenetree object named 'skiaIconBillboards'; it disappears with the scene (onClientEndMission invalidates all identifiers).
- The code of Icon:update has the real signature (pos, scale, dt); the extracted page wrongly shows (scale, dt) because the method is declared with ':'.
- Loads the core_skiaTemplate extension on demand.

## Functions

| Function | Description | Line |
|---|---|---|
| `render_skiaIcons.exploreFolder(which)` | Opens one of these folders in the system file explorer (development convenience). | 568 |
| `render_skiaIcons.getColors()` | Returns the table of named colors of the icon config. | 604 |
| `render_skiaIcons.getFolders()` | Folders read by the system: presets (/art/skiaIcons) and font. | 562 |
| `render_skiaIcons.getIcon(spec, pos)` | Returns an icon for a preset name, a spec table, or a preset with overrides (spec.preset plus fields). If the style cannot be built, returns an already dead icon (isLive false). | 476 |
| `render_skiaIcons.getMotives()` | Sorted list of all motive names (bngIcons glyphs). | 553 |
| `render_skiaIcons.getPresets()` | Returns the presets table (name -> spec) loaded from /art/skiaIcons/*.skiaIcon.json ('presets' field). | 174 |
| `render_skiaIcons.getShapes()` | Sorted list of available shape names. | 605 |
| `render_skiaIcons.getStats()` | Pool statistics for debugging. | 575 |
| `render_skiaIcons.onClientEndMission()` | End-of-mission hook: the scene and its renderer are lost, all billboard identifiers are invalidated and the pools emptied. *(internal)* *(hook)* | 544 |
| `render_skiaIcons.onExtensionLoaded()` | Hook called when the extension loads: deletes a 'skiaIconBillboards' renderer left by a previous Lua VM. *(internal)* *(hook)* | 589 |
| `render_skiaIcons.onExtensionUnloaded()` | Hook called on unload: identical to reload(). *(internal)* *(hook)* | 525 |
| `render_skiaIcons.reload()` | Re-reads the shared config, the glyph table and the presets from disk. Deletes the renderer (all textures); live icons rebuild on their next update. | 525 |
| `render_skiaIcons.reloadPresets()` | Forgets the loaded presets so that the next getIcon re-reads the *.skiaIcon.json files. Lighter than reload: already built textures are kept. | 539 |
| `render_skiaIcons.screenBoundedScale(pos, worldSize, minScreen, maxScreen)` | Computes the world height of an icon that behaves like a real object at medium distance but stays bounded on screen: never below minScreen (readable from afar), never above maxScreen (does not flood the view up close). Bounds are expressed as a fraction of the screen height; equal bounds give a constant on-screen size. Uses the core_camera camera; without a camera, returns worldSize. | 508 |

### Parameter details

#### `render_skiaIcons.exploreFolder(which)`

Opens one of these folders in the system file explorer (development convenience).

- `which` (*string*) : 'presets', 'font', or a path.
- **returns**: string|nil Opened path, or nil if the platform cannot open it.

#### `render_skiaIcons.getColors()`

Returns the table of named colors of the icon config.

- **returns**: table<string, string> Color name to value (config format).

#### `render_skiaIcons.getFolders()`

Folders read by the system: presets (/art/skiaIcons) and font.

- **returns**: table<string, string> {presets = ..., font = ...}.

#### `render_skiaIcons.getIcon(spec, pos)`

Returns an icon for a preset name, a spec table, or a preset with overrides (spec.preset plus fields). If the style cannot be built, returns an already dead icon (isLive false).

- `spec` (*string|table*) : Preset name or spec table (see notes).
- `pos` (*vec3|nil*) : World position. If provided, the icon is built and placed right away; otherwise on the first update.
- **returns**: Icon Icon object with update, setPos, setScale, setVisible, visibility, isLive, release.

#### `render_skiaIcons.getMotives()`

Sorted list of all motive names (bngIcons glyphs).

- **returns**: string[] Motive names usable in spec.motive.

#### `render_skiaIcons.getPresets()`

Returns the presets table (name -> spec) loaded from /art/skiaIcons/*.skiaIcon.json ('presets' field).

- **returns**: table<string, table> Presets.

#### `render_skiaIcons.getShapes()`

Sorted list of available shape names.

- **returns**: string[] Shape names usable in spec.shape.

#### `render_skiaIcons.getStats()`

Pool statistics for debugging.

- **returns**: table {live, looks, pooled, created, reused, destroyed, hasRenderer}.

#### `render_skiaIcons.reload()`

Re-reads the shared config, the glyph table and the presets from disk. Deletes the renderer (all textures); live icons rebuild on their next update.

- **returns**: boolean true if the config could be re-read.

#### `render_skiaIcons.screenBoundedScale(pos, worldSize, minScreen, maxScreen)`

Computes the world height of an icon that behaves like a real object at medium distance but stays bounded on screen: never below minScreen (readable from afar), never above maxScreen (does not flood the view up close). Bounds are expressed as a fraction of the screen height; equal bounds give a constant on-screen size. Uses the core_camera camera; without a camera, returns worldSize.

- `pos` (*vec3*) : Icon position.
- `worldSize` (*number*) : Height in meters in the intermediate range.
- `minScreen` (*number|nil*) : Minimum fraction of the screen height (default 0).
- `maxScreen` (*number|nil*) : Maximum fraction of the screen height (default 1).
- **returns**: number World height to pass to Icon:update.

## Class `Icon`

Icon handle returned by getIcon. Each state method returns the icon itself (except isLive, visibility, release).

| Method | Description | Line |
|---|---|---|
| `Icon:isLive()` | False if the icon has no billboard: released, style impossible to build, or no renderer. | 450 |
| `Icon:release()` | Puts the billboard away in the pool for an icon of the same style. The handle is unusable afterward. | 454 |
| `Icon:setPos(pos)` | Shortcut for update(pos, nil, nil). | 431 |
| `Icon:setScale(scale)` | Shortcut for update(nil, scale, nil). | 432 |
| `Icon:setVisible(visible, instant)` | Shows or hides the icon with a fade. With instant, skips the fade and pushes the result right away (useful for a hidden marker that is no longer updated). | 436 |
| `Icon:sync()` | Makes sure the icon has a billboard of its current appearance: rebuilds after a reload or after the scene is lost, takes a billboard from the pool or creates one. | 369 |
| `Icon:update(pos, scale, dt)` | Per-frame call. pos and scale keep their current value when nil; dt advances the visibility fade (nil or 0 leaves it in place). | 405 |
| `Icon:visibility()` | Current fade progress between 0 and 1, to sync other visual elements to it. | 446 |

## Calls into the engine (C++)

- `FS:` `findFiles`

**Loads extensions:** `core_skiaTemplate`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/render/skiaIcons.lua`.*

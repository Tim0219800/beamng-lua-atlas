# `editor_ezObjectSelect_selectionQuery`

*File: `lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua` · VM: Game Engine (GE) · 624 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_selectionQuery`: `extensions.load("editor_ezObjectSelect_selectionQuery")`, then the global `editor_ezObjectSelect_selectionQuery`

Selection query of the Easy Object Select tool. From the mouse position and the camera, it collects the scene objects (StaticShape, StaticObject, vehicles) under or near the cursor, resolves them to their owning prefab, applies the filters (class, hidden, locked, bounds, name patterns, max volume and distance) and builds "proxies" (screen geometry) classified as "over" (cursor on top) or "discovery" (within the discovery radius) relation. Uses the selectionCache cache when available, otherwise a "broad" mode (screen rectangle + box around the camera).

## Notes

- Classes excluded outright: TerrainBlock, WaterPlane, Forest; the object named gameCamera is ignored.
- The namePattern / ignorePattern patterns are comma-separated lists of Lua patterns (string.find), tested against the name, the internal name, the shapeName field and the model file. An invalid pattern causes all objects to be rejected (rejected.invalidPattern / invalidIgnorePattern).
- Broad query radius: max(discoveryPixels + 8, 128 * uiscale); default near distance 40 m (nearQueryDistance); default discoveryPixels 48.
- Rejection reasons are counted in the rejected table (unsupported, excludedClass, cameraObject, hidden, classDisabled, locked, selectionDisabled, invalidBounds, patternFilter, ignorePattern, outsideVolume, outsideRange, outsideDiscovery...).
- Local function passesPatterns defined but not used in this file.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_selectionQuery.activate()` | Enables the selection cache (selectionCache.activate). Called when the tool opens. | 606 |
| `editor_ezObjectSelect_selectionQuery.gather(options)` | Collects the selection candidates for the current frame. Returns nil if the camera context is unavailable. Fills proxies (over relation), discoveryProxies (discovery relation), filteredLarge (large filtered objects if options.collectFilteredLarge), queryStats, rejected and sourceCount. | 396 |
| `editor_ezObjectSelect_selectionQuery.getCacheStatus()` | Returns the state of the selection cache (selectionCache.getStatus), useful for the debug display. | 614 |
| `editor_ezObjectSelect_selectionQuery.invalidateCache(reason)` | Invalidates the selection cache. | 610 |
| `editor_ezObjectSelect_selectionQuery.validatePatternList(value)` | Checks that a comma-separated list of Lua patterns is valid (each entry is tested with pcall(string.find)). | 618 |

### Parameter details

#### `editor_ezObjectSelect_selectionQuery.gather(options)`

Collects the selection candidates for the current frame. Returns nil if the camera context is unavailable. Fills proxies (over relation), discoveryProxies (discovery relation), filteredLarge (large filtered objects if options.collectFilteredLarge), queryStats, rejected and sourceCount.

- `options` (*table|nil*) : discoveryPixels (px, default 48), nearQueryDistance (m, default 40), maxDistance (m), maxVolume (m^3), namePattern, ignorePattern (comma-separated lists of Lua patterns), collectFilteredLarge (boolean).
- **returns**: table|nil Table {camera, mouse, queryRadius, discoveryRadius, nearQueryDistance, proxies, discoveryProxies, filteredLarge, queryStats, rejected, sourceCount}.

#### `editor_ezObjectSelect_selectionQuery.getCacheStatus()`

Returns the state of the selection cache (selectionCache.getStatus), useful for the debug display.

- **returns**: table Cache state.

#### `editor_ezObjectSelect_selectionQuery.invalidateCache(reason)`

Invalidates the selection cache.

- `reason` (*string|nil*) : Reason for the invalidation (diagnostic).

#### `editor_ezObjectSelect_selectionQuery.validatePatternList(value)`

Checks that a comma-separated list of Lua patterns is valid (each entry is tested with pcall(string.find)).

- `value` (*string|nil*) : List of patterns, comma-separated.
- **returns**: boolean true if all patterns are valid.
- **returns**: string|nil Error message "entry N: ..." if invalid.

## Calls into the engine (C++)

- `Sim.` `upcast`
- `obj:` `getClassName`, `getField`, `getID`, `getInternalName`, `getModelFile`, `getName`, `getObjBox`, `getWorldBox`, `isHidden`, `isLocked`
- `scenetree.` `findObjectById`
- `ui_imgui.` `GetMousePos`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua`.*

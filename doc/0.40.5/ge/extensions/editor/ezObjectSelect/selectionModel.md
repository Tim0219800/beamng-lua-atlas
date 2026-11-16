# `editor_ezObjectSelect_selectionModel`

*File: `lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua` · VM: Game Engine (GE) · 355 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_selectionModel`: `extensions.load("editor_ezObjectSelect_selectionModel")`, then the global `editor_ezObjectSelect_selectionModel`

Selection model of the editor's "Easy Object Select" tool. Every frame it queries selectionQuery.gather, groups the candidates under the cursor into a stack (object stacking), automatically chooses the winner (with hysteresis to avoid flickering), and handles manual wheel cycling as well as pick "freezing". It produces a snapshot (camera, mouse, candidates, pick, activeIndex, cycleActive, stackCount...) read by the drawing and interaction modules.

## Notes

- Temporal state (automatic target, cycle, frozen pick) kept in a local upvalue; activate() and deactivate() reset it to zero.
- The wheel cycle resets when the mouse leaves the dead zone (cycleDeadZone, 6 px by default) or when the camera has moved (cycleShouldReset).
- If the first candidate is farther than options.maxStackDistance, the stack is reduced to that single candidate (stackLimited = true) and the cycle is cancelled.
- Cycle direction: wheelDelta > 0 steps back one notch in the stack, wheelDelta < 0 steps forward (modulo stackCount).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_selectionModel.activate()` | Resets the temporal state (automatic target, cycle, frozen pick, snapshot) and enables the selectionQuery cache. To be called when the tool opens. | 204 |
| `editor_ezObjectSelect_selectionModel.cycle(wheelDelta)` | Advances the active pick in the candidate stack following the wheel direction. No effect if there are fewer than 2 candidates or if wheelDelta is 0. Stores the mouse anchor and the camera to detect movement later. | 311 |
| `editor_ezObjectSelect_selectionModel.deactivate()` | Resets the temporal state (target, cycle, frozen pick, snapshot) when the tool closes. | 209 |
| `editor_ezObjectSelect_selectionModel.freezePick()` | Freezes the current pick: while frozen, it remains the target even if the cursor moves (useful during a drag). | 332 |
| `editor_ezObjectSelect_selectionModel.getSnapshot()` | Returns the last snapshot computed by update. | 346 |
| `editor_ezObjectSelect_selectionModel.invalidateCache(reason)` | Invalidates the selection cache of selectionQuery (the cache will be rebuilt at the next query). | 350 |
| `editor_ezObjectSelect_selectionModel.releasePick()` | Releases the pick frozen by freezePick. | 340 |
| `editor_ezObjectSelect_selectionModel.update(options)` | Computes the frame's snapshot: calls selectionQuery.gather(options), groups and sorts the candidates, applies the stack limit, handles cycle reset, the frozen pick and the automatic winner. Returns an empty snapshot if the query fails (no camera). | 213 |

### Parameter details

#### `editor_ezObjectSelect_selectionModel.cycle(wheelDelta)`

Advances the active pick in the candidate stack following the wheel direction. No effect if there are fewer than 2 candidates or if wheelDelta is 0. Stores the mouse anchor and the camera to detect movement later.

- `wheelDelta` (*number*) : Wheel delta; > 0 steps back in the stack, < 0 steps forward.
- **returns**: table|nil The current snapshot (modified in place), or nil if there is none.

#### `editor_ezObjectSelect_selectionModel.freezePick()`

Freezes the current pick: while frozen, it remains the target even if the cursor moves (useful during a drag).

- **returns**: table|nil The frozen candidate, or nil if there is no pick.

#### `editor_ezObjectSelect_selectionModel.getSnapshot()`

Returns the last snapshot computed by update.

- **returns**: table|nil Current snapshot.

#### `editor_ezObjectSelect_selectionModel.invalidateCache(reason)`

Invalidates the selection cache of selectionQuery (the cache will be rebuilt at the next query).

- `reason` (*string|nil*) : Reason for the invalidation (diagnostic).

#### `editor_ezObjectSelect_selectionModel.update(options)`

Computes the frame's snapshot: calls selectionQuery.gather(options), groups and sorts the candidates, applies the stack limit, handles cycle reset, the frozen pick and the automatic winner. Returns an empty snapshot if the query fails (no camera).

- `options` (*table|nil*) : Options passed to gather (discoveryPixels, nearQueryDistance, maxDistance, maxVolume, namePattern, ignorePattern, collectFilteredLarge) plus preferUnselected (boolean: favor unselected objects), maxStackDistance (number, m) and cycleDeadZone (number, px).
- **returns**: table Snapshot: camera, mouse, queryRadius, discoveryRadius, nearQueryDistance, candidates, discovery, filteredLarge, queryStats, rejected, sourceCount, stackCount, stackLimited, activeIndex, pick, cycleActive, cycleAnchor, cycleDeadZone, frozenTargetId.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua`.*

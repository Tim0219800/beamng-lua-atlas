# `editor_ezObjectSelect_selectionScreenDebug`

*File: `lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua` · VM: Game Engine (GE) · 492 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect_selectionScreenDebug`: `extensions.load("editor_ezObjectSelect_selectionScreenDebug")`, then the global `editor_ezObjectSelect_selectionScreenDebug`

ImGui overlay drawing (full screen, no inputs) of the Easy Object Select selection: outlines/convex hulls and fills of the candidates (green for the active pick, yellow for the rest of the stack, white for discovery, orange for selected objects, magenta during drag), discovery circle around the cursor, labels, and a debug window with a performance curve (180 samples).

## Notes

- Draws in an ImGui window "##easySelectProxyOverlay" covering the main viewport, with the NoInputs/NoBackground flags.
- Draws nothing if there is no pick, no discovery proxy, no debugEnabled and no showHoverRing.
- Outside debug, the number of discovery outlines is limited by options.maxDiscoveryOutlines (5 by default).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect_selectionScreenDebug.draw(snapshot, options)` | Draws the overlay for a snapshot from selectionModel.update and records the frame's performance time. Exits immediately if the snapshot has no camera. | 299 |
| `editor_ezObjectSelect_selectionScreenDebug.reset()` | Resets the performance history (samples and counters). | 51 |

### Parameter details

#### `editor_ezObjectSelect_selectionScreenDebug.draw(snapshot, options)`

Draws the overlay for a snapshot from selectionModel.update and records the frame's performance time. Exits immediately if the snapshot has no camera.

- `snapshot` (*table|nil*) : Snapshot produced by editor_ezObjectSelect_selectionModel.update.
- `options` (*table|nil*) : Display options: debugEnabled, showHoverRing, outlineMode (1 = no convex hulls), discoveryPixels, maxDiscoveryOutlines... (inferred from code).

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect/selectionScreenDebug.lua`.*

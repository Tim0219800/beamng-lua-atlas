# `ui_frustumOffset`

*File: `lua/ge/extensions/ui/frustumOffset.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_frustumOffset`: `extensions.load("ui_frustumOffset")`, then the global `ui_frustumOffset`

Shifts the camera frustum center (scenetree.OnlyGui:setFrustumCameraCenterOffset) so that the 3D view is recentered when UI panels cover part of the screen (see BngFrustumMover.js). Accepts a raw offset in engine units and/or an offset as a fraction of half the screen, converted taking the screen ratio and the FoV into account.

## Notes

- The engine offset is a slope in camera space: screen offset = offset / (aspect * tan(vFov/2)).
- The FoV used is clamped to a minimum of 10 degrees, like the engine.
- The screen offsets are recomputed in onUpdate as soon as the FoV changes.
- Signs: a positive value of screenX/screenY shifts the view center to the right/up.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_frustumOffset.onUpdate()` | Per-frame hook: if a screen offset is active and the FoV has changed since the last application, reapplies the offset. *(internal)* *(hook)* | 44 |
| `ui_frustumOffset.set(newRawX, newRawY, newScreenX, newScreenY)` | Sets the offsets and applies them immediately. Any missing value is 0. | 38 |

### Parameter details

#### `ui_frustumOffset.set(newRawX, newRawY, newScreenX, newScreenY)`

Sets the offsets and applies them immediately. Any missing value is 0.

- `newRawX` (*number|nil*) : Raw horizontal offset (engine units), passed as is.
- `newRawY` (*number|nil*) : Raw vertical offset (engine units), passed as is.
- `newScreenX` (*number|nil*) : Horizontal offset as a fraction of half the screen width.
- `newScreenY` (*number|nil*) : Vertical offset as a fraction of half the screen height.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/frustumOffset.lua`.*

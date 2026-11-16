# `editor_toolUtilities_groundClaims`

*File: `lua/ge/extensions/editor/toolUtilities/groundClaims.lua` · VM: Game Engine (GE) · 162 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_groundClaims`: `extensions.load("editor_toolUtilities_groundClaims")`, then the global `editor_toolUtilities_groundClaims`

Shared registry of "ground claims" between the editor tools that lay surfaces on the terrain. Each tool publishes, under an owner name, the rings (outlines) it occupies and the margin to respect; the other tools read these rings so as not to encroach on them. A revision counter and fingerprints (fp) make it possible to detect that another tool has moved its terrain.

## Example

```lua
local claims = require('editor/toolUtilities/groundClaims')
claims.publish('monOutil', {ring1, ring2}, 0.5)
local obs, roads = claims.obstructions(monRing, 'monOutil', roadRings, 0.1)
```

## Notes

- Rings are lists of points {x, y} (at least 3). publish does not copy the rings: the caller must republish if it modifies them.
- publish ignores a nil owner and does nothing if the fingerprint (number of points and coordinates, margin) has not changed; a publish without a valid ring clears the claim.
- A ring labeled 'buried' is a terrain held above something (tunnel cover): one can plant on it.
- The state is local to the module (claims table): it is not saved.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_groundClaims.clear(owner)` | Clears an owner's claim (publish without a ring). | 71 |
| `editor_toolUtilities_groundClaims.extents(owner)` | For each other owner, its fingerprint fp and the box {x0, y0, x1, y1} that its terrain covers, margin included. Used to know WHERE another's terrain has moved. | 63 |
| `editor_toolUtilities_groundClaims.keepOut(out, owner)` | Like others, but each ring is enlarged by the margin requested by its owner (geom.outsetClosedRing2D): what must be subtracted from one's own terrain. A claim without margin is returned as is. | 92 |
| `editor_toolUtilities_groundClaims.obstructions(ring, owner, roadRings, roadMargin, pad, skip)` | Everything that is near ring and that its owner must not cover: the supplied road rings enlarged by roadMargin, plus the claim of each other tool enlarged by its margin. Only elements whose box touches that of ring are kept. | 107 |
| `editor_toolUtilities_groundClaims.others(out, owner, flushOnly, tags)` | Adds to out all the rings of the other owners (without the margin). The exclusion prevents a tool from subtracting its own terrain from itself. | 77 |
| `editor_toolUtilities_groundClaims.publish(owner, rings, margin, tags)` | Replaces everything this owner holds with the given rings, with the margin that the others must respect. Increments the revision only if the content changed. | 32 |
| `editor_toolUtilities_groundClaims.sig()` | Revision counter, incremented on every publication that changes something. Lets a tool notice that another's terrain has moved without knowing it directly. | 150 |

### Parameter details

#### `editor_toolUtilities_groundClaims.clear(owner)`

Clears an owner's claim (publish without a ring).

- `owner` (*any*) : Owner name.

#### `editor_toolUtilities_groundClaims.extents(owner)`

For each other owner, its fingerprint fp and the box {x0, y0, x1, y1} that its terrain covers, margin included. Used to know WHERE another's terrain has moved.

- `owner` (*any*) : Owner excluded from the result.
- **returns**: table<any, table> owner -> { fp, box }.

#### `editor_toolUtilities_groundClaims.keepOut(out, owner)`

Like others, but each ring is enlarged by the margin requested by its owner (geom.outsetClosedRing2D): what must be subtracted from one's own terrain. A claim without margin is returned as is.

- `out` (*table|nil*) : Output list.
- `owner` (*any*) : Excluded owner.
- **returns**: table The out list.

#### `editor_toolUtilities_groundClaims.obstructions(ring, owner, roadRings, roadMargin, pad, skip)`

Everything that is near ring and that its owner must not cover: the supplied road rings enlarged by roadMargin, plus the claim of each other tool enlarged by its margin. Only elements whose box touches that of ring are kept.

- `ring` (*table*) : Outline tested (at least 3 points); otherwise returns two empty tables.
- `owner` (*any*) : Excluded owner.
- `roadRings` (*table[]|nil*) : Road rings supplied by the caller.
- `roadMargin` (*number|nil*) : Margin applied to roads (m).
- `pad` (*number|nil*) : Enlarges the box that defines "near".
- `skip` (*any|nil*) : Ignores the rings carrying this label (a site being edited does not obstruct itself).
- **returns**: table[] Obstacle rings.
- **returns**: table<table, boolean> Set of the output rings that are roads.

#### `editor_toolUtilities_groundClaims.others(out, owner, flushOnly, tags)`

Adds to out all the rings of the other owners (without the margin). The exclusion prevents a tool from subtracting its own terrain from itself.

- `out` (*table|nil*) : Output list (created if nil).
- `owner` (*any*) : Excluded owner.
- `flushOnly` (*boolean|nil*) : Keeps only the claims without margin (terrain that we join flush with).
- `tags` (*table|nil*) : If provided, receives the label of each ring (false if none) at the ring's index in out.
- **returns**: table The out list.

#### `editor_toolUtilities_groundClaims.publish(owner, rings, margin, tags)`

Replaces everything this owner holds with the given rings, with the margin that the others must respect. Increments the revision only if the content changed.

- `owner` (*any*) : Owner name (table key); nil = no effect.
- `rings` (*table[]|nil*) : Rings of points {x, y}; those with fewer than 3 points are ignored.
- `margin` (*number|nil*) : Margin (m) that the other tools leave around; default 0 (flush junction).
- `tags` (*table|nil*) : Label per ring (same index as rings), so that a tool editing this thing ignores its own copies (see obstructions).

#### `editor_toolUtilities_groundClaims.sig()`

Revision counter, incremented on every publication that changes something. Lets a tool notice that another's terrain has moved without knowing it directly.

- **returns**: integer Current revision.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/groundClaims.lua`.*

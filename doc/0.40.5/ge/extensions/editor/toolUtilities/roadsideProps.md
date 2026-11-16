# `editor_toolUtilities_roadsideProps`

*File: `lua/ge/extensions/editor/toolUtilities/roadsideProps.lua` · VM: Game Engine (GE) · 538 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_roadsideProps`: `extensions.load("editor_toolUtilities_roadsideProps")`, then the global `editor_toolUtilities_roadsideProps`

Shared placer of lines of objects at the roadside (guardrails, barriers, fences, lampposts, bollards, bins, bus shelters...). A presets table describes each piece (.dae shape, rotation, gap between pieces, normal mode, alternating pieces, end caps); runLine places a line of pieces along a rail, placePoints one piece at each given point, placeScatter random scattered elements. The pieces go into "pools" identified by poolId (scene via kitPlacer), which the tool can delete, count or burn (commitPool) into persistent objects. Lampposts also create their light (siteLights).

## Example

```lua
local rp = extensions.editor_toolUtilities_roadsideProps
local n = rp.runLine({poolId = 'edgeL', presetKey = 'guardrail', folder = scenetree.findObject('MissionGroup'),
  railPts = pts, railUps = ups})
print(rp.poolCount('edgeL'))
rp.removePool('edgeL')
```

## Notes

- Provided presets (key): jersey, plastic, fence, chainlink, scrap, guardrail, lampMast, lampVictorian, lampSingle, lampTwin, lampStreet, lampHighway, lampSidewalk, bollard, bollardStone, bollardTall, bin, binMetal, binSmall, busShelter. A preset with reach is a lamppost (light created). normalMode 'surface' follows the ground/rail normal, 'global' stands the piece upright (spot props, no chaining).
- The street furniture pieces baked by the props kit are not part of the shipped version: they register via addPresets.
- The pieces of a pool are created transient; commitPool makes them persistent (canSave=true) and detaches them from the pool.
- Object names are "HeroProp_" + poolId (+ _ownerTag) + index: several sections in the same pool (keepPool) must have different ownerTags, otherwise they overwrite the names of the previous ones.
- For spot props, the default step is preset.pointStepM or 25 m; for chained pieces, piece length + gapM + extraGapM. The minimum step is 0.05 m.
- placeScatter is deterministic for a given opts.seed (linear congruential 1103515245/12345 modulo 2^31).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_roadsideProps.addPresets(t)` | Merges additional presets into the presets table (by key). Used by the props kit, outside the shipped version, to register street furniture and civic pieces. | 517 |
| `editor_toolUtilities_roadsideProps.beginPointBatch(minGap)` | Starts a batch of spot props with spatial deduplication: any point within minGap of a point already placed in this batch is rejected (breaks up places where lines meet). Without a positive minGap, disables deduplication. | 244 |
| `editor_toolUtilities_roadsideProps.commitPool(poolId)` | Burns a pool: makes the transient pieces and the lights of its lampposts persistent (canSave=true), then detaches them from the pool without deleting them. | 301 |
| `editor_toolUtilities_roadsideProps.endPointBatch()` | Ends the batch of spot props. | 248 |
| `editor_toolUtilities_roadsideProps.lampLight(presetKey, px, py, pz, q, scale, col, bright, reach)` | Builds the light record (see siteLights) of a lamppost placed at (px, py, pz) and rotated by q; the head is placed under the top of the mesh's box, at the end of the arm if there is one. Returns nil if the preset is not a lamppost. | 210 |
| `editor_toolUtilities_roadsideProps.orientation(along, up, preIdx, sideSign)` | Rotation given to a placed piece (see orient) for a tool that stands up its own pieces. Shared quaternion: use or copy it before the next call. | 179 |
| `editor_toolUtilities_roadsideProps.placePoints(opts)` | Places a preset at each world point provided. Replaces the pool unless keepPool. Each point can carry ax, ay (horizontal direction along) and scl (number, or {x,y,z} in the piece's frame) to adjust that instance. For a lamppost, also creates the light. | 314 |
| `editor_toolUtilities_roadsideProps.placeScatter(opts)` | Scatters free meshes at the given points (random shape, yaw, tilt, size and burial) into a pool. Deterministic for opts.seed. Always replaces the pool. | 340 |
| `editor_toolUtilities_roadsideProps.poolCount(poolId)` | Number of pieces currently in a pool (0 if empty, not built or burned). O(1) read, usable every frame. | 289 |
| `editor_toolUtilities_roadsideProps.poolList(poolId)` | Returns the placed pieces of a pool, for a bake that rereads them from the scene. Read-only. | 295 |
| `editor_toolUtilities_roadsideProps.removePool(poolId)` | Deletes the pool of pieces placed by the caller (pieces and lights). | 278 |
| `editor_toolUtilities_roadsideProps.runLine(opts)` | Builds (or rebuilds) a line of props along a rail. keepPool adds to the pool instead of replacing it, which allows building a line made of several rails (a parapet interrupted by flights of stairs comes as a few open sections). Spot props (global mode) are placed at regular intervals, with lockEnds to lock both ends and distribute the interior. | 372 |

### Parameter details

#### `editor_toolUtilities_roadsideProps.addPresets(t)`

Merges additional presets into the presets table (by key). Used by the props kit, outside the shipped version, to register street furniture and civic pieces.

- `t` (*table<string, table>*) : Presets to add or replace.

#### `editor_toolUtilities_roadsideProps.beginPointBatch(minGap)`

Starts a batch of spot props with spatial deduplication: any point within minGap of a point already placed in this batch is rejected (breaks up places where lines meet). Without a positive minGap, disables deduplication.

- `minGap` (*number|nil*) : Minimum distance between points, in meters.

#### `editor_toolUtilities_roadsideProps.commitPool(poolId)`

Burns a pool: makes the transient pieces and the lights of its lampposts persistent (canSave=true), then detaches them from the pool without deleting them.

- `poolId` (*string*) : Pool identifier.
- **returns**: table List of identifiers/names of the objects made persistent.

#### `editor_toolUtilities_roadsideProps.lampLight(presetKey, px, py, pz, q, scale, col, bright, reach)`

Builds the light record (see siteLights) of a lamppost placed at (px, py, pz) and rotated by q; the head is placed under the top of the mesh's box, at the end of the arm if there is one. Returns nil if the preset is not a lamppost.

- `presetKey` (*string*) : Preset key.
- `px` (*number*) : x of the foot.
- `py` (*number*) : y of the foot.
- `pz` (*number*) : z of the foot.
- `q` (*quat*) : Rotation of the piece.
- `scale` (*number|nil*) : Scale (default 1).
- `col` (*any|nil*) : Glow color (default siteLights.TONES.warm).
- `bright` (*number|nil*) : Brightness (default that of the preset).
- `reach` (*number|nil*) : Light radius (default that of the preset).
- **returns**: table|nil { px, py, pz, glow, radius, brightness }.

#### `editor_toolUtilities_roadsideProps.orientation(along, up, preIdx, sideSign)`

Rotation given to a placed piece (see orient) for a tool that stands up its own pieces. Shared quaternion: use or copy it before the next call.

- `along` (*vec3*) : Direction along the rail.
- `up` (*vec3*) : Upward direction.
- `preIdx` (*integer*) : Pre-rotation of the piece, 0 to 3 (0, 90, 180, 270 degrees around Z).
- `sideSign` (*number|nil*) : Side: a negative value flips the piece by 180 degrees (default 1).
- **returns**: quat Rotation (shared instance of the module).

#### `editor_toolUtilities_roadsideProps.placePoints(opts)`

Places a preset at each world point provided. Replaces the pool unless keepPool. Each point can carry ax, ay (horizontal direction along) and scl (number, or {x,y,z} in the piece's frame) to adjust that instance. For a lamppost, also creates the light.

- `opts` (*table*) : poolId, presetKey, folder (parent scene group), points ({x,y,z,ax,ay,scl}), sideSign (default 1), keepPool, ownerTag, outPositions (receives the placed positions), outLights (receives the lights).
- **returns**: integer Number of pieces placed (0 if preset or points are missing).

#### `editor_toolUtilities_roadsideProps.placeScatter(opts)`

Scatters free meshes at the given points (random shape, yaw, tilt, size and burial) into a pool. Deterministic for opts.seed. Always replaces the pool.

- `opts` (*table*) : poolId, folder, shapePaths (shapes to choose from), points ({x,y,z}), seed, base (base scale, default 1), var (relative variation, default 0), tiltMax (max tilt in radians, default 0.2), buryBase (default 0.03 m), buryVar (default 0.12), collidable (boolean), outPositions.
- **returns**: integer Number of pieces placed.

#### `editor_toolUtilities_roadsideProps.poolCount(poolId)`

Number of pieces currently in a pool (0 if empty, not built or burned). O(1) read, usable every frame.

- `poolId` (*string*) : Pool identifier.
- **returns**: integer Number of pieces.

#### `editor_toolUtilities_roadsideProps.poolList(poolId)`

Returns the placed pieces of a pool, for a bake that rereads them from the scene. Read-only.

- `poolId` (*string*) : Pool identifier.
- **returns**: table|nil List of scene objects, or nil.

#### `editor_toolUtilities_roadsideProps.removePool(poolId)`

Deletes the pool of pieces placed by the caller (pieces and lights).

- `poolId` (*string*) : Pool identifier.

#### `editor_toolUtilities_roadsideProps.runLine(opts)`

Builds (or rebuilds) a line of props along a rail. keepPool adds to the pool instead of replacing it, which allows building a line made of several rails (a parapet interrupted by flights of stairs comes as a few open sections). Spot props (global mode) are placed at regular intervals, with lockEnds to lock both ends and distribute the interior.

- `opts` (*table*) : poolId, presetKey ('none' = nothing), folder, railPts (at least 2 points), railUps (normals), sideSign, stepM, extraGapM, lockEnds, isLoop, keepPool, ownerTag, outPositions, outLights, rejectFn (returns true to reject a sample).
- **returns**: integer Number of pieces placed.

## Fields

| Field | Type | Description |
|---|---|---|
| `presets` | table<string, table> | Table of piece presets, by key. Usual fields: name, shapePath, preRot (0 to 3, quarter turns around Z), gapM (gap between pieces, negative = overlap), nativeLenM, normalMode ('surface' or 'global'), altPaths (alternating shapes), capMode/capPath/capPreRot (end caps), reach/bright (lampposts). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/roadsideProps.lua`.*

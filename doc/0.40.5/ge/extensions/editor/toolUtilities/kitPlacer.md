# `editor_toolUtilities_kitPlacer`

*File: `lua/ge/extensions/editor/toolUtilities/kitPlacer.lua` · VM: Game Engine (GE) · 647 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_kitPlacer`: `extensions.load("editor_toolUtilities_kitPlacer")`, then the global `editor_toolUtilities_kitPlacer`

Shared placer of kit pieces (baked .dae files) for the editor's construction tools (streets, buildings, bridges). A piece can be a TSStatic (transient preview, canSave = false) or a Forest item (much cheaper: a transform and a pointer to a ForestItemData). Handles reusing pieces from one rebuild to the next, "burning" (making pieces persistent in the level), writing the datablocks in art/forest/managedItemData.json and removing live pieces from the forest during a level save.

## Example

```lua
local kp = require('editor/toolUtilities/kitPlacer')
local sink = kp.newSink(folder, 'monOutil', true)
kp.beginReuse(sink.list)
kp.placeOriented(sink, 'art/shapes/.../piece.dae', x, y, z, ax, ay, az, ux, uy, uz, 1)
kp.endReuse(sink.list)
local manifest = kp.commitSink(sink) -- burn
```

## Notes

- Frame of a piece: local X = 'along' direction (ax, ay, az), local Z = 'up' (ux, uy, uz), local Y = up x along. The scale is either a number (uniform) or a table {x, y, z} per axis.
- An unbaked shape (missing file) is reported once per path in the log (E 'kit piece is not baked') and the piece is not created; the entry stays in the list with obj = nil so the counts stay correct.
- The forest limits matrix entries: newItem divides the matrix until no column exceeds 1.08 (the forest otherwise reloads a matrix > 1.1 as broken) and carries the factor over into the item's scale.
- Three families of datablocks: 'burned' (prefix massingKit_, collision kept), 'live' (liveKit_, collidable = 0) and 'solid' (liveSolid_, collision active). Only the massingKit_ ones are written to managedItemData.json.
- Live pieces must be removed from the forest before a save (liftLive) then put back (relayLive, to be called every frame), otherwise they would go into the level with 'live' datablocks that are not persisted.
- A sink is { folder, ownerId, collidable, list, n }; with an emitFrame field, placeOriented passes it the frame instead of creating an object (tools that bake their output).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_kitPlacer.beginReuse(list)` | Sets aside the pieces of the last pass for the next one: one queue per shape, handed out in order. The list is emptied but nothing is deleted. An identical rebuild finds each piece in its place without work. | 133 |
| `editor_toolUtilities_kitPlacer.burnItem(fd, entry)` | Puts a live piece back into the level: same pose on the shape's own datablock (the one that collides), removes the live item. Nil for an entry that is not a Forest item. | 468 |
| `editor_toolUtilities_kitPlacer.burnList(fd, list, out)` | Burns all live entries of a pool: their items are added to out and the pool is emptied. | 481 |
| `editor_toolUtilities_kitPlacer.commitSink(sink)` | Burn of a sink: makes its TSStatics persistent (canSave = true), applies the 'Collision Mesh' collision if the sink is collidable, marks the editor as modified and returns the object names as a manifest. Does not delete or detach anything (the caller detaches its pool). The names survive the save. | 317 |
| `editor_toolUtilities_kitPlacer.deleteList(list)` | Clears the pieces placed from a list: deletes each TSStatic, removes each Forest item, empties the list (also ends an abandoned reuse). | 285 |
| `editor_toolUtilities_kitPlacer.dropLive(fd, t, k)` | Removes slot k of t from the forest and from the table. fd may be nil (the forest where the piece lives is then looked up). | 452 |
| `editor_toolUtilities_kitPlacer.endReuse(list)` | Deletes what the pass did not ask for again (what remains in the queues) and returns how many disappeared. | 118 |
| `editor_toolUtilities_kitPlacer.isLive(e)` | Tells whether a pool slot is a live Forest piece rather than a TSStatic. | 449 |
| `editor_toolUtilities_kitPlacer.itemDataFor(shapePath, kind)` | Returns the ForestItemData of a kit shape, created on first use: the level's ('burned', default) or a tool copy for live pieces ('live', collidable = 0, or 'solid'). Deliberately created without going through editor.createDataBlock so as not to be handed to the persistence manager (writeItemDatas takes care of it). The name comes from the full path of the shape. | 383 |
| `editor_toolUtilities_kitPlacer.liftLive()` | Takes all live pieces out of the forest before a level save (their own and those a tool may have lost track of, identified by the liveKit_/liveSolid_ datablock prefix). To be called from each tool's save hook: the first does the work, the following ones find it already done. | 500 |
| `editor_toolUtilities_kitPlacer.liveForestData()` | Returns the level's forest data, creating a Forest if there is none (foliageScatter.ensureForest). | 633 |
| `editor_toolUtilities_kitPlacer.markDirty()` | Marks the editor as modified so that saving is offered. Enough for a tool whose burn is made of statics only (scene objects saved with the level); a tool that plants Forest items must also call writeItemDatas. | 611 |
| `editor_toolUtilities_kitPlacer.moveOriented(entry, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Moves a piece already in the scene onto a new frame, much cheaper than deleting and rebuilding it. For a Forest item: removes then replants (faster than updateItem). For a TSStatic: setPosRot, the scale is only rewritten if it changed. | 259 |
| `editor_toolUtilities_kitPlacer.newSink(folder, ownerId, collidable, list)` | Builds a "sink" for an owner. A nil ownerId produces unnamed pieces, for a caller that never finds them again by name. | 98 |
| `editor_toolUtilities_kitPlacer.placeOriented(sink, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Places a kit piece according to a local frame (origin, along direction, up direction). A sink carrying emitFrame receives the frame instead of a scene object and its return value is returned. | 241 |
| `editor_toolUtilities_kitPlacer.placeTs(sink, shapePath, px, py, pz, qx, qy, qz, qw, scl)` | Places an instance (position + quaternion) and adds its entry to the sink's list, reusing a reusable piece of the same shape if possible (only rewrites the transform if it changed). Missing shape or no folder: entry with obj = nil. | 164 |
| `editor_toolUtilities_kitPlacer.plantOriented(fd, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Plants a live piece from a local frame, as a Forest item. Returns the entry the list keeps, or nil if there is no forest or no burned shape, so the caller places a TSStatic instead. | 412 |
| `editor_toolUtilities_kitPlacer.plantStatic(fd, obj)` | Plants a piece as a Forest item directly from a TSStatic's pose (per-axis scale baked into the matrix columns), on the 'burned' datablock of its shape. | 529 |
| `editor_toolUtilities_kitPlacer.poseLive(fd, list, i, shapePath, solid, px, py, pz, qx, qy, qz, qw, sx, sy, sz)` | Places slot i of a list as a live Forest piece: shape at a position, a quaternion and a per-axis scale; solid for a piece that collides like its TSStatic. A slot whose shape and pose have not changed is left as is. An unburned shape keeps its slot without an item. | 427 |
| `editor_toolUtilities_kitPlacer.relayLive()` | To be called every frame by each tool: the first call after a save restores what liftLive removed. Only in an entry that still holds the lifted item, and only in the forest it was taken out of. | 516 |
| `editor_toolUtilities_kitPlacer.removeBurned(nameManifest)` | Deletes by name all the burned pieces listed in the manifest (from commitSink), then marks the editor as modified. Nil or empty manifest: no effect. | 338 |
| `editor_toolUtilities_kitPlacer.safeName(prefix, id)` | Composes prefix + id with every non-alphanumeric character of the id replaced by '_'. Warning: string.gsub returns two values but the .. operator keeps only one. | 305 |
| `editor_toolUtilities_kitPlacer.setGlow(obj, glow, night)` | Colors a luminous piece (instanceColor). With night, also entrusts it to core_environment's day/night pass (nightEmissive), which sets the color to black by day and restores it at dusk: a sign or lamp lens is dark glass by day. The color is also written here. | 594 |
| `editor_toolUtilities_kitPlacer.shapeOf(path)` | Returns the path of a kit shape if the file exists (result cached), otherwise nil with a single error message in the log. | 38 |
| `editor_toolUtilities_kitPlacer.spawnOriented(folder, shapePath, name, collidable, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Creates an isolated piece (TSStatic), outside any sink, for a caller that manages its own slots. Replaces any object of the same name. | 251 |
| `editor_toolUtilities_kitPlacer.trimLive(fd, list, n)` | Removes from the forest and from the list all slots after the n-th. | 462 |
| `editor_toolUtilities_kitPlacer.writeItemDatas()` | Writes the kit's datablocks to the level's art/forest/managedItemData.json, to be called at save time. The massingKit_ keys are rebuilt from what is placed (adding new burned shapes, removing those nothing uses); the rest of the file, owned by the Forest Editor, is left as is. Without this, a burned building reloads with pieces pointing to nonexistent datablocks. Does not touch the file if there is nothing from this kit. | 561 |

### Parameter details

#### `editor_toolUtilities_kitPlacer.beginReuse(list)`

Sets aside the pieces of the last pass for the next one: one queue per shape, handed out in order. The list is emptied but nothing is deleted. An identical rebuild finds each piece in its place without work.

- `list` (*table|nil*) : Sink list (the reuse key is the list, not the sink).

#### `editor_toolUtilities_kitPlacer.burnItem(fd, entry)`

Puts a live piece back into the level: same pose on the shape's own datablock (the one that collides), removes the live item. Nil for an entry that is not a Forest item.

- `fd` (*userdata*) : ForestData.
- `entry` (*table*) : Live entry.
- **returns**: userdata|nil New burned item.

#### `editor_toolUtilities_kitPlacer.burnList(fd, list, out)`

Burns all live entries of a pool: their items are added to out and the pool is emptied.

- `fd` (*userdata*) : ForestData.
- `list` (*table|nil*) : Entry pool.
- `out` (*table*) : List receiving the burned items.

#### `editor_toolUtilities_kitPlacer.commitSink(sink)`

Burn of a sink: makes its TSStatics persistent (canSave = true), applies the 'Collision Mesh' collision if the sink is collidable, marks the editor as modified and returns the object names as a manifest. Does not delete or detach anything (the caller detaches its pool). The names survive the save.

- `sink` (*table|nil*) : Sink or { list = ... }.
- **returns**: string[] Manifest of object names.

#### `editor_toolUtilities_kitPlacer.deleteList(list)`

Clears the pieces placed from a list: deletes each TSStatic, removes each Forest item, empties the list (also ends an abandoned reuse).

- `list` (*table|nil*) : List of entries.

#### `editor_toolUtilities_kitPlacer.dropLive(fd, t, k)`

Removes slot k of t from the forest and from the table. fd may be nil (the forest where the piece lives is then looked up).

- `fd` (*userdata|nil*) : ForestData.
- `t` (*table*) : List.
- `k` (*integer*) : Index.

#### `editor_toolUtilities_kitPlacer.endReuse(list)`

Deletes what the pass did not ask for again (what remains in the queues) and returns how many disappeared.

- `list` (*table|nil*) : Sink list.
- **returns**: integer Number of deleted objects.

#### `editor_toolUtilities_kitPlacer.isLive(e)`

Tells whether a pool slot is a live Forest piece rather than a TSStatic.

- `e` (*table|nil*) : Entry.
- **returns**: boolean true if it is a tracked Forest piece.

#### `editor_toolUtilities_kitPlacer.itemDataFor(shapePath, kind)`

Returns the ForestItemData of a kit shape, created on first use: the level's ('burned', default) or a tool copy for live pieces ('live', collidable = 0, or 'solid'). Deliberately created without going through editor.createDataBlock so as not to be handed to the persistence manager (writeItemDatas takes care of it). The name comes from the full path of the shape.

- `shapePath` (*string|nil*) : Path of the .dae.
- `kind` (*string|nil*) : 'burned' (default), 'live' or 'solid'.
- **returns**: userdata|nil ForestItemData.

#### `editor_toolUtilities_kitPlacer.liveForestData()`

Returns the level's forest data, creating a Forest if there is none (foliageScatter.ensureForest).

- **returns**: userdata|nil ForestData.

#### `editor_toolUtilities_kitPlacer.moveOriented(entry, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)`

Moves a piece already in the scene onto a new frame, much cheaper than deleting and rebuilding it. For a Forest item: removes then replants (faster than updateItem). For a TSStatic: setPosRot, the scale is only rewritten if it changed.

- `entry` (*table*) : Entry { obj } or { item, data }.
- `ox` (*number*) : Origin x.
- `oy` (*number*) : Origin y.
- `oz` (*number*) : Origin z.
- `ax` (*number*) : Along x.
- `ay` (*number*) : Along y.
- `az` (*number*) : Along z.
- `ux` (*number*) : Up x.
- `uy` (*number*) : Up y.
- `uz` (*number*) : Up z.
- `scl` (*number|table|nil*) : Scale.
- **returns**: boolean true if the piece was moved.

#### `editor_toolUtilities_kitPlacer.newSink(folder, ownerId, collidable, list)`

Builds a "sink" for an owner. A nil ownerId produces unnamed pieces, for a caller that never finds them again by name.

- `folder` (*userdata*) : SimGroup receiving the pieces.
- `ownerId` (*string|nil*) : Owner identifier, base of the 'ownerId_N' names.
- `collidable` (*boolean|nil*) : The pieces must collide (applied at commit for statics).
- `list` (*table|nil*) : Existing list to fill (shared between sinks); otherwise a new one.
- **returns**: table Sink { folder, ownerId, collidable, list, n }.

#### `editor_toolUtilities_kitPlacer.placeOriented(sink, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)`

Places a kit piece according to a local frame (origin, along direction, up direction). A sink carrying emitFrame receives the frame instead of a scene object and its return value is returned.

- `sink` (*table*) : Sink.
- `shapePath` (*string*) : Path of the .dae.
- `ox` (*number*) : Origin x.
- `oy` (*number*) : Origin y.
- `oz` (*number*) : Origin z.
- `ax` (*number*) : Along direction x.
- `ay` (*number*) : Along direction y.
- `az` (*number*) : Along direction z.
- `ux` (*number*) : Up direction x.
- `uy` (*number*) : Up direction y.
- `uz` (*number*) : Up direction z.
- `scl` (*number|table|nil*) : Scale.
- **returns**: any Result of sink.emitFrame, otherwise nothing.

#### `editor_toolUtilities_kitPlacer.placeTs(sink, shapePath, px, py, pz, qx, qy, qz, qw, scl)`

Places an instance (position + quaternion) and adds its entry to the sink's list, reusing a reusable piece of the same shape if possible (only rewrites the transform if it changed). Missing shape or no folder: entry with obj = nil.

- `sink` (*table*) : Sink.
- `shapePath` (*string|nil*) : Path of the .dae.
- `px` (*number*) : Position x.
- `py` (*number*) : Position y.
- `pz` (*number*) : Position z.
- `qx` (*number*) : Quaternion x.
- `qy` (*number*) : Quaternion y.
- `qz` (*number*) : Quaternion z.
- `qw` (*number*) : Quaternion w.
- `scl` (*number|table|nil*) : Uniform scale or {x, y, z}.

#### `editor_toolUtilities_kitPlacer.plantOriented(fd, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)`

Plants a live piece from a local frame, as a Forest item. Returns the entry the list keeps, or nil if there is no forest or no burned shape, so the caller places a TSStatic instead.

- `fd` (*userdata*) : ForestData.
- `shapePath` (*string*) : Path of the .dae.
- `ox` (*number*) : Origin x.
- `oy` (*number*) : Origin y.
- `oz` (*number*) : Origin z.
- `ax` (*number*) : Along x.
- `ay` (*number*) : Along y.
- `az` (*number*) : Along z.
- `ux` (*number*) : Up x.
- `uy` (*number*) : Up y.
- `uz` (*number*) : Up z.
- `scl` (*number|table|nil*) : Scale (per-axis possible: the forest matrix carries it).
- **returns**: table|nil Entry { item, data, shape }.

#### `editor_toolUtilities_kitPlacer.plantStatic(fd, obj)`

Plants a piece as a Forest item directly from a TSStatic's pose (per-axis scale baked into the matrix columns), on the 'burned' datablock of its shape.

- `fd` (*userdata*) : ForestData.
- `obj` (*userdata*) : Source TSStatic.
- **returns**: userdata|nil Created item, or nil.

#### `editor_toolUtilities_kitPlacer.poseLive(fd, list, i, shapePath, solid, px, py, pz, qx, qy, qz, qw, sx, sy, sz)`

Places slot i of a list as a live Forest piece: shape at a position, a quaternion and a per-axis scale; solid for a piece that collides like its TSStatic. A slot whose shape and pose have not changed is left as is. An unburned shape keeps its slot without an item.

- `fd` (*userdata*) : ForestData.
- `list` (*table*) : Entry pool.
- `i` (*integer*) : Slot index.
- `shapePath` (*string*) : Path of the .dae.
- `solid` (*boolean*) : Datablock with collision.
- `px` (*number*) : Position x.
- `py` (*number*) : Position y.
- `pz` (*number*) : Position z.
- `qx` (*number*) : Quaternion x.
- `qy` (*number*) : Quaternion y.
- `qz` (*number*) : Quaternion z.
- `qw` (*number*) : Quaternion w.
- `sx` (*number*) : X scale.
- `sy` (*number*) : Y scale.
- `sz` (*number*) : Z scale.
- **returns**: table The slot's entry.

#### `editor_toolUtilities_kitPlacer.removeBurned(nameManifest)`

Deletes by name all the burned pieces listed in the manifest (from commitSink), then marks the editor as modified. Nil or empty manifest: no effect.

- `nameManifest` (*string[]|nil*) : Object names.
- **returns**: integer Number of deleted objects.

#### `editor_toolUtilities_kitPlacer.safeName(prefix, id)`

Composes prefix + id with every non-alphanumeric character of the id replaced by '_'. Warning: string.gsub returns two values but the .. operator keeps only one.

- `prefix` (*string*) : Prefix.
- `id` (*any*) : Identifier (converted by tostring).
- **returns**: string Safe name.

#### `editor_toolUtilities_kitPlacer.setGlow(obj, glow, night)`

Colors a luminous piece (instanceColor). With night, also entrusts it to core_environment's day/night pass (nightEmissive), which sets the color to black by day and restores it at dusk: a sign or lamp lens is dark glass by day. The color is also written here.

- `obj` (*userdata*) : TSStatic.
- `glow` (*number[]*) : Color {r, g, b} (default 1 per component).
- `night` (*boolean|nil*) : Register for the night emissive (siteLights.markDirty).

#### `editor_toolUtilities_kitPlacer.shapeOf(path)`

Returns the path of a kit shape if the file exists (result cached), otherwise nil with a single error message in the log.

- `path` (*string|nil*) : Path of the baked .dae.
- **returns**: string|nil The path, or nil if it is absent or not baked.

#### `editor_toolUtilities_kitPlacer.spawnOriented(folder, shapePath, name, collidable, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)`

Creates an isolated piece (TSStatic), outside any sink, for a caller that manages its own slots. Replaces any object of the same name.

- `folder` (*userdata*) : Parent SimGroup.
- `shapePath` (*string*) : Path of the .dae.
- `name` (*string|nil*) : Scene object name.
- `collidable` (*boolean|nil*) : 'Collision Mesh' collision, otherwise 'None'.
- `ox` (*number*) : Origin x.
- `oy` (*number*) : Origin y.
- `oz` (*number*) : Origin z.
- `ax` (*number*) : Along x.
- `ay` (*number*) : Along y.
- `az` (*number*) : Along z.
- `ux` (*number*) : Up x.
- `uy` (*number*) : Up y.
- `uz` (*number*) : Up z.
- `scl` (*number|table|nil*) : Scale.
- **returns**: userdata|nil Created TSStatic, or nil.

#### `editor_toolUtilities_kitPlacer.trimLive(fd, list, n)`

Removes from the forest and from the list all slots after the n-th.

- `fd` (*userdata|nil*) : ForestData.
- `list` (*table*) : List.
- `n` (*integer*) : Number of slots to keep.

## Fields

| Field | Type | Description |
|---|---|---|
| `MASSING_ITEM_PREFIX` | string | 'massingKit_' prefix of the ForestItemData of the burned (persistent) pieces. |

## Calls into the engine (C++)

- `FS:` `fileExists`
- `Sim.` `getDataBlockSet`
- `obj:` `getField`, `getTransform`, `setField`, `updateInstanceRenderData`
- `scenetree.` `findClassObjects`, `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/kitPlacer.lua`.*

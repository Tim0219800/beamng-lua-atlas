---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/kitPlacer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared placer of kit pieces (baked .dae files) for the editor's construction tools (streets, buildings, bridges). A piece can be a TSStatic (transient preview, canSave = false) or a Forest item (much cheaper: a transform and a pointer to a ForestItemData). Handles reusing pieces from one rebuild to the next, "burning" (making pieces persistent in the level), writing the datablocks in art/forest/managedItemData.json and removing live pieces from the forest during a level save.
--- Access: extension `editor_toolUtilities_kitPlacer`: `extensions.load("editor_toolUtilities_kitPlacer")`, then the global `editor_toolUtilities_kitPlacer`
---@class editor_toolUtilities_kitPlacer
---@field MASSING_ITEM_PREFIX string 'massingKit_' prefix of the ForestItemData of the burned (persistent) pieces.
editor_toolUtilities_kitPlacer = {}

--- Sets aside the pieces of the last pass for the next one: one queue per shape, handed out in order. The list is emptied but nothing is deleted. An identical rebuild finds each piece in its place without work.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:133
---@param list table|nil Sink list (the reuse key is the list, not the sink).
function editor_toolUtilities_kitPlacer.beginReuse(list) end

--- Puts a live piece back into the level: same pose on the shape's own datablock (the one that collides), removes the live item. Nil for an entry that is not a Forest item.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:468
---@param fd userdata ForestData.
---@param entry table Live entry.
---@return userdata|nil  New burned item.
function editor_toolUtilities_kitPlacer.burnItem(fd, entry) end

--- Burns all live entries of a pool: their items are added to out and the pool is emptied.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:481
---@param fd userdata ForestData.
---@param list table|nil Entry pool.
---@param out table List receiving the burned items.
function editor_toolUtilities_kitPlacer.burnList(fd, list, out) end

--- Burn of a sink: makes its TSStatics persistent (canSave = true), applies the 'Collision Mesh' collision if the sink is collidable, marks the editor as modified and returns the object names as a manifest. Does not delete or detach anything (the caller detaches its pool). The names survive the save.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:317
---@param sink table|nil Sink or { list = ... }.
---@return string[]  Manifest of object names.
function editor_toolUtilities_kitPlacer.commitSink(sink) end

--- Clears the pieces placed from a list: deletes each TSStatic, removes each Forest item, empties the list (also ends an abandoned reuse).
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:285
---@param list table|nil List of entries.
function editor_toolUtilities_kitPlacer.deleteList(list) end

--- Removes slot k of t from the forest and from the table. fd may be nil (the forest where the piece lives is then looked up).
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:452
---@param fd userdata|nil ForestData.
---@param t table List.
---@param k integer Index.
function editor_toolUtilities_kitPlacer.dropLive(fd, t, k) end

--- Deletes what the pass did not ask for again (what remains in the queues) and returns how many disappeared.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:118
---@param list table|nil Sink list.
---@return integer  Number of deleted objects.
function editor_toolUtilities_kitPlacer.endReuse(list) end

--- Tells whether a pool slot is a live Forest piece rather than a TSStatic.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:449
---@param e table|nil Entry.
---@return boolean  true if it is a tracked Forest piece.
function editor_toolUtilities_kitPlacer.isLive(e) end

--- Returns the ForestItemData of a kit shape, created on first use: the level's ('burned', default) or a tool copy for live pieces ('live', collidable = 0, or 'solid'). Deliberately created without going through editor.createDataBlock so as not to be handed to the persistence manager (writeItemDatas takes care of it). The name comes from the full path of the shape.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:383
---@param shapePath string|nil Path of the .dae.
---@param kind string|nil 'burned' (default), 'live' or 'solid'.
---@return userdata|nil  ForestItemData.
function editor_toolUtilities_kitPlacer.itemDataFor(shapePath, kind) end

--- Takes all live pieces out of the forest before a level save (their own and those a tool may have lost track of, identified by the liveKit_/liveSolid_ datablock prefix). To be called from each tool's save hook: the first does the work, the following ones find it already done.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:500
function editor_toolUtilities_kitPlacer.liftLive() end

--- Returns the level's forest data, creating a Forest if there is none (foliageScatter.ensureForest).
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:633
---@return userdata|nil  ForestData.
function editor_toolUtilities_kitPlacer.liveForestData() end

--- Marks the editor as modified so that saving is offered. Enough for a tool whose burn is made of statics only (scene objects saved with the level); a tool that plants Forest items must also call writeItemDatas.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:611
function editor_toolUtilities_kitPlacer.markDirty() end

--- Moves a piece already in the scene onto a new frame, much cheaper than deleting and rebuilding it. For a Forest item: removes then replants (faster than updateItem). For a TSStatic: setPosRot, the scale is only rewritten if it changed.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:259
---@param entry table Entry { obj } or { item, data }.
---@param ox number Origin x.
---@param oy number Origin y.
---@param oz number Origin z.
---@param ax number Along x.
---@param ay number Along y.
---@param az number Along z.
---@param ux number Up x.
---@param uy number Up y.
---@param uz number Up z.
---@param scl number|table|nil Scale.
---@return boolean  true if the piece was moved.
function editor_toolUtilities_kitPlacer.moveOriented(entry, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Builds a "sink" for an owner. A nil ownerId produces unnamed pieces, for a caller that never finds them again by name.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:98
---@param folder userdata SimGroup receiving the pieces.
---@param ownerId string|nil Owner identifier, base of the 'ownerId_N' names.
---@param collidable boolean|nil The pieces must collide (applied at commit for statics).
---@param list table|nil Existing list to fill (shared between sinks); otherwise a new one.
---@return table  Sink { folder, ownerId, collidable, list, n }.
function editor_toolUtilities_kitPlacer.newSink(folder, ownerId, collidable, list) end

--- Places a kit piece according to a local frame (origin, along direction, up direction). A sink carrying emitFrame receives the frame instead of a scene object and its return value is returned.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:241
---@param sink table Sink.
---@param shapePath string Path of the .dae.
---@param ox number Origin x.
---@param oy number Origin y.
---@param oz number Origin z.
---@param ax number Along direction x.
---@param ay number Along direction y.
---@param az number Along direction z.
---@param ux number Up direction x.
---@param uy number Up direction y.
---@param uz number Up direction z.
---@param scl number|table|nil Scale.
---@return any  Result of sink.emitFrame, otherwise nothing.
function editor_toolUtilities_kitPlacer.placeOriented(sink, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Places an instance (position + quaternion) and adds its entry to the sink's list, reusing a reusable piece of the same shape if possible (only rewrites the transform if it changed). Missing shape or no folder: entry with obj = nil.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:164
---@param sink table Sink.
---@param shapePath string|nil Path of the .dae.
---@param px number Position x.
---@param py number Position y.
---@param pz number Position z.
---@param qx number Quaternion x.
---@param qy number Quaternion y.
---@param qz number Quaternion z.
---@param qw number Quaternion w.
---@param scl number|table|nil Uniform scale or {x, y, z}.
function editor_toolUtilities_kitPlacer.placeTs(sink, shapePath, px, py, pz, qx, qy, qz, qw, scl) end

--- Plants a live piece from a local frame, as a Forest item. Returns the entry the list keeps, or nil if there is no forest or no burned shape, so the caller places a TSStatic instead.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:412
---@param fd userdata ForestData.
---@param shapePath string Path of the .dae.
---@param ox number Origin x.
---@param oy number Origin y.
---@param oz number Origin z.
---@param ax number Along x.
---@param ay number Along y.
---@param az number Along z.
---@param ux number Up x.
---@param uy number Up y.
---@param uz number Up z.
---@param scl number|table|nil Scale (per-axis possible: the forest matrix carries it).
---@return table|nil  Entry { item, data, shape }.
function editor_toolUtilities_kitPlacer.plantOriented(fd, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Plants a piece as a Forest item directly from a TSStatic's pose (per-axis scale baked into the matrix columns), on the 'burned' datablock of its shape.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:529
---@param fd userdata ForestData.
---@param obj userdata Source TSStatic.
---@return userdata|nil  Created item, or nil.
function editor_toolUtilities_kitPlacer.plantStatic(fd, obj) end

--- Places slot i of a list as a live Forest piece: shape at a position, a quaternion and a per-axis scale; solid for a piece that collides like its TSStatic. A slot whose shape and pose have not changed is left as is. An unburned shape keeps its slot without an item.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:427
---@param fd userdata ForestData.
---@param list table Entry pool.
---@param i integer Slot index.
---@param shapePath string Path of the .dae.
---@param solid boolean Datablock with collision.
---@param px number Position x.
---@param py number Position y.
---@param pz number Position z.
---@param qx number Quaternion x.
---@param qy number Quaternion y.
---@param qz number Quaternion z.
---@param qw number Quaternion w.
---@param sx number X scale.
---@param sy number Y scale.
---@param sz number Z scale.
---@return table  The slot's entry.
function editor_toolUtilities_kitPlacer.poseLive(fd, list, i, shapePath, solid, px, py, pz, qx, qy, qz, qw, sx, sy, sz) end

--- To be called every frame by each tool: the first call after a save restores what liftLive removed. Only in an entry that still holds the lifted item, and only in the forest it was taken out of.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:516
function editor_toolUtilities_kitPlacer.relayLive() end

--- Deletes by name all the burned pieces listed in the manifest (from commitSink), then marks the editor as modified. Nil or empty manifest: no effect.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:338
---@param nameManifest string[]|nil Object names.
---@return integer  Number of deleted objects.
function editor_toolUtilities_kitPlacer.removeBurned(nameManifest) end

--- Composes prefix + id with every non-alphanumeric character of the id replaced by '_'. Warning: string.gsub returns two values but the .. operator keeps only one.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:305
---@param prefix string Prefix.
---@param id any Identifier (converted by tostring).
---@return string  Safe name.
function editor_toolUtilities_kitPlacer.safeName(prefix, id) end

--- Colors a luminous piece (instanceColor). With night, also entrusts it to core_environment's day/night pass (nightEmissive), which sets the color to black by day and restores it at dusk: a sign or lamp lens is dark glass by day. The color is also written here.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:594
---@param obj userdata TSStatic.
---@param glow number[] Color {r, g, b} (default 1 per component).
---@param night boolean|nil Register for the night emissive (siteLights.markDirty).
function editor_toolUtilities_kitPlacer.setGlow(obj, glow, night) end

--- Returns the path of a kit shape if the file exists (result cached), otherwise nil with a single error message in the log.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:38
---@param path string|nil Path of the baked .dae.
---@return string|nil  The path, or nil if it is absent or not baked.
function editor_toolUtilities_kitPlacer.shapeOf(path) end

--- Creates an isolated piece (TSStatic), outside any sink, for a caller that manages its own slots. Replaces any object of the same name.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:251
---@param folder userdata Parent SimGroup.
---@param shapePath string Path of the .dae.
---@param name string|nil Scene object name.
---@param collidable boolean|nil 'Collision Mesh' collision, otherwise 'None'.
---@param ox number Origin x.
---@param oy number Origin y.
---@param oz number Origin z.
---@param ax number Along x.
---@param ay number Along y.
---@param az number Along z.
---@param ux number Up x.
---@param uy number Up y.
---@param uz number Up z.
---@param scl number|table|nil Scale.
---@return userdata|nil  Created TSStatic, or nil.
function editor_toolUtilities_kitPlacer.spawnOriented(folder, shapePath, name, collidable, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Removes from the forest and from the list all slots after the n-th.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:462
---@param fd userdata|nil ForestData.
---@param list table List.
---@param n integer Number of slots to keep.
function editor_toolUtilities_kitPlacer.trimLive(fd, list, n) end

--- Writes the kit's datablocks to the level's art/forest/managedItemData.json, to be called at save time. The massingKit_ keys are rebuilt from what is placed (adding new burned shapes, removing those nothing uses); the rest of the file, owned by the Forest Editor, is left as is. Without this, a burned building reloads with pieces pointing to nonexistent datablocks. Does not touch the file if there is nothing from this kit.
---Source: lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:561
function editor_toolUtilities_kitPlacer.writeItemDatas() end


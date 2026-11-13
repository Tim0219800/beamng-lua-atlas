---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/kitPlacer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_kitPlacer` : `extensions.load("editor_toolUtilities_kitPlacer")`, puis la globale `editor_toolUtilities_kitPlacer`
---@class editor_toolUtilities_kitPlacer
---@field MASSING_ITEM_PREFIX string
editor_toolUtilities_kitPlacer = {}

--- Set the last run's pieces aside for the next one. The list is emptied but nothing is deleted.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:133
---@param list any
function editor_toolUtilities_kitPlacer.beginReuse(list) end

--- A live piece handed to the level: the same pose on the shape's own datablock, the one that collides. Nil for an entry
---  that is not a forest item.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:468
---@param fd any
---@param entry any
function editor_toolUtilities_kitPlacer.burnItem(fd, entry) end

--- Every live entry in a pool handed to the level, its item appended to `out`, and the pool emptied.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:481
---@param fd any
---@param list any
---@param out any
function editor_toolUtilities_kitPlacer.burnList(fd, list, out) end

--- Flip a sink's (or a bare { list = ... } wrapper's) pieces to persistent (canSave=true) and return their scene-object names
---  as the manifest. Does NOT delete or detach (the caller detaches its pool). Names survive save/reload (registerObject keeps
---  them), so removeBurned can find the pieces again by name after a level load.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:317
---@param sink any
function editor_toolUtilities_kitPlacer.commitSink(sink) end

--- Clear a sink's placed pieces: delete each TSStatic, pull each forest item, and empty the list for reuse.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:285
---@param list any
function editor_toolUtilities_kitPlacer.deleteList(list) end

--- Slot `k` of `t` out of the forest and off the table. `fd` may be nil, for the forest the piece stands in.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:452
---@param fd any
---@param t any
---@param k any
function editor_toolUtilities_kitPlacer.dropLive(fd, t, k) end

--- Whatever the run did not ask for, taken away: what is left in the queues is what the last run had and this one has no
---  use for. Answers how many went.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:118
---@param list any
function editor_toolUtilities_kitPlacer.endReuse(list) end

--- Whether a pool slot is a live forest piece rather than a TSStatic.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:449
---@param e any
function editor_toolUtilities_kitPlacer.isLive(e) end

--- The ForestItemData standing for one kit shape, made on first use: the level's own, or with `kind` 'live' / 'solid' a
---  tool's copy for its live pieces. Built the long way round rather than through editor.createDataBlock so it is
---  deliberately NOT handed to the persistence manager: writeItemDatas below serializes the level's into its
---  managedItemData.json itself, and letting the manager write them as well would add the __parent entry the hand-authored
---  entries do not carry. It still joins the datablock group, which holds the reference that keeps it alive.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:383
---@param shapePath any
---@param kind any
function editor_toolUtilities_kitPlacer.itemDataFor(shapePath, kind) end

--- Every live piece out of the forest for a level save, which writes the forest as it finds it: every tool's, and any a
--- tool lost track of, which would otherwise go out with the level. For each tool to call from its own save hook; the
--- first does the work. `relayLive` puts back the ones still wanted.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:500
function editor_toolUtilities_kitPlacer.liftLive() end

---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:633
function editor_toolUtilities_kitPlacer.liveForestData() end

--- For a tool whose burn is statics and nothing else, committing or reconciling one needs no more than the editor marked
---  dirty so the save is offered: the pieces are scene objects and go out with the level. A tool that plants forest items
---  instead has the datablocks to write as well, which is writeItemDatas above.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:611
function editor_toolUtilities_kitPlacer.markDirty() end

--- Move a piece already in the scene onto a new frame. Far cheaper than deleting one and building another, which is what
---  makes it worth telling a piece that moved from a piece that changed.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:259
---@param entry any
---@param ox any
---@param oy any
---@param oz any
---@param ax any
---@param ay any
---@param az any
---@param ux any
---@param uy any
---@param uz any
---@param scl any
function editor_toolUtilities_kitPlacer.moveOriented(entry, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Build a sink for `ownerId`. A nil owner makes unnamed pieces, for a caller that never finds them by name.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:98
---@param folder any
---@param ownerId any
---@param collidable any
---@param list any
function editor_toolUtilities_kitPlacer.newSink(folder, ownerId, collidable, list) end

--- Place one kit piece by a local frame. A sink carrying `emitFrame` takes the frame itself instead of a scene object, which
---  is what a tool that bakes its output rather than spawning it wants.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:241
---@param sink any
---@param shapePath any
---@param ox any
---@param oy any
---@param oz any
---@param ax any
---@param ay any
---@param az any
---@param ux any
---@param uy any
---@param uz any
---@param scl any
function editor_toolUtilities_kitPlacer.placeOriented(sink, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Place one instance (pos + quaternion) and append its entry to the sink's flat list. A missing shape / no folder yields a
---  nil-obj entry (kept so the count stays honest; simply nothing to render or delete).
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:164
---@param sink any
---@param shapePath any
---@param px any
---@param py any
---@param pz any
---@param qx any
---@param qy any
---@param qz any
---@param qw any
---@param scl any
function editor_toolUtilities_kitPlacer.placeTs(sink, shapePath, px, py, pz, qx, qy, qz, qw, scl) end

--- One live piece by a local frame, as a forest item: the entry a list keeps for it, or nil with no forest to plant in or no
---  baked shape, for the caller to stand a TSStatic instead.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:412
---@param fd any
---@param shapePath any
---@param ox any
---@param oy any
---@param oz any
---@param ax any
---@param ay any
---@param az any
---@param ux any
---@param uy any
---@param uz any
---@param scl any
function editor_toolUtilities_kitPlacer.plantOriented(fd, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Plant one piece straight from a TSStatic's own pose.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:529
---@param fd any
---@param obj any
function editor_toolUtilities_kitPlacer.plantStatic(fd, obj) end

--- Pool slot `i` of `list` stood as a live forest item: `shapePath` at a position, quaternion and per-axis scale, `solid`
--- for a piece that collides as its TSStatic did. A slot whose shape and pose have not changed is left as it stands, which
--- is most of a run while one thing on it is dragged. A shape that is not baked keeps its slot with nothing in it.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:427
---@param fd any
---@param list any
---@param i any
---@param shapePath any
---@param solid any
---@param px any
---@param py any
---@param pz any
---@param qx any
---@param qy any
---@param qz any
---@param qw any
---@param sx any
---@param sy any
---@param sz any
function editor_toolUtilities_kitPlacer.poseLive(fd, list, i, shapePath, solid, px, py, pz, qx, qy, qz, qw, sx, sy, sz) end

--- For each tool to call every frame: the first after a save puts back what liftLive took out. Only into an entry still
--- holding what was lifted from it, since one moved or taken down since has moved on without it, and only into the forest
--- it came out of.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:516
function editor_toolUtilities_kitPlacer.relayLive() end

--- Remove every burned piece recorded in `nameManifest` (from commitSink) by name. Returns the count removed. A nil/empty
---  manifest is a no-op.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:338
---@param nameManifest any
function editor_toolUtilities_kitPlacer.removeBurned(nameManifest) end

---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:305
---@param prefix any
---@param id any
function editor_toolUtilities_kitPlacer.safeName(prefix, id) end

--- Colour a lit piece. `night` hands it to core_environment's day/night pass as well, which drives the same instanceColor
---  to black by day and back to this at dusk - so a sign or a lamp lens is dark glass in daylight rather than burning
---  through it. The colour is still written here, so a piece reads right before the first refresh reaches it.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:594
---@param obj any
---@param glow any
---@param night any
function editor_toolUtilities_kitPlacer.setGlow(obj, glow, night) end

---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:38
---@param path any
function editor_toolUtilities_kitPlacer.shapeOf(path) end

--- One piece on its own, outside any sink, for a caller keeping its own slots.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:251
---@param folder any
---@param shapePath any
---@param name any
---@param collidable any
---@param ox any
---@param oy any
---@param oz any
---@param ax any
---@param ay any
---@param az any
---@param ux any
---@param uy any
---@param uz any
---@param scl any
function editor_toolUtilities_kitPlacer.spawnOriented(folder, shapePath, name, collidable, ox, oy, oz, ax, ay, az, ux, uy, uz, scl) end

--- Every slot of a pool past the first `n`, out of the forest and off the list.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:462
---@param fd any
---@param list any
---@param n any
function editor_toolUtilities_kitPlacer.trimLive(fd, list, n) end

--- Write the kit datablocks into the level's managedItemData.json, for a tool to call on level save. The massingKit_
---  keys are rebuilt from what is standing, so newly burned shapes are added and ones nothing uses drop out; everything
---  else in the file belongs to the Forest Editor and is left exactly as it wrote it. Without this a burned building loads
---  next session with every piece pointing at a datablock that no longer exists.
---Source : lua/ge/extensions/editor/toolUtilities/kitPlacer.lua:561
function editor_toolUtilities_kitPlacer.writeItemDatas() end


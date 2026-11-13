# `editor_toolUtilities_kitPlacer`

*Fichier : `lua/ge/extensions/editor/toolUtilities/kitPlacer.lua` · VM : Game Engine (GE) · 647 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_kitPlacer` : `extensions.load("editor_toolUtilities_kitPlacer")`, puis la globale `editor_toolUtilities_kitPlacer`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_kitPlacer.beginReuse(list)` | Set the last run's pieces aside for the next one. The list is emptied but nothing is deleted. | 133 |
| `editor_toolUtilities_kitPlacer.burnItem(fd, entry)` | A live piece handed to the level: the same pose on the shape's own datablock, the one that collides. Nil for an entry<br> that is not a forest item. | 468 |
| `editor_toolUtilities_kitPlacer.burnList(fd, list, out)` | Every live entry in a pool handed to the level, its item appended to `out`, and the pool emptied. | 481 |
| `editor_toolUtilities_kitPlacer.commitSink(sink)` | Flip a sink's (or a bare { list = ... } wrapper's) pieces to persistent (canSave=true) and return their scene-object names<br> as the manifest. Does NOT delete or detach (the caller detaches its pool). Names survive save/reload (registerObject keeps<br> them), so removeBurned can find the pieces again by name after a level load. | 317 |
| `editor_toolUtilities_kitPlacer.deleteList(list)` | Clear a sink's placed pieces: delete each TSStatic, pull each forest item, and empty the list for reuse. | 285 |
| `editor_toolUtilities_kitPlacer.dropLive(fd, t, k)` | Slot `k` of `t` out of the forest and off the table. `fd` may be nil, for the forest the piece stands in. | 452 |
| `editor_toolUtilities_kitPlacer.endReuse(list)` | Whatever the run did not ask for, taken away: what is left in the queues is what the last run had and this one has no<br> use for. Answers how many went. | 118 |
| `editor_toolUtilities_kitPlacer.isLive(e)` | Whether a pool slot is a live forest piece rather than a TSStatic. | 449 |
| `editor_toolUtilities_kitPlacer.itemDataFor(shapePath, kind)` | The ForestItemData standing for one kit shape, made on first use: the level's own, or with `kind` 'live' / 'solid' a<br> tool's copy for its live pieces. Built the long way round rather than through editor.createDataBlock so it is<br> deliberately NOT handed to the persistence manager: writeItemDatas below serializes the level's into its<br> managedItemData.json itself, and letting the manager write them as well would add the __parent entry the hand-authored<br> entries do not carry. It still joins the datablock group, which holds the reference that keeps it alive. | 383 |
| `editor_toolUtilities_kitPlacer.liftLive()` | Every live piece out of the forest for a level save, which writes the forest as it finds it: every tool's, and any a<br>tool lost track of, which would otherwise go out with the level. For each tool to call from its own save hook; the<br>first does the work. `relayLive` puts back the ones still wanted. | 500 |
| `editor_toolUtilities_kitPlacer.liveForestData()` |  | 633 |
| `editor_toolUtilities_kitPlacer.markDirty()` | For a tool whose burn is statics and nothing else, committing or reconciling one needs no more than the editor marked<br> dirty so the save is offered: the pieces are scene objects and go out with the level. A tool that plants forest items<br> instead has the datablocks to write as well, which is writeItemDatas above. | 611 |
| `editor_toolUtilities_kitPlacer.moveOriented(entry, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Move a piece already in the scene onto a new frame. Far cheaper than deleting one and building another, which is what<br> makes it worth telling a piece that moved from a piece that changed. | 259 |
| `editor_toolUtilities_kitPlacer.newSink(folder, ownerId, collidable, list)` | Build a sink for `ownerId`. A nil owner makes unnamed pieces, for a caller that never finds them by name. | 98 |
| `editor_toolUtilities_kitPlacer.placeOriented(sink, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | Place one kit piece by a local frame. A sink carrying `emitFrame` takes the frame itself instead of a scene object, which<br> is what a tool that bakes its output rather than spawning it wants. | 241 |
| `editor_toolUtilities_kitPlacer.placeTs(sink, shapePath, px, py, pz, qx, qy, qz, qw, scl)` | Place one instance (pos + quaternion) and append its entry to the sink's flat list. A missing shape / no folder yields a<br> nil-obj entry (kept so the count stays honest; simply nothing to render or delete). | 164 |
| `editor_toolUtilities_kitPlacer.plantOriented(fd, shapePath, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | One live piece by a local frame, as a forest item: the entry a list keeps for it, or nil with no forest to plant in or no<br> baked shape, for the caller to stand a TSStatic instead. | 412 |
| `editor_toolUtilities_kitPlacer.plantStatic(fd, obj)` | Plant one piece straight from a TSStatic's own pose. | 529 |
| `editor_toolUtilities_kitPlacer.poseLive(fd, list, i, shapePath, solid, px, py, pz, qx, qy, qz, qw, sx, sy, sz)` | Pool slot `i` of `list` stood as a live forest item: `shapePath` at a position, quaternion and per-axis scale, `solid`<br>for a piece that collides as its TSStatic did. A slot whose shape and pose have not changed is left as it stands, which<br>is most of a run while one thing on it is dragged. A shape that is not baked keeps its slot with nothing in it. | 427 |
| `editor_toolUtilities_kitPlacer.relayLive()` | For each tool to call every frame: the first after a save puts back what liftLive took out. Only into an entry still<br>holding what was lifted from it, since one moved or taken down since has moved on without it, and only into the forest<br>it came out of. | 516 |
| `editor_toolUtilities_kitPlacer.removeBurned(nameManifest)` | Remove every burned piece recorded in `nameManifest` (from commitSink) by name. Returns the count removed. A nil/empty<br> manifest is a no-op. | 338 |
| `editor_toolUtilities_kitPlacer.safeName(prefix, id)` |  | 305 |
| `editor_toolUtilities_kitPlacer.setGlow(obj, glow, night)` | Colour a lit piece. `night` hands it to core_environment's day/night pass as well, which drives the same instanceColor<br> to black by day and back to this at dusk - so a sign or a lamp lens is dark glass in daylight rather than burning<br> through it. The colour is still written here, so a piece reads right before the first refresh reaches it. | 594 |
| `editor_toolUtilities_kitPlacer.shapeOf(path)` |  | 38 |
| `editor_toolUtilities_kitPlacer.spawnOriented(folder, shapePath, name, collidable, ox, oy, oz, ax, ay, az, ux, uy, uz, scl)` | One piece on its own, outside any sink, for a caller keeping its own slots. | 251 |
| `editor_toolUtilities_kitPlacer.trimLive(fd, list, n)` | Every slot of a pool past the first `n`, out of the forest and off the list. | 462 |
| `editor_toolUtilities_kitPlacer.writeItemDatas()` | Write the kit datablocks into the level's managedItemData.json, for a tool to call on level save. The massingKit_<br> keys are rebuilt from what is standing, so newly burned shapes are added and ones nothing uses drop out; everything<br> else in the file belongs to the Forest Editor and is left exactly as it wrote it. Without this a burned building loads<br> next session with every piece pointing at a datablock that no longer exists. | 561 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `MASSING_ITEM_PREFIX` | string | Public interface. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `getDataBlockSet`
- `obj:` `getField`, `getTransform`, `setField`, `updateInstanceRenderData`
- `scenetree.` `findClassObjects`, `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/kitPlacer.lua`.*

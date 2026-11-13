# `editor_heroRoadEditor_groundmodel`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua` · VM : Game Engine (GE) · 201 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_groundmodel` : `extensions.load("editor_heroRoadEditor_groundmodel")`, puis la globale `editor_heroRoadEditor_groundmodel`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_groundmodel.clearAll(group)` | Remove ALL paint from the group (caller wraps the undo commit). Physics rebuild is deferred like a normal stroke. | 78 |
| `editor_heroRoadEditor_groundmodel.drawOverlay(group)` | Editor overlay: tint every deck cell (carriageway + shoulders) of the (post-decimation) grid so the whole drivable surface<br> reads as covered -- base/Dry faint, painted patches stronger -- plus an optional deck wireframe. Only the selected road (bounds cost).<br> Reads the SAME stamps + grid the mesh rasterises from, so it can't disagree with the physics. | 146 |
| `editor_heroRoadEditor_groundmodel.flushPending()` | Rebuild the physics mesh of every road painted since the last Apply, then clear the queue. Runs the light surface-only path<br> (mesh + collision, no decals/furniture/terrain-paint). Called every frame from onEditorGui; a no-op unless Apply was clicked.<br> Bake / save read the stamps directly, so they're correct even if Apply was never pressed. | 71 |
| `editor_heroRoadEditor_groundmodel.getBrushDefault()` |  | 55 |
| `editor_heroRoadEditor_groundmodel.getBrushRadius()` |  | 53 |
| `editor_heroRoadEditor_groundmodel.getMatIndex()` |  | 51 |
| `editor_heroRoadEditor_groundmodel.getShowWire()` |  | 56 |
| `editor_heroRoadEditor_groundmodel.isActive()` | Accessors. | 50 |
| `editor_heroRoadEditor_groundmodel.requestApply()` | Ask for the painted roads' physics to be rebuilt (Apply button). Consumed by flushPending on the next frame -- painting<br> itself only touches the overlay, so nothing rebuilds until the artist explicitly asks for it. | 66 |
| `editor_heroRoadEditor_groundmodel.setActive(b)` |  | 59 |
| `editor_heroRoadEditor_groundmodel.setBrushRadius(r)` |  | 54 |
| `editor_heroRoadEditor_groundmodel.setMatIndex(i)` |  | 52 |
| `editor_heroRoadEditor_groundmodel.setShowWire(b)` |  | 57 |
| `editor_heroRoadEditor_groundmodel.updateAndPaint(group)` | Per-frame while the mode is on: draw the brush cursor and, on LMB drag, drop evenly-spaced world-space stamps. No mesh<br> rebuild here -- the overlay shows the change instantly; the physics rebuild is queued (pending) and applied on the next Apply.<br> One undo entry per stroke. Returns true (the mode owns the mouse) whenever active. | 101 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua`.*

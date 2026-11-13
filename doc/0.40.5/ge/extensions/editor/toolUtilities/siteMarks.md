# `editor_toolUtilities_siteMarks`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteMarks.lua` · VM : Game Engine (GE) · 161 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteMarks` : `extensions.load("editor_toolUtilities_siteMarks")`, puis la globale `editor_toolUtilities_siteMarks`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteMarks.build(plan, folder, terrainZ)` | A whole plan painted at once. Answers the objects made, so whoever asked can hand them over or take them down again. | 54 |
| `editor_toolUtilities_siteMarks.commit(objs)` | Hand the marks to the level. Painted by the tool they belong to nothing and are not written out; from here they are the<br>level's own, and the tool must not delete them. | 66 |
| `editor_toolUtilities_siteMarks.emit(folder, rec, terrainZ)` | One DecalRoad, from the record that describes it. | 20 |
| `editor_toolUtilities_siteMarks.localise(plan, ox, oy, oz)` | The plan as a manifest carries it, local to the bake origin.<br>Grouped by style, because a lot paints a thousand marks in about four of them -- one for the white bay grid, one for the<br>yellow reserved boxes, one for the hatching, one for the give-way bars. Saying which of the four each run is in costs an<br>index where saying it in full would cost five fields a thousand times over. | 82 |
| `editor_toolUtilities_siteMarks.place(rec, px, py, yaw, ox, oy, pz)` | And back: the manifest's marks as a plan, stood where a placement is and turned onto its heading.<br>`ox, oy` is the point in the site's own frame the placement turns about -- the middle of its footprint rather than the<br>bake origin at a corner. The same two numbers everything else a placement stands is measured off. `pz` is the height<br>the placement sits at, which only the marks laid on one of its own slabs need. | 129 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteMarks.lua`.*

# `editor_toolUtilities_siteWater`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteWater.lua` · VM : Game Engine (GE) · 438 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteWater` : `extensions.load("editor_toolUtilities_siteWater")`, puis la globale `editor_toolUtilities_siteWater`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteWater.build(ca, folder, tag)` | Flood whatever the centrepiece put down, then hang a sheet off each face of every bowl that spills. `tag` names the<br>site standing it, so two of the same square on one map do not fight over object names. Returns the ids and the names. | 305 |
| `editor_toolUtilities_siteWater.commit(ids)` | Flip every pool to persistent and hand back its names, which is what a burn's undo deletes by. | 338 |
| `editor_toolUtilities_siteWater.localise(ca, ox, oy, oz)` | The record a manifest carries, in the site's own frame. Only what `build` reads: the editor's centrepiece knows a<br>great deal more about itself -- its apron, its grab handles, its balustrade -- and none of that is water.<br>The one anchor and the one angle are the whole of the placement. Everything else is a radius, a half-width or a<br>height off that anchor, so a site turned on the ground turns its water simply by turning those two. | 356 |
| `editor_toolUtilities_siteWater.place(rec, px, py, pz, yaw, ox, oy)` | And back the other way: a manifest record stood at a place, on a heading, ready for `build`. The turn is the site's,<br>so the anchor swings round the placement and the grain takes the yaw straight on top of its own.<br>`ox, oy` is the point in the site's own frame that the placement turns about -- the middle of its footprint rather than<br>the bake origin at a corner. Everything else a placement stands is measured off the same two numbers. | 391 |
| `editor_toolUtilities_siteWater.remove(folder)` | Everything wet under one folder, off. Swept by class rather than by a list of ids kept somewhere, because undo<br>restores a document whose ids belong to objects that have since been deleted: what is actually in the folder is the<br>only account of it that cannot go stale. | 293 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteWater.lua`.*

# `editor_decalSpline_populate`

*Fichier : `lua/ge/extensions/editor/decalSpline/populate.lua` · VM : Game Engine (GE) · 379 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_decalSpline_populate` : `extensions.load("editor_decalSpline_populate")`, puis la globale `editor_decalSpline_populate`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_decalSpline_populate.adopt(spline, kept)` | Takes back the decals release() let go of (those still in the scene), as they are, with their templates and folder. | 291 |
| `editor_decalSpline_populate.hasAny(spline)` | True if the tool holds any decals for the spline. | 265 |
| `editor_decalSpline_populate.populateDecalSpline(spline, splines)` | Populates a decal spline with instances of decals along its length. | 171 |
| `editor_decalSpline_populate.propagateRowsCols(spline, componentIdx)` | On a change of num rows/num cols, we need to update the same properties in the other components. | 313 |
| `editor_decalSpline_populate.release(spline)` | Lua reload: the tool lets go of a locked spline's decals without deleting them (they are the level's) and returns their<br> uids per material, with the templates they use, for adopt() to pick up again. Their templates stay counted, so removing the<br> other splines leaves them (and the template folder) in place. | 275 |
| `editor_decalSpline_populate.removeFolder()` | Removes the folder for the shared templates (not while decals a locked spline kept across a Lua reload still use them). | 160 |
| `editor_decalSpline_populate.tryRemove(spline)` | Attempts to removes the decals of the decal spline, from the scene. | 129 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/decalSpline/populate.lua`.*

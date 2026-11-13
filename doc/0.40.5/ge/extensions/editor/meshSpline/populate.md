# `editor_meshSpline_populate`

*Fichier : `lua/ge/extensions/editor/meshSpline/populate.lua` · VM : Game Engine (GE) · 508 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline_populate` : `extensions.load("editor_meshSpline_populate")`, puis la globale `editor_meshSpline_populate`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline_populate.adopt(spline, ids)` | Takes back the meshes release() let go of (those still in the scene), as they are. | 464 |
| `editor_meshSpline_populate.eachObject(spline, fn)` | Calls fn(mesh, true) for every mesh the tool holds for the spline (the splineLock `each`). | 252 |
| `editor_meshSpline_populate.evenFitInfo(spline)` | For the 'Lock ends' UI label: given the current spline, returns the effective centre-to-centre spacing (m) and the<br> number of gaps that even-fit would produce, so the user sees the real spacing they'll get (e.g. "≈ 19.0 m"). Returns<br> nil when it can't be computed (too few points / no mesh length yet). | 487 |
| `editor_meshSpline_populate.isDiscreteSpline(spline)` | A spline is 'discrete' (props sitting on sample points, e.g. lamps) rather than 'tiling' (barriers abutting end-to-end)<br> when its gap exceeds the threshold. The UI uses this to show the discrete-only 'Lock ends' toggle. | 480 |
| `editor_meshSpline_populate.minSpacingFor(spline)` | Slider floor for Spacing on this piece: the value that reaches the minimum allowed period (max overlap) for its length.<br> Below this the period would be clamped anyway, so we stop the slider here to keep it a live, honest control. | 65 |
| `editor_meshSpline_populate.populateMeshSpline(spline, splineIdx)` | Populates a mesh spline with instances of a static mesh along its length. | 294 |
| `editor_meshSpline_populate.release(spline)` | Lua reload: the tool lets go of a locked spline's meshes without deleting them (they are the level's) and returns their ids<br> per component, for adopt() to pick up again. | 449 |
| `editor_meshSpline_populate.tryRemove(spline)` | Attempts to removes the static meshes of the mesh spline, from the scene. | 429 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline/populate.lua`.*

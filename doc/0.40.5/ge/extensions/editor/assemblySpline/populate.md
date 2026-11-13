# `editor_assemblySpline_populate`

*Fichier : `lua/ge/extensions/editor/assemblySpline/populate.lua` · VM : Game Engine (GE) · 538 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline_populate` : `extensions.load("editor_assemblySpline_populate")`, puis la globale `editor_assemblySpline_populate`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline_populate.adopt(spline, ids)` | Takes back the meshes release() let go of (those still in the scene), as they are. | 516 |
| `editor_assemblySpline_populate.eachObject(spline, fn)` | Calls fn(mesh, true) for every mesh the tool holds for the spline (the splineLock `each`). | 54 |
| `editor_assemblySpline_populate.populateAssemblySpline(spline, splineIdx, molecule)` | A locked spline whose meshes exist only has its lock state applied: the tool does not move them. Otherwise it is placed. | 490 |
| `editor_assemblySpline_populate.release(spline)` | Lua reload: the tool lets go of a locked spline's meshes without deleting them (they are the level's) and returns their ids<br> per mesh path, for adopt() to pick up again. | 500 |
| `editor_assemblySpline_populate.tryRemove(spline)` | Tries to remove all the meshes for the given spline. | 460 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `obj:` `delete`, `getField`, `registerObject`, `setField`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline/populate.lua`.*

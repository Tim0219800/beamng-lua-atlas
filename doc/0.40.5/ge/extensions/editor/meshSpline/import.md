# `editor_meshSpline_import`

*Fichier : `lua/ge/extensions/editor/meshSpline/import.lua` · VM : Game Engine (GE) · 648 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshSpline_import` : `extensions.load("editor_meshSpline_import")`, puis la globale `editor_meshSpline_import`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshSpline_import.convertTSStatics2MeshSpline(collection)` | Convert the selected TSStatic objects to a mesh spline. | 508 |
| `editor_meshSpline_import.handleDelayedSplineUpdates()` | Handle delayed spline updates.<br> [We need to wait until the collision mesh has been updated, then update the spline which was created by the import.] | 35 |
| `editor_meshSpline_import.importFromPolygon(polygon)` | Import a mesh spline from the given selection polygon. | 627 |

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `be:` `reloadCollision`
- `obj:` `delete`, `getClassName`, `getField`, `getGroup`, `getID`, `getName`, `getObjBox`, `getPosition`, `getWorldBox`, `registerObject`, `setField`, `setPosRot`, `setPosition`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshSpline/import.lua`.*

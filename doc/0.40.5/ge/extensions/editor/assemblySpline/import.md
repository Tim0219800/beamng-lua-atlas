# `editor_assemblySpline_import`

*Fichier : `lua/ge/extensions/editor/assemblySpline/import.lua` · VM : Game Engine (GE) · 674 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assemblySpline_import` : `extensions.load("editor_assemblySpline_import")`, puis la globale `editor_assemblySpline_import`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assemblySpline_import.convertTSStatics2AssemblySpline(collection)` | Convert the selected TSStatic objects to an assembly spline. | 566 |
| `editor_assemblySpline_import.handleDelayedSplineUpdates()` | Handle delayed spline updates.<br> [We need to wait until the collision mesh has been updated, then update the spline which was created by the import.] | 42 |
| `editor_assemblySpline_import.importFromPolygon(polygon)` | Import an assembly spline from the given selection polygon. | 651 |
| `editor_assemblySpline_import.validateToolCompatibleTSStatic(obj)` | Validate if a TSStatic object has tool-compatible anchor points. | 145 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `upcast`
- `be:` `reloadCollision`
- `obj:` `delete`, `getAnchorNames`, `getClassName`, `getField`, `getGroup`, `getID`, `getName`, `getPosition`, `registerObject`, `setField`, `setPosition`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assemblySpline/import.lua`.*

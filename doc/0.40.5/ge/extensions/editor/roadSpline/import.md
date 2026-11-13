# `editor_roadSpline_import`

*Fichier : `lua/ge/extensions/editor/roadSpline/import.lua` · VM : Game Engine (GE) · 451 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadSpline_import` : `extensions.load("editor_roadSpline_import")`, puis la globale `editor_roadSpline_import`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadSpline_import.importFromPolygon(polygon)` | Import a Road Spline from the given selection polygon. | 425 |
| `editor_roadSpline_import.importSelectedIntoNewGroup(decalRoads)` | Import a Road Spline from the currently selected decal roads. | 351 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`, `upcast`
- `obj:` `delete`, `getID`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadSpline/import.lua`.*

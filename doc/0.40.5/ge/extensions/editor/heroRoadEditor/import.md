# `editor_heroRoadEditor_import`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/import.lua` · VM : Game Engine (GE) · 452 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_import` : `extensions.load("editor_heroRoadEditor_import")`, puis la globale `editor_heroRoadEditor_import`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_import.importFromPolygon(polygon)` | Import a Hero Road from the given selection polygon. | 426 |
| `editor_heroRoadEditor_import.importSelectedIntoNewGroup(decalRoads)` | Import a Hero Road from the currently selected decal roads. | 351 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`, `upcast`
- `obj:` `delete`, `getID`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/import.lua`.*

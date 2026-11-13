# `editor_dragRaceEditor_zones`

*Fichier : `lua/ge/extensions/editor/dragRaceEditor/zones.lua` · VM : Game Engine (GE) · 342 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dragRaceEditor_zones` : `extensions.load("editor_dragRaceEditor_zones")`, puis la globale `editor_dragRaceEditor_zones`

Zone editing for drag strip zone and lane zones (crawl boundary-style).
 Uses gameplay/sites/zone and same vertex manipulation as crawl boundaries.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dragRaceEditor_zones.init()` |  | 334 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `zoneFromData` | any |  |
| `zoneToData` | any |  |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` |  | 226 |
| `C:clearZone()` |  | 75 |
| `C:dragging()` |  | 237 |
| `C:draw(mouseInfo)` |  | 318 |
| `C:dropToTerrain(pos)` |  | 129 |
| `C:endDragging()` |  | 295 |
| `C:findVert(mouseInfo, objects)` |  | 99 |
| `C:init()` |  | 57 |
| `C:input(mouseInfo)` |  | 157 |
| `C:setZone(zoneInstance, target)` |  | 68 |
| `C:syncBack()` | Write zone back to strip.stripZone or lane.zone and mark strip dirty. | 83 |
| `C:tryInsert(mouseInfo)` |  | 138 |
| `C:updateTransform()` |  | 201 |
| `C.zoneFromData(data)` | Build Zone instance from serialized zone data (strip.stripZone or lane.zone table). Allows empty vertices for editor. | 41 |
| `C.zoneToData(zone)` | Serialize Zone to table (for writing back to strip/lane). | 52 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dragRaceEditor/zones.lua`.*

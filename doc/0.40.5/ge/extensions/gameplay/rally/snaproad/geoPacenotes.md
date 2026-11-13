# `gameplay_rally_snaproad_geoPacenotes`

*Fichier : `lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua` · VM : Game Engine (GE) · 850 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_snaproad_geoPacenotes` : `extensions.load("gameplay_rally_snaproad_geoPacenotes")`, puis la globale `gameplay_rally_snaproad_geoPacenotes`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_snaproad_geoPacenotes.calculateCircleFromPoints2(p1, p2, p3)` | Calculate circle from points using the simpler 2D method | 220 |
| `gameplay_rally_snaproad_geoPacenotes.calculateMiddlePoint(pn, startPos, endPos, partition)` | Calculate middle point between start and end positions | 515 |
| `gameplay_rally_snaproad_geoPacenotes.drawPacenoteMeasurement(center, radius, arcDistance, p1, p2, p3, clr, alpha, prefix, fitQuality, arcDegrees)` | Draw pacenote measurements using minimal circle data and original points (always uses prisms) | 773 |
| `gameplay_rally_snaproad_geoPacenotes.measurePartition(pn, focusPoints, skipAuto)` |  | 800 |
| `gameplay_rally_snaproad_geoPacenotes.measurementTypeOptions()` |  | 32 |
| `gameplay_rally_snaproad_geoPacenotes.normalizeMeasurementType(measurementType)` |  | 27 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultMeasurementType` | string |  |
| `measurementTypeOrder` | table |  |
| `measurementTypes` | table |  |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/snaproad/geoPacenotes.lua`.*

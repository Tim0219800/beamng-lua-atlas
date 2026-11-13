# `util_trackBuilder_markers`

*Fichier : `lua/ge/extensions/util/trackBuilder/markers.lua` · VM : Game Engine (GE) · 1026 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_markers` : `extensions.load("util_trackBuilder_markers")`, puis la globale `util_trackBuilder_markers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_markers.addMarkerChange(name, index)` |  | 999 |
| `util_trackBuilder_markers.caps(segments, closed)` |  | 921 |
| `util_trackBuilder_markers.clearMarkers(name)` |  | 990 |
| `util_trackBuilder_markers.hideMarkers(name)` |  | 982 |
| `util_trackBuilder_markers.interpolate(nameOfField, track)` | interpolates the segments with given name of field to interpolate and an interpolation function. | 820 |
| `util_trackBuilder_markers.interpolateField(name, t, a, b, point, length)` |  | 972 |
| `util_trackBuilder_markers.interpolateOverPoints(nameOfField, track)` |  | 721 |
| `util_trackBuilder_markers.interpolateOverSegments(nameOfField, track)` |  | 781 |
| `util_trackBuilder_markers.interpolatePointsOfSegment(segment, startValue, endValue, startLength, endLength, nameOfField)` | interpolation function for one segment | 931 |
| `util_trackBuilder_markers.interpolateSingle(nameOfField, track)` |  | 808 |
| `util_trackBuilder_markers.linear(t)` |  | 439 |
| `util_trackBuilder_markers.pow2(t)` |  | 449 |
| `util_trackBuilder_markers.pow3(t)` |  | 459 |
| `util_trackBuilder_markers.pow4(t)` |  | 469 |
| `util_trackBuilder_markers.smoothSlope(t)` | smooth slope interpolation, goes from 0/0 to 1/delta, having horizontal slope at 0 and 1 | 480 |
| `util_trackBuilder_markers.smootherSlope(t)` | smoother slope interpolation, goes from 0/0 to 1/delta, having horizontal slope at 0 and 1 | 491 |
| `util_trackBuilder_markers.step(t)` |  | 435 |
| `util_trackBuilder_markers.transformMarkers(name, allNodes)` |  | 976 |
| `util_trackBuilder_markers.unloadAll()` |  | 1007 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `names` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/markers.lua`.*

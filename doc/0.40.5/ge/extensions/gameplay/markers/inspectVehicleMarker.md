# `gameplay_markers_inspectVehicleMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua` · VM : Game Engine (GE) · 274 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_inspectVehicleMarker` : `extensions.load("gameplay_markers_inspectVehicleMarker")`, puis la globale `gameplay_markers_inspectVehicleMarker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_inspectVehicleMarker.cluster(pois, allClusters)` | zoneMarkers are not grouped/merged - each poi will be one cluster. | 248 |
| `gameplay_markers_inspectVehicleMarker.create(...)` |  | 239 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` |  | 42 |
| `C:createObjects()` |  | 38 |
| `C:hide()` |  | 52 |
| `C:init()` |  | 26 |
| `C:interactInPlayMode(interactData, interactableElements)` | Interactivity | 231 |
| `C:setup(cluster)` |  | 202 |
| `C:show()` |  | 63 |
| `C:update(data)` |  | 86 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/inspectVehicleMarker.lua`.*

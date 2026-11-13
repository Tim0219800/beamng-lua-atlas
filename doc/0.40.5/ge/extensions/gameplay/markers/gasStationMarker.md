# `gameplay_markers_gasStationMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/gasStationMarker.lua` · VM : Game Engine (GE) · 253 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_gasStationMarker` : `extensions.load("gameplay_markers_gasStationMarker")`, puis la globale `gameplay_markers_gasStationMarker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_gasStationMarker.cluster(pois, allClusters)` | gasstationMarkers are not grouped/merged - each poi will be one cluster. | 233 |
| `gameplay_markers_gasStationMarker.create(...)` |  | 224 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` |  | 135 |
| `C:createObjects()` |  | 113 |
| `C:drawAxisBox(corner, x, y, z, clr)` |  | 159 |
| `C:drawOnMinimap(td)` | minimap | 218 |
| `C:hide()` |  | 117 |
| `C:init()` |  | 19 |
| `C:instantFade(visible)` |  | 155 |
| `C:interactInPlayMode(interactData, interactableElements)` |  | 145 |
| `C:setup(cluster)` |  | 23 |
| `C:show()` |  | 130 |
| `C:update(data)` |  | 79 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTriSolid`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/gasStationMarker.lua`.*

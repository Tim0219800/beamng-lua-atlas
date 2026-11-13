# `gameplay_markers_driftLineMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/driftLineMarker.lua` · VM : Game Engine (GE) · 134 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_driftLineMarker` : `extensions.load("gameplay_markers_driftLineMarker")`, puis la globale `gameplay_markers_driftLineMarker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_driftLineMarker.cluster(pois, allClusters)` | zoneMarkers are not grouped/merged - each poi will be one cluster. | 109 |
| `gameplay_markers_driftLineMarker.create(...)` |  | 100 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` |  | 18 |
| `C:createObjects()` |  | 14 |
| `C:drawOnMinimap(td)` |  | 90 |
| `C:hide()` |  | 28 |
| `C:init()` |  | 9 |
| `C:interactWhileMoving(interactData)` | Interactivity | 75 |
| `C:setup(cluster)` |  | 54 |
| `C:show()` |  | 31 |
| `C:update()` |  | 35 |

## Appels vers le moteur (C++)

- `obj:` `setHidden`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/driftLineMarker.lua`.*

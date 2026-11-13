# `gameplay_markers_parkingMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/parkingMarker.lua` · VM : Game Engine (GE) · 544 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_parkingMarker` : `extensions.load("gameplay_markers_parkingMarker")`, puis la globale `gameplay_markers_parkingMarker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_parkingMarker.cluster(pois, allClusters)` | parking markers are clustered if the path to the parking spot is identical.<br> if no path is given, that marker will never cluster... | 497 |
| `gameplay_markers_parkingMarker.create(...)` |  | 487 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:checkParking(data)` |  | 257 |
| `C:clearObjects()` |  | 329 |
| `C:createObject(shapeName, objectName)` |  | 288 |
| `C:createObjects()` |  | 302 |
| `C:drawAxisBox(corner, x, y, z, clr)` |  | 430 |
| `C:drawOnMinimap(td)` |  | 368 |
| `C:hide()` |  | 306 |
| `C:init()` |  | 26 |
| `C:instantFade(visible)` |  | 360 |
| `C:interactInPlayMode(interactData, interactableElements)` |  | 352 |
| `C:setup(cluster)` |  | 41 |
| `C:show()` |  | 323 |
| `C:update(data)` |  | 135 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawTriSolid`
- `obj:` `registerObject`, `setField`, `setPosition`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/parkingMarker.lua`.*

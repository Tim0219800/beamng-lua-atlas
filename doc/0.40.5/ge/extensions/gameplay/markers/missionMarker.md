# `gameplay_markers_missionMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/missionMarker.lua` · VM : Game Engine (GE) · 534 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_missionMarker` : `extensions.load("gameplay_markers_missionMarker")`, puis la globale `gameplay_markers_missionMarker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_missionMarker.cluster(pois, allClusters)` | Mission markers are clustered with the original clustering algorithm - when they overlap, they merge. | 488 |
| `gameplay_markers_missionMarker.create(...)` |  | 436 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | destorys/cleans up all objects created by this | 387 |
| `C:createObject(shapeName, objectName)` |  | 318 |
| `C:createObjects()` |  | 333 |
| `C:drawOnMinimap(td, dpi)` |  | 428 |
| `C:hide()` |  | 345 |
| `C:init()` | called when this object is created. initialize variables here (but dont spawn objects) | 61 |
| `C:instantFade(visible)` |  | 380 |
| `C:interactInPlayMode(interactData, interactableElements)` | Interactivity | 414 |
| `C:playerIsInArea(data)` |  | 86 |
| `C:setVisibilityInBigmap(vis, instant)` |  | 383 |
| `C:setup(cluster)` |  | 250 |
| `C:show()` |  | 375 |
| `C:update(data)` | called every frame to update the visuals. | 100 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawLineInstance`
- `obj:` `registerObject`, `setField`, `setPosition`
- `scenetree.` `findObjectById`

**Charge les extensions :** `render_skiaIcons`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/missionMarker.lua`.*

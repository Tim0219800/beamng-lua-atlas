# `gameplay_markers_crawlMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/crawlMarker.lua` · VM : Game Engine (GE) · 276 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_crawlMarker` : `extensions.load("gameplay_markers_crawlMarker")`, puis la globale `gameplay_markers_crawlMarker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_crawlMarker.cluster(pois, allClusters)` | crawlmarker are clustered if the area and icon names are identical | 245 |
| `gameplay_markers_crawlMarker.create(...)` |  | 236 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` |  | 145 |
| `C:createObjects()` |  | 123 |
| `C:drawAxisBox(corner, x, y, z, clr)` |  | 170 |
| `C:drawOnMinimap(td)` | minimap | 228 |
| `C:hide()` |  | 127 |
| `C:init()` |  | 22 |
| `C:instantFade(visible)` |  | 166 |
| `C:interactInPlayMode(interactData, interactableElements)` |  | 156 |
| `C:setup(cluster)` |  | 26 |
| `C:show()` |  | 140 |
| `C:update(data)` |  | 65 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/crawlMarker.lua`.*

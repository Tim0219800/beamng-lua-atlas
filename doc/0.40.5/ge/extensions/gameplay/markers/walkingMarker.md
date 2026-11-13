# `gameplay_markers_walkingMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/walkingMarker.lua` · VM : Game Engine (GE) · 315 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_walkingMarker` : `extensions.load("gameplay_markers_walkingMarker")`, puis la globale `gameplay_markers_walkingMarker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_walkingMarker.cluster(pois, allClusters)` | walkingmarker are clustered if the area and icon names are identical | 278 |
| `gameplay_markers_walkingMarker.create(...)` |  | 269 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` |  | 174 |
| `C:createObjects()` |  | 147 |
| `C:drawAxisBox(corner, x, y, z, clr)` |  | 204 |
| `C:drawOnMinimap(td)` | minimap | 262 |
| `C:hide()` |  | 151 |
| `C:init()` |  | 21 |
| `C:instantFade(visible)` |  | 200 |
| `C:interactInPlayMode(interactData, interactableElements)` |  | 190 |
| `C:setup(cluster)` |  | 25 |
| `C:show()` |  | 169 |
| `C:update(data)` |  | 83 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawTriSolid`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/walkingMarker.lua`.*

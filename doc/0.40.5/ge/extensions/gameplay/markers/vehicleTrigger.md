# `gameplay_markers_vehicleTrigger`

*Fichier : `lua/ge/extensions/gameplay/markers/vehicleTrigger.lua` · VM : Game Engine (GE) · 241 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_vehicleTrigger` : `extensions.load("gameplay_markers_vehicleTrigger")`, puis la globale `gameplay_markers_vehicleTrigger`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_vehicleTrigger.cluster(pois, allClusters)` |  | 216 |
| `gameplay_markers_vehicleTrigger.create(...)` |  | 208 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` |  | 171 |
| `C:createObjects()` |  | 144 |
| `C:drawOnMinimap(td)` | minimap | 202 |
| `C:hide()` |  | 148 |
| `C:init()` |  | 19 |
| `C:instantFade(visible)` |  | 195 |
| `C:interactInPlayMode(interactData, interactableElements)` |  | 187 |
| `C:setHidden(value)` |  | 198 |
| `C:setup(cluster)` |  | 23 |
| `C:show()` |  | 166 |
| `C:update(data)` |  | 79 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/vehicleTrigger.lua`.*

# `gameplay_markers_invisibleTrigger`

*Fichier : `lua/ge/extensions/gameplay/markers/invisibleTrigger.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markers_invisibleTrigger` : `extensions.load("gameplay_markers_invisibleTrigger")`, puis la globale `gameplay_markers_invisibleTrigger`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markers_invisibleTrigger.cluster(pois, allClusters)` | zoneMarkers are not grouped/merged - each poi will be one cluster. | 81 |
| `gameplay_markers_invisibleTrigger.create(...)` |  | 72 |

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | destorys/cleans up all objects created by this | 68 |
| `C:createObjects()` | creates neccesary objects | 60 |
| `C:hide()` |  | 63 |
| `C:init()` | called when this object is created. initialize variables here (but dont spawn objects) | 11 |
| `C:instantFade(visible)` |  | 70 |
| `C:interactInPlayMode(interactData, interactableElements)` | Interactivity | 23 |
| `C:interactWhileMoving(interactData)` |  | 24 |
| `C:setHidden(value)` |  | 61 |
| `C:setup(cluster)` |  | 48 |
| `C:show()` |  | 62 |
| `C:update(data)` | called every frame to update the visuals. | 14 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/invisibleTrigger.lua`.*

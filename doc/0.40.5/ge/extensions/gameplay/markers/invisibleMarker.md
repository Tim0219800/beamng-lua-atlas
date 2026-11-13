# `gameplay_markers_invisibleMarker`

*Fichier : `lua/ge/extensions/gameplay/markers/invisibleMarker.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/markers/invisibleMarker")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_markers_invisibleMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearObjects()` | destorys/cleans up all objects created by this | 38 |
| `C:createObjects()` | creates neccesary objects | 23 |
| `C:hide()` |  | 30 |
| `C:init()` | called when this object is created. initialize variables here (but dont spawn objects) | 8 |
| `C:instantFade(visible)` |  | 42 |
| `C:interactInPlayMode(interactData, interactableElements)` | Interactivity | 47 |
| `C:setHidden(value)` |  | 27 |
| `C:setup(cluster)` |  | 18 |
| `C:show()` |  | 33 |
| `C:update(data)` | called every frame to update the visuals. | 13 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markers/invisibleMarker.lua`.*

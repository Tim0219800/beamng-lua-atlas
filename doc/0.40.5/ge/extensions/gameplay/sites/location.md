# `gameplay_sites_location`

*Fichier : `lua/ge/extensions/gameplay/sites/location.lua` · VM : Game Engine (GE) · 116 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/sites/location")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_sites_location")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawDebug(drawMode, clr)` |  | 45 |
| `C:findClosestRoadInfo()` |  | 81 |
| `C:init(sites, name, forceId)` |  | 8 |
| `C:onDeserialized(data)` |  | 32 |
| `C:onSerialize()` |  | 20 |
| `C:set(pos, radius)` |  | 40 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/location.lua`.*

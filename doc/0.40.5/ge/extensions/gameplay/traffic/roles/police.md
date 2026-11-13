# `gameplay_traffic_roles_police`

*Fichier : `lua/ge/extensions/gameplay/traffic/roles/police.lua` · VM : Game Engine (GE) · 312 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/roles/police")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_roles_police")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:checkTarget()` |  | 107 |
| `C:init()` |  | 7 |
| `C:onRefresh()` |  | 124 |
| `C:onTrafficTick(dt)` |  | 153 |
| `C:onUpdate(dt, dtSim)` |  | 225 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/roles/police.lua`.*

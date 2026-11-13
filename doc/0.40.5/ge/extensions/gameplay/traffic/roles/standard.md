# `gameplay_traffic_roles_standard`

*Fichier : `lua/ge/extensions/gameplay/traffic/roles/standard.lua` · VM : Game Engine (GE) · 319 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/traffic/roles/standard")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_traffic_roles_standard")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` |  | 15 |
| `C:onCollision(otherId, data)` |  | 109 |
| `C:onCrashDamage(data)` |  | 86 |
| `C:onOtherCollision(id1, id2, data)` |  | 130 |
| `C:onOtherCrashDamage(otherId, data)` |  | 97 |
| `C:onOtherEvent(eventType, otherId, data)` |  | 149 |
| `C:onRefresh()` |  | 60 |
| `C:onTrafficTick(tickTime)` |  | 158 |
| `C:onUpdate(dt, dtSim)` |  | 274 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTrafficAction` — écouté par 2 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/traffic/roles/standard.lua`.*

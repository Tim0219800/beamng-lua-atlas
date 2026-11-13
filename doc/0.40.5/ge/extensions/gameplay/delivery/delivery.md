# `gameplay_delivery_delivery`

*Fichier : `lua/ge/extensions/gameplay/delivery/delivery.lua` · VM : Game Engine (GE) · 176 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/delivery/delivery")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_delivery_delivery")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateRoundtrip()` |  | 66 |
| `C:checkFail(dt)` |  | 137 |
| `C:clearEvents()` |  | 133 |
| `C:getCurrentLocation()` |  | 165 |
| `C:getCurrentRewardFactor()` |  | 26 |
| `C:init()` |  | 7 |
| `C:proceedDelivery()` |  | 114 |
| `C:selectLocations(tag, count)` |  | 40 |
| `C:setTimeParameters(baseTime, timePerKm)` |  | 95 |
| `C:setup(sites, pickupPos, pickupRadius, tag, count)` |  | 100 |
| `C:startDelivery()` |  | 109 |
| `C:update(dt)` |  | 124 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/delivery/delivery.lua`.*

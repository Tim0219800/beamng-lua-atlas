# `gameplay_rally_loop_speedingDetector`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua` · VM : Game Engine (GE) · 262 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/loop/speedingDetector")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_loop_speedingDetector")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addSample(sample)` |  | 42 |
| `C:drawDebug()` |  | 155 |
| `C:getAverageSpeed()` |  | 49 |
| `C:getCurrentSpeedKph()` |  | 35 |
| `C:init(manager)` |  | 9 |
| `C:stochasticPenalty(maxSpeedOver, maxProbability)` |  | 60 |
| `C:update(dtSim, limitKph, strictMode)` |  | 86 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua`.*

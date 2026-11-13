# `gameplay_rally_loop_stagedCountdownTest`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua` · VM : Game Engine (GE) · 123 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/loop/stagedCountdownTest")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_loop_stagedCountdownTest")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateScheduledEventTime()` |  | 39 |
| `C:getWallClockTime()` |  | 106 |
| `C:init()` |  | 17 |
| `C:reschedule(slotSizeMinutes, rescheduleCount, maxReschedules, defaultWarningTimes, warningsTriggered)` |  | 71 |

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua`.*

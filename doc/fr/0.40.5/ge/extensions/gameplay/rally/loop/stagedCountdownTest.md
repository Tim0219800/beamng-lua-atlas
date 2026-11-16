# `gameplay_rally_loop_stagedCountdownTest`

*Fichier : `lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua` · VM : Game Engine (GE) · 123 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/loop/stagedCountdownTest")` (fichier sous extensions/ mais pas une extension classique)

Simulation de test pour le compte à rebours de départ de spéciale (staged countdown). Reproduit une horloge murale à partir de l'heure du jour de l'environnement et planifie l'évènement de départ à la prochaine minute pleine (ou la suivante s'il reste moins de 15 s). Utilisé en mode test par le nœud de compte à rebours ; l'époque (epoch) est avancée par l'appelant.

## Remarques

- Le module renvoie un constructeur : require('gameplay_rally_loop_stagedCountdownTest')().
- L'heure de départ en secondes = ((tod.time * 24 + 12) % 24) * 3600 (tod.time = 0 correspond à midi) ; si core_environment est absent, minuit (0).
- Dans calculateScheduledEventTime la variable minutesToAdd est calculée mais jamais utilisée (le décalage de 60 s est appliqué séparément).

## Classe `C`

Instance de test. Champs : epoch (secondes écoulées depuis le début), environmentStartTimeSecs (heure murale de départ en secondes), scheduledEventTime (époque de l'évènement planifié).

Le module renvoie un constructeur : `local obj = require("gameplay_rally_loop_stagedCountdownTest")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateScheduledEventTime()` | Planifie scheduledEventTime à la prochaine minute pleine de l'horloge murale ; s'il reste moins de 15 s avant, utilise la minute suivante. Le résultat est exprimé en époque (relative au démarrage). | 39 |
| `C:getWallClockTime()` | Heure murale simulée = (environmentStartTimeSecs + epoch) modulo 86400. | 106 |
| `C:init()` | Lit l'heure de l'environnement, initialise epoch = 0 et planifie l'évènement. | 17 |
| `C:reschedule(slotSizeMinutes, rescheduleCount, maxReschedules, defaultWarningTimes, warningsTriggered)` | Replanifie l'évènement : minute pleine suivant l'ancienne heure plus slotSizeMinutes minutes. Marque comme déjà déclenchés les avertissements dont le délai restant est déjà passé. | 71 |

## Appels vers le moteur (C++)

- `core_environment.` `getTimeOfDay`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/loop/stagedCountdownTest.lua`.*

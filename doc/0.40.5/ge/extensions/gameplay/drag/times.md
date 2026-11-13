# `gameplay_drag_times`

*Fichier : `lua/ge/extensions/gameplay/drag/times.lua` · VM : Game Engine (GE) · 288 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_times` : `extensions.load("gameplay_drag_times")`, puis la globale `gameplay_drag_times`

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_times.dragRaceStarted(vehId)` | Marks a racer's timers as started (called when green light fires).<br> vehId: vehicle ID of the racer | 270 |
| `gameplay_drag_times.getImportantTimerValue(racer, data)` |  | 89 |
| `gameplay_drag_times.getImportantTimerValueForWin(racer, data)` | Effective time for win comparison: timer + reaction for time-type (distanceTimer), raw value for velocity. | 112 |
| `gameplay_drag_times.getNetworkTimersForRacer(racer)` | In MP, get network-broadcast timer values for a racer's vehicle. Returns table keyed by timerId, or nil. | 56 |
| `gameplay_drag_times.getRacerTimerValue(racer, timerId)` |  | 82 |
| `gameplay_drag_times.getReactionTimerValue(racer)` |  | 94 |
| `gameplay_drag_times.onDragClear()` | *(hook)* | 284 |
| `gameplay_drag_times.onDragReset()` | *(hook)* | 283 |
| `gameplay_drag_times.onUpdate(dtReal, dtSim, dtRaw)` | Per-frame timer update. Calculates elapsed time, distance/velocity splits, reaction time, and braking G. *(hook)* | 138 |
| `gameplay_drag_times.reset()` | Resets all non-dial timers for every racer. | 12 |
| `gameplay_drag_times.resetDragRaceValues()` |  | 276 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/times.lua`.*

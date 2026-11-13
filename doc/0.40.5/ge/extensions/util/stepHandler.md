# `util_stepHandler`

*Fichier : `lua/ge/extensions/util/stepHandler.lua` · VM : Game Engine (GE) · 338 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_stepHandler` : `extensions.load("util_stepHandler")`, puis la globale `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_stepHandler.makeLoadLevelStep(level)` |  | 246 |
| `util_stepHandler.makeStepFadeFromBlack(duration)` |  | 59 |
| `util_stepHandler.makeStepFadeToBlack(duration)` |  | 49 |
| `util_stepHandler.makeStepReturnTrueFunction(fun)` |  | 124 |
| `util_stepHandler.makeStepSpawnTrafficSimple(amount, active, generator)` |  | 204 |
| `util_stepHandler.makeStepSpawnVehicle(spawningOptions, callback)` |  | 160 |
| `util_stepHandler.makeStepSpawnVehicleSimple(model, config, callback)` |  | 169 |
| `util_stepHandler.makeStepWait(seconds)` |  | 78 |
| `util_stepHandler.makeStepWaitFrames(frames)` |  | 97 |
| `util_stepHandler.makeUiMessageStep(message)` |  | 132 |
| `util_stepHandler.onClientStartMission(state)` | *(hook)* | 239 |
| `util_stepHandler.onScreenFadeState(state)` | *(hook)* | 43 |
| `util_stepHandler.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 282 |
| `util_stepHandler.onVehicleGroupSpawned(vehIds, groupId)` | *(hook)* | 176 |
| `util_stepHandler.skipToLastStepOrCallback()` |  | 275 |
| `util_stepHandler.startStepSequence(steps, callbackWhenFinished)` | starting a sequence | 262 |
| `util_stepHandler.taskLoadLevelStep(step)` |  | 218 |
| `util_stepHandler.taskSpawnTrafficStep(step)` | vehicle spawning helper | 188 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/stepHandler.lua`.*

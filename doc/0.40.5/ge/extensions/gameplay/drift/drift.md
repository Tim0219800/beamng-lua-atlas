# `gameplay_drift_drift`

*Fichier : `lua/ge/extensions/gameplay/drift/drift.lua` · VM : Game Engine (GE) · 1206 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_drift` : `extensions.load("gameplay_drift_drift")`, puis la globale `gameplay_drift_drift`

**Dépendances (chargées avant) :** `gameplay_walk`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_drift.addTrackedVehicle(vehId, opts)` |  | 873 |
| `gameplay_drift_drift.doesPlHaveVeh(vehId)` |  | 1000 |
| `gameplay_drift_drift.getAirSpeed(vehId)` |  | 920 |
| `gameplay_drift_drift.getAngleDiff(vehId)` |  | 962 |
| `gameplay_drift_drift.getCurrDegAngleSigned(vehId)` |  | 950 |
| `gameplay_drift_drift.getCurrDriftCompletedTime(vehId)` |  | 956 |
| `gameplay_drift_drift.getCurrentDriftDuration(vehId)` |  | 972 |
| `gameplay_drift_drift.getDistSinceLastFrame(vehId)` |  | 967 |
| `gameplay_drift_drift.getDriftActiveData(vehId)` |  | 900 |
| `gameplay_drift_drift.getDriftChainActiveData(vehId)` |  | 905 |
| `gameplay_drift_drift.getDriftChainChainedDrifts(vehId)` |  | 910 |
| `gameplay_drift_drift.getDriftDebugInfo()` |  | 1017 |
| `gameplay_drift_drift.getDriftOptions()` |  | 1005 |
| `gameplay_drift_drift.getGC()` |  | 1013 |
| `gameplay_drift_drift.getIsCrashing(vehId)` |  | 995 |
| `gameplay_drift_drift.getIsDrifting(vehId)` |  | 915 |
| `gameplay_drift_drift.getIsInTheAir(vehId)` |  | 990 |
| `gameplay_drift_drift.getIsOverMinSpeedForDrift(vehId)` |  | 985 |
| `gameplay_drift_drift.getIsOverSteering(vehId)` |  | 980 |
| `gameplay_drift_drift.getPlVeh()` |  | 935 |
| `gameplay_drift_drift.getPlayerIdForVehicle(vehId)` |  | 859 |
| `gameplay_drift_drift.getTrackedVehicles()` |  | 896 |
| `gameplay_drift_drift.getVehCorners()` |  | 1009 |
| `gameplay_drift_drift.getVehData(vehId)` |  | 940 |
| `gameplay_drift_drift.getVehId()` |  | 930 |
| `gameplay_drift_drift.getVehPos(vehId)` |  | 925 |
| `gameplay_drift_drift.getVehVel(vehId)` |  | 945 |
| `gameplay_drift_drift.onAnyStuntZoneAccomplished()` | *(hook)* | 1080 |
| `gameplay_drift_drift.onClientEndMission()` | *(hook)* | 1076 |
| `gameplay_drift_drift.onDeserialized(data)` | *(hook)* | 1151 |
| `gameplay_drift_drift.onDriftChallengeFinished()` | *(hook)* | 1103 |
| `gameplay_drift_drift.onDriftContextChanged(context, oldContext)` | *(hook)* | 1087 |
| `gameplay_drift_drift.onDriftPlVehReset(vehId)` | *(hook)* | 1130 |
| `gameplay_drift_drift.onSerialize()` | *(hook)* | 1145 |
| `gameplay_drift_drift.onUpdate(dtReal, _dtSim, dtRaw)` | *(hook)* | 807 |
| `gameplay_drift_drift.onVehicleCrashStarted(crashStartData)` | *(hook)* | 1117 |
| `gameplay_drift_drift.onVehicleDestroyed(vehId)` | *(hook)* | 1072 |
| `gameplay_drift_drift.onVehicleSwitched(oldId, newVehId, player)` | *(hook)* | 1056 |
| `gameplay_drift_drift.removeTrackedVehicle(vehId)` |  | 864 |
| `gameplay_drift_drift.reset(vehId)` |  | 1045 |
| `gameplay_drift_drift.setAllowDonut(value)` |  | 1021 |
| `gameplay_drift_drift.setAllowTightDrift(value)` |  | 1025 |
| `gameplay_drift_drift.setBalanceMode(_balanceMode, vehId)` |  | 1038 |
| `gameplay_drift_drift.setVehId(newVehId)` |  | 1029 |
| `gameplay_drift_drift.simulateADrift(data)` |  | 855 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftActiveDataFinished` — écouté par 2 module(s)
- `onDriftChainStarted` — écouté par 1 module(s)
- `onDriftCompleted` — écouté par 3 module(s)
- `onDriftCrash` — écouté par 7 module(s)
- `onDriftSpinout` — écouté par 6 module(s)
- `onDriftStatusChanged` — écouté par 2 module(s)
- `onDriftTransition` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawTextAdvanced`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/drift.lua`.*

# `gameplay_drift_freeroam_driftSpots`

*Fichier : `lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua` · VM : Game Engine (GE) · 532 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_freeroam_driftSpots` : `extensions.load("gameplay_drift_freeroam_driftSpots")`, puis la globale `gameplay_drift_freeroam_driftSpots`

**Dépendances (chargées avant) :** `gameplay_drift_general`, `gameplay_drift_drift`, `gameplay_drift_scoring`, `gameplay_drift_saveLoad`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_freeroam_driftSpots.detectStart(lineId)` | "Proper" end means going through the finish line, not out of bounds or wrong way | 244 |
| `gameplay_drift_freeroam_driftSpots.getDriftDebugInfo()` |  | 379 |
| `gameplay_drift_freeroam_driftSpots.getGC()` |  | 387 |
| `gameplay_drift_freeroam_driftSpots.getIsInFreeroamChallenge()` |  | 391 |
| `gameplay_drift_freeroam_driftSpots.getIsInTheConcludingPhase()` |  | 383 |
| `gameplay_drift_freeroam_driftSpots.onClientEndMission()` | *(hook)* | 482 |
| `gameplay_drift_freeroam_driftSpots.onClientStartMission()` | *(hook)* | 491 |
| `gameplay_drift_freeroam_driftSpots.onDeserialized(data)` | *(hook)* | 497 |
| `gameplay_drift_freeroam_driftSpots.onDriftCompletedScored()` | when whole drift chain done *(hook)* | 446 |
| `gameplay_drift_freeroam_driftSpots.onGetRawPoiListForLevel(levelIdentifier, elements)` | *(hook)* | 409 |
| `gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStarted()` | *(hook)* | 468 |
| `gameplay_drift_freeroam_driftSpots.onMultiplayerGamemodeStopped()` | *(hook)* | 477 |
| `gameplay_drift_freeroam_driftSpots.onSerialize()` | *(hook)* | 504 |
| `gameplay_drift_freeroam_driftSpots.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 358 |
| `gameplay_drift_freeroam_driftSpots.onVehicleResetted(id)` | *(hook)* | 395 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDriftSpotCompleted` — écouté par 1 module(s)
- `onDriftSpotFailed` — écouté par 2 module(s)
- `onDriftSpotFinishLineCrossed` — écouté par 1 module(s)
- `onDriftSpotForcedEnd`
- `onDriftSpotStarted` — écouté par 1 module(s)
- `onFreeroamDriftZoneNewHighscore` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `SetTasklistTask`

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/freeroam/driftSpots.lua`.*

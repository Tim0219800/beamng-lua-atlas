# `telemetry_trackers_performanceSpatial`

*Fichier : `lua/ge/extensions/telemetry/trackers/performanceSpatial.lua` · VM : Game Engine (GE) · 329 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_performanceSpatial` : `extensions.load("telemetry_trackers_performanceSpatial")`, puis la globale `telemetry_trackers_performanceSpatial`

**Dépendances (chargées avant) :** `telemetry_core`, `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_performanceSpatial.onClientEndMission()` | *(hook)* | 316 |
| `telemetry_trackers_performanceSpatial.onExit()` | *(hook)* | 316 |
| `telemetry_trackers_performanceSpatial.onExtensionLoaded(data)` | *(hook)* | 246 |
| `telemetry_trackers_performanceSpatial.onExtensionUnloaded()` | *(hook)* | 316 |
| `telemetry_trackers_performanceSpatial.onSerialize(reason)` | *(hook)* | 305 |
| `telemetry_trackers_performanceSpatial.onUpdate(dtReal, dtSim)` | *(hook)* | 178 |
| `telemetry_trackers_performanceSpatial.trackVehReset()` |  | 101 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyMissionChanged` — écouté par 19 module(s)
- `onClientPreEndMission`
- `onGameplayActivityAborted`
- `onMissionAttemptAggregated` — écouté par 2 module(s)
- `onPreExit` — écouté par 1 module(s)
- `onRecoveryPromptButtonPressed` — écouté par 2 module(s)
- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/performanceSpatial.lua`.*

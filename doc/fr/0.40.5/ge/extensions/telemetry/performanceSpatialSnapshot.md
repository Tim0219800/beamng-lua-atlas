# `telemetry_performanceSpatialSnapshot`

*Fichier : `lua/ge/extensions/telemetry/performanceSpatialSnapshot.lua` · VM : Game Engine (GE) · 192 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceSpatialSnapshot` : `extensions.load("telemetry_performanceSpatialSnapshot")`, puis la globale `telemetry_performanceSpatialSnapshot`

Module utilitaire (chargé par require) qui construit l'instantané de performance envoyé par le tracker performanceSpatial : FPS (instantané, moyenne, min, p99), temps de frame, CPU/GPU, cause du plafond de FPS, position et réglages de la caméra, état du monde (échelle de temps, nombre de véhicules, écran partagé, trafic) et, sur option, répartition du temps par phase de frame et statistiques de rendu. Les valeurs sont arrondies.

## Remarques

- framePhases n'est ajouté que si options.renderTimingTrackingEnabled ; renderStats que si options.sceneComplexityTrackingEnabled.
- Les phases viennent de Engine.Debug.getLastPerformanceMetrics ; gpuWaitMs retombe sur la phase FramePresent s'il est absent.
- Position de la caméra arrondie à 0,1 m, angles à 0,1 degré.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceSpatialSnapshot.capture(level, fpsInstant, frameMs, activeGpu, options)` | Renvoie une table d'événement : level, fpsInstant, fpsAvg, fpsMin, fpsP99, frameMs, cpuMs, gpuMs, gpuWaitMs, limitedBy, activeGpu, position, camera, textureStreaming, worldReadyState, simTimeScale, vehicleCount, splitScreenPlayers, trafficCount, et facultativement framePhases et renderStats. | 168 |

### Détail des paramètres

#### `telemetry_performanceSpatialSnapshot.capture(level, fpsInstant, frameMs, activeGpu, options)`

Renvoie une table d'événement : level, fpsInstant, fpsAvg, fpsMin, fpsP99, frameMs, cpuMs, gpuMs, gpuWaitMs, limitedBy, activeGpu, position, camera, textureStreaming, worldReadyState, simTimeScale, vehicleCount, splitScreenPlayers, trafficCount, et facultativement framePhases et renderStats.

- `level` (*string*) : Nom du niveau courant.
- `fpsInstant` (*number*) : FPS instantanés.
- `frameMs` (*number*) : Durée de frame en ms.
- `activeGpu` (*any*) : Description du GPU actif, recopiée telle quelle.
- `options` (*table|nil*) : renderTimingTrackingEnabled, sceneComplexityTrackingEnabled.
- **renvoie** : table Événement de performance.

## Appels vers le moteur (C++)

- `be:` `getObjectCount`, `getSimulationTimeScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceSpatialSnapshot.lua`.*

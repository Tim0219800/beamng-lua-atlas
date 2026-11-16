# `telemetry_performanceSpatialSnapshot.test`

*Fichier : `lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua` · VM : Game Engine (GE) · 39 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceSpatialSnapshot.test` : `extensions.load("telemetry_performanceSpatialSnapshot.test")`, puis la globale `telemetry_performanceSpatialSnapshot.test`

Tests unitaires de telemetry/performanceSpatialSnapshot (runTestFiles("performanceSpatialSnapshot")).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceSpatialSnapshot.test.testDetailedMetricsDefaultOff(ctx)` | Vérifie que framePhases et renderStats sont absents par défaut. *(interne)* | 15 |
| `telemetry_performanceSpatialSnapshot.test.testRenderTimingCanBeEnabledAlone(ctx)` | Vérifie que renderTimingTrackingEnabled ajoute framePhases sans renderStats. *(interne)* | 22 |
| `telemetry_performanceSpatialSnapshot.test.testSceneComplexityCanBeEnabledAlone(ctx)` | Vérifie que sceneComplexityTrackingEnabled ajoute renderStats (dont visibleObjectCount numérique) sans framePhases. *(interne)* | 29 |

### Détail des paramètres

#### `telemetry_performanceSpatialSnapshot.test.testDetailedMetricsDefaultOff(ctx)`

Vérifie que framePhases et renderStats sont absents par défaut.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialSnapshot.test.testRenderTimingCanBeEnabledAlone(ctx)`

Vérifie que renderTimingTrackingEnabled ajoute framePhases sans renderStats.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialSnapshot.test.testSceneComplexityCanBeEnabledAlone(ctx)`

Vérifie que sceneComplexityTrackingEnabled ajoute renderStats (dont visibleObjectCount numérique) sans framePhases.

- `ctx` (*table*) : Contexte du framework de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceSpatialSnapshot.test.lua`.*

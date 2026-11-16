# `telemetry_performanceSpatialConfig.test`

*Fichier : `lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua` · VM : Game Engine (GE) · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceSpatialConfig.test` : `extensions.load("telemetry_performanceSpatialConfig.test")`, puis la globale `telemetry_performanceSpatialConfig.test`

Tests unitaires de telemetry/performanceSpatialConfig (runTestFiles("performanceSpatialConfig")).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceSpatialConfig.test.testAdvancedCollectionDefaultsOff(ctx)` | Vérifie qu'avec une config vide, intervalle 0 et tous les suivis avancés sont désactivés. *(interne)* | 11 |
| `telemetry_performanceSpatialConfig.test.testDetailedMetricsAreExplicit(ctx)` | Vérifie que sceneComplexityTrackingEnabled et renderTimingTrackingEnabled doivent être activés explicitement. *(interne)* | 48 |
| `telemetry_performanceSpatialConfig.test.testDipSettingsAreClamped(ctx)` | Vérifie que les seuils de chute hors limites sont ramenés dans leurs bornes. *(interne)* | 71 |
| `telemetry_performanceSpatialConfig.test.testGameplayExitTrackingIsExplicit(ctx)` | Vérifie que gameplayExitTrackingEnabled doit être mis à true explicitement. *(interne)* | 34 |
| `telemetry_performanceSpatialConfig.test.testLevelFilterBecomesLookup(ctx)` | Vérifie que la liste levels devient une table de recherche nom -> true. *(interne)* | 60 |
| `telemetry_performanceSpatialConfig.test.testRecoveryTrackingIsExplicit(ctx)` | Vérifie que recoveryTrackingEnabled doit être mis à true explicitement. *(interne)* | 28 |
| `telemetry_performanceSpatialConfig.test.testShaderGenerationTrackingIsExplicit(ctx)` | Vérifie que shaderGenerationTrackingEnabled doit être mis à true explicitement. *(interne)* | 41 |

### Détail des paramètres

#### `telemetry_performanceSpatialConfig.test.testAdvancedCollectionDefaultsOff(ctx)`

Vérifie qu'avec une config vide, intervalle 0 et tous les suivis avancés sont désactivés.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialConfig.test.testDetailedMetricsAreExplicit(ctx)`

Vérifie que sceneComplexityTrackingEnabled et renderTimingTrackingEnabled doivent être activés explicitement.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialConfig.test.testDipSettingsAreClamped(ctx)`

Vérifie que les seuils de chute hors limites sont ramenés dans leurs bornes.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialConfig.test.testGameplayExitTrackingIsExplicit(ctx)`

Vérifie que gameplayExitTrackingEnabled doit être mis à true explicitement.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialConfig.test.testLevelFilterBecomesLookup(ctx)`

Vérifie que la liste levels devient une table de recherche nom -> true.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialConfig.test.testRecoveryTrackingIsExplicit(ctx)`

Vérifie que recoveryTrackingEnabled doit être mis à true explicitement.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialConfig.test.testShaderGenerationTrackingIsExplicit(ctx)`

Vérifie que shaderGenerationTrackingEnabled doit être mis à true explicitement.

- `ctx` (*table*) : Contexte du framework de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceSpatialConfig.test.lua`.*

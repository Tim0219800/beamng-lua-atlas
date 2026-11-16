# `telemetry_performanceSpatialDetector.test`

*Fichier : `lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua` · VM : Game Engine (GE) · 169 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceSpatialDetector.test` : `extensions.load("telemetry_performanceSpatialDetector.test")`, puis la globale `telemetry_performanceSpatialDetector.test`

Tests unitaires de telemetry/performanceSpatialDetector (runTestFiles("performanceSpatialDetector")).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceSpatialDetector.test.testAbsoluteDip(ctx)` | Vérifie qu'une chute sous le seuil de FPS absolu produit un événement au retour à la normale. *(interne)* | 27 |
| `telemetry_performanceSpatialDetector.test.testCooldownSuppressesDip(ctx)` | Vérifie que le délai de repos supprime un nouvel épisode. *(interne)* | 132 |
| `telemetry_performanceSpatialDetector.test.testDipMustBeSustained(ctx)` | Vérifie qu'une chute plus courte que dipMinDurationMs ne produit rien. *(interne)* | 51 |
| `telemetry_performanceSpatialDetector.test.testIntentionalCapDisablesAbsoluteTrigger(ctx)` | Vérifie qu'avec absoluteAllowed = false, un FPS plafonné ne déclenche pas de chute absolue. *(interne)* | 99 |
| `telemetry_performanceSpatialDetector.test.testLongDipIsSegmented(ctx)` | Vérifie qu'un épisode dépassant maxEpisodeMs est découpé. *(interne)* | 121 |
| `telemetry_performanceSpatialDetector.test.testOpenSustainedDipCanBeFinished(ctx)` | Vérifie que finish() clôt un épisode ouvert et soutenu. *(interne)* | 109 |
| `telemetry_performanceSpatialDetector.test.testRecoveryEmitsWorstFrameOnce(ctx)` | Vérifie que la pire frame est capturée une fois puis que l'événement est émis à la reprise. *(interne)* | 75 |
| `telemetry_performanceSpatialDetector.test.testRecoveryWithoutObservedDurationDoesNotEmit(ctx)` | Vérifie qu'un épisode sans durée observée (un seul échantillon) n'émet pas d'événement. *(interne)* | 65 |
| `telemetry_performanceSpatialDetector.test.testRelativeDip(ctx)` | Vérifie qu'un temps de frame supérieur à baseline * ratio produit un événement. *(interne)* | 39 |
| `telemetry_performanceSpatialDetector.test.testSessionCapSuppressesDip(ctx)` | Vérifie que maxDipEventsPerSession plafonne le nombre d'événements. *(interne)* | 153 |

### Détail des paramètres

#### `telemetry_performanceSpatialDetector.test.testAbsoluteDip(ctx)`

Vérifie qu'une chute sous le seuil de FPS absolu produit un événement au retour à la normale.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialDetector.test.testCooldownSuppressesDip(ctx)`

Vérifie que le délai de repos supprime un nouvel épisode.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialDetector.test.testDipMustBeSustained(ctx)`

Vérifie qu'une chute plus courte que dipMinDurationMs ne produit rien.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialDetector.test.testIntentionalCapDisablesAbsoluteTrigger(ctx)`

Vérifie qu'avec absoluteAllowed = false, un FPS plafonné ne déclenche pas de chute absolue.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialDetector.test.testLongDipIsSegmented(ctx)`

Vérifie qu'un épisode dépassant maxEpisodeMs est découpé.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialDetector.test.testOpenSustainedDipCanBeFinished(ctx)`

Vérifie que finish() clôt un épisode ouvert et soutenu.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialDetector.test.testRecoveryEmitsWorstFrameOnce(ctx)`

Vérifie que la pire frame est capturée une fois puis que l'événement est émis à la reprise.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialDetector.test.testRecoveryWithoutObservedDurationDoesNotEmit(ctx)`

Vérifie qu'un épisode sans durée observée (un seul échantillon) n'émet pas d'événement.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialDetector.test.testRelativeDip(ctx)`

Vérifie qu'un temps de frame supérieur à baseline * ratio produit un événement.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_performanceSpatialDetector.test.testSessionCapSuppressesDip(ctx)`

Vérifie que maxDipEventsPerSession plafonne le nombre d'événements.

- `ctx` (*table*) : Contexte du framework de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua`.*

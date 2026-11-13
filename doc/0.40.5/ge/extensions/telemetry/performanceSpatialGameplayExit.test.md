# `telemetry_performanceSpatialGameplayExit.test`

*Fichier : `lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua` · VM : Game Engine (GE) · 311 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_performanceSpatialGameplayExit.test` : `extensions.load("telemetry_performanceSpatialGameplayExit.test")`, puis la globale `telemetry_performanceSpatialGameplayExit.test`

Tests unitaires de telemetry/performanceSpatialGameplayExit. Chaque test reçoit un contexte `ctx` (assert, assertEqual) du lanceur de tests du jeu et injecte de faux modules de gameplay via le paramètre `source` (niveau « italy », véhicule en (1.24, -2.26, 3.01), caméra en (10.04, 20.06, 30.01)). Ce n'est pas une extension à charger.

## Remarques

- Les tests documentent le comportement attendu : la mission prime sur le reste, une tentative active (drag, drift, crawl) prime sur la livraison de carrière, et les activités terminées (scénario en état post, drag isCompleted, drift en conclusion, crawl isCompleted) ne comptent plus comme actives.
- Ils vérifient aussi l'arrondi à 0,1 m, le repli véhicule puis caméra, le rejet d'un exitKind inconnu (« failure »), d'un activityType inconnu et d'un niveau non suivi.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_performanceSpatialGameplayExit.test.testActiveAttemptTakesPrecedenceOverCareerDelivery(ctx)` | Un drag, drift ou crawl actif prime sur une livraison de carrière active. *(interne)* | 244 |
| `telemetry_performanceSpatialGameplayExit.test.testAttemptBasedActivityFamilies(ctx)` | Vérifie que chaque famille (scénario, livraison libre, livraison de carrière, essai, certification, drag, drift, crawl) est reconnue avec le bon activityType et activityId. *(interne)* | 58 |
| `telemetry_performanceSpatialGameplayExit.test.testCaptureUsesVehicleThenCamera(ctx)` | capture prend la position du véhicule (arrondie à 0,1), sinon celle de la caméra. *(interne)* | 146 |
| `telemetry_performanceSpatialGameplayExit.test.testCaptureValidatesContextAndLevel(ctx)` | capture convertit un id numérique en chaîne, omet un id invalide sans perdre l'évènement, et renvoie nil pour un exitKind/activityType inconnu ou un niveau non suivi. *(interne)* | 165 |
| `telemetry_performanceSpatialGameplayExit.test.testCompletedCrawlIsNotActive(ctx)` | Un crawl terminé n'est plus actif. *(interne)* | 293 |
| `telemetry_performanceSpatialGameplayExit.test.testCompletedDragIsNotActive(ctx)` | Un drag terminé (isCompleted) n'est plus actif. *(interne)* | 211 |
| `telemetry_performanceSpatialGameplayExit.test.testCompletedScenarioIsNotActive(ctx)` | Un scénario à l'état post n'est pas une activité active. *(interne)* | 188 |
| `telemetry_performanceSpatialGameplayExit.test.testConcludingDriftIsNotActive(ctx)` | Un défi de drift en phase de conclusion n'est plus actif. *(interne)* | 200 |
| `telemetry_performanceSpatialGameplayExit.test.testDragUsesTopLevelDataAndCurrentLevel(ctx)` | La clé de drag est calculée avec les données de drag de plus haut niveau, et le préfixe « : » est complété par le niveau courant. *(interne)* | 224 |
| `telemetry_performanceSpatialGameplayExit.test.testMissionTakesPrecedence(ctx)` | Une mission au premier plan est prioritaire sur un drag en cours. *(interne)* | 39 |

### Détail des paramètres

#### `telemetry_performanceSpatialGameplayExit.test.testActiveAttemptTakesPrecedenceOverCareerDelivery(ctx)`

Un drag, drift ou crawl actif prime sur une livraison de carrière active.

- `ctx` (*table*) : Contexte de test.

#### `telemetry_performanceSpatialGameplayExit.test.testAttemptBasedActivityFamilies(ctx)`

Vérifie que chaque famille (scénario, livraison libre, livraison de carrière, essai, certification, drag, drift, crawl) est reconnue avec le bon activityType et activityId.

- `ctx` (*table*) : Contexte de test.

#### `telemetry_performanceSpatialGameplayExit.test.testCaptureUsesVehicleThenCamera(ctx)`

capture prend la position du véhicule (arrondie à 0,1), sinon celle de la caméra.

- `ctx` (*table*) : Contexte de test.

#### `telemetry_performanceSpatialGameplayExit.test.testCaptureValidatesContextAndLevel(ctx)`

capture convertit un id numérique en chaîne, omet un id invalide sans perdre l'évènement, et renvoie nil pour un exitKind/activityType inconnu ou un niveau non suivi.

- `ctx` (*table*) : Contexte de test.

#### `telemetry_performanceSpatialGameplayExit.test.testCompletedCrawlIsNotActive(ctx)`

Un crawl terminé n'est plus actif.

- `ctx` (*table*) : Contexte de test.

#### `telemetry_performanceSpatialGameplayExit.test.testCompletedDragIsNotActive(ctx)`

Un drag terminé (isCompleted) n'est plus actif.

- `ctx` (*table*) : Contexte de test.

#### `telemetry_performanceSpatialGameplayExit.test.testCompletedScenarioIsNotActive(ctx)`

Un scénario à l'état post n'est pas une activité active.

- `ctx` (*table*) : Contexte de test.

#### `telemetry_performanceSpatialGameplayExit.test.testConcludingDriftIsNotActive(ctx)`

Un défi de drift en phase de conclusion n'est plus actif.

- `ctx` (*table*) : Contexte de test.

#### `telemetry_performanceSpatialGameplayExit.test.testDragUsesTopLevelDataAndCurrentLevel(ctx)`

La clé de drag est calculée avec les données de drag de plus haut niveau, et le préfixe « : » est complété par le niveau courant.

- `ctx` (*table*) : Contexte de test.

#### `telemetry_performanceSpatialGameplayExit.test.testMissionTakesPrecedence(ctx)`

Une mission au premier plan est prioritaire sur un drag en cours.

- `ctx` (*table*) : Contexte de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua`.*

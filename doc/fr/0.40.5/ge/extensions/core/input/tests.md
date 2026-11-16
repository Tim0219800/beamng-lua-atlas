# `core_input_tests`

*Fichier : `lua/ge/extensions/core/input/tests.lua` · VM : Game Engine (GE) · 98 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_input_tests` : `extensions.load("core_input_tests")`, puis la globale `core_input_tests`

Extension GE `core_input_tests` : orchestre les tests de latence/fréquence des entrées (système, moteur, véhicule, oscillation) affichés dans l'UI. Elle met la simulation en marche (dépause), lance côté véhicule l'extension `inputTests` pour chaque test d'une file, reçoit les statistiques et pousse l'état à l'UI par `InputTestStateChanged`. Surtout destinée à l'interface de diagnostic, peu utile à un moddeur.

## Remarques

- Tests déclarés : systemFrequencyTest, systemResolutionTest, systemLatencyTest (run 'systemTest'), engineLatencyTest ('simulationTest'), vehicleLatencyTest ('vehicleTest'), oscillationTest et vehicleFrequencyTest ('vehicleOscillationTest'). startTests reçoit des runId, pas des id de test.
- La pause de simulation précédente est mémorisée (simTimeAuthority.getPause) et restaurée à la fin ; les tests déclenchent simTimeAuthority.pause(false).
- Message affiché si le véhicule disparaît : 'Vehicle lost while the test was running.'.
- M.updateUI et onVehicleSpawned/onVehicleSwitched sont la même fonction (updateUI).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_input_tests.onInputTestStats(stats)` | Hook appelé (depuis le véhicule) avec les statistiques d'un test : enregistre message et stats sur la ligne du test et rafraîchit l'UI. *(interne)* *(hook)* | 78 |
| `core_input_tests.onInputTestStatus(testId)` | Hook appelé quand un run se termine : si c'est le run en cours, passe au suivant de la file. *(interne)* *(hook)* | 85 |
| `core_input_tests.onVehicleDestroyed()` | Hook : si le véhicule joueur a disparu pendant un test, termine les tests avec un message d'erreur ; sinon rafraîchit l'UI. *(interne)* *(hook)* | 90 |
| `core_input_tests.onVehicleSpawned()` | Hook : alias de updateUI. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `core_input_tests.onVehicleSwitched()` | Hook : alias de updateUI. (assignée dynamiquement) *(interne)* *(hook)* | dyn |
| `core_input_tests.startTests(runIds)` | Démarre une file de tests. Supprime les doublons, efface messages et stats des tests concernés, dépause la simulation puis lance le premier run sur le véhicule joueur (extensions.load('inputTests') ; inputTests.start(runId)). | 58 |
| `core_input_tests.updateUI()` | Met à jour state.hasVehicle (véhicule joueur 0 présent) et envoie l'état complet à l'UI via guihooks InputTestStateChanged. | 33 |

### Détail des paramètres

#### `core_input_tests.onInputTestStats(stats)`

Hook appelé (depuis le véhicule) avec les statistiques d'un test : enregistre message et stats sur la ligne du test et rafraîchit l'UI.

- `stats` (*table*) : {testId, message?, sampleCount, …}.

#### `core_input_tests.onInputTestStatus(testId)`

Hook appelé quand un run se termine : si c'est le run en cours, passe au suivant de la file.

- `testId` (*string*) : runId du run terminé.

#### `core_input_tests.startTests(runIds)`

Démarre une file de tests. Supprime les doublons, efface messages et stats des tests concernés, dépause la simulation puis lance le premier run sur le véhicule joueur (extensions.load('inputTests') ; inputTests.start(runId)).

- `runIds` (*string[]*) : Liste de runId : 'systemTest', 'simulationTest', 'vehicleTest', 'vehicleOscillationTest'. Liste vide : ne fait que rafraîchir l'UI.

**Évènements UI (guihooks.trigger) :** `InputTestStateChanged`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/input/tests.lua`.*

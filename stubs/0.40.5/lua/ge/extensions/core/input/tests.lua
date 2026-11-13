---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/tests.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_input_tests` : orchestre les tests de latence/fréquence des entrées (système, moteur, véhicule, oscillation) affichés dans l'UI. Elle met la simulation en marche (dépause), lance côté véhicule l'extension `inputTests` pour chaque test d'une file, reçoit les statistiques et pousse l'état à l'UI par `InputTestStateChanged`. Surtout destinée à l'interface de diagnostic, peu utile à un moddeur.
--- Accès : extension `core_input_tests` : `extensions.load("core_input_tests")`, puis la globale `core_input_tests`
---@class core_input_tests
core_input_tests = {}

--- Hook appelé (depuis le véhicule) avec les statistiques d'un test : enregistre message et stats sur la ligne du test et rafraîchit l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/tests.lua:78
---@param stats table {testId, message?, sampleCount, …}.
function core_input_tests.onInputTestStats(stats) end

--- Hook appelé quand un run se termine : si c'est le run en cours, passe au suivant de la file.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/tests.lua:85
---@param testId string runId du run terminé.
function core_input_tests.onInputTestStatus(testId) end

--- Hook : si le véhicule joueur a disparu pendant un test, termine les tests avec un message d'erreur ; sinon rafraîchit l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/tests.lua:90
function core_input_tests.onVehicleDestroyed() end

--- Hook : alias de updateUI. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/tests.lua:dyn
function core_input_tests.onVehicleSpawned() end

--- Hook : alias de updateUI. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/input/tests.lua:dyn
function core_input_tests.onVehicleSwitched() end

--- Démarre une file de tests. Supprime les doublons, efface messages et stats des tests concernés, dépause la simulation puis lance le premier run sur le véhicule joueur (extensions.load('inputTests') ; inputTests.start(runId)).
---Source : lua/ge/extensions/core/input/tests.lua:58
---@param runIds string[] Liste de runId : 'systemTest', 'simulationTest', 'vehicleTest', 'vehicleOscillationTest'. Liste vide : ne fait que rafraîchir l'UI.
function core_input_tests.startTests(runIds) end

--- Met à jour state.hasVehicle (véhicule joueur 0 présent) et envoie l'état complet à l'UI via guihooks InputTestStateChanged.
---Source : lua/ge/extensions/core/input/tests.lua:33
function core_input_tests.updateUI() end


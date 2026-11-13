---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/escMeasurement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil interne de mesure/calibration automatique de l'ESC (contrôleur drivingDynamics/CMU), piloté depuis le GE par util_calibrateESC. Une coroutine de travail lance un test de rigidité de dérive (skew stiffness) en balayant vitesses (30 à 150 km/h, pas de 2 m/s) et angles de braquage (0,5° à 20°), puis écrit le résultat dans vehicles/<modèle>/drivingDynamics/<config>.stat.json. Un second test (STM, mesures de lacet à 200 km/h) existe mais est désactivé dans performTests.
--- Accès : extension `escMeasurement` : `extensions.load (VM véhicule)("escMeasurement")`, puis la globale `escMeasurement`
---@class escMeasurement
escMeasurement = {}

--- Hook d'initialisation : remet état, compteurs, mesures et vitesse physique à zéro (état Idling).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/escMeasurement.lua:442
function escMeasurement.onInit() end

--- Même fonction que onInit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/escMeasurement.lua:442
function escMeasurement.onReset() end

--- Lance la séquence complète de calibration dans une coroutine et mémorise modèle/config pour le nom du fichier de sortie.
---Source : lua/vehicle/extensions/escMeasurement.lua:507
---@param vehicleName string Nom du modèle (dossier vehicles/).
---@param configName string Nom de la configuration.
function escMeasurement.performTests(vehicleName, configName) end

--- Démarre le test de rigidité de dérive : récupère le CMU, enregistre le callback de pas fixe, désactive les systèmes ESC pour la calibration et passe en Initialization.
---Source : lua/vehicle/extensions/escMeasurement.lua:457
function escMeasurement.startSkewStiffnessTest() end

--- Arrête le test : coupe le régulateur interne, remet la vitesse physique normale, état Finished.
---Source : lua/vehicle/extensions/escMeasurement.lua:499
function escMeasurement.stopSkewStiffnessTest() end

--- Callback appelé par le CMU à pas de physique fixe : exécute la logique du test de rigidité de dérive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/escMeasurement.lua:390
---@param dt number Pas de temps en secondes.
function escMeasurement.updateFixedStepCallback(dt) end

--- Appelé chaque frame : reprend la coroutine de travail, envoie le heartbeat au GE et déclenche le killswitch quand elle est terminée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/escMeasurement.lua:115
---@param dt number Pas de temps en secondes (non utilisé).
function escMeasurement.updateGFX(dt) end

--- Callback GFX du CMU ; vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/escMeasurement.lua:394
---@param dt number Pas de temps en secondes.
function escMeasurement.updateGFXCallback(dt) end


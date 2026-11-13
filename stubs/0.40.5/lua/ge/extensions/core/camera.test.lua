---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/camera.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires du système de caméras, pour le framework de tests du jeu. À lancer depuis la console Lua GE : extensions.testFramework_TestManager:runTestFiles('camera'). Chaque fonction testXxx reçoit un contexte ctx (assert, assertEqual). Elle vérifie notamment l'anneau de groupes de caméras, l'appartenance des caméras libres au groupe 'world', la caméra Drone Chase, la caméra conducteur 'occupant' et la présence de l'API de configuration des caméras libres. Utile comme exemple d'usage de core_camera.
--- Accès : extension `core_camera.test` : `extensions.load("core_camera.test")`, puis la globale `core_camera.test`
---@class core_camera.test
core_camera.test = {}

--- Teste core_camera.nextCameraGroup : caméras de jeu vers caméras libres vers caméras de jeu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.test.lua:11
---@param ctx table Contexte de test (assert, assertEqual)
function core_camera.test.testCameraGroupRing(ctx) end

--- Vérifie le mode core/cameraModes/droneChase : non global, non caché, désactivé par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.test.lua:25
---@param ctx table Contexte de test
function core_camera.test.testDroneIsRegularCamera(ctx) end

--- Vérifie que core_camera expose getFreeCameraConfigurationReadOnly, changeFreeCameraOrder, toggleFreeCameraEnabledById et setCameraByNameFromOptions.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.test.lua:43
---@param ctx table Contexte de test
function core_camera.test.testFreeCameraConfigurationApi(ctx) end

--- Vérifie que les caméras free, smoothFree et steadycam appartiennent au groupe 'world'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.test.lua:18
---@param ctx table Contexte de test
function core_camera.test.testFreeCameraModes(ctx) end

--- Vérifie la conversion d'une ancienne caméra 'driver' en mode occupant (noeud 5, côté 'right', épaule droite à 0.6 m).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/camera.test.lua:32
---@param ctx table Contexte de test
function core_camera.test.testLegacyDriverIsOccupant(ctx) end


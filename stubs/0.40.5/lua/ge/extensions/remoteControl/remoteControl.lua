---@meta
-- tim19Atlas stub generated from lua/ge/extensions/remoteControl/remoteControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exemple/prototype de télécommande HTTP : au chargement, démarre un petit serveur HTTP (utils/simpleHttpServer) sur 0.0.0.0:8081 qui sert les fichiers de /lua/ge/extensions/remoteControl/ et quelques routes d'API, et enregistre un périphérique d'entrée virtuel « httpcontrollerv1 » (1 axe, 2 boutons déclarés) auprès du gestionnaire d'entrées virtuelles. Il sert de base pour piloter le jeu depuis un téléphone ou un navigateur.
--- Accès : extension `remoteControl_remoteControl` : `extensions.load("remoteControl_remoteControl")`, puis la globale `remoteControl_remoteControl`
---@class remoteControl_remoteControl
---@field _unittests table Table de tests unitaires (testExampleSuccess, testExampleFailure_shouldFail) pour le lanceur de tests du jeu.
---@field onFirstUpdate nil Référence à une variable locale non définie : vaut nil.
remoteControl_remoteControl = {}

--- Hook appelé au chargement de l'extension : démarre le serveur HTTP et déclare les routes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/remoteControl/remoteControl.lua:17
function remoteControl_remoteControl.onExtensionLoaded() end

--- Hook appelé au déchargement : désenregistre le périphérique virtuel (le serveur HTTP n'est pas arrêté explicitement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/remoteControl/remoteControl.lua:62
function remoteControl_remoteControl.onExtensionUnloaded() end

--- Hook appelé à chaque image : traite les requêtes HTTP et émet les évènements du périphérique virtuel (l'enregistre à la première image).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/remoteControl/remoteControl.lua:46
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function remoteControl_remoteControl.onUpdate(dtReal, dtSim, dtRaw) end

--- Tests d'exemple exposés par _unittests ; les fonctions doivent commencer par « test ».
---@class remoteControl_remoteControl_tests
local remoteControl_remoteControl_tests = {}

--- Test d'exemple qui échoue volontairement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/remoteControl/remoteControl.lua:83
---@param context table Contexte de test.
function remoteControl_remoteControl_tests.testExampleFailure_shouldFail(context) end

--- Test d'exemple qui réussit (42 == 42).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/remoteControl/remoteControl.lua:72
---@param context table Contexte de test avec success() et fail().
function remoteControl_remoteControl_tests.testExampleSuccess(context) end


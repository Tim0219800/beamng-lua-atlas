---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de telemetry/performanceSpatialGameplayExit. Chaque test reçoit un contexte `ctx` (assert, assertEqual) du lanceur de tests du jeu et injecte de faux modules de gameplay via le paramètre `source` (niveau « italy », véhicule en (1.24, -2.26, 3.01), caméra en (10.04, 20.06, 30.01)). Ce n'est pas une extension à charger.
--- Accès : extension `telemetry_performanceSpatialGameplayExit.test` : `extensions.load("telemetry_performanceSpatialGameplayExit.test")`, puis la globale `telemetry_performanceSpatialGameplayExit.test`
---@class telemetry_performanceSpatialGameplayExit.test
telemetry_performanceSpatialGameplayExit.test = {}

--- Un drag, drift ou crawl actif prime sur une livraison de carrière active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:244
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testActiveAttemptTakesPrecedenceOverCareerDelivery(ctx) end

--- Vérifie que chaque famille (scénario, livraison libre, livraison de carrière, essai, certification, drag, drift, crawl) est reconnue avec le bon activityType et activityId.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:58
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testAttemptBasedActivityFamilies(ctx) end

--- capture prend la position du véhicule (arrondie à 0,1), sinon celle de la caméra.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:146
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testCaptureUsesVehicleThenCamera(ctx) end

--- capture convertit un id numérique en chaîne, omet un id invalide sans perdre l'évènement, et renvoie nil pour un exitKind/activityType inconnu ou un niveau non suivi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:165
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testCaptureValidatesContextAndLevel(ctx) end

--- Un crawl terminé n'est plus actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:293
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testCompletedCrawlIsNotActive(ctx) end

--- Un drag terminé (isCompleted) n'est plus actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:211
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testCompletedDragIsNotActive(ctx) end

--- Un scénario à l'état post n'est pas une activité active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:188
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testCompletedScenarioIsNotActive(ctx) end

--- Un défi de drift en phase de conclusion n'est plus actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:200
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testConcludingDriftIsNotActive(ctx) end

--- La clé de drag est calculée avec les données de drag de plus haut niveau, et le préfixe « : » est complété par le niveau courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:224
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testDragUsesTopLevelDataAndCurrentLevel(ctx) end

--- Une mission au premier plan est prioritaire sur un drag en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.test.lua:39
---@param ctx table Contexte de test.
function telemetry_performanceSpatialGameplayExit.test.testMissionTakesPrecedence(ctx) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de telemetry/performanceSpatialDetector (runTestFiles("performanceSpatialDetector")).
--- Accès : extension `telemetry_performanceSpatialDetector.test` : `extensions.load("telemetry_performanceSpatialDetector.test")`, puis la globale `telemetry_performanceSpatialDetector.test`
---@class telemetry_performanceSpatialDetector.test
telemetry_performanceSpatialDetector.test = {}

--- Vérifie qu'une chute sous le seuil de FPS absolu produit un événement au retour à la normale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:27
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testAbsoluteDip(ctx) end

--- Vérifie que le délai de repos supprime un nouvel épisode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:132
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testCooldownSuppressesDip(ctx) end

--- Vérifie qu'une chute plus courte que dipMinDurationMs ne produit rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:51
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testDipMustBeSustained(ctx) end

--- Vérifie qu'avec absoluteAllowed = false, un FPS plafonné ne déclenche pas de chute absolue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:99
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testIntentionalCapDisablesAbsoluteTrigger(ctx) end

--- Vérifie qu'un épisode dépassant maxEpisodeMs est découpé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:121
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testLongDipIsSegmented(ctx) end

--- Vérifie que finish() clôt un épisode ouvert et soutenu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:109
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testOpenSustainedDipCanBeFinished(ctx) end

--- Vérifie que la pire frame est capturée une fois puis que l'événement est émis à la reprise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:75
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testRecoveryEmitsWorstFrameOnce(ctx) end

--- Vérifie qu'un épisode sans durée observée (un seul échantillon) n'émet pas d'événement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:65
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testRecoveryWithoutObservedDurationDoesNotEmit(ctx) end

--- Vérifie qu'un temps de frame supérieur à baseline * ratio produit un événement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:39
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testRelativeDip(ctx) end

--- Vérifie que maxDipEventsPerSession plafonne le nombre d'événements.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.test.lua:153
---@param ctx table Contexte du framework de test.
function telemetry_performanceSpatialDetector.test.testSessionCapSuppressesDip(ctx) end


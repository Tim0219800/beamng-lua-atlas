---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareAudio.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de telemetry/hardwareAudio (runTestFiles("hardwareAudio")).
--- Accès : extension `telemetry_hardwareAudio.test` : `extensions.load("telemetry_hardwareAudio.test")`, puis la globale `telemetry_hardwareAudio.test`
---@class telemetry_hardwareAudio.test
telemetry_hardwareAudio.test = {}

--- Vérifie la classification casque, écran/TV, haut-parleurs et périphérique virtuel à partir de noms types.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareAudio.test.lua:25
---@param ctx table Contexte du framework de test.
function telemetry_hardwareAudio.test.testClassifiesKnownOutputTypes(ctx) end

--- Vérifie que fromDeviceInfo(nil) renvoie nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareAudio.test.lua:50
---@param ctx table Contexte du framework de test.
function telemetry_hardwareAudio.test.testMissingDeviceIsNotReported(ctx) end

--- Vérifie que le nom brut et les champs de diagnostic n'entrent pas dans la télémétrie, alors que sampleRateHz, speakerMode et channels sont conservés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareAudio.test.lua:36
---@param ctx table Contexte du framework de test.
function telemetry_hardwareAudio.test.testRawDeviceNameIsRemoved(ctx) end

--- Vérifie qu'un nom sans mot-clé (ex. 'WH-1000XM5') donne la catégorie 'unknown'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareAudio.test.lua:32
---@param ctx table Contexte du framework de test.
function telemetry_hardwareAudio.test.testUnknownNamesStayUnknown(ctx) end


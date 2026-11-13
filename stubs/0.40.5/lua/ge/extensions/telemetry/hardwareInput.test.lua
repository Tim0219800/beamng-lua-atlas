---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareInput.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de telemetry/hardwareInput (runTestFiles("hardwareInput")).
--- Accès : extension `telemetry_hardwareInput.test` : `extensions.load("telemetry_hardwareInput.test")`, puis la globale `telemetry_hardwareInput.test`
---@class telemetry_hardwareInput.test
telemetry_hardwareInput.test = {}

--- Vérifie que le nom anglais est lu dans /settings/inputmaps/<vidpid>.json quand le fichier est officiel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareInput.test.lua:69
---@param ctx table Contexte du framework de test.
function telemetry_hardwareInput.test.testEnglishNameComesOnlyFromOfficialInputMap(ctx) end

--- Vérifie que tous les champs d'un volant (noms, vidpid, productId/vendorId, GUID, FFB, révisions, controls, controlCounts) sont repris.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareInput.test.lua:34
---@param ctx table Contexte du framework de test.
function telemetry_hardwareInput.test.testMapsEveryAvailableWheelField(ctx) end

--- Vérifie qu'un périphérique qui n'est pas un volant ne garde que type, productName, vidpid et forceFeedback.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareInput.test.lua:100
---@param ctx table Contexte du framework de test.
function telemetry_hardwareInput.test.testNonWheelsKeepOnlyCommonIdentity(ctx) end

--- Vérifie qu'un identifiant symbolique (ex. 'XIDevice') n'est pas mis en majuscules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareInput.test.lua:117
---@param ctx table Contexte du framework de test.
function telemetry_hardwareInput.test.testSymbolicDeviceIdentityKeepsItsCase(ctx) end

--- Vérifie que sans période d'échantillonnage FFB valide, ni la période ni maxRawFfbUpdateRateHz ne sont renseignées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareInput.test.lua:61
---@param ctx table Contexte du framework de test.
function telemetry_hardwareInput.test.testUnknownDefaultUpdateRateStaysAbsent(ctx) end

--- Vérifie qu'une table d'entrée non officielle ne peut pas fournir de nom.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareInput.test.lua:87
---@param ctx table Contexte du framework de test.
function telemetry_hardwareInput.test.testUnofficialInputMapCannotSupplyTelemetryName(ctx) end


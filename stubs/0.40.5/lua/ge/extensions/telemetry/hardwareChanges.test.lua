---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareChanges.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de telemetry/hardwareChanges (runTestFiles("hardwareChanges")).
--- Accès : extension `telemetry_hardwareChanges.test` : `extensions.load("telemetry_hardwareChanges.test")`, puis la globale `telemetry_hardwareChanges.test`
---@class telemetry_hardwareChanges.test
telemetry_hardwareChanges.test = {}

--- Vérifie qu'un périphérique ajouté et un retiré donnent deux événements, connexion d'abord.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareChanges.test.lua:30
---@param ctx table Contexte du framework de test.
function telemetry_hardwareChanges.test.testConnectionChangesContainAddedAndRemovedDevices(ctx) end

--- Vérifie que l'instantané ne garde que wheel, joystick, gamepad et xinput (4 entrées sur 8 périphériques).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareChanges.test.lua:11
---@param ctx table Contexte du framework de test.
function telemetry_hardwareChanges.test.testControllerSnapshotFiltersNonControllerDevices(ctx) end

--- Vérifie que seules les transitions Window/Fullscreen directes sont suivies.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareChanges.test.lua:64
---@param ctx table Contexte du framework de test.
function telemetry_hardwareChanges.test.testOnlyDirectWindowFullscreenTransitionsAreTracked(ctx) end

--- Vérifie qu'un volant remplacé dans le même emplacement signale la connexion du nouveau et la déconnexion de l'ancien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/hardwareChanges.test.lua:47
---@param ctx table Contexte du framework de test.
function telemetry_hardwareChanges.test.testReplacedDeviceSlotReportsBothTransitions(ctx) end


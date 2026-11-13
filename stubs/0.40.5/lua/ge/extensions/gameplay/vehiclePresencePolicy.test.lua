---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de gameplay/vehiclePresencePolicy. Chaque fonction testXxx reçoit un contexte de test `ctx` (avec assert et assertEqual) fourni par le lanceur de tests du jeu ; ce n'est pas une extension de gameplay à charger.
--- Accès : extension `gameplay_vehiclePresencePolicy.test` : `extensions.load("gameplay_vehiclePresencePolicy.test")`, puis la globale `gameplay_vehiclePresencePolicy.test`
---@class gameplay_vehiclePresencePolicy.test
gameplay_vehiclePresencePolicy.test = {}

--- Vérifie allowsActionMap : driver seulement sur « driving », passenger jamais, unrestricted toujours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua:25
---@param ctx table Contexte de test.
function gameplay_vehiclePresencePolicy.test.testActionMapPermissions(ctx) end

--- Vérifie defaultUnseatedMode : unrestricted seulement en freeroam sans multi-siège, passenger dans les autres cas (multiplayer, career, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua:17
---@param ctx table Contexte de test.
function gameplay_vehiclePresencePolicy.test.testDefaultUnseatedMode(ctx) end

--- Vérifie isValidMode (driver, passenger, unrestricted valides ; observer invalide) et normalizeMode (repli, valeur par défaut « passenger »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/vehiclePresencePolicy.test.lua:7
---@param ctx table Contexte de test avec assert et assertEqual.
function gameplay_vehiclePresencePolicy.test.testModeValidationAndNormalization(ctx) end


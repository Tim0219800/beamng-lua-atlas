---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/vehiclePresencePolicy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Règles pures (sans état) décrivant la « présence » d'un joueur par rapport à un véhicule : driver (conducteur), passenger (passager) ou unrestricted (sans restriction). Dit si une carte d'actions d'entrée est autorisée pour un mode donné et quel mode non assis utiliser par défaut. Pas de hook ni d'état : on l'utilise comme bibliothèque.
--- Accès : extension `gameplay_vehiclePresencePolicy` : `extensions.load("gameplay_vehiclePresencePolicy")`, puis la globale `gameplay_vehiclePresencePolicy`
---@class gameplay_vehiclePresencePolicy
gameplay_vehiclePresencePolicy = {}

--- Indique si une carte d'actions est autorisée pour le mode.
---Source : lua/ge/extensions/gameplay/vehiclePresencePolicy.lua:28
---@param mode string Mode de présence.
---@param mapKind string Type de carte d'actions (par ex. « driving », « slot »).
---@return boolean
function gameplay_vehiclePresencePolicy.allowsActionMap(mode, mapKind) end

--- Mode par défaut d'un joueur non assis : « unrestricted » en freeroam (ou sans mode) quand le multi-siège n'est pas actif, « passenger » sinon.
---Source : lua/ge/extensions/gameplay/vehiclePresencePolicy.lua:21
---@param context table|nil {mode = "freeroam"|"multiplayer"|"career"|..., isMultiseatActive = boolean}
---@return string  "unrestricted" ou "passenger"
function gameplay_vehiclePresencePolicy.defaultUnseatedMode(context) end

--- Teste si une valeur est un mode connu.
---Source : lua/ge/extensions/gameplay/vehiclePresencePolicy.lua:13
---@param mode any Valeur à tester.
---@return boolean  true pour driver, passenger ou unrestricted.
function gameplay_vehiclePresencePolicy.isValidMode(mode) end

--- Renvoie le mode s'il est valide, sinon le mode de repli s'il est valide, sinon « passenger ».
---Source : lua/ge/extensions/gameplay/vehiclePresencePolicy.lua:17
---@param mode any Mode demandé.
---@param fallback any Mode de repli facultatif.
---@return string  Un mode valide.
function gameplay_vehiclePresencePolicy.normalizeMode(mode, fallback) end


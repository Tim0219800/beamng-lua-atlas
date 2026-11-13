---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/vehicleSwitching.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_input_vehicleSwitching` : implémente le passage au véhicule suivant/précédent (touches de changement de véhicule). Il peut suivre un ordre personnalisé (liste d'ids définie par setVehicleOrder) ou parcourir tous les véhicules actifs utilisables, en ignorant le 'unicycle', les véhicules playerUsable == false et ceux que gameplay_seatOccupants refuse. En multijoueur, la demande est déléguée à multiplayer_vehicleSync.
--- Accès : extension `core_input_vehicleSwitching` : `extensions.load("core_input_vehicleSwitching")`, puis la globale `core_input_vehicleSwitching`
---@class core_input_vehicleSwitching
core_input_vehicleSwitching = {}

--- Effectue réellement le changement : cherche la cible (ordre personnalisé puis ordre par défaut), appelle be:enterVehicle et émet les hooks.
---Source : lua/ge/extensions/core/input/vehicleSwitching.lua:50
---@param player integer|nil Indice du joueur, défaut 0 ; -1 = ignoré.
---@param dir integer +1 suivant, -1 précédent.
function core_input_vehicleSwitching.applySwitchCycleVehicle(player, dir) end

--- Définit l'ordre personnalisé de parcours des véhicules (liste d'ids). nil pour revenir à l'ordre par défaut.
---Source : lua/ge/extensions/core/input/vehicleSwitching.lua:8
---@param order integer[]|nil Ids de véhicules.
function core_input_vehicleSwitching.setVehicleOrder(order) end

--- Point d'entrée : change de véhicule pour le joueur. En multijoueur (multiplayer_vehicleSync présent), envoie requestSwitchCycleVehicle ; sinon appelle applySwitchCycleVehicle.
---Source : lua/ge/extensions/core/input/vehicleSwitching.lua:89
---@param player integer|nil Indice du joueur, défaut 0 ; -1 = ignoré.
---@param dir integer +1 suivant, -1 précédent.
function core_input_vehicleSwitching.switchCycleVehicle(player, dir) end


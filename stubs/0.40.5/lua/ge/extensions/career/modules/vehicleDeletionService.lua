---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/vehicleDeletionService.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Service de suppression différée de véhicules en carrière : un véhicule « marqué » est supprimé (avec appel d'un callback) quand il est à plus de 100 m de la caméra et derrière elle, pour qu'il disparaisse sans que le joueur le voie. Les véhicules d'inventaire sont retirés via career_modules_inventory.removeVehicleObject, les autres via obj:delete(). Le hook onUpdate n'est branché que tant qu'au moins un véhicule est marqué.
--- Accès : extension `career_modules_vehicleDeletionService` : `extensions.load("career_modules_vehicleDeletionService")`, puis la globale `career_modules_vehicleDeletionService`
---@class career_modules_vehicleDeletionService
---@field dependencies string[] {'career_career'}.
career_modules_vehicleDeletionService = {}

--- Retire le marquage d'un véhicule (et débranche onUpdate s'il ne reste rien).
---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:78
---@param vehId integer Id du véhicule.
function career_modules_vehicleDeletionService.clearFlags(vehId) end

--- Supprime immédiatement tous les véhicules marqués.
---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:65
function career_modules_vehicleDeletionService.deleteFlaggedVehicles() end

--- Marque un véhicule pour suppression différée et active la boucle onUpdate.
---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:71
---@param vehId integer Id du véhicule.
---@param callback function|nil Appelé juste avant la suppression (défaut nop).
function career_modules_vehicleDeletionService.flagForDeletion(vehId, callback) end

--- Hook émis à chaque changement d'état de mission : à « started » en carrière, supprime les véhicules marqués.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:88
---@param state string État de la mission.
---@param mission table|nil Mission concernée.
function career_modules_vehicleDeletionService.onAnyMissionChanged(state, mission) end

--- Hook de démarrage de niveau : vide la liste des véhicules marqués.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:83
function career_modules_vehicleDeletionService.onClientStartMission() end

--- Hook de chargement : retourne false si la carrière n'est pas active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:12
---@return boolean|nil  false pour refuser le chargement.
function career_modules_vehicleDeletionService.onExtensionLoaded() end

--- Hook émis quand un véhicule est détruit : retire son marquage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/vehicleDeletionService.lua:97
---@param vehId integer Id du véhicule.
function career_modules_vehicleDeletionService.onVehicleDestroyed(vehId) end


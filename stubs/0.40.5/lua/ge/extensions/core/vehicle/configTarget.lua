---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/configTarget.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_configTarget` : mémorise quel véhicule (et quel joueur) est la cible du menu de configuration du véhicule, pour que partmgmt, colors, mirror, thumbnail, etc. n'agissent pas toujours sur le véhicule du joueur 0. Sert aussi de résolveur : resolveVehicleId prend un id explicite, sinon la cible, sinon le véhicule du joueur 0. Émet onVehicleConfigTargetChanged à chaque changement.
--- Accès : extension `core_vehicle_configTarget` : `extensions.load("core_vehicle_configTarget")`, puis la globale `core_vehicle_configTarget`
---@class core_vehicle_configTarget
core_vehicle_configTarget = {}

--- Définit le véhicule cible. Refuse un id invalide ou un véhicule inexistant. Émet onVehicleConfigTargetChanged(courant, précédent, 'begin').
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:25
---@param vehId integer id du véhicule (>= 0)
---@param context table|nil {playerId?, returnRoute?}
---@return boolean  true si la cible a été définie
function core_vehicle_configTarget.begin(vehId, context) end

--- Efface la cible et émet onVehicleConfigTargetChanged.
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:42
---@param reason string|nil raison transmise au hook, défaut 'clear'
---@return boolean  false s'il n'y avait pas de cible
function core_vehicle_configTarget.clear(reason) end

--- Copie de la cible courante.
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:55
---@return table|nil  {vehId, playerId, returnRoute} ou nil
function core_vehicle_configTarget.get() end

--- Route d'interface où revenir après la configuration.
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:67
---@return string  'pause' ou 'pause.vehicle' (défaut)
function core_vehicle_configTarget.getReturnRoute() end

--- Index du joueur qui configure.
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:63
---@return integer|nil  playerId ou nil
function core_vehicle_configTarget.getTargetPlayerId() end

--- Id du véhicule cible.
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:59
---@return integer|nil  vehId ou nil
function core_vehicle_configTarget.getTargetVehicleId() end

--- Indique si une cible est définie.
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:51
---@return boolean  true si active
function core_vehicle_configTarget.isActive() end

--- Hook : fin du niveau ; efface la cible ('missionEnded').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:118
function core_vehicle_configTarget.onClientEndMission() end

--- Hook : restaure la cible si son véhicule existe encore.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:132
---@param data table données de onSerialize
function core_vehicle_configTarget.onDeserialized(data) end

--- Hook : extension déchargée ; efface la cible ('extensionUnloaded').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:122
function core_vehicle_configTarget.onExtensionUnloaded() end

--- Hook : sauvegarde la cible avant rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:126
---@return table  {target}
function core_vehicle_configTarget.onSerialize() end

--- Hook par frame : efface la cible si le véhicule détruit n'existe toujours pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:109
function core_vehicle_configTarget.onUpdate() end

--- Hook : si le véhicule cible est détruit, note qu'il faudra effacer la cible à la prochaine frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:97
---@param vehId integer véhicule
function core_vehicle_configTarget.onVehicleDestroyed(vehId) end

--- Hook : annule l'effacement prévu si le même id est recréé (remplacement de véhicule).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:103
---@param vehId integer véhicule
function core_vehicle_configTarget.onVehicleSpawned(vehId) end

--- Comme resolveVehicleId mais renvoie l'objet véhicule.
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:86
---@param explicitVehicleId integer|nil id imposé
---@return userdata|nil  objet véhicule
function core_vehicle_configTarget.resolveVehicle(explicitVehicleId) end

--- Comme resolveVehicleId mais renvoie les données de core_vehicle_manager.getVehicleData.
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:91
---@param explicitVehicleId integer|nil id imposé
---@return table|nil  données du véhicule (vdata, config, vehicleDirectory, ioCtx…)
function core_vehicle_configTarget.resolveVehicleData(explicitVehicleId) end

--- Détermine l'id du véhicule à utiliser : l'id explicite s'il est donné et valide, sinon la cible, sinon le véhicule du joueur 0. Renvoie nil si l'objet n'existe pas.
---Source : lua/ge/extensions/core/vehicle/configTarget.lua:71
---@param explicitVehicleId integer|nil id imposé par l'appelant (nil = automatique ; un id invalide donne nil, sans repli)
---@return integer|nil  id du véhicule
function core_vehicle_configTarget.resolveVehicleId(explicitVehicleId) end


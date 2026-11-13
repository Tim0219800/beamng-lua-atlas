---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/fuelUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outils pour sauvegarder et restaurer le carburant d'un véhicule de rallye (par exemple après un reset ou une réparation). createFuelSnapshot analyse les données energyStorage : avec un seul réservoir essence/diesel valide, il mémorise le niveau courant (mode 'remembered') ; sinon il prévoit un plein (mode 'full') avec la raison du repli. applyFuelSnapshot réapplique l'instantané via core_vehicleBridge.
--- Accès : extension `gameplay_rally_fuelUtils` : `extensions.load("gameplay_rally_fuelUtils")`, puis la globale `gameplay_rally_fuelUtils`
---@class gameplay_rally_fuelUtils
gameplay_rally_fuelUtils = {}

--- Applique l'instantané : en mode 'remembered' remet currentEnergy dans chaque réservoir ; sinon remplit chaque réservoir à maxEnergy (avec un avertissement dans le log si une raison est fournie). Utilise l'action véhicule setEnergyStorageEnergy. Ne fait rien sans véhicule, sans instantané ou sans réservoir.
---Source : lua/ge/extensions/gameplay/rally/fuelUtils.lua:112
---@param veh table Objet véhicule.
---@param snapshot table Instantané issu de createFuelSnapshot.
---@param logTag string|nil Tag de log.
---@param reason string|nil Contexte pour le message de log ('recovery' par défaut).
function gameplay_rally_fuelUtils.applyFuelSnapshot(veh, snapshot, logTag, reason) end

--- Construit un instantané de carburant à partir des données energyStorage d'un véhicule.
---Source : lua/ge/extensions/gameplay/rally/fuelUtils.lua:31
---@param energyStorageData table|nil Liste des stockages d'énergie (storageType, energyType, name, currentEnergy, maxEnergy).
---@return table  {mode, tanks, reason} ; reason explique pourquoi on retombe sur un plein.
function gameplay_rally_fuelUtils.createFuelSnapshot(energyStorageData) end

--- Demande asynchrone la valeur 'energyStorage' au véhicule (core_vehicleBridge.requestValue) puis appelle callback avec l'instantané. Sans véhicule, appelle callback immédiatement avec un instantané 'full' vide.
---Source : lua/ge/extensions/gameplay/rally/fuelUtils.lua:101
---@param veh table|nil Objet véhicule.
---@param callback function function(snapshot).
function gameplay_rally_fuelUtils.requestFuelSnapshot(veh, callback) end


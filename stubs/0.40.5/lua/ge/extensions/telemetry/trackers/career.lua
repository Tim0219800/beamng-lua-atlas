---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie du mode carrière : mesure la durée pendant laquelle une carrière est jouée (activité « careerActive » avec l'état de la sauvegarde à l'ouverture : argent, beamXP, bons, nombre de véhicules, nouvelle sauvegarde, tutoriel) et enregistre les véhicules achetés (vehicleAddedToInventory) et vendus (vehicleSold). Il passe par telemetry_core.startActivity/endActivity/addEvent.
--- Accès : extension `telemetry_trackers_career` : `extensions.load("telemetry_trackers_career")`, puis la globale `telemetry_trackers_career`
---@class telemetry_trackers_career
---@field dependencies string[] telemetry_core.
telemetry_trackers_career = {}

--- Hook appelé avant la vente d'un véhicule : enregistre modèle, nom et prix de vente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/career.lua:56
---@param data table Contient inventoryId et price.
function telemetry_trackers_career.onBeforeVehicleSell(data) end

--- Hook appelé quand la carrière devient active ou inactive : démarre ou termine l'activité careerActive (avec les attributs du joueur au démarrage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/career.lua:24
---@param active boolean true si la carrière démarre.
---@param newSave boolean true si c'est une nouvelle sauvegarde.
function telemetry_trackers_career.onCareerActive(active, newSave) end

--- Hook appelé au chargement : passe l'extension en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/career.lua:70
function telemetry_trackers_career.onExtensionLoaded() end

--- Hook appelé au déchargement : un rechargement Lua détruit les suiveurs sans onExit, donc l'activité carrière est fermée ici aussi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/career.lua:18
function telemetry_trackers_career.onExtensionUnloaded() end

--- Hook appelé à l'ajout d'un véhicule à l'inventaire : enregistre modèle, nom et prix d'achat.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/career.lua:42
---@param data table Contient vehicleInfo (model_key, Name) et purchaseData (prices).
function telemetry_trackers_career.onVehicleAddedToInventory(data) end


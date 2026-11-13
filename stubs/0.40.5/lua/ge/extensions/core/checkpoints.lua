---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/checkpoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mémorise, pour chaque véhicule d'un scénario de course, le dernier point de passage atteint (position, direction, vecteur haut, indices de waypoint). Sert à replacer au dernier checkpoint les véhicules pilotés par l'IA qui sont bloqués : toutes les 4 s, un véhicule non jouable qui a quitté son point de départ (> 1 m) et n'a pas bougé de plus de 4 cm depuis le dernier relevé est remis au dernier checkpoint. Actif seulement si le scénario est en état 'running' et que enableCheckpoints est vrai avec plus d'un élément dans lapConfig.
--- Accès : extension `core_checkpoints` : `extensions.load("core_checkpoints")`, puis la globale `core_checkpoints`
---@class core_checkpoints
---@field state table État interne : vehicleCheckpoints (table<integer, table>) et aiVehiclePath (table<integer, table>), remis à zéro au début/fin de niveau.
core_checkpoints = {}

--- Appelé en retour (aller-retour véhicule -> GE) après le replacement : réapplique le chemin IA sauvegardé et informe scenario_waypoints des indices de waypoint du checkpoint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:54
---@param vehicleId integer id du véhicule
---@param vehicleName string nom du véhicule (journal)
function core_checkpoints.completeReset(vehicleId, vehicleName) end

--- Hook : à la sortie du niveau, remet les données à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:266
---@param levelPath string chemin du niveau
function core_checkpoints.onClientEndMission(levelPath) end

--- Hook : avant le chargement d'un niveau, remet les données à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:261
---@param levelPath string chemin du niveau
function core_checkpoints.onClientPreStartMission(levelPath) end

--- Hook : restaure l'état sérialisé (noms de véhicules reconvertis en ids).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:217
---@param data table table renvoyée par onSerialize
function core_checkpoints.onDeserialized(data) end

--- Hook par image : détecte les véhicules IA immobiles (voir description du module) et les remet au dernier checkpoint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:168
---@param dt number secondes
function core_checkpoints.onPreRender(dt) end

--- Hook : un véhicule atteint un waypoint de course. Enregistre le checkpoint (position du waypoint ; direction = curRot du waypoint, sinon vecteur vitesse du véhicule) et marque raceOver au dernier waypoint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:109
---@param data table vehicleId, vehicleName, curPos, curRot (optionnel), waypointName, cur, next
function core_checkpoints.onRaceWaypointReached(data) end

--- Hook : reprise de campagne, restaure vehicleCheckpoints.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:285
---@param campaignInProgress any non utilisé
---@param data table données sauvegardées par onSaveCampaign
function core_checkpoints.onResumeCampaign(campaignInProgress, data) end

--- Hook : sauvegarde de campagne ; appelle saveCallback(M.__globalAlias__, {vehicleCheckpoints}).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:277
---@param saveCallback function fonction de sauvegarde de la campagne
function core_checkpoints.onSaveCampaign(saveCallback) end

--- Hook : remet à zéro les données puis initialise un checkpoint pour chaque véhicule du scénario.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:198
---@param scenario table scénario (utilise vehicleNameToId)
function core_checkpoints.onScenarioRestarted(scenario) end

--- Hook : renvoie vehicleCheckpoints et aiVehiclePath avec clés converties en noms de véhicules (rechargement des extensions).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:206
---@return table  données à sérialiser
function core_checkpoints.onSerialize() end

--- Hook : supprime le checkpoint du véhicule détruit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:244
---@param vid integer id du véhicule
function core_checkpoints.onVehicleDestroyed(vid) end

--- Hook : initialise le checkpoint d'un nouveau véhicule s'il n'en a pas.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/checkpoints.lua:224
---@param vehId integer id du véhicule
function core_checkpoints.onVehicleSpawned(vehId) end

--- Mémorise le chemin IA (argument de setAiPath) du véhicule désigné par son nom, pour le restaurer à la remise au checkpoint.
---Source : lua/ge/extensions/core/checkpoints.lua:87
---@param vehicleName string nom de l'objet véhicule dans scenetree
---@param arg table table passée à scenario/scenariohelper.setAiPath (champ waypoints = noms)
function core_checkpoints.saveAIPath(vehicleName, arg) end

--- Enregistre un point de reprise pour un véhicule et remet son chrono à 0. Sans cpData, utilise la position et la direction actuelles du véhicule ; le vecteur haut est toujours celui du véhicule. Ne fait rien (journal) si le véhicule n'existe pas.
---Source : lua/ge/extensions/core/checkpoints.lua:25
---@param vehicleId integer id du véhicule
---@param vehicleName string|nil nom du véhicule ; « unnamed_<id> » si nil
---@param cpData table|nil desiredPos, desiredDir (vec3), currentWpName, currentWpIndex, nextWpIndex
function core_checkpoints.saveCheckpoint(vehicleId, vehicleName, cpData) end


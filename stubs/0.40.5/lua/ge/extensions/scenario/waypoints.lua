---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/waypoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de waypoints d'un scénario de course : à partir de scenario.lapConfig (liste ordonnée de waypoints/triggers) et des branches (lapConfigBranches), construit un graphe de successeurs, affiche les marqueurs (raceMarker) et détecte chaque frame le passage des roues des véhicules du joueur ou pilotés par IA à travers le prochain waypoint. Émet les hooks de course (onRaceWaypointReached, onRaceWaypoint, onRaceLap, onRaceBranchChosen) et termine la course quand le dernier waypoint du dernier tour est franchi. Chargé par scenario_scenariosLoader avec scenario_scenarios.
--- Accès : extension `scenario_waypoints` : `extensions.load("scenario_waypoints")`, puis la globale `scenario_waypoints`
---@class scenario_waypoints
---@field addWaypointBranch nil Exporté mais vaut nil (variable locale non définie dans le fichier).
---@field dependencies table<integer, string> {'scenario_scenarios'}
---@field onUpdate nil Exporté mais vaut nil (variable locale non définie dans le fichier).
---@field state table État du système (voir notes) : vehicleWaypointsData, nextWpForVehicle, waypointBranches, currentWaypointChoice, currentBranch, waypointsConfigData, branchGraph, pathnodes.
scenario_waypoints = {}

--- Insère dans la liste de waypoints du véhicule les waypoints de la branche choisie, après le waypoint courant, puis émet onRaceBranchChosen({branchName, time, vehicleId, vehicleName}).
---Source : lua/ge/extensions/scenario/waypoints.lua:324
---@param branchName string nom de la branche (clé de lapConfigBranches)
---@param vehicleId integer id du véhicule
---@param dtOff number correction de temps (s)
function scenario_waypoints.activateWaypointBranch(branchName, vehicleId, dtOff) end

--- Ne fait rien (retourne immédiatement).
---Source : lua/ge/extensions/scenario/waypoints.lua:309
---@param branchName string nom de la branche
function scenario_waypoints.deactivateWaypointBranch(branchName) end

--- Renvoie une copie profonde des données de waypoint d'un véhicule (cur, next, lap, waypointConfig, nextWps, historicalLapConfig, coins de roues…).
---Source : lua/ge/extensions/scenario/waypoints.lua:680
---@param vehicleId integer id du véhicule
---@return table|nil  données ou nil
function scenario_waypoints.getVehicleWaypointData(vehicleId) end

--- Appelée par scenario_scenarios en 'pre-running' : réinitialise l'état, construit les branches et le graphe des successeurs, crée un pathnode par waypoint, configure les marqueurs (raceMarker.setupMarkers) et initialise les données de chaque véhicule du scénario. Ne fait rien si lapConfig est vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypoints.lua:518
function scenario_waypoints.initialise() end

--- Censée dire si un waypoint est le dernier ; renvoie toujours false (corps commenté dans le code).
---Source : lua/ge/extensions/scenario/waypoints.lua:665
---@param vehicleId integer id du véhicule
---@param waypointName string nom du waypoint
---@return boolean  toujours false
function scenario_waypoints.isFinalWaypoint(vehicleId, waypointName) end

--- Hook de fin de niveau : efface l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypoints.lua:724
function scenario_waypoints.onClientEndMission() end

--- Hook de désérialisation : restaure l'état en reconvertissant les noms de véhicules en ids.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypoints.lua:697
---@param data table données de onSerialize
function scenario_waypoints.onDeserialized(data) end

--- Hook chaque frame (luaPreRender) : met à jour les coins des roues de chaque véhicule suivi et détecte le franchissement du prochain waypoint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypoints.lua:606
---@param dtReal number temps réel (s)
---@param dtSim number temps simulé (s)
---@param dtRaw number temps brut (s)
function scenario_waypoints.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook émis par scenario_scenarios à chaque changement d'état ; efface l'état du système quand le scénario est nil (arrêt).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypoints.lua:267
---@param scenario table|nil scénario ou nil
function scenario_waypoints.onScenarioChange(scenario) end

--- Hook émis au redémarrage d'un scénario : restaure lapConfig, vide l'état, reconstruit branches et graphe de successeurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypoints.lua:495
---@param scenario table scénario
function scenario_waypoints.onScenarioRestarted(scenario) end

--- Appelée en interne quand un véhicule traverse son waypoint cible : traite le waypoint (marqueurs, suivant), émet onRaceWaypointReached(data) (et onRaceWaypoint pour les véhicules playerUsable, avec un son), gère la fin de course (scenario_scenarios.endRace) et les tours (onRaceLap). Marquée « private » dans le code.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypoints.lua:205
---@param vid integer id du véhicule
---@param wpData table noeud du scénario {pos, radius, rot}
---@param dtOff number correction de temps (s)
function scenario_waypoints.onScenarioVehicleTrigger(vid, wpData, dtOff) end

--- Hook de sérialisation avant rechargement Lua : renvoie les données par nom de véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypoints.lua:685
---@return table  données sérialisées
function scenario_waypoints.onSerialize() end

--- Hook émis par scenario_scenarios : initialise le suivi des waypoints d'un véhicule dont l'IA vient d'être activée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/waypoints.lua:706
---@param data table {vehicleId, vehicleName, aiControlled}
function scenario_waypoints.onVehicleAIStateChanged(data) end

--- Réinitialise les données de waypoint d'un véhicule remis en place : sans curWpIndex (ou données absentes) les recrée, sinon positionne cur = curWpIndex - 1 et next = nextWpIndex - 1 et retraite le waypoint. Utilisée par checkpoints.lua selon le code.
---Source : lua/ge/extensions/scenario/waypoints.lua:712
---@param vehicleId integer id du véhicule
---@param curWpIndex integer|nil index (base 1) du waypoint courant
---@param nextWpIndex integer|nil index (base 1) du prochain waypoint
function scenario_waypoints.updateResetVehicleData(vehicleId, curWpIndex, nextWpIndex) end


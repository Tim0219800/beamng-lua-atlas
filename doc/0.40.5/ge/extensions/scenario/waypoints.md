# `scenario_waypoints`

*Fichier : `lua/ge/extensions/scenario/waypoints.lua` · VM : Game Engine (GE) · 757 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `scenario_waypoints` : `extensions.load("scenario_waypoints")`, puis la globale `scenario_waypoints`

Système de waypoints d'un scénario de course : à partir de scenario.lapConfig (liste ordonnée de waypoints/triggers) et des branches (lapConfigBranches), construit un graphe de successeurs, affiche les marqueurs (raceMarker) et détecte chaque frame le passage des roues des véhicules du joueur ou pilotés par IA à travers le prochain waypoint. Émet les hooks de course (onRaceWaypointReached, onRaceWaypoint, onRaceLap, onRaceBranchChosen) et termine la course quand le dernier waypoint du dernier tour est franchi. Chargé par scenario_scenariosLoader avec scenario_scenarios.

## Exemple

```lua
-- dans une extension de scénario :
local function onRaceWaypointReached(data)
  -- data = {cur, curPos, curRot, curRadius, next, vehicleId, vehicleName, waypointName, time, lapDiff, currentLapConfig}
end
local d = scenario_waypoints.getVehicleWaypointData(be:getPlayerVehicleID(0))
if d then print(d.cur, d.next, d.lap) end
```

## Remarques

- Dépend de scenario_scenarios (M.dependencies). Initialisé par scenario_scenarios au passage en 'pre-running' (initialise) et à chaque redémarrage (onScenarioRestarted).
- M.state : vehicleWaypointsData[vehicleId] = {cur, next, lap, waypointConfig, nextWps, historicalLapConfig, wheelOffsets, currentCorners, previousCorners} ; nextWpForVehicle ; waypointBranches ; branchGraph ; pathnodes ; lapConfigName ; originalBranches. Réinitialisé par onScenarioChange(nil) et onClientEndMission.
- Indices : cur = -1 (avant départ) puis 0 (première cible atteinte) ; en départ lancé (rollingStart avec startTimerCheckpoint) cur démarre à -2. Après le franchissement, cur est l'index (base 1) dans waypointConfig du waypoint qui vient d'être atteint, next celui du suivant ou nil à la fin. getNextWaypoint renvoie 1 pour un nouveau tour tant que lap + 1 < lapCount (lapCount == 0 : tours infinis).
- Détection : onPreRender calcule la position courante des coins (un par roue, décalage de l'axe de roue) et teste le segment précédent->courant contre chaque pathnode successeur (pn:intersectCorners). dtOff = dtSim * (1 - tNorm) corrige le temps du passage : time = scenario.timer - dtOff.
- Marqueurs : modes 'default' (rouge), 'lap' (fin de tour), 'final' (dernier waypoint de la dernière course), 'branch' (embranchement), 'next' (suivant des suivants), 'start' ; n'affichés que pour les véhicules playerUsable.
- Bug/incohérence : onScenarioVehicleTrigger, dans la branche de départ lancé (rollingStart et cur == 0), émet onRaceWaypoint avec la variable 'data' qui n'est déclarée que plus bas (valeur nil à ce moment) : le hook reçoit nil.
- Bug/incohérence : M.onUpdate et M.addWaypointBranch sont assignés depuis des variables non définies (nil) : ces champs n'existent pas réellement.
- Bug/incohérence : deactivateWaypointBranch commence par « do return end » : la fonction ne fait rien. isFinalWaypoint renvoie toujours false (commentaire du code : « this always returns false or what? »).
- Bug/incohérence : initialise lit scenario.lapConfig avant le test « if scenario » (erreur si aucun scénario) ; updateResetVehicleData mélange and/or sans parenthèses : « vehicleWaypointsData and not data[id] or not curWpIndex ».
- Bug/incohérence : onScenarioRestarted utilise l'argument scenario avant de le redéclarer (shadowing) ; lapConfigBranches non défini lève une erreur dans insertWaypoints.

**Dépendances (chargées avant) :** `scenario_scenarios`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `scenario_waypoints.activateWaypointBranch(branchName, vehicleId, dtOff)` | Insère dans la liste de waypoints du véhicule les waypoints de la branche choisie, après le waypoint courant, puis émet onRaceBranchChosen({branchName, time, vehicleId, vehicleName}). | 324 |
| `scenario_waypoints.deactivateWaypointBranch(branchName)` | Ne fait rien (retourne immédiatement). | 309 |
| `scenario_waypoints.getVehicleWaypointData(vehicleId)` | Renvoie une copie profonde des données de waypoint d'un véhicule (cur, next, lap, waypointConfig, nextWps, historicalLapConfig, coins de roues…). | 680 |
| `scenario_waypoints.initialise()` | Appelée par scenario_scenarios en 'pre-running' : réinitialise l'état, construit les branches et le graphe des successeurs, crée un pathnode par waypoint, configure les marqueurs (raceMarker.setupMarkers) et initialise les données de chaque véhicule du scénario. Ne fait rien si lapConfig est vide. *(interne)* | 518 |
| `scenario_waypoints.isFinalWaypoint(vehicleId, waypointName)` | Censée dire si un waypoint est le dernier ; renvoie toujours false (corps commenté dans le code). | 665 |
| `scenario_waypoints.onClientEndMission()` | Hook de fin de niveau : efface l'état. *(interne)* *(hook)* | 724 |
| `scenario_waypoints.onDeserialized(data)` | Hook de désérialisation : restaure l'état en reconvertissant les noms de véhicules en ids. *(interne)* *(hook)* | 697 |
| `scenario_waypoints.onPreRender(dtReal, dtSim, dtRaw)` | Hook chaque frame (luaPreRender) : met à jour les coins des roues de chaque véhicule suivi et détecte le franchissement du prochain waypoint. *(interne)* *(hook)* | 606 |
| `scenario_waypoints.onScenarioChange(scenario)` | Hook émis par scenario_scenarios à chaque changement d'état ; efface l'état du système quand le scénario est nil (arrêt). *(interne)* *(hook)* | 267 |
| `scenario_waypoints.onScenarioRestarted(scenario)` | Hook émis au redémarrage d'un scénario : restaure lapConfig, vide l'état, reconstruit branches et graphe de successeurs. *(interne)* *(hook)* | 495 |
| `scenario_waypoints.onScenarioVehicleTrigger(vid, wpData, dtOff)` | Appelée en interne quand un véhicule traverse son waypoint cible : traite le waypoint (marqueurs, suivant), émet onRaceWaypointReached(data) (et onRaceWaypoint pour les véhicules playerUsable, avec un son), gère la fin de course (scenario_scenarios.endRace) et les tours (onRaceLap). Marquée « private » dans le code. *(interne)* *(hook)* | 205 |
| `scenario_waypoints.onSerialize()` | Hook de sérialisation avant rechargement Lua : renvoie les données par nom de véhicule. *(interne)* *(hook)* | 685 |
| `scenario_waypoints.onVehicleAIStateChanged(data)` | Hook émis par scenario_scenarios : initialise le suivi des waypoints d'un véhicule dont l'IA vient d'être activée. *(interne)* *(hook)* | 706 |
| `scenario_waypoints.updateResetVehicleData(vehicleId, curWpIndex, nextWpIndex)` | Réinitialise les données de waypoint d'un véhicule remis en place : sans curWpIndex (ou données absentes) les recrée, sinon positionne cur = curWpIndex - 1 et next = nextWpIndex - 1 et retraite le waypoint. Utilisée par checkpoints.lua selon le code. | 712 |

### Détail des paramètres

#### `scenario_waypoints.activateWaypointBranch(branchName, vehicleId, dtOff)`

Insère dans la liste de waypoints du véhicule les waypoints de la branche choisie, après le waypoint courant, puis émet onRaceBranchChosen({branchName, time, vehicleId, vehicleName}).

- `branchName` (*string*) : nom de la branche (clé de lapConfigBranches)
- `vehicleId` (*integer*) : id du véhicule
- `dtOff` (*number*) : correction de temps (s)

#### `scenario_waypoints.deactivateWaypointBranch(branchName)`

Ne fait rien (retourne immédiatement).

- `branchName` (*string*) : nom de la branche

#### `scenario_waypoints.getVehicleWaypointData(vehicleId)`

Renvoie une copie profonde des données de waypoint d'un véhicule (cur, next, lap, waypointConfig, nextWps, historicalLapConfig, coins de roues…).

- `vehicleId` (*integer*) : id du véhicule
- **renvoie** : table|nil données ou nil

#### `scenario_waypoints.isFinalWaypoint(vehicleId, waypointName)`

Censée dire si un waypoint est le dernier ; renvoie toujours false (corps commenté dans le code).

- `vehicleId` (*integer*) : id du véhicule
- `waypointName` (*string*) : nom du waypoint
- **renvoie** : boolean toujours false

#### `scenario_waypoints.onDeserialized(data)`

Hook de désérialisation : restaure l'état en reconvertissant les noms de véhicules en ids.

- `data` (*table*) : données de onSerialize

#### `scenario_waypoints.onPreRender(dtReal, dtSim, dtRaw)`

Hook chaque frame (luaPreRender) : met à jour les coins des roues de chaque véhicule suivi et détecte le franchissement du prochain waypoint.

- `dtReal` (*number*) : temps réel (s)
- `dtSim` (*number*) : temps simulé (s)
- `dtRaw` (*number*) : temps brut (s)

#### `scenario_waypoints.onScenarioChange(scenario)`

Hook émis par scenario_scenarios à chaque changement d'état ; efface l'état du système quand le scénario est nil (arrêt).

- `scenario` (*table|nil*) : scénario ou nil

#### `scenario_waypoints.onScenarioRestarted(scenario)`

Hook émis au redémarrage d'un scénario : restaure lapConfig, vide l'état, reconstruit branches et graphe de successeurs.

- `scenario` (*table*) : scénario

#### `scenario_waypoints.onScenarioVehicleTrigger(vid, wpData, dtOff)`

Appelée en interne quand un véhicule traverse son waypoint cible : traite le waypoint (marqueurs, suivant), émet onRaceWaypointReached(data) (et onRaceWaypoint pour les véhicules playerUsable, avec un son), gère la fin de course (scenario_scenarios.endRace) et les tours (onRaceLap). Marquée « private » dans le code.

- `vid` (*integer*) : id du véhicule
- `wpData` (*table*) : noeud du scénario {pos, radius, rot}
- `dtOff` (*number*) : correction de temps (s)

#### `scenario_waypoints.onSerialize()`

Hook de sérialisation avant rechargement Lua : renvoie les données par nom de véhicule.

- **renvoie** : table données sérialisées

#### `scenario_waypoints.onVehicleAIStateChanged(data)`

Hook émis par scenario_scenarios : initialise le suivi des waypoints d'un véhicule dont l'IA vient d'être activée.

- `data` (*table*) : {vehicleId, vehicleName, aiControlled}

#### `scenario_waypoints.updateResetVehicleData(vehicleId, curWpIndex, nextWpIndex)`

Réinitialise les données de waypoint d'un véhicule remis en place : sans curWpIndex (ou données absentes) les recrée, sinon positionne cur = curWpIndex - 1 et next = nextWpIndex - 1 et retraite le waypoint. Utilisée par checkpoints.lua selon le code.

- `vehicleId` (*integer*) : id du véhicule
- `curWpIndex` (*integer|nil*) : index (base 1) du waypoint courant
- `nextWpIndex` (*integer|nil*) : index (base 1) du prochain waypoint

## Champs

| Champ | Type | Description |
|---|---|---|
| `addWaypointBranch` | nil | Exporté mais vaut nil (variable locale non définie dans le fichier). ⚠ référence `addWaypointBranch` non définie dans le fichier (vaut probablement nil) |
| `dependencies` | table<integer, string> | {'scenario_scenarios'} |
| `onUpdate` | nil | Exporté mais vaut nil (variable locale non définie dans le fichier). ⚠ référence `onUpdate` non définie dans le fichier (vaut probablement nil) |
| `state` | table | État du système (voir notes) : vehicleWaypointsData, nextWpForVehicle, waypointBranches, currentWaypointChoice, currentBranch, waypointsConfigData, branchGraph, pathnodes. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRaceBranchChosen` — écouté par 1 module(s)
- `onRaceLap` — écouté par 2 module(s)
- `onRaceWaypoint`
- `onRaceWaypointReached` — écouté par 6 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawLine`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/waypoints.lua`.*

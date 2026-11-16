# `core_busRouteManager`

*Fichier : `lua/ge/extensions/core/busRouteManager.lua` · VM : Game Engine (GE) · 142 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_busRouteManager` : `extensions.load("core_busRouteManager")`, puis la globale `core_busRouteManager`

Extension GE (core_busRouteManager) qui gère les lignes de bus d'un niveau. Au chargement de l'extension et au démarrage d'un niveau (init), elle lit les fichiers *.buslines.json du dossier du niveau (/buslines/), vérifie que les arrêts cités existent comme triggers BeamNGTrigger de type 'busstop' dans le groupe 'busstops', et remplace les noms d'arrêts par leurs données de position. Elle relaie ensuite les évènements des triggers vers le contrôleur du bus (côté véhicule) et vers le scénario scenario_busdriver.

## Exemple

```lua
local route = core_busRouteManager.setLine(vehId, 42, 'a') -- envoie la ligne 42 variante 'a' au bus
```

## Remarques

- Seuls les fichiers de version 1 sont chargés (data.version == 1). Les routes s'ajoutent à busLines.routes.
- Chaque tâche de route (route.tasklist) est remplacée par {nom, stopName, position{x,y,z}, rotation{x,y,z,w}, échelle{x,y,z}} ; les arrêts introuvables sont loggués en erreur et supprimés de la liste.
- Les commandes vers le bus passent par veh:queueLuaCommand("controller.onGameplayEvent('<cmd>', <données sérialisées>)") : commandes bus_setLineInfo, bus_onAtStop, bus_onDepartedStop, bus_onTriggerTick.
- init est exposé à la fois sous onClientStartMission et onExtensionLoaded : la liste des lignes est donc rechargée aux deux moments.
- Incohérence : init appelle path.split(missionFile, '(.-)([^/]-([^%.]*))$') avec un 2e argument (motif) qui est en réalité le paramètre compositeExtension : il est truthy, ce qui force l'extension 'composite' (tout après le premier point). Sans conséquence ici car seul levelDir est utilisé (déduit du code).
- Incohérence : le commentaire de setLine dit 'GE core_busLine.getLine' alors que la fonction exportée s'appelle setLine ; les logs d'erreur de setLine utilisent la balise 'getLine'.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_busRouteManager.onAtStop(data)` | Appelée à l'entrée d'un bus dans un arrêt : envoie bus_onAtStop au véhicule data.subjectID. *(hook)* | 96 |
| `core_busRouteManager.onBeamNGTrigger(data)` | Hook appelé par le moteur pour chaque évènement de trigger. Ne traite que type == 'busstop' : 'enter' -> onAtStop, 'exit' -> bus_onDepartedStop, 'tick' -> bus_onTriggerTick envoyés au véhicule. *(interne)* *(hook)* | 107 |
| `core_busRouteManager.onBusUpdate(state)` | Hook de mise à jour du bus : transmet l'état à scenario_busdriver.onBusUpdate si ce scénario est chargé. *(interne)* *(hook)* | 119 |
| `core_busRouteManager.onClientStartMission()` | Hook appelé au démarrage d'un niveau : (ré)initialise busLines et recharge les fichiers de lignes du niveau. *(interne)* *(hook)* | 73 |
| `core_busRouteManager.onExtensionLoaded()` | Hook appelé au chargement de l'extension : même fonction init que onClientStartMission. *(interne)* *(hook)* | 73 |
| `core_busRouteManager.setLine(vehId, routeID, variance)` | Cherche la route dont routeID et variance correspondent. Si vehId est donné, envoie les infos de la ligne au véhicule (commande bus_setLineInfo). Renvoie la route trouvée ou nil (avec log d'erreur). | 83 |

### Détail des paramètres

#### `core_busRouteManager.onAtStop(data)`

Appelée à l'entrée d'un bus dans un arrêt : envoie bus_onAtStop au véhicule data.subjectID.

- `data` (*table*) : Données du trigger (subjectID, type, event…)

#### `core_busRouteManager.onBeamNGTrigger(data)`

Hook appelé par le moteur pour chaque évènement de trigger. Ne traite que type == 'busstop' : 'enter' -> onAtStop, 'exit' -> bus_onDepartedStop, 'tick' -> bus_onTriggerTick envoyés au véhicule.

- `data` (*table*) : {type, event ('enter'|'exit'|'tick'), subjectID, …}

#### `core_busRouteManager.onBusUpdate(state)`

Hook de mise à jour du bus : transmet l'état à scenario_busdriver.onBusUpdate si ce scénario est chargé.

- `state` (*table*) : État du bus (déduit du code : contient notamment pos)

#### `core_busRouteManager.setLine(vehId, routeID, variance)`

Cherche la route dont routeID et variance correspondent. Si vehId est donné, envoie les infos de la ligne au véhicule (commande bus_setLineInfo). Renvoie la route trouvée ou nil (avec log d'erreur).

- `vehId` (*integer|nil*) : ID du véhicule bus à configurer (getObjectByID), nil pour seulement chercher
- `routeID` (*any*) : Identifiant de la ligne (comparé avec ==)
- `variance` (*any*) : Variante de la ligne (ex. 'a')
- **renvoie** : table|nil Table de la route (avec tasklist transformée), nil si non trouvée

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `Sim.` `upcast`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/busRouteManager.lua`.*

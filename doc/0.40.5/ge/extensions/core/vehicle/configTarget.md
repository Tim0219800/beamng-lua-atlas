# `core_vehicle_configTarget`

*Fichier : `lua/ge/extensions/core/vehicle/configTarget.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_configTarget` : `extensions.load("core_vehicle_configTarget")`, puis la globale `core_vehicle_configTarget`

Extension GE `core_vehicle_configTarget` : mémorise quel véhicule (et quel joueur) est la cible du menu de configuration du véhicule, pour que partmgmt, colors, mirror, thumbnail, etc. n'agissent pas toujours sur le véhicule du joueur 0. Sert aussi de résolveur : resolveVehicleId prend un id explicite, sinon la cible, sinon le véhicule du joueur 0. Émet onVehicleConfigTargetChanged à chaque changement.

## Exemple

```lua
core_vehicle_configTarget.begin(vehId, {playerId = 0, returnRoute = 'pause.vehicle'})
local id = core_vehicle_configTarget.resolveVehicleId()   -- vehId
core_vehicle_configTarget.clear('done')
```

## Remarques

- returnRoute n'est accepté que parmi 'pause' et 'pause.vehicle' (sinon 'pause.vehicle').
- La cible est effacée automatiquement une frame après la destruction du véhicule si celui-ci n'a pas été recréé entre-temps (spawn du même id), à la fin du niveau ou au déchargement de l'extension.
- Les fonctions de lecture (get) renvoient une copie ; le hook onVehicleConfigTargetChanged reçoit (cibleActuelle, cibleAvant, raison) en copies : raison = 'begin', 'clear' ou la raison passée à clear ('vehicleDestroyed', 'missionEnded', 'extensionUnloaded').

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_configTarget.begin(vehId, context)` | Définit le véhicule cible. Refuse un id invalide ou un véhicule inexistant. Émet onVehicleConfigTargetChanged(courant, précédent, 'begin'). | 25 |
| `core_vehicle_configTarget.clear(reason)` | Efface la cible et émet onVehicleConfigTargetChanged. | 42 |
| `core_vehicle_configTarget.get()` | Copie de la cible courante. | 55 |
| `core_vehicle_configTarget.getReturnRoute()` | Route d'interface où revenir après la configuration. | 67 |
| `core_vehicle_configTarget.getTargetPlayerId()` | Index du joueur qui configure. | 63 |
| `core_vehicle_configTarget.getTargetVehicleId()` | Id du véhicule cible. | 59 |
| `core_vehicle_configTarget.isActive()` | Indique si une cible est définie. | 51 |
| `core_vehicle_configTarget.onClientEndMission()` | Hook : fin du niveau ; efface la cible ('missionEnded'). *(interne)* *(hook)* | 118 |
| `core_vehicle_configTarget.onDeserialized(data)` | Hook : restaure la cible si son véhicule existe encore. *(interne)* *(hook)* | 132 |
| `core_vehicle_configTarget.onExtensionUnloaded()` | Hook : extension déchargée ; efface la cible ('extensionUnloaded'). *(interne)* *(hook)* | 122 |
| `core_vehicle_configTarget.onSerialize()` | Hook : sauvegarde la cible avant rechargement Lua. *(interne)* *(hook)* | 126 |
| `core_vehicle_configTarget.onUpdate()` | Hook par frame : efface la cible si le véhicule détruit n'existe toujours pas. *(interne)* *(hook)* | 109 |
| `core_vehicle_configTarget.onVehicleDestroyed(vehId)` | Hook : si le véhicule cible est détruit, note qu'il faudra effacer la cible à la prochaine frame. *(interne)* *(hook)* | 97 |
| `core_vehicle_configTarget.onVehicleSpawned(vehId)` | Hook : annule l'effacement prévu si le même id est recréé (remplacement de véhicule). *(interne)* *(hook)* | 103 |
| `core_vehicle_configTarget.resolveVehicle(explicitVehicleId)` | Comme resolveVehicleId mais renvoie l'objet véhicule. | 86 |
| `core_vehicle_configTarget.resolveVehicleData(explicitVehicleId)` | Comme resolveVehicleId mais renvoie les données de core_vehicle_manager.getVehicleData. | 91 |
| `core_vehicle_configTarget.resolveVehicleId(explicitVehicleId)` | Détermine l'id du véhicule à utiliser : l'id explicite s'il est donné et valide, sinon la cible, sinon le véhicule du joueur 0. Renvoie nil si l'objet n'existe pas. | 71 |

### Détail des paramètres

#### `core_vehicle_configTarget.begin(vehId, context)`

Définit le véhicule cible. Refuse un id invalide ou un véhicule inexistant. Émet onVehicleConfigTargetChanged(courant, précédent, 'begin').

- `vehId` (*integer*) : id du véhicule (>= 0)
- `context` (*table|nil*) : {playerId?, returnRoute?}
- **renvoie** : boolean true si la cible a été définie

#### `core_vehicle_configTarget.clear(reason)`

Efface la cible et émet onVehicleConfigTargetChanged.

- `reason` (*string|nil*) : raison transmise au hook, défaut 'clear'
- **renvoie** : boolean false s'il n'y avait pas de cible

#### `core_vehicle_configTarget.get()`

Copie de la cible courante.

- **renvoie** : table|nil {vehId, playerId, returnRoute} ou nil

#### `core_vehicle_configTarget.getReturnRoute()`

Route d'interface où revenir après la configuration.

- **renvoie** : string 'pause' ou 'pause.vehicle' (défaut)

#### `core_vehicle_configTarget.getTargetPlayerId()`

Index du joueur qui configure.

- **renvoie** : integer|nil playerId ou nil

#### `core_vehicle_configTarget.getTargetVehicleId()`

Id du véhicule cible.

- **renvoie** : integer|nil vehId ou nil

#### `core_vehicle_configTarget.isActive()`

Indique si une cible est définie.

- **renvoie** : boolean true si active

#### `core_vehicle_configTarget.onDeserialized(data)`

Hook : restaure la cible si son véhicule existe encore.

- `data` (*table*) : données de onSerialize

#### `core_vehicle_configTarget.onSerialize()`

Hook : sauvegarde la cible avant rechargement Lua.

- **renvoie** : table {target}

#### `core_vehicle_configTarget.onVehicleDestroyed(vehId)`

Hook : si le véhicule cible est détruit, note qu'il faudra effacer la cible à la prochaine frame.

- `vehId` (*integer*) : véhicule

#### `core_vehicle_configTarget.onVehicleSpawned(vehId)`

Hook : annule l'effacement prévu si le même id est recréé (remplacement de véhicule).

- `vehId` (*integer*) : véhicule

#### `core_vehicle_configTarget.resolveVehicle(explicitVehicleId)`

Comme resolveVehicleId mais renvoie l'objet véhicule.

- `explicitVehicleId` (*integer|nil*) : id imposé
- **renvoie** : userdata|nil objet véhicule

#### `core_vehicle_configTarget.resolveVehicleData(explicitVehicleId)`

Comme resolveVehicleId mais renvoie les données de core_vehicle_manager.getVehicleData.

- `explicitVehicleId` (*integer|nil*) : id imposé
- **renvoie** : table|nil données du véhicule (vdata, config, vehicleDirectory, ioCtx…)

#### `core_vehicle_configTarget.resolveVehicleId(explicitVehicleId)`

Détermine l'id du véhicule à utiliser : l'id explicite s'il est donné et valide, sinon la cible, sinon le véhicule du joueur 0. Renvoie nil si l'objet n'existe pas.

- `explicitVehicleId` (*integer|nil*) : id imposé par l'appelant (nil = automatique ; un id invalide donne nil, sans repli)
- **renvoie** : integer|nil id du véhicule

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleConfigTargetChanged` — écouté par 4 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/configTarget.lua`.*

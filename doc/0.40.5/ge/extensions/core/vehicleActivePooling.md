# `core_vehicleActivePooling`

*Fichier : `lua/ge/extensions/core/vehicleActivePooling.lua` · VM : Game Engine (GE) · 512 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicleActivePooling` : `extensions.load("core_vehicleActivePooling")`, puis la globale `core_vehicleActivePooling`

Extension GE `core_vehicleActivePooling` : gère des « pools » de véhicules dont seule une partie est active (visible et simulée) à la fois, pour limiter la charge (trafic, véhicules garés…). Un pool (classe VehPool) garde deux listes (activeVehs, inactiveVehs), une limite maxActiveAmount, un mode distance (activation selon la distance à la caméra) et un fondu (fade) des meshes. L'état actif d'un véhicule est celui de l'objet (`obj:setActive(0|1)`).

## Exemple

```lua
local pool = core_vehicleActivePooling.createPool({name = 'monTrafic', maxActiveAmount = 8})
pool:insertVeh(vehId)            -- ajoute un véhicule (actif si la limite le permet)
pool.useDistanceMode = true      -- active/désactive selon la distance à la caméra
pool.activeDistance = 250
pool:cycle()                     -- désactive le 1er actif, active le 1er inactif
```

## Remarques

- Champs d'un pool : id, name, activeVehs (tableau d'ids), inactiveVehs (tableau d'ids), allVehs ([id] = 1 actif / 0 inactif), fadeQueue ([id] = 1 fondu entrant / 0 sortant), total, maxActiveAmount (math.huge par défaut), useSceneVehiclesCap (compter tous les véhicules actifs de la scène au lieu de ceux du pool), useDistanceMode (prioritaire sur les autres méthodes), updateActiveStatePostFade (changer l'état actif après le fondu), activeDistance (300 m), fadeDuration (0.25 s).
- Les changements d'état actif passent par obj:setActive, qui déclenche le hook onVehicleActiveChanged, lequel appelle VehPool:_setVeh pour tenir les listes à jour.
- Incohérence : la fonction de module deletePool(id) se contente de retirer le pool de la table (pas de suppression des véhicules inactifs, pas de hook onVehiclePoolRemoved), alors que VehPool:deletePool() supprime les véhicules inactifs (sauf keepVehicles) et émet onVehiclePoolRemoved.
- VehPool:getSceneActiveAmount(vehTypes) lit un argument vehTypes (liste de types) que la liste automatique ne signale pas ; nil = types par défaut de getAllVehiclesByType, véhicules garés (isParked) exclus.
- Les signatures de plusieurs méthodes dans la liste automatique omettent le premier argument vehId (ex. fadeVeh(vehId, dt)) ; les signatures réelles sont données ci-dessous.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicleActivePooling.createPool(data)` | Crée un pool, l'enregistre et émet onVehiclePoolAdded(id). | 394 |
| `core_vehicleActivePooling.deleteAllPools()` | Appelle VehPool:deletePool() sur chaque pool (supprime leurs véhicules inactifs) puis vide la table. | 428 |
| `core_vehicleActivePooling.deletePool(id)` | Retire le pool de la table des pools (sans supprimer de véhicules ni émettre de hook ; voir notes). | 401 |
| `core_vehicleActivePooling.getAllPools()` | Renvoie la table de tous les pools (pas une copie). | 424 |
| `core_vehicleActivePooling.getPool(name)` | Trouve un pool par son nom. | 405 |
| `core_vehicleActivePooling.getPoolById(id)` | Trouve un pool par son id. | 420 |
| `core_vehicleActivePooling.getPoolOfVeh(vehId)` | Trouve le pool contenant un véhicule. | 412 |
| `core_vehicleActivePooling.onClientEndMission()` | Hook : fin du niveau ; supprime tous les pools (deleteAllPools). *(interne)* *(hook)* | 447 |
| `core_vehicleActivePooling.onDeserialized(data)` | Hook : recrée les pools à partir des données sérialisées. *(interne)* *(hook)* | 490 |
| `core_vehicleActivePooling.onSerialize()` | Hook : sérialise tous les pools avant un rechargement Lua. *(interne)* *(hook)* | 481 |
| `core_vehicleActivePooling.onUpdate(dt, dtSim)` | Hook appelé à chaque frame : applique le mode distance (activateByDistanceTo) et fait progresser les fondus de fadeQueue avec dtSim / fadeDuration. *(interne)* *(hook)* | 451 |
| `core_vehicleActivePooling.onVehicleActiveChanged(vehId, active)` | Hook : l'état actif d'un véhicule change ; met à jour les listes de tous les pools qui le contiennent. *(interne)* *(hook)* | 435 |
| `core_vehicleActivePooling.onVehicleDestroyed(vehId)` | Hook : un véhicule est détruit ; le retire de tous les pools. *(interne)* *(hook)* | 441 |

### Détail des paramètres

#### `core_vehicleActivePooling.createPool(data)`

Crée un pool, l'enregistre et émet onVehiclePoolAdded(id).

- `data` (*table|nil*) : {id?, name?, activeVehs?, inactiveVehs?, maxActiveAmount?} ; name par défaut 'pool<id>'
- **renvoie** : VehPool le pool créé

#### `core_vehicleActivePooling.deletePool(id)`

Retire le pool de la table des pools (sans supprimer de véhicules ni émettre de hook ; voir notes).

- `id` (*integer*) : identifiant du pool

#### `core_vehicleActivePooling.getAllPools()`

Renvoie la table de tous les pools (pas une copie).

- **renvoie** : table<integer, VehPool> [id] = pool

#### `core_vehicleActivePooling.getPool(name)`

Trouve un pool par son nom.

- `name` (*string|nil*) : nom du pool
- **renvoie** : VehPool|nil pool trouvé

#### `core_vehicleActivePooling.getPoolById(id)`

Trouve un pool par son id.

- `id` (*integer|nil*) : identifiant
- **renvoie** : VehPool|nil pool trouvé

#### `core_vehicleActivePooling.getPoolOfVeh(vehId)`

Trouve le pool contenant un véhicule.

- `vehId` (*integer*) : identifiant du véhicule
- **renvoie** : VehPool|nil pool
- **renvoie** : boolean|nil true si le véhicule y est actif

#### `core_vehicleActivePooling.onDeserialized(data)`

Hook : recrée les pools à partir des données sérialisées.

- `data` (*table[]*) : données de onSerialize

#### `core_vehicleActivePooling.onSerialize()`

Hook : sérialise tous les pools avant un rechargement Lua.

- **renvoie** : table[] données des pools

#### `core_vehicleActivePooling.onUpdate(dt, dtSim)`

Hook appelé à chaque frame : applique le mode distance (activateByDistanceTo) et fait progresser les fondus de fadeQueue avec dtSim / fadeDuration.

- `dt` (*number*) : temps réel écoulé (s)
- `dtSim` (*number*) : temps de simulation écoulé (s)

#### `core_vehicleActivePooling.onVehicleActiveChanged(vehId, active)`

Hook : l'état actif d'un véhicule change ; met à jour les listes de tous les pools qui le contiennent.

- `vehId` (*integer*) : véhicule
- `active` (*boolean*) : nouvel état

#### `core_vehicleActivePooling.onVehicleDestroyed(vehId)`

Hook : un véhicule est détruit ; le retire de tous les pools.

- `vehId` (*integer*) : véhicule

## Champs

| Champ | Type | Description |
|---|---|---|
| `logErrors` | boolean | false par défaut ; si true, les avertissements (véhicule déjà actif, limite atteinte…) sont logués. |

## Classe `VehPool`

Pool de véhicules créé par createPool. Les méthodes s'appellent avec `:` (pool:insertVeh(id)).

| Méthode | Description | Ligne |
|---|---|---|
| `VehPool:__tostring()` | Texte '[id] active: {...}, inactive: {...}'. | 34 |
| `VehPool:_setVeh(vehId, activate)` | Interne : met à jour les listes quand l'état actif d'un véhicule a changé (appelé par onVehicleActiveChanged). Ne pas appeler. | 305 |
| `VehPool:activateByDistanceTo(pos, dist, buffer)` | Désactive les véhicules actifs plus loin que dist + buffer et active les inactifs plus proches que dist (le buffer évite les basculements rapides). | 368 |
| `VehPool:checkActiveLimit()` | Renvoie true si la limite de véhicules actifs est atteinte (compte les actifs du pool, ou de la scène si useSceneVehiclesCap). | 121 |
| `VehPool:clearPool()` | Vide toutes les listes du pool sans toucher aux véhicules. | 133 |
| `VehPool:crossCycle(otherPool, vehId1, vehId2)` | Désactive un véhicule de ce pool et active un véhicule d'un autre pool. | 167 |
| `VehPool:cycle(vehId1, vehId2)` | Désactive un véhicule actif et en active un inactif du même pool (la limite est ignorée pendant l'opération). | 153 |
| `VehPool:deletePool(keepVehicles)` | Supprime le pool ; sauf si keepVehicles, supprime aussi les véhicules inactifs. Émet onVehiclePoolRemoved(id). | 141 |
| `VehPool:fadeInVeh(vehId)` | Programme un fondu vers opaque. Si le véhicule est inactif et updateActiveStatePostFade est true, l'active d'abord. | 192 |
| `VehPool:fadeOutVeh(vehId)` | Programme un fondu vers transparent (véhicule actif requis). Avec updateActiveStatePostFade, il est désactivé en fin de fondu. | 212 |
| `VehPool:fadeVeh(vehId, dt)` | Augmente ou diminue directement l'alpha des meshes du véhicule de `dt` (clampé 0..1). À utiliser à chaque frame pour un fondu progressif. | 181 |
| `VehPool:getSceneActiveAmount(vehTypes)` | Nombre total de véhicules actifs de la scène (tous pools confondus), véhicules garés exclus sauf si 'PropParked' est demandé. | 108 |
| `VehPool:getVehs()` | Liste de tous les ids du pool (actifs d'abord). | 388 |
| `VehPool:insertVeh(vehId, forceInsert)` | Ajoute un véhicule au pool ; il est actif si l'objet est actif et que la limite le permet, sinon inactif (et désactivé via obj:setActive). | 234 |
| `VehPool:new(data)` | Constructeur (utiliser plutôt createPool). Initialise listes, limites et valeurs par défaut, et garantit un id unique. | 38 |
| `VehPool:onDeserialized(data)` | Copie les champs de data dans le pool. | 100 |
| `VehPool:onSerialize()` | Renvoie les données du pool à sauvegarder. | 81 |
| `VehPool:removeVeh(vehId)` | Retire un véhicule du pool (sans le supprimer). | 259 |
| `VehPool:setAllVehs(activate)` | Active (dans la limite de maxActiveAmount) ou désactive tous les véhicules du pool. | 282 |
| `VehPool:setMaxActiveAmount(amount)` | Fixe la limite de véhicules actifs et désactive l'excédent s'il y en a. | 348 |
| `VehPool:setVeh(vehId, activate, forceInsert)` | Active ou désactive un véhicule du pool en respectant la limite. | 326 |
| `VehPool:tryInsertActiveVeh(vehId, forceInsert)` | Vérifie si un véhicule actif de plus est autorisé ; avec forceInsert, augmente maxActiveAmount de 1 au lieu de refuser. | 220 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehiclePoolAdded`
- `onVehiclePoolRemoved`

## Appels vers le moteur (C++)

- `be:` `getObjectActive`
- `obj:` `delete`, `getActive`, `getMeshAlpha`, `getPositionXYZ`, `setActive`, `setMeshAlpha`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicleActivePooling.lua`.*

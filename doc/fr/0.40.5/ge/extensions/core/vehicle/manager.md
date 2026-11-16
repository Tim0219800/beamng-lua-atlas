# `core_vehicle_manager`

*Fichier : `lua/ge/extensions/core/vehicle/manager.lua` · VM : Game Engine (GE) · 415 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_manager` : `extensions.load("core_vehicle_manager")`, puis la globale `core_vehicle_manager`

Extension GE `core_vehicle_manager` : chargeur de véhicules côté GE. Quand le moteur crée un objet véhicule, il appelle `_spawnCCallback` : charge les matériaux du dossier du modèle, construit la config (core_vehicle_partmgmt.buildConfigFromString), exécute l'étape 1 du chargeur jbeam (jbeam/loader), termine les meshes, notifie l'UI (VehicleChange), fait entrer le joueur si autoEnterVehicle, puis envoie les données de physique au véhicule (spawnPhysics). Conserve pour chaque véhicule son « bundle » (vdata = données jbeam, config, ioCtx…) accessible par getVehicleData, et applique en direct les changements de peinture.

## Exemple

```lua
local d = core_vehicle_manager.getVehicleData(be:getPlayerVehicleID(0))
print(d.vehicleDirectory, d.model, d.config.partConfigFilename)
dump(d.vdata.nodes[0].pos)
-- peintures par nom
core_vehicle_manager.setVehicleColorsNames(vehId, {'Black', 'White', 'Red'})
```

## Remarques

- getVehicleData(id) renvoie le « bundle » de vehicles[id] : tableau avec au moins vdata, config, ioCtx, vehicleDirectory, model, mainPartName, activePlayer (champs lus ailleurs dans le code ; le détail exact vient de jbeam/loader).
- BUG : setVehicleColorsNames teste `vehicle.color == vehicle.colorPalette0 == vehicle.colorPalette1`, ce qui compare un booléen à une couleur et vaut toujours false : le paramètre `optional` ne protège donc jamais rien.
- BUG probable : dans _spawnCCallback, `additionalVehicleData and not additionalDataId or additionalDataId == objID` mélange and/or sans parenthèses ; si additionalDataId est nil, la condition est vraie quand additionalVehicleData existe (voulu) mais aussi vraie si additionalDataId == objID.
- setVehiclePaintsNames est un alias de setVehicleColorsNames.
- L'éditeur « Vehicle Manager » (onEditorGui) est marqué obsolète dans le code : il affiche seulement l'argument de ligne de commande -debugVehicleLoading à utiliser à la place. Les arguments -profileVehicleLoading et -debugVehicleLoading sont lus au chargement du module.
- onUpdate appelle spawn.clearCache() à chaque frame (cache de placement de spawn.lua).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_manager._spawnCCallback(objID, vehicleDir, configDataIn, reloading)` | Appelée par le moteur C++ quand un objet véhicule est créé ou rechargé : charge matériaux, config et jbeam (étape 1), notifie, fait entrer le joueur (autoEnterVehicle / autoEnterVehiclePlayer) et lance la physique. Émet le hook onSpawnCCallback(objID) et appelle vehicleSpawned(objID). *(interne)* | 111 |
| `core_vehicle_manager.getDebug()` | Indique si le mode debug de chargement des véhicules est actif. | 20 |
| `core_vehicle_manager.getPlayerVehicleData()` | Bundle de données du véhicule du joueur 0. | 248 |
| `core_vehicle_manager.getVehicleData(id)` | Bundle de données d'un véhicule (vdata jbeam, config, ioCtx…). | 252 |
| `core_vehicle_manager.liveUpdateVehicleColors(objID, _vehicleObj, index, paint)` | Change la peinture d'un emplacement sur l'objet véhicule (color, colorPalette0, colorPalette1 + données métalliques) sans respawn, puis émet onVehicleColorChanged(objID, index, paint). Ne fait rien si le véhicule n'a pas de config.paints. | 256 |
| `core_vehicle_manager.onClientEndMission()` | Hook : fin du niveau ; invalide le cache de matériaux chargés. *(interne)* *(hook)* | 52 |
| `core_vehicle_manager.onDeserialized(data)` | Hook : restaure les bundles encodés par onSerialize. *(interne)* *(hook)* | 296 |
| `core_vehicle_manager.onDespawnObject(id, isReloading)` | Hook : un objet véhicule est retiré. Oublie son bundle sauf s'il s'agit d'un rechargement (isReloading true). *(interne)* *(hook)* | 242 |
| `core_vehicle_manager.onEditorGui()` | Hook de l'éditeur : affiche un message d'obsolescence recommandant -debugVehicleLoading. *(interne)* *(hook)* | 333 |
| `core_vehicle_manager.onEditorInitialized()` | Hook de l'éditeur : enregistre la fenêtre obsolète « Vehicle Manager ». *(interne)* *(hook)* | 369 |
| `core_vehicle_manager.onFileChanged(filename, type)` | Hook : un fichier a changé. Prévient jbeam/io pour les .jbeam et invalide le cache de matériaux d'un dossier de véhicule si un .materials.json y change. *(interne)* *(hook)* | 63 |
| `core_vehicle_manager.onFilesChanged(files)` | Hook : fichiers modifiés ; prévient jbeam/loader. *(interne)* *(hook)* | 57 |
| `core_vehicle_manager.onSerialize()` | Hook : encode (lpack) les bundles avant rechargement Lua. *(interne)* *(hook)* | 304 |
| `core_vehicle_manager.onUpdate()` | Hook par frame : vide le cache de placement de spawn.lua. *(interne)* *(hook)* | 375 |
| `core_vehicle_manager.onVehicleSwitched(oldID, newID, player)` | Hook : le joueur change de véhicule. Met à jour activePlayer des bundles et relâche l'embrayage (input.event('clutch', 0, 0)) de l'ancien véhicule. *(interne)* *(hook)* | 229 |
| `core_vehicle_manager.queueAdditionalVehicleData(data, vehId)` | Prépare une table de données supplémentaires qui sera ajoutée à la config du prochain véhicule chargé (config.additionalVehicleData, retirée ensuite). Appelée par core_vehicles au spawn/remplacement. | 76 |
| `core_vehicle_manager.reloadAllVehicles()` | Recharge tous les véhicules (be:reloadAllVehicles). | 326 |
| `core_vehicle_manager.reloadVehicle(playerId)` | Recharge le véhicule d'un joueur : prévient core_vehicles.reloadVehicle puis be:reloadVehicle(playerId). | 319 |
| `core_vehicle_manager.setDebug(enabled)` | Active/désactive le debug de chargement (transmis dans additionalVehicleData.debugEnabled) et prévient l'UI (guihook debugSpawnChanged). | 24 |
| `core_vehicle_manager.setVehicleColorsNames(id, paintNames, optional)` | Applique jusqu'à 3 peintures nommées (de model.paints) à un véhicule, en direct. | 279 |
| `core_vehicle_manager.setVehiclePaintsNames(id, paintNames, optional)` | Alias de setVehicleColorsNames. | 279 |
| `core_vehicle_manager.spawnPhysicsForVehicle(objID, vehicleObj, vehicleBundle)` | Envoie au véhicule (vehicleObj:spawnPhysics) ses données de physique encodées (vdata + config) ; envoie un paquet vide si le bundle est absent. | 81 |
| `core_vehicle_manager.toggleDebug()` | Inverse le mode debug. | 29 |
| `core_vehicle_manager.toggleModifyKey()` | Affiche/masque la fenêtre d'édition en place des véhicules (core_vehicle_inplaceEdit). | 315 |

### Détail des paramètres

#### `core_vehicle_manager._spawnCCallback(objID, vehicleDir, configDataIn, reloading)`

Appelée par le moteur C++ quand un objet véhicule est créé ou rechargé : charge matériaux, config et jbeam (étape 1), notifie, fait entrer le joueur (autoEnterVehicle / autoEnterVehiclePlayer) et lance la physique. Émet le hook onSpawnCCallback(objID) et appelle vehicleSpawned(objID).

- `objID` (*integer*) : id de l'objet véhicule
- `vehicleDir` (*string*) : dossier du modèle (ex. '/vehicles/pickup/')
- `configDataIn` (*table|string*) : config reçue (partConfig du véhicule)
- `reloading` (*boolean*) : true lors d'un rechargement (non exploité dans le code)

#### `core_vehicle_manager.getDebug()`

Indique si le mode debug de chargement des véhicules est actif.

- **renvoie** : boolean état

#### `core_vehicle_manager.getPlayerVehicleData()`

Bundle de données du véhicule du joueur 0.

- **renvoie** : table|nil même structure que getVehicleData

#### `core_vehicle_manager.getVehicleData(id)`

Bundle de données d'un véhicule (vdata jbeam, config, ioCtx…).

- `id` (*integer*) : id du véhicule
- **renvoie** : table|nil bundle ; nil si le véhicule n'est pas connu

#### `core_vehicle_manager.liveUpdateVehicleColors(objID, _vehicleObj, index, paint)`

Change la peinture d'un emplacement sur l'objet véhicule (color, colorPalette0, colorPalette1 + données métalliques) sans respawn, puis émet onVehicleColorChanged(objID, index, paint). Ne fait rien si le véhicule n'a pas de config.paints.

- `objID` (*integer*) : id du véhicule
- `_vehicleObj` (*userdata|nil*) : objet véhicule (cherché si nil)
- `index` (*integer*) : emplacement 1, 2 ou 3
- `paint` (*table*) : peinture {baseColor, metallic, roughness, clearcoat, clearcoatRoughness}

#### `core_vehicle_manager.onDeserialized(data)`

Hook : restaure les bundles encodés par onSerialize.

- `data` (*table*) : données de onSerialize

#### `core_vehicle_manager.onDespawnObject(id, isReloading)`

Hook : un objet véhicule est retiré. Oublie son bundle sauf s'il s'agit d'un rechargement (isReloading true).

- `id` (*integer*) : véhicule
- `isReloading` (*boolean*) : true si rechargement

#### `core_vehicle_manager.onFileChanged(filename, type)`

Hook : un fichier a changé. Prévient jbeam/io pour les .jbeam et invalide le cache de matériaux d'un dossier de véhicule si un .materials.json y change.

- `filename` (*string*) : chemin
- `type` (*string*) : type de modification

#### `core_vehicle_manager.onFilesChanged(files)`

Hook : fichiers modifiés ; prévient jbeam/loader.

- `files` (*table*) : liste de fichiers modifiés

#### `core_vehicle_manager.onSerialize()`

Hook : encode (lpack) les bundles avant rechargement Lua.

- **renvoie** : table {vehicles, autoSpawnPhysics}

#### `core_vehicle_manager.onVehicleSwitched(oldID, newID, player)`

Hook : le joueur change de véhicule. Met à jour activePlayer des bundles et relâche l'embrayage (input.event('clutch', 0, 0)) de l'ancien véhicule.

- `oldID` (*integer*) : ancien véhicule
- `newID` (*integer*) : nouveau véhicule
- `player` (*integer*) : joueur

#### `core_vehicle_manager.queueAdditionalVehicleData(data, vehId)`

Prépare une table de données supplémentaires qui sera ajoutée à la config du prochain véhicule chargé (config.additionalVehicleData, retirée ensuite). Appelée par core_vehicles au spawn/remplacement.

- `data` (*table|nil*) : données ; nil annule
- `vehId` (*integer|nil*) : si donné, seul ce véhicule recevra les données

#### `core_vehicle_manager.reloadVehicle(playerId)`

Recharge le véhicule d'un joueur : prévient core_vehicles.reloadVehicle puis be:reloadVehicle(playerId).

- `playerId` (*integer*) : index du joueur

#### `core_vehicle_manager.setDebug(enabled)`

Active/désactive le debug de chargement (transmis dans additionalVehicleData.debugEnabled) et prévient l'UI (guihook debugSpawnChanged).

- `enabled` (*boolean*) : état voulu

#### `core_vehicle_manager.setVehicleColorsNames(id, paintNames, optional)`

Applique jusqu'à 3 peintures nommées (de model.paints) à un véhicule, en direct.

- `id` (*integer|nil*) : véhicule ; nil = joueur 0
- `paintNames` (*string[]*) : {nom1, nom2, nom3}
- `optional` (*any*) : si non nil, devait annuler l'action quand les 3 couleurs du véhicule sont identiques (inopérant, voir notes)

#### `core_vehicle_manager.setVehiclePaintsNames(id, paintNames, optional)`

Alias de setVehicleColorsNames.

- `id` (*integer|nil*) : véhicule ; nil = joueur 0
- `paintNames` (*string[]*) : noms de peintures
- `optional` (*any*) : voir setVehicleColorsNames

#### `core_vehicle_manager.spawnPhysicsForVehicle(objID, vehicleObj, vehicleBundle)`

Envoie au véhicule (vehicleObj:spawnPhysics) ses données de physique encodées (vdata + config) ; envoie un paquet vide si le bundle est absent.

- `objID` (*integer|nil*) : véhicule ; nil = joueur 0
- `vehicleObj` (*userdata|nil*) : objet véhicule (cherché si nil)
- `vehicleBundle` (*table|nil*) : bundle à envoyer (défaut : celui mémorisé)

## Champs

| Champ | Type | Description |
|---|---|---|
| `autoSpawnPhysics` | boolean | true par défaut ; si false, la physique n'est pas envoyée au véhicule après le chargement (spawnPhysicsForVehicle doit être appelée à la main). Aussi désactivé pour un véhicule dont NoPhysics == 'true'. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSpawnCCallback` — écouté par 3 module(s)
- `onVehicleColorChanged` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `VehicleChange`, `debugSpawnChanged`

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `FS:` `findFiles`
- `TorqueScriptLua.` `exec`
- `be:` `addObject`, `enterVehicle`, `getPlayerVehicleID`, `reloadAllVehicles`, `reloadVehicle`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/manager.lua`.*

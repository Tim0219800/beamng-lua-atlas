# `util_screenshotCreator_vehicleSetup`

*Fichier : `lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua` · VM : Game Engine (GE) · 157 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_vehicleSetup` : `extensions.load("util_screenshotCreator_vehicleSetup")`, puis la globale `util_screenshotCreator_vehicleSetup`

Mise en place physique du véhicule avant une vignette : le replace à l'endroit de départ (premier SpawnSphere du niveau, sinon une position de repli), applique la rotation de vignette configurée (thumbnailConfig.getRotation), l'aligne au sol et attend qu'il se stabilise. Fournit aussi des mesures du sol sous une boîte englobante (utilisées par le cadrage procédural) et l'allumage des feux de croisement.

## Remarques

- placeVehicleForThumbnail et waitForVehicleToSettle utilisent coroutine.yield : à appeler depuis une coroutine (celle de job.lua).
- Le véhicule est aligné par le coin arrière-droit de sa boîte sur le SpawnSphere ; pour les modèles inflated_mat et large_bridge la boîte est centrée sur le point d'apparition.
- La boîte du véhicule dans le monde (getSpawnWorldOOBB) ne suit une téléportation qu'après des pas de physique ; l'alignement utilise donc la boîte locale initialNodePosBB et la pose qui vient d'être fixée.
- Si une rotation de vignette est appliquée, la position et l'orientation d'origine sont mémorisées par véhicule pour getResetTransform ; elles sont oubliées quand le véhicule est réapparu (onVehicleSpawned).
- Délai de stabilisation : pauseDelay de la config s'il est > 0, sinon options.settleDelay, sinon 2 s.

**Dépendances (chargées avant) :** `util_screenshotCreator_thumbnailConfig`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_vehicleSetup.getFloorHeight(bb)` | Trouve la hauteur du sol sous une boîte englobante en lançant le rayon depuis le dessus de la boîte (utile pour les accessoires dont des nœuds sont enterrés, comme des bornes). Se replie sur le bas de la boîte si aucun sol n'est touché. | 46 |
| `util_screenshotCreator_vehicleSetup.getGroundHeight(position)` | Lance un rayon statique vers le bas (0,5 m au-dessus, 2 m en dessous) depuis la position donnée et renvoie la hauteur du sol, ou la hauteur de la position si le sol n'est pas trouvé ou est incohérent. | 29 |
| `util_screenshotCreator_vehicleSetup.getResetTransform(vehicle)` | Renvoie la position et la rotation à utiliser pour replacer le véhicule : celles d'origine mémorisées si une rotation de vignette avait été appliquée, sinon sa pose actuelle. | 96 |
| `util_screenshotCreator_vehicleSetup.getThumbnailSpawnTransform()` | Renvoie la position et la rotation du premier objet SpawnSphere de la scène, point de départ des vignettes. | 89 |
| `util_screenshotCreator_vehicleSetup.onVehicleSpawned(vehicleId)` | Hook appelé quand un véhicule apparaît : oublie la rotation de vignette mémorisée pour ce véhicule. *(interne)* *(hook)* | 149 |
| `util_screenshotCreator_vehicleSetup.placeVehicleForThumbnail(vehicle, configName, fallbackPosition, fallbackRotation)` | Réinitialise le véhicule (vehicle:reset), le téléporte sur le point de départ avec la rotation de vignette de la config, puis l'aligne au sol (deux coroutine.yield). | 102 |
| `util_screenshotCreator_vehicleSetup.setLowBeams(vehicle, enabled)` | Si enabled est vrai, envoie au véhicule electrics.setLightsState(1) (feux de croisement). Ne fait rien sinon. | 143 |
| `util_screenshotCreator_vehicleSetup.waitForVehicleToSettle(modelName, configName, options)` | Attend (en cédant la main à chaque frame) le temps de stabilisation du véhicule. | 135 |

### Détail des paramètres

#### `util_screenshotCreator_vehicleSetup.getFloorHeight(bb)`

Trouve la hauteur du sol sous une boîte englobante en lançant le rayon depuis le dessus de la boîte (utile pour les accessoires dont des nœuds sont enterrés, comme des bornes). Se replie sur le bas de la boîte si aucun sol n'est touché.

- `bb` (*table*) : OOBB avec getPoint(i) et getCenter().
- **renvoie** : number Hauteur Z du sol en mètres.

#### `util_screenshotCreator_vehicleSetup.getGroundHeight(position)`

Lance un rayon statique vers le bas (0,5 m au-dessus, 2 m en dessous) depuis la position donnée et renvoie la hauteur du sol, ou la hauteur de la position si le sol n'est pas trouvé ou est incohérent.

- `position` (*vec3*) : Position monde.
- **renvoie** : number Hauteur Z du sol en mètres.

#### `util_screenshotCreator_vehicleSetup.getResetTransform(vehicle)`

Renvoie la position et la rotation à utiliser pour replacer le véhicule : celles d'origine mémorisées si une rotation de vignette avait été appliquée, sinon sa pose actuelle.

- `vehicle` (*table*) : Objet véhicule.
- **renvoie** : vec3 Position.
- **renvoie** : quat Rotation.

#### `util_screenshotCreator_vehicleSetup.getThumbnailSpawnTransform()`

Renvoie la position et la rotation du premier objet SpawnSphere de la scène, point de départ des vignettes.

- **renvoie** : vec3|nil Position, nil s'il n'y a pas de SpawnSphere.
- **renvoie** : quat|nil Rotation.

#### `util_screenshotCreator_vehicleSetup.onVehicleSpawned(vehicleId)`

Hook appelé quand un véhicule apparaît : oublie la rotation de vignette mémorisée pour ce véhicule.

- `vehicleId` (*integer*) : Identifiant du véhicule.

#### `util_screenshotCreator_vehicleSetup.placeVehicleForThumbnail(vehicle, configName, fallbackPosition, fallbackRotation)`

Réinitialise le véhicule (vehicle:reset), le téléporte sur le point de départ avec la rotation de vignette de la config, puis l'aligne au sol (deux coroutine.yield).

- `vehicle` (*table*) : Objet véhicule.
- `configName` (*string*) : Nom de la configuration (pour la rotation de vignette).
- `fallbackPosition` (*vec3|nil*) : Position utilisée s'il n'y a pas de SpawnSphere.
- `fallbackRotation` (*quat|nil*) : Rotation utilisée s'il n'y a pas de SpawnSphere.

#### `util_screenshotCreator_vehicleSetup.setLowBeams(vehicle, enabled)`

Si enabled est vrai, envoie au véhicule electrics.setLightsState(1) (feux de croisement). Ne fait rien sinon.

- `vehicle` (*table*) : Objet véhicule.
- `enabled` (*boolean*) : Allumer les feux.

#### `util_screenshotCreator_vehicleSetup.waitForVehicleToSettle(modelName, configName, options)`

Attend (en cédant la main à chaque frame) le temps de stabilisation du véhicule.

- `modelName` (*string*) : Nom du modèle.
- `configName` (*string*) : Nom de la configuration.
- `options` (*table|nil*) : {settleDelay = secondes} (défaut 2).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extension chargée avant : util_screenshotCreator_thumbnailConfig. |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/vehicleSetup.lua`.*

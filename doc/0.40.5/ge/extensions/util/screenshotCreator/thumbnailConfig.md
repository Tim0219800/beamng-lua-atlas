# `util_screenshotCreator_thumbnailConfig`

*Fichier : `lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_thumbnailConfig` : `extensions.load("util_screenshotCreator_thumbnailConfig")`, puis la globale `util_screenshotCreator_thumbnailConfig`

Lecture et écriture de la configuration de vignette (clé thumbnailConfig) d'un véhicule : elle est stockée dans /vehicles/<modèle>/info_<config>.json pour une configuration, et dans /vehicles/<modèle>/info.json pour le modèle. Elle contient notamment rotation (degrés, rotation du repère de caméra autour de l'axe vertical), pauseDelay (secondes d'attente avant capture) et des caméras enregistrées (configCamEnabled, modelCamEnabled). Le module fournit aussi les axes de référence du véhicule (niveau et orientés selon la rotation) et les conversions décalage de caméra <-> repère véhicule utilisées pour enregistrer et rejouer une caméra.

## Remarques

- La configuration d'une config prime sur celle du modèle pour rotation et pauseDelay ; valeurs par défaut 0.
- getCameraConfig renvoie vehCamConfig = {configCamEnabled = false, modelCamEnabled = false} si aucune config de vignette n'existe pour la config.
- Les fonctions de lecture supposent que core_vehicles.getModel(modelName) renvoie une table ; un modèle inconnu peut provoquer une erreur Lua en accédant à modelData.configs.
- getLevelAxes redresse les axes de la boîte du véhicule à l'horizontale (le cap est conservé) pour qu'un véhicule incliné à l'apparition n'incline pas la caméra.

**Dépendances (chargées avant) :** `core_camera`, `core_vehicles`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_thumbnailConfig.getCameraConfig(modelName, configName)` | Récupère les configs de vignette d'une configuration et de son modèle (en relisant le fichier info_<config>.json si elle n'est pas en mémoire). | 54 |
| `util_screenshotCreator_thumbnailConfig.getCameraOffsets(configName, vehicle)` | Convertit la position et l'orientation de la caméra actuelle en décalages relatifs au véhicule (dans ses axes de référence) pour pouvoir les enregistrer. | 116 |
| `util_screenshotCreator_thumbnailConfig.getLevelAxes(bb)` | Calcule des axes orthonormés à partir de la boîte du véhicule : cap horizontal (axe 1), droite et haut du monde. | 95 |
| `util_screenshotCreator_thumbnailConfig.getPauseDelay(modelName, configName)` | Renvoie le délai d'attente avant capture en secondes (config, sinon modèle, sinon 0), jamais négatif. | 83 |
| `util_screenshotCreator_thumbnailConfig.getReferenceAxes(vehicle, configName, boundingBox)` | Renvoie les axes de référence du véhicule pour la caméra : axes redressés par getLevelAxes, tournés de -rotation degrés autour de l'axe vertical si une rotation est configurée. | 104 |
| `util_screenshotCreator_thumbnailConfig.getRotation(modelName, configName)` | Renvoie la rotation de caméra (en degrés) : celle de la config, sinon celle du modèle, sinon 0. | 72 |
| `util_screenshotCreator_thumbnailConfig.rewindCameraOffsets(posOffset, rotOffset, vehicle, configName)` | Opération inverse de getCameraOffsets : reconstruit la position et l'orientation monde de la caméra pour le véhicule à partir de décalages enregistrés. | 132 |
| `util_screenshotCreator_thumbnailConfig.saveModelConfig(modelName, config)` | Enregistre la config de vignette du modèle dans /vehicles/<modèle>/info.json et met à jour la donnée en mémoire. | 41 |
| `util_screenshotCreator_thumbnailConfig.saveVehicleConfig(modelName, configName, config)` | Enregistre la config de vignette d'une configuration dans son fichier info (infoFilename connu, sinon /vehicles/<modèle>/info_<config>.json) et met à jour la donnée en mémoire. | 27 |

### Détail des paramètres

#### `util_screenshotCreator_thumbnailConfig.getCameraConfig(modelName, configName)`

Récupère les configs de vignette d'une configuration et de son modèle (en relisant le fichier info_<config>.json si elle n'est pas en mémoire).

- `modelName` (*string*) : Nom du modèle.
- `configName` (*string*) : Nom de la configuration.
- **renvoie** : table {vehCamConfig = table, modelCamConfig = table|nil}.

#### `util_screenshotCreator_thumbnailConfig.getCameraOffsets(configName, vehicle)`

Convertit la position et l'orientation de la caméra actuelle en décalages relatifs au véhicule (dans ses axes de référence) pour pouvoir les enregistrer.

- `configName` (*string|nil*) : Nom de la configuration.
- `vehicle` (*table|nil*) : Objet véhicule (défaut : véhicule du joueur 0).
- **renvoie** : vec3 Décalage de position dans le repère du véhicule.
- **renvoie** : quat Orientation de la caméra dans le repère du véhicule.

#### `util_screenshotCreator_thumbnailConfig.getLevelAxes(bb)`

Calcule des axes orthonormés à partir de la boîte du véhicule : cap horizontal (axe 1), droite et haut du monde.

- `bb` (*table*) : Boîte englobante orientée (OOBB) avec getAxis(i).
- **renvoie** : vec3 Axe droite.
- **renvoie** : vec3 Axe avant (horizontal).
- **renvoie** : vec3 Axe haut (0, 0, 1).

#### `util_screenshotCreator_thumbnailConfig.getPauseDelay(modelName, configName)`

Renvoie le délai d'attente avant capture en secondes (config, sinon modèle, sinon 0), jamais négatif.

- `modelName` (*string*) : Nom du modèle.
- `configName` (*string*) : Nom de la configuration.
- **renvoie** : number Délai en secondes (>= 0).

#### `util_screenshotCreator_thumbnailConfig.getReferenceAxes(vehicle, configName, boundingBox)`

Renvoie les axes de référence du véhicule pour la caméra : axes redressés par getLevelAxes, tournés de -rotation degrés autour de l'axe vertical si une rotation est configurée.

- `vehicle` (*table*) : Objet véhicule.
- `configName` (*string|nil*) : Nom de la configuration (pour lire la rotation).
- `boundingBox` (*table|nil*) : OOBB déjà calculée ; sinon vehicle:getSpawnWorldOOBB().
- **renvoie** : vec3 Axe droite.
- **renvoie** : vec3 Axe avant.
- **renvoie** : vec3 Axe haut.

#### `util_screenshotCreator_thumbnailConfig.getRotation(modelName, configName)`

Renvoie la rotation de caméra (en degrés) : celle de la config, sinon celle du modèle, sinon 0.

- `modelName` (*string*) : Nom du modèle.
- `configName` (*string*) : Nom de la configuration.
- **renvoie** : number Rotation en degrés.

#### `util_screenshotCreator_thumbnailConfig.rewindCameraOffsets(posOffset, rotOffset, vehicle, configName)`

Opération inverse de getCameraOffsets : reconstruit la position et l'orientation monde de la caméra pour le véhicule à partir de décalages enregistrés.

- `posOffset` (*vec3*) : Décalage de position enregistré.
- `rotOffset` (*quat*) : Orientation enregistrée.
- `vehicle` (*table|nil*) : Objet véhicule (défaut : véhicule du joueur 0).
- `configName` (*string|nil*) : Nom de la configuration.
- **renvoie** : vec3 Position monde de la caméra.
- **renvoie** : quat Orientation monde de la caméra.

#### `util_screenshotCreator_thumbnailConfig.saveModelConfig(modelName, config)`

Enregistre la config de vignette du modèle dans /vehicles/<modèle>/info.json et met à jour la donnée en mémoire.

- `modelName` (*string*) : Nom du modèle.
- `config` (*table*) : Table thumbnailConfig à enregistrer.
- **renvoie** : boolean Succès de l'écriture.

#### `util_screenshotCreator_thumbnailConfig.saveVehicleConfig(modelName, configName, config)`

Enregistre la config de vignette d'une configuration dans son fichier info (infoFilename connu, sinon /vehicles/<modèle>/info_<config>.json) et met à jour la donnée en mémoire.

- `modelName` (*string*) : Nom du modèle.
- `configName` (*string*) : Nom de la configuration.
- `config` (*table*) : Table thumbnailConfig à enregistrer.
- **renvoie** : boolean false si le fichier existant est illisible ou si l'écriture échoue.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : core_camera et core_vehicles. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua`.*

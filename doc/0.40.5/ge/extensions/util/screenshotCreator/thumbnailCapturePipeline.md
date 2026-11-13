# `util_screenshotCreator_thumbnailCapturePipeline`

*Fichier : `lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua` · VM : Game Engine (GE) · 137 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_thumbnailCapturePipeline` : `extensions.load("util_screenshotCreator_thumbnailCapturePipeline")`, puis la globale `util_screenshotCreator_thumbnailCapturePipeline`

Chaîne de capture d'une vignette de véhicule utilisée par le compositeur de vignettes (thumbnailComposerRun) : remplace le véhicule par la configuration voulue, le place et le laisse se stabiliser, gèle la physique, calcule la caméra avec le cadrage « legacy » (angle « warehouse », marges réduites à 85 %), pointe la caméra principale sur la prise de vue, règle l'éclairage, attend 2 s puis capture l'image avec util_screenshotCreator_capture.captureFramedThumbnail. Contrairement à job.lua, les caméras enregistrées par config ou modèle sont ignorées. processWorkItem doit être appelé depuis une coroutine, car il fait des yield.

## Remarques

- processWorkItem utilise coroutine.yield (attentes de 0,7 s et de 2 s) : à appeler uniquement dans une coroutine.
- Le mode de capture « defaults » écrit default.jpg pour la config par défaut ; avec « all », la vignette de la config par défaut est aussi copiée en default.jpg (voir thumbnailPaths).
- La caméra principale est mise en vue libre et son état d'origine est mémorisé (une seule fois) ; resetRenderState() le restaure. Il faut l'appeler à la fin ou en cas d'annulation.
- Le FOV transmis à la capture est framingContext.fieldOfView (réglage utilisateur) alors que le mode legacy cadre avec un FOV fixe de 20° : le FOV réglé doit rester à 20 pour un cadrage cohérent.

**Dépendances (chargées avant) :** `core_vehicles`, `core_camera`, `util_screenshotCreator_settings`, `util_screenshotCreator_vehicleSetup`, `util_screenshotCreator_capture`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_framing_legacy`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_thumbnailPaths`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_thumbnailCapturePipeline.processWorkItem(item, index, total, settingsSnapshot, runContext, options)` | Traite un élément de la file : remplace le véhicule, le place, attend sa stabilisation, gèle la physique, cadre, éclaire, capture et restaure l'éclairage. Renvoie un résultat {status = "saved", current, camera, outputFolder, outputPath} ou {status = "failed", error}, ou nil si l'annulation a été demandée. | 65 |
| `util_screenshotCreator_thumbnailCapturePipeline.resetRenderState()` | Restaure la caméra principale mémorisée par pointMainCameraAt et l'éclairage (lightingSetup.restore). | 128 |
| `util_screenshotCreator_thumbnailCapturePipeline.resolveCamera(vehicle, modelName, configName, outputResolution)` | Calcule la caméra de cadrage « warehouse angle » : contexte de cadrage issu des réglages, mode « legacy », marges multipliées par 0,85. Journalise une erreur et renvoie nil si le cadrage échoue. | 45 |

### Détail des paramètres

#### `util_screenshotCreator_thumbnailCapturePipeline.processWorkItem(item, index, total, settingsSnapshot, runContext, options)`

Traite un élément de la file : remplace le véhicule, le place, attend sa stabilisation, gèle la physique, cadre, éclaire, capture et restaure l'éclairage. Renvoie un résultat {status = "saved", current, camera, outputFolder, outputPath} ou {status = "failed", error}, ou nil si l'annulation a été demandée.

- `item` (*table*) : Élément {modelName, modelKey, configName, isDefaultConfig...}.
- `index` (*integer*) : Rang de l'élément (à partir de 1).
- `total` (*integer*) : Nombre total d'éléments.
- `settingsSnapshot` (*table*) : Instantané des réglages : capture {superSampling, freezePhysics...}, captureTimeout.
- `runContext` (*table*) : {initialPosition, initialRotation} : transformation de départ du véhicule.
- `options` (*table*) : {sendProgress = function(fait, total, courant), isCancelled = function, outputResolution, captureMode}.
- **renvoie** : table|nil Résultat de l'élément ; nil si annulé.

#### `util_screenshotCreator_thumbnailCapturePipeline.resolveCamera(vehicle, modelName, configName, outputResolution)`

Calcule la caméra de cadrage « warehouse angle » : contexte de cadrage issu des réglages, mode « legacy », marges multipliées par 0,85. Journalise une erreur et renvoie nil si le cadrage échoue.

- `vehicle` (*table*) : Objet véhicule.
- `modelName` (*string*) : Nom du modèle.
- `configName` (*string*) : Nom de la configuration.
- `outputResolution` (*integer[]|nil*) : {largeur, hauteur} de l'image finale.
- **renvoie** : table|nil Caméra {pos, rot, fov, name, ...} ou nil.
- **renvoie** : table|nil Contexte de cadrage utilisé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : core_vehicles, core_camera et util_screenshotCreator_settings, vehicleSetup, capture, lightingSetup, framing_legacy, framingManager, thumbnailPaths. |

## Appels vers le moteur (C++)

- `FS:` `copyFile`
- `be:` `getPhysicsRunning`, `setPhysicsRunning`, `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua`.*

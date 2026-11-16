# `util_screenshotCreator_job`

*Fichier : `lua/ge/extensions/util/screenshotCreator/job.lua` · VM : Game Engine (GE) · 860 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_job` : `extensions.load("util_screenshotCreator_job")`, puis la globale `util_screenshotCreator_job`

Orchestrateur du créateur de vignettes (thumbnails) de véhicules. Il lance, dans une coroutine pilotée par onPreRender, la boucle complète : remplacer/placer le véhicule, le laisser se stabiliser, geler la physique, calculer la caméra (cadrage via framingManager ou caméra enregistrée), ajuster l'éclairage, attendre 2 s, capturer l'image avec util_screenshotCreator_capture, vérifier le fichier produit puis restaurer l'environnement et la physique. Il gère aussi l'aperçu de la caméra (startPreview) et expose la progression et le compte rendu pour l'interface. Un moddeur l'utilise pour générer en lot les images vehicles/<modèle>/<config>.jpg.

## Exemple

```lua
util_screenshotCreator_job.startWork({selection = 'selectedModels', onlyMissingThumbnails = true})
-- puis, à chaque frame de l'UI :
local p = util_screenshotCreator_job.getProgress() -- {completed, total, current}
if util_screenshotCreator_job.consumeRunDone() then dump(util_screenshotCreator_job.getReviewData()) end
```

## Remarques

- Le travail avance d'un pas de coroutine par appel de onPreRender ; un seul travail à la fois (startWork et startPreview renvoient false si une coroutine existe déjà).
- Options de startWork : selection (« selectedModels » par défaut, « selectedModelDefaults », ou nom de config pour le véhicule courant), targets (liste {model, config}, max 2000), onlyMissingThumbnails, shippedConfigsOnly (vrai par défaut sauf si shippedOnly == false), lowBeamsEnabled, sample (écrit dans screenshots/thumbnailSamples/<date>/), comparison (copie la vignette existante en *_existing), cameraOverridePolicy (« useSaved » ou « ignore »), framingModeId, vehicleId, configName, outputPath, onDoneHook (nom d'évènement guihooks déclenché à la fin).
- Dossier de sortie : vehicles/ par défaut (vehicles/<modèle>/<config><ext>), screenshots/showroom/ si le réglage de destination vaut 1 ; pour le véhicule courant, dans son vehicleDirectory. Si la config est celle par défaut (hors mode sample), la vignette est aussi copiée en vehicles/<modèle>/default<ext>.
- La physique est gelée pendant le cadrage et la capture ; son état (running, speedFactor) est sauvegardé puis restauré à la fin ou lors du déchargement de l'extension.
- Une capture échouée met forceQuit : le lot s'arrête (abortRun) sauf si c'était le dernier élément. Délai d'attente de la capture : 5 s, puis 2 s d'attente du fichier.
- En ligne de commande, si les arguments contiennent deux fois -onLevelLoad_ext / 'util/createThumbnails', le jeu est fermé (shutdown(0)) à la fin du travail.
- Les véhicules sont remplacés par core_vehicles.replaceVehicle (plaque « BeamNG »), frein de stationnement serré et moteur coupé.

**Dépendances (chargées avant) :** `core_camera`, `core_vehicles`, `core_vehicle_manager`, `ui_vehicleSelector_general`, `util_screenshotCreator_settings`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_vehicleSetup`, `util_screenshotCreator_capture`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_framing_configured`, `util_screenshotCreator_framingManager`, `util_screenshotCreator_modelSelection`, `util_screenshotCreator_shippedConfigs`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_job.clearRunDone()` | Remet l'indicateur « travail terminé » à false sans le lire. | 810 |
| `util_screenshotCreator_job.consumeRunDone()` | Lit puis remet à false l'indicateur « travail terminé ». | 804 |
| `util_screenshotCreator_job.getProgress()` | Renvoie la progression du travail. | 846 |
| `util_screenshotCreator_job.getReviewData()` | Renvoie le compte rendu du dernier travail. | 847 |
| `util_screenshotCreator_job.isCameraSet()` | Indique si un aperçu a déplacé la caméra (cameraSet). | 851 |
| `util_screenshotCreator_job.isRunning()` | Indique si une coroutine de travail existe. | 845 |
| `util_screenshotCreator_job.onClientEndMission()` | Hook appelé à la fin de la mission/niveau ; même fonction que onExtensionUnloaded. *(interne)* *(hook)* | 833 |
| `util_screenshotCreator_job.onDeserialized(data)` | Hook appelé après rechargement avec l'état sérialisé. *(interne)* *(hook)* | 824 |
| `util_screenshotCreator_job.onExit()` | Hook appelé à la fermeture du jeu ; même fonction que onExtensionUnloaded. *(interne)* *(hook)* | 833 |
| `util_screenshotCreator_job.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension : arrête le travail, restaure l'éclairage, les réglages et l'état de la physique. Aussi utilisé comme onClientEndMission et onExit. *(interne)* *(hook)* | 833 |
| `util_screenshotCreator_job.onPreRender()` | Hook appelé à chaque frame avant le rendu : fait avancer la coroutine de travail. En cas d'erreur Lua, la trace est journalisée et le travail est abandonné ; à la fin, l'éclairage et la physique sont restaurés. *(interne)* *(hook)* | 785 |
| `util_screenshotCreator_job.onSerialize()` | Hook appelé avant un rechargement des extensions : renvoie progress, review, runDone, previousFov et cameraSet. La coroutine n'est pas sauvegardée. *(interne)* *(hook)* | 814 |
| `util_screenshotCreator_job.resetCamera()` | Rend la caméra du joueur au mode « orbit » et restaure le FOV mémorisé avant l'aperçu (60 par défaut). | 117 |
| `util_screenshotCreator_job.startPreview(vehicle, configName, modeOrOptions, fixedRotation)` | Place le véhicule comme pour une vignette, attend qu'il se stabilise puis positionne la caméra libre du joueur sur le cadrage calculé, sans capturer d'image. Renvoie false si un travail tourne ou si vehicle est nil. | 765 |
| `util_screenshotCreator_job.startPreviewWithDelay(vehicle, configName, modeOrOptions, fixedRotation)` | Comme startPreview, mais pour les véhicules dont thumbnailConfig.getPauseDelay est > 0 : la physique tourne pendant ce délai avant le gel. Renvoie false si le modèle est inconnu ou si le délai est nul. | 769 |
| `util_screenshotCreator_job.startWork(workOptions)` | Démarre la génération de vignettes. Normalise les options, construit la liste des éléments (modèles sélectionnés, cibles explicites ou véhicule courant), prend le contrôle de la physique, active les réglages d'environnement (settings.beginWork) et crée la coroutine de travail. Renvoie false si un travail est déjà en cours, si les cibles sont invalides ou si l'API de physique manque. | 654 |
| `util_screenshotCreator_job.stop()` | Demande l'arrêt du travail en cours (forceQuit) ; la coroutine s'arrête à son prochain point de contrôle. | 779 |

### Détail des paramètres

#### `util_screenshotCreator_job.consumeRunDone()`

Lit puis remet à false l'indicateur « travail terminé ».

- **renvoie** : boolean true une seule fois après la fin d'un travail (ou d'un échec au démarrage faute de véhicule).

#### `util_screenshotCreator_job.getProgress()`

Renvoie la progression du travail.

- **renvoie** : table {completed = integer, total = integer, current = string « modèle/config »}.

#### `util_screenshotCreator_job.getReviewData()`

Renvoie le compte rendu du dernier travail.

- **renvoie** : table|nil {onlyMissingThumbnails, shippedConfigsOnly, lowBeamsEnabled, selection, framingModeId, cameraOverridePolicy, sampleOutputFolder, configs = [{vehName, camName, status (done/failed/skipped), thumbnailPath}]} ; nil avant tout travail.

#### `util_screenshotCreator_job.isCameraSet()`

Indique si un aperçu a déplacé la caméra (cameraSet).

- **renvoie** : boolean true tant que resetCamera n'a pas été appelé.

#### `util_screenshotCreator_job.isRunning()`

Indique si une coroutine de travail existe.

- **renvoie** : boolean true pendant un travail ou un aperçu.

#### `util_screenshotCreator_job.onDeserialized(data)`

Hook appelé après rechargement avec l'état sérialisé.

- `data` (*table*) : État renvoyé par onSerialize.

#### `util_screenshotCreator_job.onSerialize()`

Hook appelé avant un rechargement des extensions : renvoie progress, review, runDone, previousFov et cameraSet. La coroutine n'est pas sauvegardée.

- **renvoie** : table État à restaurer.

#### `util_screenshotCreator_job.startPreview(vehicle, configName, modeOrOptions, fixedRotation)`

Place le véhicule comme pour une vignette, attend qu'il se stabilise puis positionne la caméra libre du joueur sur le cadrage calculé, sans capturer d'image. Renvoie false si un travail tourne ou si vehicle est nil.

- `vehicle` (*table*) : Objet véhicule.
- `configName` (*string*) : Nom de la configuration.
- `modeOrOptions` (*string|table|nil*) : Id du mode de cadrage, ou table d'options {framingModeId, fixedRotation, delayedPreview}.
- `fixedRotation` (*quat|nil*) : Rotation de caméra imposée (ignoré si modeOrOptions est une table).
- **renvoie** : boolean true si l'aperçu a démarré.

#### `util_screenshotCreator_job.startPreviewWithDelay(vehicle, configName, modeOrOptions, fixedRotation)`

Comme startPreview, mais pour les véhicules dont thumbnailConfig.getPauseDelay est > 0 : la physique tourne pendant ce délai avant le gel. Renvoie false si le modèle est inconnu ou si le délai est nul.

- `vehicle` (*table*) : Objet véhicule.
- `configName` (*string*) : Nom de la configuration.
- `modeOrOptions` (*string|table|nil*) : Id du mode de cadrage ou table d'options.
- `fixedRotation` (*quat|nil*) : Rotation de caméra imposée.
- **renvoie** : boolean true si l'aperçu a démarré.

#### `util_screenshotCreator_job.startWork(workOptions)`

Démarre la génération de vignettes. Normalise les options, construit la liste des éléments (modèles sélectionnés, cibles explicites ou véhicule courant), prend le contrôle de la physique, active les réglages d'environnement (settings.beginWork) et crée la coroutine de travail. Renvoie false si un travail est déjà en cours, si les cibles sont invalides ou si l'API de physique manque.

- `workOptions` (*table|nil*) : Options du travail (voir notes). Si ce n'est pas une table : selection = « selectedModels », onlyMissingThumbnails = false.
- **renvoie** : boolean true si le travail a démarré.

#### `util_screenshotCreator_job.stop()`

Demande l'arrêt du travail en cours (forceQuit) ; la coroutine s'arrête à son prochain point de contrôle.

- **renvoie** : boolean false s'il n'y a pas de travail en cours, sinon true.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : core_camera, core_vehicles, core_vehicle_manager, ui_vehicleSelector_general et plusieurs util_screenshotCreator_* (settings, thumbnailConfig, vehicleSetup, capture, lightingSetup, framing_configured, framingManager, modelSelection, shippedConfigs). |

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `FS:` `copyFile`, `directoryCreate`, `fileExists`, `fileSize`, `removeFile`
- `be:` `getPhysicsRunning`, `getPhysicsSpeedFactor`, `setPhysicsRunning`, `setPhysicsSpeedFactor`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/job.lua`.*

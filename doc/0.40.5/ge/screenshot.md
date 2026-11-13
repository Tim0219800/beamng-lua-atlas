# `screenshot`

*Fichier : `lua/ge/screenshot.lua` · VM : Game Engine (GE) · 1376 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `screenshot`

Prise de captures d'écran côté Game Engine. Il prépare le nom de fichier (dossier screenshots/<mois>/screenshot_<date>), les options de qualité (super-échantillonnage, mise à l'échelle), les métadonnées (niveau, véhicules, partage), et lance la capture via le moteur (createScreenshot2). Il suit chaque capture comme un « job » (file, en cours, sauvegarde, terminé, erreur) et prévient l'interface. Il gère aussi l'envoi vers le serveur de médias BeamNG, la liste des dernières photos du mode photo et le retour des réglages graphiques après une capture haute qualité.

## Exemple

```lua
screenshot.takeScreenShot()            -- capture normale
screenshot.takeBigScreenShot()         -- 2x linéaire (4x pixels)
screenshot.takeCustomScreenShot(4, 1)  -- supersampling 4, rescale 1
```

## Remarques

- Les fonctions takeXxxScreenShot acceptent des arguments positionnels flexibles : (splitSceneVehicle, saveNormalDepth, options...) ou, si le premier argument est une table, les booléens sont lus aux positions c et d. Une table passée en dernière ou avant-dernière position est interprétée comme 'options' (callOrigin, upload, jsonMetaData, includeMetadata, persistMetadataSidecar, forceSidecar).
- Le super-échantillonnage est le multiplicateur TOTAL de pixels (1 = natif, 4 = 2x linéaire, 9 = 3x linéaire). Il est borné par un budget GPU (getMaxSafeScreenshotSuperSampling) : Big 4, Huge 9, Custom/MotionBlur jusqu'à 24. Les valeurs élevées peuvent bloquer ou faire planter certains pilotes GPU.
- À partir d'un super-échantillonnage >= 9 (highest), le module passe temporairement $pref::TS::detailAdjust à 20, $pref::Terrain::lodScale à 0.001 et l'échelle des herbes à 8 ; avec super-échantillonnage > 1 il règle aussi la couche de nuages volumétriques (étapes 256). screenshotAllDone remet les valeurs d'origine.
- Une seule capture à la fois : doScreenshot, takeBig et takeHuge sortent si captureInProgress est vrai (log 'ignoring screenshot capture'). captureInProgress est remis à false par screenshotAllDone. takeScreenShot, takeCustom et takeMotionBlur ne testent pas ce verrou.
- takeMotionBlurScreenShot appelle exactement le même code que takeCustomScreenShot : aucun traitement de flou de mouvement n'y est visible.
- Les formats de fichier viennent du réglage settings 'screenshotFormat' (png par défaut, jpg/jpeg possible). doScreenshot peut recevoir un chemin et une extension imposés.
- Les fonctions screenshotProgress, screenshotTaken, screenshotSaved, screenshotUploaded et screenshotAllDone sont appelées par le moteur C++ ; ne pas les appeler soi-même.
- Les phases d'un job (champ phase) : 'queue' -> 'in progress' -> 'saving' -> 'done' ou 'error'. result == 0 signifie succès.
- L'envoi (publish) est refusé si le réglage onlineFeatures n'est pas 'enable'. doSteamScreenshot demande aussi onlineFeatures, mais prend en photo puis appelle OnlineServiceProvider.triggerScreenshot().
- Le module écrit aussi un fichier annexe (sidecar) ou une métadonnée intégrée à l'image (writeScreenshotEmbeddedMetadata) avec level, véhicules, lien de partage, utilisés par getPhotomodeRollEntries.
- Champs créés dynamiquement : hqActive, cloudHqActive, sc_detailAdjustSaved, sc_lodScaleSaved, sc_GroundCoverScaleSaved, sc_cloudDownsampleSaved, sc_cloudStepCountSaved, sc_cloudSunShadowStepCountSaved (état sauvegardé pendant une capture haute qualité).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `screenshot.clearScreenshotJobs()` | Oublie tous les jobs de capture (listes, métadonnées, envois en attente), remet hqActive à false et prévient l'interface. | 1131 |
| `screenshot.createScreenshotTracked(p)` | Crée une capture dans le moteur (createScreenshot2) à partir d'une copie de la table de paramètres et enregistre le job pour le suivi (filename, bufferType, type, métadonnées, upload). Positionne captureInProgress. | 114 |
| `screenshot.doScreenshot(batchTag, upload, path, ext, options)` | Prend une capture simple (échelle 1, un seul tile) avec nom de fichier unique 'screenshot_<date>[_n]'. Si path et ext sont fournis, utilise ce chemin et ignore upload et batchTag. Joint les métadonnées si demandé ou si upload. | 512 |
| `screenshot.doSteamScreenshot(options)` | Prend une capture puis demande au fournisseur de services en ligne (Steam) de déclencher sa capture. Refusé si onlineFeatures n'est pas 'enable'. | 585 |
| `screenshot.getPhotomodeRollEntries(limit)` | Liste les dernières captures principales du mode photo (fichiers 'screenshot_AAAAMMJJ_HHMMSS', hors _scene/_vehicle/_normal/_depth), les plus récentes d'abord, avec lien de partage et métadonnées lus dans le fichier annexe ou la métadonnée intégrée. | 715 |
| `screenshot.getPhotomodeRollEntriesJson(limit)` | Même résultat que getPhotomodeRollEntries mais encodé en chaîne JSON, pour l'interface (les tables ne passent pas toujours bien vers Angular/CEF). | 764 |
| `screenshot.getScreenshotCompletion(id)` | Renvoie l'état final d'un job de capture, seulement s'il est terminé ('done') ou en erreur ('error'). | 1068 |
| `screenshot.getScreenshotJobsSnapshotJson()` | Instantané des jobs en cours sous forme de JSON : id, runId, percent, message, phase, result, filename, bufferType, type, metadata, openMap. | 768 |
| `screenshot.isDebugTracingEnabled()` | Indique si les logs de trace '[Trace]' du module sont activés. | 1360 |
| `screenshot.openScreenshotFileInExplorer(filePath)` | Ouvre l'explorateur de fichiers du système sur une capture. Ne fait rien (avec un avertissement) si le fichier n'existe pas ou si le chemin est vide. | 605 |
| `screenshot.openScreenshotsFolderInExplorer()` | Crée si besoin le dossier screenshots/<mois> et l'ouvre dans l'explorateur de fichiers. | 595 |
| `screenshot.publish(batchTag, options)` | Prend une capture et l'envoie au serveur de médias BeamNG. Refusé avec un toast d'erreur si onlineFeatures n'est pas 'enable'. | 576 |
| `screenshot.runPhotomodeFlashCapture(kind, ...)` | Point d'entrée unique des anciens callbacks d'interface du mode photo : charge l'extension util/photomodeFlash et appelle util_photomodeFlash.runCapture(kind, ...). | 1341 |
| `screenshot.screenshotAllDone()` | Appelée par le moteur quand tous les jobs d'une série sont finis : remet les réglages graphiques et nuages d'origine, libère les noms de fichiers réservés, remet captureInProgress à false, émet le hook onScreenshotAllDone et l'évènement UI ScreenshotJobsAllDone. *(interne)* | 1161 |
| `screenshot.screenshotProgress(id, percent, message)` | Appelée par le moteur : met à jour le pourcentage et le message d'un job (phase 'in progress') et prévient l'interface. *(interne)* | 1142 |
| `screenshot.screenshotSaved(id, res, filename)` | Appelée par le moteur quand l'image est écrite sur disque. res == 0 : succès (phase 'done', 100 %, écriture du fichier annexe de métadonnées si prévu) ; sinon phase 'error'. *(interne)* | 1016 |
| `screenshot.screenshotTaken(id)` | Appelée par le moteur quand l'image est capturée côté GPU mais pas encore écrite : passe le job en phase 'saving'. *(interne)* | 1120 |
| `screenshot.screenshotUploaded(id, result, _adminUrl, shareUrl)` | Appelée par le moteur à la fin d'un envoi : écrit le lien de partage dans le fichier annexe, notifie l'interface (ScreenshotUploadComplete) et affiche un toast de succès ou d'échec (result == 0 = succès). *(interne)* | 1079 |
| `screenshot.setDebugTracingEnabled(value)` | Active ou désactive les logs de trace du module. | 1359 |
| `screenshot.takeBigScreenShot(a, b, c, d)` | Capture « Big » : super-échantillonnage 4 (2x linéaire, 4x pixels). Un écran 1080p donne une image 4K. Ignorée si une capture est déjà en cours. | 1270 |
| `screenshot.takeCustomScreenShot(superSampling, rescaleFactor, a, b, c, d)` | Capture avec super-échantillonnage et mise à l'échelle choisis (limité à 24 et au budget GPU). Au-dessus de 9 le risque de gel du pilote est réel. | 1308 |
| `screenshot.takeHugeScreenShot(a, b, c, d)` | Capture « Huge » : super-échantillonnage 9 (3x linéaire, 9x pixels), avec réglages graphiques maximaux. 1080p donne environ du 6K, 4K donne environ du 12K. Ignorée si une capture est déjà en cours. | 1289 |
| `screenshot.takeMotionBlurScreenShot(superSampling, rescaleFactor, a, b, c, d)` | Même comportement que takeCustomScreenShot (même appel interne) : voir les notes sur l'absence de traitement spécifique du flou de mouvement. | 1324 |
| `screenshot.takeScreenShot(a, b, c, d)` | Capture « Normal » à la résolution native (1080p donne une image 1080p). Peut enregistrer en plus des images scène/véhicule séparées et normales/profondeur. | 1247 |

### Détail des paramètres

#### `screenshot.createScreenshotTracked(p)`

Crée une capture dans le moteur (createScreenshot2) à partir d'une copie de la table de paramètres et enregistre le job pour le suivi (filename, bufferType, type, métadonnées, upload). Positionne captureInProgress.

- `p` (*table*) : Paramètres de capture : filename, writeJPG, superSampling, tiles, overlap, rescaleFactor, upload, jsonMetaData (string JSON), persistMetadataSidecar, bufferType ('color', 'depth'…), jobType, masques d'objets (objectTypeWhitelistMask…), etc.
- **renvoie** : integer|nil Id du job renvoyé par le moteur (nil ou 0 si la création échoue).

#### `screenshot.doScreenshot(batchTag, upload, path, ext, options)`

Prend une capture simple (échelle 1, un seul tile) avec nom de fichier unique 'screenshot_<date>[_n]'. Si path et ext sont fournis, utilise ce chemin et ignore upload et batchTag. Joint les métadonnées si demandé ou si upload.

- `batchTag` (*string|nil*) : Étiquette de lot (ignorée si path/ext fournis ; non utilisée ensuite dans le code lu).
- `upload` (*boolean|nil*) : true pour envoyer la capture au serveur de médias.
- `path` (*string|nil*) : Chemin de sortie sans extension.
- `ext` (*string|nil*) : Extension/format ('png' ou 'jpg'), à fournir avec path.
- `options` (*table|nil*) : jsonMetaData, includeMetadata, persistMetadataSidecar, callOrigin…

#### `screenshot.doSteamScreenshot(options)`

Prend une capture puis demande au fournisseur de services en ligne (Steam) de déclencher sa capture. Refusé si onlineFeatures n'est pas 'enable'.

- `options` (*table|nil*) : Options ; options.upload == true envoie aussi la capture.

#### `screenshot.getPhotomodeRollEntries(limit)`

Liste les dernières captures principales du mode photo (fichiers 'screenshot_AAAAMMJJ_HHMMSS', hors _scene/_vehicle/_normal/_depth), les plus récentes d'abord, avec lien de partage et métadonnées lus dans le fichier annexe ou la métadonnée intégrée.

- `limit` (*integer|nil*) : Nombre maximum d'entrées (10 par défaut). Une valeur <= 0 cherche récursivement dans tous les dossiers screenshots sans limite.
- **renvoie** : table[] Liste de {gamePath = string, shareUrl = string|nil, metadata = table|nil, openMap = table|nil}.

#### `screenshot.getPhotomodeRollEntriesJson(limit)`

Même résultat que getPhotomodeRollEntries mais encodé en chaîne JSON, pour l'interface (les tables ne passent pas toujours bien vers Angular/CEF).

- `limit` (*integer|nil*) : Voir getPhotomodeRollEntries.
- **renvoie** : string JSON du tableau d'entrées.

#### `screenshot.getScreenshotCompletion(id)`

Renvoie l'état final d'un job de capture, seulement s'il est terminé ('done') ou en erreur ('error').

- `id` (*integer*) : Id du job.
- **renvoie** : table|nil {id, result, filename, phase}, ou nil si le job est inconnu ou pas fini.

#### `screenshot.getScreenshotJobsSnapshotJson()`

Instantané des jobs en cours sous forme de JSON : id, runId, percent, message, phase, result, filename, bufferType, type, metadata, openMap.

- **renvoie** : string JSON du tableau de jobs.

#### `screenshot.isDebugTracingEnabled()`

Indique si les logs de trace '[Trace]' du module sont activés.

- **renvoie** : boolean true si activé.

#### `screenshot.openScreenshotFileInExplorer(filePath)`

Ouvre l'explorateur de fichiers du système sur une capture. Ne fait rien (avec un avertissement) si le fichier n'existe pas ou si le chemin est vide.

- `filePath` (*string*) : Chemin du fichier.

#### `screenshot.publish(batchTag, options)`

Prend une capture et l'envoie au serveur de médias BeamNG. Refusé avec un toast d'erreur si onlineFeatures n'est pas 'enable'.

- `batchTag` (*string|nil*) : Étiquette de lot (passée à doScreenshot).
- `options` (*table|nil*) : Options de capture (voir doScreenshot).

#### `screenshot.runPhotomodeFlashCapture(kind, ...)`

Point d'entrée unique des anciens callbacks d'interface du mode photo : charge l'extension util/photomodeFlash et appelle util_photomodeFlash.runCapture(kind, ...).

- `kind` (*string*) : Type de capture demandé à l'extension (valeurs définies dans util/photomodeFlash).
- `...` (*any*) : Arguments transmis à runCapture.

#### `screenshot.screenshotProgress(id, percent, message)`

Appelée par le moteur : met à jour le pourcentage et le message d'un job (phase 'in progress') et prévient l'interface.

- `id` (*integer*) : Id du job.
- `percent` (*number*) : Avancement en %.
- `message` (*string*) : Message d'étape.

#### `screenshot.screenshotSaved(id, res, filename)`

Appelée par le moteur quand l'image est écrite sur disque. res == 0 : succès (phase 'done', 100 %, écriture du fichier annexe de métadonnées si prévu) ; sinon phase 'error'.

- `id` (*integer*) : Id du job.
- `res` (*integer*) : Code de résultat, 0 = succès.
- `filename` (*string*) : Chemin du fichier écrit.

#### `screenshot.screenshotTaken(id)`

Appelée par le moteur quand l'image est capturée côté GPU mais pas encore écrite : passe le job en phase 'saving'.

- `id` (*integer*) : Id du job.

#### `screenshot.screenshotUploaded(id, result, _adminUrl, shareUrl)`

Appelée par le moteur à la fin d'un envoi : écrit le lien de partage dans le fichier annexe, notifie l'interface (ScreenshotUploadComplete) et affiche un toast de succès ou d'échec (result == 0 = succès).

- `id` (*integer|string*) : Id du job (converti en nombre).
- `result` (*integer|string*) : Code de résultat, 0 = succès (1 par défaut si invalide).
- `_adminUrl` (*string*) : URL d'administration (non utilisée).
- `shareUrl` (*string*) : URL publique de partage.

#### `screenshot.setDebugTracingEnabled(value)`

Active ou désactive les logs de trace du module.

- `value` (*boolean*) : true pour activer (toute autre valeur désactive).

#### `screenshot.takeBigScreenShot(a, b, c, d)`

Capture « Big » : super-échantillonnage 4 (2x linéaire, 4x pixels). Un écran 1080p donne une image 4K. Ignorée si une capture est déjà en cours.

- `a` (*boolean|table|nil*) : splitSceneVehicle (enregistrer aussi scène et véhicule séparés), ou une table d'options.
- `b` (*boolean|nil*) : saveNormalDepth (enregistrer aussi normales et profondeur).
- `c` (*boolean|table|nil*) : Table d'options, ou splitSceneVehicle si a est une table.
- `d` (*boolean|table|nil*) : Table d'options, ou saveNormalDepth si a est une table.

#### `screenshot.takeCustomScreenShot(superSampling, rescaleFactor, a, b, c, d)`

Capture avec super-échantillonnage et mise à l'échelle choisis (limité à 24 et au budget GPU). Au-dessus de 9 le risque de gel du pilote est réel.

- `superSampling` (*number*) : Multiplicateur total de pixels (1 natif, 4 = 2x linéaire, 9 = 3x linéaire).
- `rescaleFactor` (*number|nil*) : Facteur de redimensionnement final (1 si invalide ou <= 0).
- `a` (*boolean|table|nil*) : splitSceneVehicle ou table d'options.
- `b` (*boolean|nil*) : saveNormalDepth.
- `c` (*boolean|table|nil*) : Table d'options, ou splitSceneVehicle si a est une table.
- `d` (*boolean|table|nil*) : Table d'options, ou saveNormalDepth si a est une table.

#### `screenshot.takeHugeScreenShot(a, b, c, d)`

Capture « Huge » : super-échantillonnage 9 (3x linéaire, 9x pixels), avec réglages graphiques maximaux. 1080p donne environ du 6K, 4K donne environ du 12K. Ignorée si une capture est déjà en cours.

- `a` (*boolean|table|nil*) : splitSceneVehicle ou table d'options.
- `b` (*boolean|nil*) : saveNormalDepth.
- `c` (*boolean|table|nil*) : Table d'options, ou splitSceneVehicle si a est une table.
- `d` (*boolean|table|nil*) : Table d'options, ou saveNormalDepth si a est une table.

#### `screenshot.takeMotionBlurScreenShot(superSampling, rescaleFactor, a, b, c, d)`

Même comportement que takeCustomScreenShot (même appel interne) : voir les notes sur l'absence de traitement spécifique du flou de mouvement.

- `superSampling` (*number*) : Multiplicateur total de pixels (limité à 24 et au budget GPU).
- `rescaleFactor` (*number|nil*) : Facteur de redimensionnement final.
- `a` (*boolean|table|nil*) : splitSceneVehicle ou table d'options.
- `b` (*boolean|nil*) : saveNormalDepth.
- `c` (*boolean|table|nil*) : Table d'options, ou splitSceneVehicle.
- `d` (*boolean|table|nil*) : Table d'options, ou saveNormalDepth.

#### `screenshot.takeScreenShot(a, b, c, d)`

Capture « Normal » à la résolution native (1080p donne une image 1080p). Peut enregistrer en plus des images scène/véhicule séparées et normales/profondeur.

- `a` (*boolean|table|nil*) : splitSceneVehicle (true pour sauvegarder séparément scène et véhicule) ou table d'options.
- `b` (*boolean|nil*) : saveNormalDepth (true pour sauvegarder normales et profondeur).
- `c` (*boolean|table|nil*) : Table d'options, ou splitSceneVehicle si a est une table.
- `d` (*boolean|table|nil*) : Table d'options, ou saveNormalDepth si a est une table.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCollectScreenshotMetadata` — écouté par 2 module(s)
- `onScreenshotAllDone` — écouté par 3 module(s)

**Évènements UI (guihooks.trigger) :** `ScreenshotJobsAllDone`, `ScreenshotJobsUpdate`, `ScreenshotUploadComplete`, `toastrMsg`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryList`, `expandFilename`, `fileExists`, `findFiles`
- `core_environment.` `getTimeOfDay`

**Charge les extensions :** `util/photomodeFlash`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/screenshot.lua`.*

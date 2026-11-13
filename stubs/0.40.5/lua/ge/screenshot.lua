---@meta
-- tim19Atlas stub generated from lua/ge/screenshot.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prise de captures d'écran côté Game Engine. Il prépare le nom de fichier (dossier screenshots/<mois>/screenshot_<date>), les options de qualité (super-échantillonnage, mise à l'échelle), les métadonnées (niveau, véhicules, partage), et lance la capture via le moteur (createScreenshot2). Il suit chaque capture comme un « job » (file, en cours, sauvegarde, terminé, erreur) et prévient l'interface. Il gère aussi l'envoi vers le serveur de médias BeamNG, la liste des dernières photos du mode photo et le retour des réglages graphiques après une capture haute qualité.
--- Accès : globale `screenshot`
---@class screenshot
screenshot = {}

--- Oublie tous les jobs de capture (listes, métadonnées, envois en attente), remet hqActive à false et prévient l'interface.
---Source : lua/ge/screenshot.lua:1131
function screenshot.clearScreenshotJobs() end

--- Crée une capture dans le moteur (createScreenshot2) à partir d'une copie de la table de paramètres et enregistre le job pour le suivi (filename, bufferType, type, métadonnées, upload). Positionne captureInProgress.
---Source : lua/ge/screenshot.lua:114
---@param p table Paramètres de capture : filename, writeJPG, superSampling, tiles, overlap, rescaleFactor, upload, jsonMetaData (string JSON), persistMetadataSidecar, bufferType ('color', 'depth'…), jobType, masques d'objets (objectTypeWhitelistMask…), etc.
---@return integer|nil  Id du job renvoyé par le moteur (nil ou 0 si la création échoue).
function screenshot.createScreenshotTracked(p) end

--- Prend une capture simple (échelle 1, un seul tile) avec nom de fichier unique 'screenshot_<date>[_n]'. Si path et ext sont fournis, utilise ce chemin et ignore upload et batchTag. Joint les métadonnées si demandé ou si upload.
---Source : lua/ge/screenshot.lua:512
---@param batchTag string|nil Étiquette de lot (ignorée si path/ext fournis ; non utilisée ensuite dans le code lu).
---@param upload boolean|nil true pour envoyer la capture au serveur de médias.
---@param path string|nil Chemin de sortie sans extension.
---@param ext string|nil Extension/format ('png' ou 'jpg'), à fournir avec path.
---@param options table|nil jsonMetaData, includeMetadata, persistMetadataSidecar, callOrigin…
function screenshot.doScreenshot(batchTag, upload, path, ext, options) end

--- Prend une capture puis demande au fournisseur de services en ligne (Steam) de déclencher sa capture. Refusé si onlineFeatures n'est pas 'enable'.
---Source : lua/ge/screenshot.lua:585
---@param options table|nil Options ; options.upload == true envoie aussi la capture.
function screenshot.doSteamScreenshot(options) end

--- Liste les dernières captures principales du mode photo (fichiers 'screenshot_AAAAMMJJ_HHMMSS', hors _scene/_vehicle/_normal/_depth), les plus récentes d'abord, avec lien de partage et métadonnées lus dans le fichier annexe ou la métadonnée intégrée.
---Source : lua/ge/screenshot.lua:715
---@param limit integer|nil Nombre maximum d'entrées (10 par défaut). Une valeur <= 0 cherche récursivement dans tous les dossiers screenshots sans limite.
---@return table[]  Liste de {gamePath = string, shareUrl = string|nil, metadata = table|nil, openMap = table|nil}.
function screenshot.getPhotomodeRollEntries(limit) end

--- Même résultat que getPhotomodeRollEntries mais encodé en chaîne JSON, pour l'interface (les tables ne passent pas toujours bien vers Angular/CEF).
---Source : lua/ge/screenshot.lua:764
---@param limit integer|nil Voir getPhotomodeRollEntries.
---@return string  JSON du tableau d'entrées.
function screenshot.getPhotomodeRollEntriesJson(limit) end

--- Renvoie l'état final d'un job de capture, seulement s'il est terminé ('done') ou en erreur ('error').
---Source : lua/ge/screenshot.lua:1068
---@param id integer Id du job.
---@return table|nil  {id, result, filename, phase}, ou nil si le job est inconnu ou pas fini.
function screenshot.getScreenshotCompletion(id) end

--- Instantané des jobs en cours sous forme de JSON : id, runId, percent, message, phase, result, filename, bufferType, type, metadata, openMap.
---Source : lua/ge/screenshot.lua:768
---@return string  JSON du tableau de jobs.
function screenshot.getScreenshotJobsSnapshotJson() end

--- Indique si les logs de trace '[Trace]' du module sont activés.
---Source : lua/ge/screenshot.lua:1360
---@return boolean  true si activé.
function screenshot.isDebugTracingEnabled() end

--- Ouvre l'explorateur de fichiers du système sur une capture. Ne fait rien (avec un avertissement) si le fichier n'existe pas ou si le chemin est vide.
---Source : lua/ge/screenshot.lua:605
---@param filePath string Chemin du fichier.
function screenshot.openScreenshotFileInExplorer(filePath) end

--- Crée si besoin le dossier screenshots/<mois> et l'ouvre dans l'explorateur de fichiers.
---Source : lua/ge/screenshot.lua:595
function screenshot.openScreenshotsFolderInExplorer() end

--- Prend une capture et l'envoie au serveur de médias BeamNG. Refusé avec un toast d'erreur si onlineFeatures n'est pas 'enable'.
---Source : lua/ge/screenshot.lua:576
---@param batchTag string|nil Étiquette de lot (passée à doScreenshot).
---@param options table|nil Options de capture (voir doScreenshot).
function screenshot.publish(batchTag, options) end

--- Point d'entrée unique des anciens callbacks d'interface du mode photo : charge l'extension util/photomodeFlash et appelle util_photomodeFlash.runCapture(kind, ...).
---Source : lua/ge/screenshot.lua:1341
---@param kind string Type de capture demandé à l'extension (valeurs définies dans util/photomodeFlash).
---@param ... any Arguments transmis à runCapture.
function screenshot.runPhotomodeFlashCapture(kind, ...) end

--- Appelée par le moteur quand tous les jobs d'une série sont finis : remet les réglages graphiques et nuages d'origine, libère les noms de fichiers réservés, remet captureInProgress à false, émet le hook onScreenshotAllDone et l'évènement UI ScreenshotJobsAllDone.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/screenshot.lua:1161
function screenshot.screenshotAllDone() end

--- Appelée par le moteur : met à jour le pourcentage et le message d'un job (phase 'in progress') et prévient l'interface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/screenshot.lua:1142
---@param id integer Id du job.
---@param percent number Avancement en %.
---@param message string Message d'étape.
function screenshot.screenshotProgress(id, percent, message) end

--- Appelée par le moteur quand l'image est écrite sur disque. res == 0 : succès (phase 'done', 100 %, écriture du fichier annexe de métadonnées si prévu) ; sinon phase 'error'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/screenshot.lua:1016
---@param id integer Id du job.
---@param res integer Code de résultat, 0 = succès.
---@param filename string Chemin du fichier écrit.
function screenshot.screenshotSaved(id, res, filename) end

--- Appelée par le moteur quand l'image est capturée côté GPU mais pas encore écrite : passe le job en phase 'saving'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/screenshot.lua:1120
---@param id integer Id du job.
function screenshot.screenshotTaken(id) end

--- Appelée par le moteur à la fin d'un envoi : écrit le lien de partage dans le fichier annexe, notifie l'interface (ScreenshotUploadComplete) et affiche un toast de succès ou d'échec (result == 0 = succès).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/screenshot.lua:1079
---@param id integer|string Id du job (converti en nombre).
---@param result integer|string Code de résultat, 0 = succès (1 par défaut si invalide).
---@param _adminUrl string URL d'administration (non utilisée).
---@param shareUrl string URL publique de partage.
function screenshot.screenshotUploaded(id, result, _adminUrl, shareUrl) end

--- Active ou désactive les logs de trace du module.
---Source : lua/ge/screenshot.lua:1359
---@param value boolean true pour activer (toute autre valeur désactive).
function screenshot.setDebugTracingEnabled(value) end

--- Capture « Big » : super-échantillonnage 4 (2x linéaire, 4x pixels). Un écran 1080p donne une image 4K. Ignorée si une capture est déjà en cours.
---Source : lua/ge/screenshot.lua:1270
---@param a boolean|table|nil splitSceneVehicle (enregistrer aussi scène et véhicule séparés), ou une table d'options.
---@param b boolean|nil saveNormalDepth (enregistrer aussi normales et profondeur).
---@param c boolean|table|nil Table d'options, ou splitSceneVehicle si a est une table.
---@param d boolean|table|nil Table d'options, ou saveNormalDepth si a est une table.
function screenshot.takeBigScreenShot(a, b, c, d) end

--- Capture avec super-échantillonnage et mise à l'échelle choisis (limité à 24 et au budget GPU). Au-dessus de 9 le risque de gel du pilote est réel.
---Source : lua/ge/screenshot.lua:1308
---@param superSampling number Multiplicateur total de pixels (1 natif, 4 = 2x linéaire, 9 = 3x linéaire).
---@param rescaleFactor number|nil Facteur de redimensionnement final (1 si invalide ou <= 0).
---@param a boolean|table|nil splitSceneVehicle ou table d'options.
---@param b boolean|nil saveNormalDepth.
---@param c boolean|table|nil Table d'options, ou splitSceneVehicle si a est une table.
---@param d boolean|table|nil Table d'options, ou saveNormalDepth si a est une table.
function screenshot.takeCustomScreenShot(superSampling, rescaleFactor, a, b, c, d) end

--- Capture « Huge » : super-échantillonnage 9 (3x linéaire, 9x pixels), avec réglages graphiques maximaux. 1080p donne environ du 6K, 4K donne environ du 12K. Ignorée si une capture est déjà en cours.
---Source : lua/ge/screenshot.lua:1289
---@param a boolean|table|nil splitSceneVehicle ou table d'options.
---@param b boolean|nil saveNormalDepth.
---@param c boolean|table|nil Table d'options, ou splitSceneVehicle si a est une table.
---@param d boolean|table|nil Table d'options, ou saveNormalDepth si a est une table.
function screenshot.takeHugeScreenShot(a, b, c, d) end

--- Même comportement que takeCustomScreenShot (même appel interne) : voir les notes sur l'absence de traitement spécifique du flou de mouvement.
---Source : lua/ge/screenshot.lua:1324
---@param superSampling number Multiplicateur total de pixels (limité à 24 et au budget GPU).
---@param rescaleFactor number|nil Facteur de redimensionnement final.
---@param a boolean|table|nil splitSceneVehicle ou table d'options.
---@param b boolean|nil saveNormalDepth.
---@param c boolean|table|nil Table d'options, ou splitSceneVehicle.
---@param d boolean|table|nil Table d'options, ou saveNormalDepth.
function screenshot.takeMotionBlurScreenShot(superSampling, rescaleFactor, a, b, c, d) end

--- Capture « Normal » à la résolution native (1080p donne une image 1080p). Peut enregistrer en plus des images scène/véhicule séparées et normales/profondeur.
---Source : lua/ge/screenshot.lua:1247
---@param a boolean|table|nil splitSceneVehicle (true pour sauvegarder séparément scène et véhicule) ou table d'options.
---@param b boolean|nil saveNormalDepth (true pour sauvegarder normales et profondeur).
---@param c boolean|table|nil Table d'options, ou splitSceneVehicle si a est une table.
---@param d boolean|table|nil Table d'options, ou saveNormalDepth si a est une table.
function screenshot.takeScreenShot(a, b, c, d) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/job.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orchestrateur du créateur de vignettes (thumbnails) de véhicules. Il lance, dans une coroutine pilotée par onPreRender, la boucle complète : remplacer/placer le véhicule, le laisser se stabiliser, geler la physique, calculer la caméra (cadrage via framingManager ou caméra enregistrée), ajuster l'éclairage, attendre 2 s, capturer l'image avec util_screenshotCreator_capture, vérifier le fichier produit puis restaurer l'environnement et la physique. Il gère aussi l'aperçu de la caméra (startPreview) et expose la progression et le compte rendu pour l'interface. Un moddeur l'utilise pour générer en lot les images vehicles/<modèle>/<config>.jpg.
--- Accès : extension `util_screenshotCreator_job` : `extensions.load("util_screenshotCreator_job")`, puis la globale `util_screenshotCreator_job`
---@class util_screenshotCreator_job
---@field dependencies string[] Extensions chargées avant : core_camera, core_vehicles, core_vehicle_manager, ui_vehicleSelector_general et plusieurs util_screenshotCreator_* (settings, thumbnailConfig, vehicleSetup, capture, lightingSetup, framing_configured, framingManager, modelSelection, shippedConfigs).
util_screenshotCreator_job = {}

--- Remet l'indicateur « travail terminé » à false sans le lire.
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:810
function util_screenshotCreator_job.clearRunDone() end

--- Lit puis remet à false l'indicateur « travail terminé ».
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:804
---@return boolean  true une seule fois après la fin d'un travail (ou d'un échec au démarrage faute de véhicule).
function util_screenshotCreator_job.consumeRunDone() end

--- Renvoie la progression du travail.
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:846
---@return table  {completed = integer, total = integer, current = string « modèle/config »}.
function util_screenshotCreator_job.getProgress() end

--- Renvoie le compte rendu du dernier travail.
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:847
---@return table|nil  {onlyMissingThumbnails, shippedConfigsOnly, lowBeamsEnabled, selection, framingModeId, cameraOverridePolicy, sampleOutputFolder, configs = [{vehName, camName, status (done/failed/skipped), thumbnailPath}]} ; nil avant tout travail.
function util_screenshotCreator_job.getReviewData() end

--- Indique si un aperçu a déplacé la caméra (cameraSet).
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:851
---@return boolean  true tant que resetCamera n'a pas été appelé.
function util_screenshotCreator_job.isCameraSet() end

--- Indique si une coroutine de travail existe.
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:845
---@return boolean  true pendant un travail ou un aperçu.
function util_screenshotCreator_job.isRunning() end

--- Hook appelé à la fin de la mission/niveau ; même fonction que onExtensionUnloaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:833
function util_screenshotCreator_job.onClientEndMission() end

--- Hook appelé après rechargement avec l'état sérialisé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:824
---@param data table État renvoyé par onSerialize.
function util_screenshotCreator_job.onDeserialized(data) end

--- Hook appelé à la fermeture du jeu ; même fonction que onExtensionUnloaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:833
function util_screenshotCreator_job.onExit() end

--- Hook appelé au déchargement de l'extension : arrête le travail, restaure l'éclairage, les réglages et l'état de la physique. Aussi utilisé comme onClientEndMission et onExit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:833
function util_screenshotCreator_job.onExtensionUnloaded() end

--- Hook appelé à chaque frame avant le rendu : fait avancer la coroutine de travail. En cas d'erreur Lua, la trace est journalisée et le travail est abandonné ; à la fin, l'éclairage et la physique sont restaurés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:785
function util_screenshotCreator_job.onPreRender() end

--- Hook appelé avant un rechargement des extensions : renvoie progress, review, runDone, previousFov et cameraSet. La coroutine n'est pas sauvegardée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:814
---@return table  État à restaurer.
function util_screenshotCreator_job.onSerialize() end

--- Rend la caméra du joueur au mode « orbit » et restaure le FOV mémorisé avant l'aperçu (60 par défaut).
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:117
function util_screenshotCreator_job.resetCamera() end

--- Place le véhicule comme pour une vignette, attend qu'il se stabilise puis positionne la caméra libre du joueur sur le cadrage calculé, sans capturer d'image. Renvoie false si un travail tourne ou si vehicle est nil.
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:765
---@param vehicle table Objet véhicule.
---@param configName string Nom de la configuration.
---@param modeOrOptions string|table|nil Id du mode de cadrage, ou table d'options {framingModeId, fixedRotation, delayedPreview}.
---@param fixedRotation quat|nil Rotation de caméra imposée (ignoré si modeOrOptions est une table).
---@return boolean  true si l'aperçu a démarré.
function util_screenshotCreator_job.startPreview(vehicle, configName, modeOrOptions, fixedRotation) end

--- Comme startPreview, mais pour les véhicules dont thumbnailConfig.getPauseDelay est > 0 : la physique tourne pendant ce délai avant le gel. Renvoie false si le modèle est inconnu ou si le délai est nul.
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:769
---@param vehicle table Objet véhicule.
---@param configName string Nom de la configuration.
---@param modeOrOptions string|table|nil Id du mode de cadrage ou table d'options.
---@param fixedRotation quat|nil Rotation de caméra imposée.
---@return boolean  true si l'aperçu a démarré.
function util_screenshotCreator_job.startPreviewWithDelay(vehicle, configName, modeOrOptions, fixedRotation) end

--- Démarre la génération de vignettes. Normalise les options, construit la liste des éléments (modèles sélectionnés, cibles explicites ou véhicule courant), prend le contrôle de la physique, active les réglages d'environnement (settings.beginWork) et crée la coroutine de travail. Renvoie false si un travail est déjà en cours, si les cibles sont invalides ou si l'API de physique manque.
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:654
---@param workOptions table|nil Options du travail (voir notes). Si ce n'est pas une table : selection = « selectedModels », onlyMissingThumbnails = false.
---@return boolean  true si le travail a démarré.
function util_screenshotCreator_job.startWork(workOptions) end

--- Demande l'arrêt du travail en cours (forceQuit) ; la coroutine s'arrête à son prochain point de contrôle.
---Source : lua/ge/extensions/util/screenshotCreator/job.lua:779
---@return boolean  false s'il n'y a pas de travail en cours, sinon true.
function util_screenshotCreator_job.stop() end


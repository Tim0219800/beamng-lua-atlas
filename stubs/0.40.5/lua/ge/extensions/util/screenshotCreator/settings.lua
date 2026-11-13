---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Réglages et fenêtre de paramètres du créateur de captures/vignettes. Il conserve dans des pointeurs ImGui (getControls) tous les réglages : destination de sortie, résolution (préréglages thumbnail 800x448, 720p, 1080p, 4k, 8k…), supersampling, FOV, hauteur de caméra, marges de cadrage, qualité des réflexions dynamiques, exposition, feux de croisement, délai de stabilisation, gel de la physique, rig d'éclairage, SSAO. Il fabrique les contextes (getFramingContext, getCaptureContext, getJobSettings) consommés par job.lua, les modes de cadrage et la capture, applique/restaure l'environnement du showroom (exposition locale, réflexions, plaques, occupants de sièges) et dessine les surcouches de marges dans la vue 3D.
--- Accès : extension `util_screenshotCreator_settings` : `extensions.load("util_screenshotCreator_settings")`, puis la globale `util_screenshotCreator_settings`
---@class util_screenshotCreator_settings
---@field dependencies string[] Extensions chargées avant : ui_imgui et core_camera.
util_screenshotCreator_settings = {}

--- Ajoute à une cible de marge la marge horizontale réglée par l'utilisateur (gauche et droite) et les marges véhicule (haut +4, bas +2).
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:205
---@param margin table|nil Cible de marge.
---@return table|nil  Nouvelle marge, ou nil si margin est nil.
function util_screenshotCreator_settings.addVehicleMargin(margin) end

--- Mémorise l'environnement actuel puis applique celui des captures : exposition, réflexions, plaques non générées, occupants de sièges désactivés. Ne fait rien hors showroom.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:429
---@param options table|nil {applyExposure = false} pour ne pas toucher à l'exposition.
function util_screenshotCreator_settings.applyEnvironment(options) end

--- Réapplique un instantané d'environnement en vérifiant chaque valeur ; journalise une erreur pour chaque réglage non restauré.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:441
---@param snapshot table Instantané (voir getEnvironmentSnapshot).
---@return boolean  true si tout a été restauré.
function util_screenshotCreator_settings.applyEnvironmentSnapshot(snapshot) end

--- Écrit l'exposition (auto ou manuelle en EV) dans l'objet PostEffectLocalExposureObject de la scène.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:375
---@return boolean  true si l'objet existe et a pris les valeurs demandées.
function util_screenshotCreator_settings.applyExposure() end

--- Active le réglage SkipGenerateLicencePlate (showroom uniquement).
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:388
---@return boolean  false hors showroom.
function util_screenshotCreator_settings.applyLicensePlates() end

--- Allume les feux de croisement du véhicule (electrics.setLightsState(1)) si activé ; ne fait rien sinon.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:949
---@param vehicle table Objet véhicule.
---@param enabled boolean|nil Valeur imposée ; par défaut le réglage de l'interface.
function util_screenshotCreator_settings.applyLowBeams(vehicle, enabled) end

--- Applique la qualité de réflexion dynamique choisie via dynCaptureQuality (showroom uniquement).
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:382
---@return boolean  false hors showroom.
function util_screenshotCreator_settings.applyReflections() end

--- Début d'un travail de capture : appelle applyEnvironment.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:612
---@param options table|nil Passé à applyEnvironment.
function util_screenshotCreator_settings.beginWork(options) end

--- Restaure les réglages depuis une table (valeurs bornées, anciens formats acceptés), puis applique exposition et réflexions si on est dans le showroom (alias onDeserialized).
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:875
---@param data table|nil État sérialisé ; ignoré si ce n'est pas une table.
function util_screenshotCreator_settings.deserialize(data) end

--- Dessine dans la vue 3D, devant la caméra courante, le cadre de l'image finale (rouge), les marges de sécurité (vert), les marges véhicule (bleu) et optionnellement la grille de composition (tiers et centre). À appeler à chaque frame.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:782
---@param fovOverride number|nil FOV en degrés à utiliser à la place du FOV réglé.
function util_screenshotCreator_settings.drawCameraOverlay(fovOverride) end

--- Dessine les contrôles ImGui d'éclairage : couleur du cyclorama (matériau showroom_v2_lighting_backdrop), rig relatif à la caméra, ombres et intensité par rôle, correction d'exposition, marquage de parking, mode SSAO.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:340
function util_screenshotCreator_settings.drawLightingControls() end

--- Alias de drawOutputControls.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:646
---@param options table|nil Voir drawOutputControls.
function util_screenshotCreator_settings.drawOutput(options) end

--- Dessine les contrôles ImGui de sortie : bouton « Restore thumbnail defaults », destination, FOV et hauteur de caméra procéduraux, marge horizontale, résolutions, supersampling, réflexions, exposition, feux, délai de stabilisation, gel de la physique, et un résumé de la taille d'image.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:646
---@param options table|nil {drawToggleUiApps = function} dessiné à côté du bouton d'aperçu de résolution.
function util_screenshotCreator_settings.drawOutputControls(options) end

--- Dessine les contrôles ImGui des surcouches : marges, boîte de cadrage, OOBB, entrées de cadrage, composition, ainsi que les cases Sample et Comparison.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:760
function util_screenshotCreator_settings.drawOverlayControls() end

--- Alias de drawCameraOverlay.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:782
---@param fovOverride number|nil Voir drawCameraOverlay.
function util_screenshotCreator_settings.drawOverlays(fovOverride) end

--- Fin d'un travail de capture : appelle restoreEnvironment.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:616
function util_screenshotCreator_settings.finishWork() end

--- Construit le contexte de capture : destination, extension de fichier, résolution, superSampling (et supersampling), internalResolution (résolution × supersampling), qualité des réflexions, feux, délai, gel de la physique, exposition, options sample/comparison.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:545
---@return table  Contexte de capture.
function util_screenshotCreator_settings.getCaptureContext() end

--- Renvoie la table de tous les pointeurs ImGui des réglages (outputDestination, resolution, imageResolution, superSampling, fieldOfView, cameraHeight, selectedMargin, lightRoleIntensity, etc.). Modifier ces pointeurs modifie directement les réglages.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:980
---@return table  ctrls (im.BoolPtr, im.FloatPtr, im.IntPtr, im.ArrayInt…).
function util_screenshotCreator_settings.getControls() end

--- Renvoie la résolution finale choisie : celle du préréglage sélectionné, ou la résolution personnalisée si « custom ».
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:239
---@return integer[]  {largeur, hauteur}.
function util_screenshotCreator_settings.getCurrentResolution() end

--- Renvoie une copie des valeurs par défaut des réglages.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1005
---@return table  Valeurs par défaut.
function util_screenshotCreator_settings.getDefaults() end

--- Renvoie les niveaux de qualité des réflexions : Lowest, Low, Normal, High, Ultra.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1012
---@return string[]  Niveaux de qualité.
function util_screenshotCreator_settings.getDynamicReflectionQualities() end

--- Renvoie une copie de l'environnement mémorisé (skipLicensePlates, dynamicReflectionRuntime, autoExposure, manualExposure, seatOccupants).
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:486
---@return table|nil  Instantané, nil si rien n'a été mémorisé.
function util_screenshotCreator_settings.getEnvironmentSnapshot() end

--- Construit le contexte transmis aux modes de cadrage : fieldOfView/fov, nearPlane, cameraHeight, cameraAxisDownOffset, settleDelay, resolution, aspectRatio, useMargins, margin et debug {drawBounds, drawOobb, drawInputs}. L'appelant ajoute vehicle, configName, etc.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:524
---@param resolution integer[]|nil {largeur, hauteur} ; défaut la résolution courante.
---@return table  Contexte de cadrage.
function util_screenshotCreator_settings.getFramingContext(resolution) end

--- Renvoie une copie des défauts de cadrage : {cameraAxisDownOffset = 0.10, cameraHeight = 1.1, settleDelay = 1}.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1007
---@return table  Défauts de cadrage.
function util_screenshotCreator_settings.getFramingDefaults() end

--- Calcule la marge de cadrage finale pour une résolution : cible choisie + marges véhicule, mise à l'échelle. Renvoie une marge nulle si « useFramingMargins » est décoché.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:517
---@param resolution integer[] {largeur, hauteur}.
---@return table  {left, right, top, bottom, extraBottom, ...}.
function util_screenshotCreator_settings.getFramingMargin(resolution) end

--- Fusionne contexte de cadrage et de capture en un seul tableau de réglages de travail (outputFolder, resolution, fov, margin, captureTimeout min 0,1 s…). Les options remplacent certains réglages de l'interface.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:572
---@param options table|nil {resolution, outputFolder, lowBeamsEnabled, shippedConfigsOnly, sample, comparison, captureTimeout}.
---@return table  Réglages du travail.
function util_screenshotCreator_settings.getJobSettings(options) end

--- Renvoie les réglages du rig d'éclairage lus dans l'interface : enabled, exposureCorrection, ssaoMode (« on », « reduced » ou « off »), parkingMarkup, roles[id] = {intensity, shadows} pour key, fill, rim, top, groundFill, horizonFill.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:300
---@return table  Réglages du rig.
function util_screenshotCreator_settings.getLightingRig() end

--- Renvoie la cible de marge d'indice donné (base 0). La cible « minimal » est remplacée par le maximum de toutes les autres. Retombe sur la cible par défaut si l'indice est invalide.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:200
---@param index integer|nil Indice de cible, base 0 (défaut safeMargins.defaultTargetIndex).
---@return table  {name, left, right, top, bottom, extraBottom, color} en pixels de référence 500x281.
function util_screenshotCreator_settings.getMarginTarget(index) end

--- Renvoie le sous-ensemble des pointeurs de sortie : outputDestination, resolution, imageResolution, shippedConfigsOnly, keepAspectRatio, resolutionMultiplier.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:981
---@return table  Pointeurs ImGui.
function util_screenshotCreator_settings.getOutputControls() end

--- Renvoie les noms des destinations de sortie : « Vehicle thumbnails » et « Screenshot/showroom folder ».
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1008
---@return string[]  Destinations.
function util_screenshotCreator_settings.getOutputDestinations() end

--- Renvoie les pointeurs de rendu : superSampling, shippedConfigsOnly, fieldOfView, cameraHeight, dynamicReflectionQuality, lowBeamsEnabled, settleDelay, freezePhysics, autoExposure, manualExposure.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:991
---@return table  Pointeurs ImGui.
function util_screenshotCreator_settings.getRenderControls() end

--- Renvoie les préréglages de résolution {nom, largeur, hauteur}.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1009
---@return table[]  Préréglages.
function util_screenshotCreator_settings.getResolutions() end

--- Renvoie la définition des marges de sécurité : {width = 500, height = 281, defaultTargetIndex, targets = [{name, left, right, top, bottom, extraBottom, color}]}.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1010
---@return table  Marges de référence.
function util_screenshotCreator_settings.getSafeMargins() end

--- Renvoie une copie de la config de vignette : {fileEnding = ".jpg", fov = 20, nearPlane = 0.1}.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1006
---@return table  Config de vignette.
function util_screenshotCreator_settings.getThumbnailConfig() end

--- Renvoie la résolution correcte d'une vignette de véhicule (préréglage « thumbnail », 800 x 448).
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:234
---@return integer[]  {largeur, hauteur}.
function util_screenshotCreator_settings.getThumbnailResolution() end

--- Renvoie la marge supplémentaire autour du véhicule : {top = 4, bottom = 2} (en pixels de référence).
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1011
---@return table  {top, bottom}.
function util_screenshotCreator_settings.getVehicleSafeMargin() end

--- Indique si les réglages de sortie/rendu principaux sont aux valeurs par défaut des vignettes.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:499
---@return boolean  true si tout est par défaut.
function util_screenshotCreator_settings.isDefaultConfig() end

--- Vérifie que, pour la destination « Vehicle thumbnails », la résolution est bien le préréglage vignette.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:512
---@return boolean  false si la taille ne convient pas pour des vignettes du jeu.
function util_screenshotCreator_settings.isThumbnailConfigGood() end

--- Hook de fin de niveau ; même fonction que onExtensionUnloaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:968
function util_screenshotCreator_settings.onClientEndMission() end

--- Hook appelé après le démarrage d'un niveau : dans le showroom, force les réflexions sur Ultra et applique l'environnement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:961
function util_screenshotCreator_settings.onClientPostStartMission() end

--- Hook appelé après rechargement avec l'état sérialisé ; identique à deserialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:875
---@param data table|nil État sérialisé.
function util_screenshotCreator_settings.onDeserialized(data) end

--- Hook de fermeture du jeu ; même fonction que onExtensionUnloaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:968
function util_screenshotCreator_settings.onExit() end

--- Hook : remet les réglages par défaut et applique l'environnement (showroom).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:956
function util_screenshotCreator_settings.onExtensionLoaded() end

--- Hook : rétablit la résolution de la fenêtre si l'aperçu était actif, puis restaure l'environnement. Aussi utilisé comme onClientEndMission et onExit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:968
function util_screenshotCreator_settings.onExtensionUnloaded() end

--- Hook de sérialisation avant rechargement des extensions ; identique à serialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:837
---@return table  État des réglages.
function util_screenshotCreator_settings.onSerialize() end

--- Remet aux valeurs par défaut les réglages de sortie et de rendu (pas ceux de l'éclairage ni des surcouches).
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:262
function util_screenshotCreator_settings.resetToDefaults() end

--- Restaure l'environnement mémorisé puis l'oublie.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:491
---@return boolean  true si tout est restauré ou si rien n'avait été mémorisé.
function util_screenshotCreator_settings.restoreEnvironment() end

--- Met à l'échelle une marge exprimée pour 500x281 vers la résolution donnée.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:219
---@param margin table Marge de référence.
---@param resolution integer[] {largeur, hauteur} cible.
---@return table  Marge en pixels de la résolution cible (renvoyée telle quelle si un argument est absent).
function util_screenshotCreator_settings.scaleMargin(margin, resolution) end

--- Renvoie tous les réglages sous forme de table sérialisable (alias onSerialize).
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:837
---@return table  État des réglages.
function util_screenshotCreator_settings.serialize() end

--- Fixe la résolution personnalisée (arrondie, minimum 1) et sélectionne le préréglage correspondant s'il existe, sinon « custom ».
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:247
---@param width number Largeur en pixels.
---@param height number Hauteur en pixels.
function util_screenshotCreator_settings.setImageResolution(width, height) end

--- Passe la fenêtre du jeu en mode sans bordure à la résolution finale choisie (aperçu), ou rétablit le mode vidéo d'origine.
---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:620
---@param enabled boolean true pour activer l'aperçu.
function util_screenshotCreator_settings.setPreviewResolution(enabled) end


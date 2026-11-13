---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/capture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Capture d'images du mode photo : réglages (supersampling, niveau de réduction, HDR, capture avec flou de mouvement, passes supplémentaires scène/véhicule et normales/profondeur), présets de résolution de fenêtre, échelle de rendu des upscalers temporels, et les demandes de capture elles-mêmes (basique, publication/upload, Steam, flou de mouvement). Le module s'appuie sur le module « screenshot » (takeScreenShot, takeCustomScreenShot, takeMotionBlurScreenShot, publish, doSteamScreenshot) et sur ui_photomode_flash pour le flash. Il est piloté par l'UI du mode photo et par ui_photomode_shared.
--- Accès : extension `ui_photomode_capture` : `extensions.load("ui_photomode_capture")`, puis la globale `ui_photomode_capture`
---@class ui_photomode_capture
---@field DEFAULTS table Valeurs par défaut statiques : superSampling = 2, downscaleLevel = 2, motionEnabled = false, motionBehavior = "followVehicle", splitSceneVehicle = false, saveNormalDepth = false, hdrScreenshot = false. Pour les valeurs réellement appliquées (upscaler temporel, HDR), utiliser buildDefaultSettings().
---@field dependencies string[] {"ui_photomode_flash"}
ui_photomode_capture = {}

--- Applique un patch partiel sur des réglages donnés sans toucher à l'état du module : superSampling, downscaleLevel, motion {enabled, behavior}, artifacts {splitSceneVehicle, saveNormalDepth}, hdr {enabled}, flash (transmis à ui_photomode_flash.applyStatePatch) et resolutionScale (appliqué tout de suite aux réglages graphiques GraphicUpscalingQuality, entre 0.33 et 1).
---Source : lua/ge/extensions/ui/photomode/capture.lua:816
---@param currentCaptureSettings table Réglages de départ
---@param partialState table Patch partiel
---@return table|nil  Nouveaux réglages normalisés, ou nil
---@return string|nil  capture_state_invalid ou capture_resolution_scale_set_failed
function ui_photomode_capture.applyCaptureStatePatch(currentCaptureSettings, partialState) end

--- Applique un préset de résolution en fenêtré via util_resolution.setWindowedResolution (charge l'extension util/resolution). Le préset « current » ne fait rien.
---Source : lua/ge/extensions/ui/photomode/capture.lua:393
---@param preset table Préset renvoyé par findResolutionPreset
---@return boolean  succès
---@return string|nil  resolution_api_unavailable ou resolution_apply_failed
function ui_photomode_capture.applyResolutionPreset(preset) end

--- Cherche puis applique le préset dont l'identifiant est donné (applyResolutionPreset(findResolutionPreset(id))). Si l'identifiant est inconnu, findResolutionPreset renvoie nil et applyResolutionPreset renvoie true sans rien faire.
---Source : lua/ge/extensions/ui/photomode/capture.lua:412
---@param selectedResolutionPresetId string|nil Identifiant du préset choisi
---@return boolean  succès
---@return string|nil  raison de l'échec
function ui_photomode_capture.applySelectedResolutionPresetBeforeCapture(selectedResolutionPresetId) end

--- Calcule le facteur de réduction final de l'image : 1 / racine carrée du niveau de réduction normalisé.
---Source : lua/ge/extensions/ui/photomode/capture.lua:524
---@param downscaleLevel number Niveau de réduction (1 à 8)
---@return number  Facteur d'échelle entre 0.35 et 1
function ui_photomode_capture.buildCaptureRescaleFactor(downscaleLevel) end

--- Construit l'état complet d'affichage de la capture pour l'UI : réglages, facteur de réduction, limites, libellés de résolutions (fenêtre, cible de rendu, sortie), format, rapport d'aspect, taille de fichier estimée, avertissement VRAM / supersampling élevé (seuil 6), mouvement, artefacts, HDR et état du flash.
---Source : lua/ge/extensions/ui/photomode/capture.lua:716
---@param captureSettings table|nil Réglages à décrire
---@return table  État d'affichage
function ui_photomode_capture.buildCaptureState(captureSettings) end

--- Renvoie les réglages de capture par défaut en tenant compte du contexte : supersampling et réduction à 1 si un upscaler temporel est actif (sinon 2), HDR activé par défaut seulement si le HDR est pris en charge et actif.
---Source : lua/ge/extensions/ui/photomode/capture.lua:254
---@return table  {superSampling, downscaleLevel, motionEnabled, motionBehavior, splitSceneVehicle, saveNormalDepth, hdrScreenshot}
function ui_photomode_capture.buildDefaultSettings() end

--- Sous-ensemble des réglages à écrire dans les métadonnées d'une photo : superSampling, downscaleLevel, rescaleFactor, motion, artifacts, hdr, flash, resolutionScale.
---Source : lua/ge/extensions/ui/photomode/capture.lua:1043
---@return table  Réglages de capture
function ui_photomode_capture.buildMetadataState() end

--- Normalise un jeu de réglages de capture : bornes de supersampling et de réduction (selon la VRAM), booléens, mode de mouvement, HDR désactivé si non pris en charge, supersampling et réduction forcés à 1 avec un upscaler temporel. Ajoute safeSuperSamplingMax et temporalUpscalersEnabled.
---Source : lua/ge/extensions/ui/photomode/capture.lua:529
---@param captureSettings table|nil Réglages bruts
---@return table  Réglages normalisés
function ui_photomode_capture.buildNormalizedCaptureSettings(captureSettings) end

--- Construit l'état de l'interface des présets de résolution : visible, enabled, selectedId, libellés, applyOnCapture (toujours false) et la liste items {value, label}.
---Source : lua/ge/extensions/ui/photomode/capture.lua:1039
---@return table  État des présets
function ui_photomode_capture.buildResolutionPresetState() end

--- État d'affichage de la capture avec les réglages courants du module.
---Source : lua/ge/extensions/ui/photomode/capture.lua:1035
---@return table  Voir buildCaptureState
function ui_photomode_capture.buildState() end

--- Cherche un préset de résolution par identifiant ; un identifiant vide vaut « current ».
---Source : lua/ge/extensions/ui/photomode/capture.lua:278
---@param presetId string|nil Identifiant du préset
---@return table|nil  Préset {id, labelKey, width?, height?} ou nil
function ui_photomode_capture.findResolutionPreset(presetId) end

--- Termine une capture avec flou de mouvement : restaure la demande de pause du mode photo ou remet la simulation en pause, puis détache la caméra du véhicule (immédiatement ou après quelques images).
---Source : lua/ge/extensions/ui/photomode/capture.lua:959
---@param immediateAttachRelease boolean|nil true pour détacher sans délai
function ui_photomode_capture.finishPendingMotionCapture(immediateAttachRelease) end

--- Renvoie buildState() avec ok = session de mode photo active, et reason = session_inactive sinon.
---Source : lua/ge/extensions/ui/photomode/capture.lua:1065
---@return table  État de capture
function ui_photomode_capture.getCaptureState() end

--- Renvoie {ok = fonction active, state = buildResolutionPresetState()}.
---Source : lua/ge/extensions/ui/photomode/capture.lua:1074
---@return table  {ok, state}
function ui_photomode_capture.getResolutionPresetState() end

--- À appeler à chaque image avant le rendu : décrémente le compteur de capture en cours, fait avancer la capture basique en attente (attente du HDR, envoi de la capture) et la capture avec flou de mouvement (images de préchauffage, envoi, nettoyage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/capture.lua:1596
---@param dtReal number Temps réel de l'image (s)
---@param dtSim number Temps de simulation (s)
---@param dtRaw number Temps brut (s)
function ui_photomode_capture.handlePreRender(dtReal, dtSim, dtRaw) end

--- Indique si une capture est en cours (basique en attente, mouvement en attente, ou compteur d'images de capture non nul), pour que l'UI reste masquée.
---Source : lua/ge/extensions/ui/photomode/capture.lua:1029
---@return boolean  capture en cours
function ui_photomode_capture.isCaptureInProgress() end

--- Indique si les présets de résolution sont disponibles : true quand le jeu n'est pas un build shipping.
---Source : lua/ge/extensions/ui/photomode/capture.lua:266
---@return boolean  fonction active
function ui_photomode_capture.isResolutionPresetFeatureEnabled() end

--- Prolonge le compteur d'images pendant lesquelles la capture est considérée en cours (prend le maximum de la valeur actuelle et de frames).
---Source : lua/ge/extensions/ui/photomode/capture.lua:1018
---@param frames integer Nombre d'images ; ignoré si <= 0
function ui_photomode_capture.markCaptureInProgress(frames) end

--- Arrondit la valeur de supersampling à l'entier le plus proche puis la borne entre 1 et safeMax (maximum 8).
---Source : lua/ge/extensions/ui/photomode/capture.lua:451
---@param value number Valeur demandée (défaut 2 si non numérique)
---@param safeMax number|nil Maximum sûr (8 par défaut)
---@return integer  Supersampling normalisé
function ui_photomode_capture.normalizeCaptureSuperSampling(value, safeMax) end

--- Hook appelé quand le module screenshot a fini toutes les captures : termine la capture basique en attente et restaure le HDR.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/capture.lua:1680
function ui_photomode_capture.onScreenshotAllDone() end

--- Mémorise l'échelle de résolution de départ, remet supersampling, réduction et HDR à leurs valeurs par défaut du moment, puis réapplique le flash. Appelée au début d'une session du mode photo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/capture.lua:1007
function ui_photomode_capture.refreshSessionDefaults() end

--- Demande une capture. options.motion = capture avec flou de mouvement ; options.upload = publication en ligne ; options.steam = capture Steam ; ils se combinent (upload + steam). Sans option : capture basique (chemin par défaut si supersampling et réduction valent 1 sans passe supplémentaire, sinon capture personnalisée). Gère le flash, le changement HDR (différé de quelques images) et déclenche le succès SCREENSHOT_TAKEN.
---Source : lua/ge/extensions/ui/photomode/capture.lua:1532
---@param options table|nil {motion?, upload?, steam?}
---@return table  {ok, reason?, mode, captureUiHoldFrames?}
function ui_photomode_capture.requestScreenshot(options) end

--- Annule toute capture basique en attente, remet les réglages de capture par défaut et réinitialise le flash.
---Source : lua/ge/extensions/ui/photomode/capture.lua:995
function ui_photomode_capture.resetSettings() end

--- Termine la capture basique en attente (restaure le HDR), coupe le flash et restaure l'échelle de résolution d'avant la session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/capture.lua:1001
function ui_photomode_capture.restoreCaptureRuntimeState() end

--- Applique un patch partiel aux réglages de capture du module (voir applyCaptureStatePatch), puis réapplique les réglages du flash. Exige une session active.
---Source : lua/ge/extensions/ui/photomode/capture.lua:1081
---@param partialState table Patch partiel
---@return table  {ok, reason?, state}
function ui_photomode_capture.setCaptureState(partialState) end

--- Sélectionne et applique immédiatement un préset de résolution, et le mémorise comme sélection courante.
---Source : lua/ge/extensions/ui/photomode/capture.lua:1560
---@param presetId string Identifiant du préset
---@return table  {ok, reason?, state}
function ui_photomode_capture.setResolutionPreset(presetId) end


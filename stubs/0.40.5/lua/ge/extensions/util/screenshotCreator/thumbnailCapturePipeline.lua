---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chaîne de capture d'une vignette de véhicule utilisée par le compositeur de vignettes (thumbnailComposerRun) : remplace le véhicule par la configuration voulue, le place et le laisse se stabiliser, gèle la physique, calcule la caméra avec le cadrage « legacy » (angle « warehouse », marges réduites à 85 %), pointe la caméra principale sur la prise de vue, règle l'éclairage, attend 2 s puis capture l'image avec util_screenshotCreator_capture.captureFramedThumbnail. Contrairement à job.lua, les caméras enregistrées par config ou modèle sont ignorées. processWorkItem doit être appelé depuis une coroutine, car il fait des yield.
--- Accès : extension `util_screenshotCreator_thumbnailCapturePipeline` : `extensions.load("util_screenshotCreator_thumbnailCapturePipeline")`, puis la globale `util_screenshotCreator_thumbnailCapturePipeline`
---@class util_screenshotCreator_thumbnailCapturePipeline
---@field dependencies string[] Extensions chargées avant : core_vehicles, core_camera et util_screenshotCreator_settings, vehicleSetup, capture, lightingSetup, framing_legacy, framingManager, thumbnailPaths.
util_screenshotCreator_thumbnailCapturePipeline = {}

--- Traite un élément de la file : remplace le véhicule, le place, attend sa stabilisation, gèle la physique, cadre, éclaire, capture et restaure l'éclairage. Renvoie un résultat {status = "saved", current, camera, outputFolder, outputPath} ou {status = "failed", error}, ou nil si l'annulation a été demandée.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua:65
---@param item table Élément {modelName, modelKey, configName, isDefaultConfig...}.
---@param index integer Rang de l'élément (à partir de 1).
---@param total integer Nombre total d'éléments.
---@param settingsSnapshot table Instantané des réglages : capture {superSampling, freezePhysics...}, captureTimeout.
---@param runContext table {initialPosition, initialRotation} : transformation de départ du véhicule.
---@param options table {sendProgress = function(fait, total, courant), isCancelled = function, outputResolution, captureMode}.
---@return table|nil  Résultat de l'élément ; nil si annulé.
function util_screenshotCreator_thumbnailCapturePipeline.processWorkItem(item, index, total, settingsSnapshot, runContext, options) end

--- Restaure la caméra principale mémorisée par pointMainCameraAt et l'éclairage (lightingSetup.restore).
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua:128
function util_screenshotCreator_thumbnailCapturePipeline.resetRenderState() end

--- Calcule la caméra de cadrage « warehouse angle » : contexte de cadrage issu des réglages, mode « legacy », marges multipliées par 0,85. Journalise une erreur et renvoie nil si le cadrage échoue.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailCapturePipeline.lua:45
---@param vehicle table Objet véhicule.
---@param modelName string Nom du modèle.
---@param configName string Nom de la configuration.
---@param outputResolution integer[]|nil {largeur, hauteur} de l'image finale.
---@return table|nil  Caméra {pos, rot, fov, name, ...} ou nil.
---@return table|nil  Contexte de cadrage utilisé.
function util_screenshotCreator_thumbnailCapturePipeline.resolveCamera(vehicle, modelName, configName, outputResolution) end


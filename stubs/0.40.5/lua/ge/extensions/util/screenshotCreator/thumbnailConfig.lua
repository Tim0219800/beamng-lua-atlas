---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lecture et écriture de la configuration de vignette (clé thumbnailConfig) d'un véhicule : elle est stockée dans /vehicles/<modèle>/info_<config>.json pour une configuration, et dans /vehicles/<modèle>/info.json pour le modèle. Elle contient notamment rotation (degrés, rotation du repère de caméra autour de l'axe vertical), pauseDelay (secondes d'attente avant capture) et des caméras enregistrées (configCamEnabled, modelCamEnabled). Le module fournit aussi les axes de référence du véhicule (niveau et orientés selon la rotation) et les conversions décalage de caméra <-> repère véhicule utilisées pour enregistrer et rejouer une caméra.
--- Accès : extension `util_screenshotCreator_thumbnailConfig` : `extensions.load("util_screenshotCreator_thumbnailConfig")`, puis la globale `util_screenshotCreator_thumbnailConfig`
---@class util_screenshotCreator_thumbnailConfig
---@field dependencies string[] Extensions chargées avant : core_camera et core_vehicles.
util_screenshotCreator_thumbnailConfig = {}

--- Récupère les configs de vignette d'une configuration et de son modèle (en relisant le fichier info_<config>.json si elle n'est pas en mémoire).
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:54
---@param modelName string Nom du modèle.
---@param configName string Nom de la configuration.
---@return table  {vehCamConfig = table, modelCamConfig = table|nil}.
function util_screenshotCreator_thumbnailConfig.getCameraConfig(modelName, configName) end

--- Convertit la position et l'orientation de la caméra actuelle en décalages relatifs au véhicule (dans ses axes de référence) pour pouvoir les enregistrer.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:116
---@param configName string|nil Nom de la configuration.
---@param vehicle table|nil Objet véhicule (défaut : véhicule du joueur 0).
---@return vec3  Décalage de position dans le repère du véhicule.
---@return quat  Orientation de la caméra dans le repère du véhicule.
function util_screenshotCreator_thumbnailConfig.getCameraOffsets(configName, vehicle) end

--- Calcule des axes orthonormés à partir de la boîte du véhicule : cap horizontal (axe 1), droite et haut du monde.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:95
---@param bb table Boîte englobante orientée (OOBB) avec getAxis(i).
---@return vec3  Axe droite.
---@return vec3  Axe avant (horizontal).
---@return vec3  Axe haut (0, 0, 1).
function util_screenshotCreator_thumbnailConfig.getLevelAxes(bb) end

--- Renvoie le délai d'attente avant capture en secondes (config, sinon modèle, sinon 0), jamais négatif.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:83
---@param modelName string Nom du modèle.
---@param configName string Nom de la configuration.
---@return number  Délai en secondes (>= 0).
function util_screenshotCreator_thumbnailConfig.getPauseDelay(modelName, configName) end

--- Renvoie les axes de référence du véhicule pour la caméra : axes redressés par getLevelAxes, tournés de -rotation degrés autour de l'axe vertical si une rotation est configurée.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:104
---@param vehicle table Objet véhicule.
---@param configName string|nil Nom de la configuration (pour lire la rotation).
---@param boundingBox table|nil OOBB déjà calculée ; sinon vehicle:getSpawnWorldOOBB().
---@return vec3  Axe droite.
---@return vec3  Axe avant.
---@return vec3  Axe haut.
function util_screenshotCreator_thumbnailConfig.getReferenceAxes(vehicle, configName, boundingBox) end

--- Renvoie la rotation de caméra (en degrés) : celle de la config, sinon celle du modèle, sinon 0.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:72
---@param modelName string Nom du modèle.
---@param configName string Nom de la configuration.
---@return number  Rotation en degrés.
function util_screenshotCreator_thumbnailConfig.getRotation(modelName, configName) end

--- Opération inverse de getCameraOffsets : reconstruit la position et l'orientation monde de la caméra pour le véhicule à partir de décalages enregistrés.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:132
---@param posOffset vec3 Décalage de position enregistré.
---@param rotOffset quat Orientation enregistrée.
---@param vehicle table|nil Objet véhicule (défaut : véhicule du joueur 0).
---@param configName string|nil Nom de la configuration.
---@return vec3  Position monde de la caméra.
---@return quat  Orientation monde de la caméra.
function util_screenshotCreator_thumbnailConfig.rewindCameraOffsets(posOffset, rotOffset, vehicle, configName) end

--- Enregistre la config de vignette du modèle dans /vehicles/<modèle>/info.json et met à jour la donnée en mémoire.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:41
---@param modelName string Nom du modèle.
---@param config table Table thumbnailConfig à enregistrer.
---@return boolean  Succès de l'écriture.
function util_screenshotCreator_thumbnailConfig.saveModelConfig(modelName, config) end

--- Enregistre la config de vignette d'une configuration dans son fichier info (infoFilename connu, sinon /vehicles/<modèle>/info_<config>.json) et met à jour la donnée en mémoire.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailConfig.lua:27
---@param modelName string Nom du modèle.
---@param configName string Nom de la configuration.
---@param config table Table thumbnailConfig à enregistrer.
---@return boolean  false si le fichier existant est illisible ou si l'écriture échoue.
function util_screenshotCreator_thumbnailConfig.saveVehicleConfig(modelName, configName, config) end


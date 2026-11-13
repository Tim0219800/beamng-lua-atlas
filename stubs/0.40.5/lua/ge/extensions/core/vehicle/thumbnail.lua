---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/thumbnail.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_thumbnail` : génère les miniatures (.jpg) des configurations de véhicule sauvegardées, soit directement dans vehicles/<modèle>/<config>.jpg, soit sous forme de capture temporaire d'aperçu (dossier /screenshots/vehicleConfigTemp) que l'utilisateur peut valider ou annuler avant la sauvegarde. Délègue la prise de vue à util_screenshotCreator_currentConfigThumbnail. Utilisée par core_vehicle_partmgmt.
--- Accès : extension `core_vehicle_thumbnail` : `extensions.load("core_vehicle_thumbnail")`, puis la globale `core_vehicle_thumbnail`
---@class core_vehicle_thumbnail
---@field dependencies string[] core_vehicle_manager, core_vehicle_configTarget, util_screenshotCreator_currentConfigThumbnail.
core_vehicle_thumbnail = {}

--- Annule une capture (supprime le fichier ; si elle est encore en cours, elle sera supprimée à son terme).
---Source : lua/ge/extensions/core/vehicle/thumbnail.lua:186
---@param captureId integer identifiant de la capture
---@return table  {success, captureId} ou {success = false, reason = 'captureNotFound', captureId}
function core_vehicle_thumbnail.cancelTemporaryThumbnail(captureId) end

--- Démarre une capture temporaire (aperçu) pour la config courante du véhicule configuré ; le fichier est /screenshots/vehicleConfigTemp/save-preview-<id>.jpg.
---Source : lua/ge/extensions/core/vehicle/thumbnail.lua:161
---@return table  {success = true, captureId, path} ou {success = false, reason = 'noCurrentConfig'|'busy'}
function core_vehicle_thumbnail.captureTemporaryThumbnail() end

--- Annule une capture précise, ou toutes si captureId est nil.
---Source : lua/ge/extensions/core/vehicle/thumbnail.lua:199
---@param captureId integer|nil identifiant ; nil = toutes
---@return table  {success = true} (ou résultat de cancelTemporaryThumbnail)
function core_vehicle_thumbnail.clearTemporaryThumbnail(captureId) end

--- Valide une capture prête : la copie vers targetPath puis supprime le fichier temporaire.
---Source : lua/ge/extensions/core/vehicle/thumbnail.lua:265
---@param captureId integer capture prête
---@param targetPath string chemin du .jpg définitif
---@return boolean  true si copiée
function core_vehicle_thumbnail.commitTemporaryThumbnail(captureId, targetPath) end

--- Copie un fichier miniature vers une destination en remplaçant l'ancien de manière sûre (création du dossier si nécessaire).
---Source : lua/ge/extensions/core/vehicle/thumbnail.lua:223
---@param sourcePath string fichier source existant
---@param targetPath string fichier destination
---@return boolean  true si la copie a réussi
function core_vehicle_thumbnail.copyThumbnailFile(sourcePath, targetPath) end

--- Génère la miniature de la config nommée pour le véhicule configuré, dans vehicles/<modèle>/<nom>.jpg, via util_screenshotCreator_currentConfigThumbnail.
---Source : lua/ge/extensions/core/vehicle/thumbnail.lua:110
---@param configName string nom de config (le chemin et les extensions .pc/.jpg sont retirés)
---@return boolean  true si la prise de vue a démarré
function core_vehicle_thumbnail.generateConfigThumbnail(configName) end

--- Renvoie la capture temporaire prête la plus récente.
---Source : lua/ge/extensions/core/vehicle/thumbnail.lua:114
---@return table  {captureId, path} ou {path = nil} s'il n'y en a pas
function core_vehicle_thumbnail.getTemporaryThumbnail() end

--- Indique si le chemin correspond à une capture temporaire prête, non annulée et existante.
---Source : lua/ge/extensions/core/vehicle/thumbnail.lua:213
---@param path string chemin du fichier
---@return boolean  true si valide
function core_vehicle_thumbnail.isValidTemporaryThumbnail(path) end


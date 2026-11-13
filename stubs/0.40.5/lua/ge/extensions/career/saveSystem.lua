---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/saveSystem.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de sauvegarde de la carrière. Les profils sont des dossiers de settings/cloud/saves/<profil>/ ; chaque sauvegarde est un sous-dossier (autosave1 à autosave4 en rotation, ou un nom choisi) contenant info.json (version, date UTC, creationDate, displayName, corrupted). saveCurrent écrit d'abord info.json en « corrupted », déclenche les hooks onSaveCurrentProfileAsyncStart puis onSaveCurrentProfile(chemin, miniatures) pour que chaque extension écrive ses fichiers, attend les extensions asynchrones, puis finalise info.json et émet onSaveFinished.
--- Accès : extension `career_saveSystem` : `extensions.load("career_saveSystem")`, puis la globale `career_saveSystem`
---@class career_saveSystem
career_saveSystem = {}

--- Signale qu'une extension asynchrone a fini ; finalise la sauvegarde quand toutes sont terminées.
---Source : lua/ge/extensions/career/saveSystem.lua:284
---@param extName string Nom de l'extension.
function career_saveSystem.asyncSaveExtensionFinished(extName) end

--- Liste les noms de profils (dossiers de settings/cloud/saves/).
---Source : lua/ge/extensions/career/saveSystem.lua:325
---@return string[]  Noms de profils.
function career_saveSystem.getAllProfiles() end

--- Liste les sauvegardes d'un profil (contenu d'info.json + champ name = nom du dossier), triées par date croissante.
---Source : lua/ge/extensions/career/saveSystem.lua:16
---@param profile string Nom du profil.
---@return table[]  Liste de tables info.json.
function career_saveSystem.getAllSaveFolders(profile) end

--- Version minimale de sauvegarde acceptée (36).
---Source : lua/ge/extensions/career/saveSystem.lua:362
---@return integer  Version.
function career_saveSystem.getBackwardsCompVersion() end

--- Nom d'affichage du profil courant.
---Source : lua/ge/extensions/career/saveSystem.lua:228
---@return string|nil  Nom affiché.
function career_saveSystem.getCurrentDisplayName() end

--- Retourne le profil courant et le chemin de sa sauvegarde courante.
---Source : lua/ge/extensions/career/saveSystem.lua:224
---@return string|nil  Nom du profil.
---@return string|nil  Chemin du dossier de sauvegarde courant (à utiliser comme racine des fichiers de la carrière).
function career_saveSystem.getCurrentProfile() end

--- Trouve le dossier de sauvegarde le plus récent (non corrompu) d'un chemin de profil.
---Source : lua/ge/extensions/career/saveSystem.lua:84
---@param path string Dossier du profil.
---@return string  Chemin du dossier, ou chaîne vide si aucun.
function career_saveSystem.getNewestSave(path) end

--- Racine des sauvegardes : 'settings/cloud/saves/'.
---Source : lua/ge/extensions/career/saveSystem.lua:338
---@return string  Chemin.
function career_saveSystem.getSaveRootDirectory() end

--- Version du format de sauvegarde (64).
---Source : lua/ge/extensions/career/saveSystem.lua:358
---@return integer  Version.
function career_saveSystem.getSaveSystemVersion() end

--- Écrit un JSON via un fichier temporaire puis renomme (écriture atomique).
---Source : lua/ge/extensions/career/saveSystem.lua:243
---@param filename string Fichier cible.
---@param obj table Données.
---@param pretty boolean|nil Mise en forme lisible.
---@param numberPrecision integer|nil Précision des nombres.
---@param tempFileName string|nil Fichier temporaire, défaut filename..".tmp".
---@return boolean  true si écrit.
function career_saveSystem.jsonWriteFileSafe(filename, obj, pretty, numberPrecision, tempFileName) end

--- Hook de rechargement Lua : restaure l'état retourné par onSerialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/saveSystem.lua:351
---@param v table État sauvegardé.
function career_saveSystem.onDeserialized(v) end

--- Hook de chargement ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/saveSystem.lua:335
function career_saveSystem.onExtensionLoaded() end

--- Hook de rechargement Lua : retourne le profil, le chemin, le nom d'affichage et la date de création courants.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/saveSystem.lua:342
---@return table  État à conserver.
function career_saveSystem.onSerialize() end

--- Déclare qu'une extension finira sa sauvegarde plus tard (la finalisation est retardée).
---Source : lua/ge/extensions/career/saveSystem.lua:280
---@param extName string Nom de l'extension.
function career_saveSystem.registerAsyncSaveExtension(extName) end

--- Supprime le dossier d'un profil (refusé pour le profil courant si la carrière est active).
---Source : lua/ge/extensions/career/saveSystem.lua:153
---@param profile string Nom du profil.
function career_saveSystem.removeProfile(profile) end

--- Supprime un dossier de sauvegarde d'un profil, sauf la sauvegarde courante ou un nom illégal.
---Source : lua/ge/extensions/career/saveSystem.lua:164
---@param profile string Nom du profil.
---@param saveFolderName string Nom du dossier de sauvegarde.
---@return boolean  true si supprimé.
function career_saveSystem.removeSaveFolder(profile, saveFolderName) end

--- Renomme le dossier d'un profil (refusé si le nouveau nom existe, ou pour le profil courant en carrière active).
---Source : lua/ge/extensions/career/saveSystem.lua:208
---@param profile string Ancien nom.
---@param newName string Nouveau nom.
---@return boolean|nil  true si renommé, false si refusé, nil dans les autres cas d'échec.
function career_saveSystem.renameProfile(profile, newName) end

--- Sauvegarde la carrière dans une sauvegarde automatique (la plus ancienne) ou dans saveName. Sans profil courant, ne fait rien.
---Source : lua/ge/extensions/career/saveSystem.lua:291
---@param vehiclesThumbnailUpdate any Transmis aux extensions via onSaveCurrentProfile (ex. liste d'inventoryId dont la miniature doit être mise à jour).
---@param playSuccessSound boolean|nil Joue un son à la réussite.
---@param saveName string|nil Nom d'une sauvegarde dédiée au lieu d'une autosave.
function career_saveSystem.saveCurrent(vehiclesThumbnailUpdate, playSuccessSound, saveName) end

--- Marque la sauvegarde en cours comme échouée (vide infoData).
---Source : lua/ge/extensions/career/saveSystem.lua:239
function career_saveSystem.saveFailed() end

--- Sélectionne le profil courant (et sa sauvegarde la plus récente ou une précise). Émet onBeforeSetProfile puis onSetProfile(savePath, profile). Avec profile = nil, désélectionne.
---Source : lua/ge/extensions/career/saveSystem.lua:120
---@param profile string|nil Nom du profil.
---@param specificSaveFolder string|nil Nom d'un sous-dossier de sauvegarde précis.
---@return boolean  false si profil nil ou sauvegarde trop ancienne, true sinon.
function career_saveSystem.setProfile(profile, specificSaveFolder) end


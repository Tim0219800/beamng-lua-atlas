---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/modmanager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_modmanager` : gestionnaire de mods. Au démarrage de l'interface (onUiReady), il lit la base mods/db.json, scanne /mods/*.zip et /mods/unpacked/*, détecte le type de chaque mod (vehicle, terrain, app, scenario, sound, unknown), les monte dans le système de fichiers virtuel, puis exécute les scripts modScript.lua (/scripts/**/modScript.lua et /mods_data/*/modScript.lua). Il permet d'activer, désactiver, supprimer, dépaqueter (unpack) et reconditionner (pack) un mod, détecte les doublons et les conflits de fichiers, et vérifie les mises à jour via le serveur. Un moddeur s'en sert pour savoir à quel mod appartient un fichier, lister les mods actifs, ou réagir aux hooks onModActivated / onModDeactivated / onModManagerReady.
--- Accès : extension `core_modmanager` : `extensions.load("core_modmanager")`, puis la globale `core_modmanager`
---@class core_modmanager
---@field checkUpdate function Job (core_jobsystem.wrap, délai 500) qui envoie la liste des mods au serveur (s2/v4/modSync) et applique les actions renvoyées : deactivate, update, missing, 404OLD.
---@field dependencies string[] { 'core_versionUpdate' }.
---@field initDB function Job (core_jobsystem.wrap) qui scanne /mods/, monte les mods, notifie onFileChanged, charge core_repository, lance onModManagerReady et exécute les modScripts. Appelé par onUiReady et enableAutoMount.
core_modmanager = {}

--- Monte et active tous les mods connus, exécute leurs modScripts, notifie les fichiers et met à jour l'état.
---Source : lua/ge/extensions/core/modmanager.lua:1070
function core_modmanager.activateAllMods() end

--- Active un mod : le monte s'il ne l'est pas, exécute ses modScript.lua, le marque active, émet onModActivated, notifie les fichiers ajoutés, charge les extensions en déchargement manuel et met à jour l'état.
---Source : lua/ge/extensions/core/modmanager.lua:1023
---@param modname string Clé de mod (voir getMods). Inconnu : message dans le log, rien d'autre.
function core_modmanager.activateMod(modname) end

--- Comme activateMod mais avec l'ID repository du mod (tagid) ou le modname.
---Source : lua/ge/extensions/core/modmanager.lua:1061
---@param modID string tagid ou modname.
function core_modmanager.activateModId(modID) end

--- Demande une vérification des mises à jour au prochain démarrage de initDB (si le réglage modAutoUpdates est actif et le réseau autorisé).
---Source : lua/ge/extensions/core/modmanager.lua:1486
function core_modmanager.check4Update() end

--- Vérifie un mod : compare les hash de tous ses fichiers avec le manifeste (modData.hashes) et cherche dans /vehicles/<nom>/ des fichiers qui n'appartiennent pas au mod (conflits). Renseigne mods[modname].valid et .conflict.
---Source : lua/ge/extensions/core/modmanager.lua:268
---@param modname string Clé de mod.
---@return boolean|nil  true si valide et sans conflit ; nil si le mod est inconnu.
function core_modmanager.checkMod(modname) end

--- Démonte tous les mods, les désactive et notifie les changements de fichiers.
---Source : lua/ge/extensions/core/modmanager.lua:773
function core_modmanager.deactivateAllMods() end

--- Démonte le mod, le marque inactif (active = false), émet onModDeactivated et notifie les fichiers supprimés.
---Source : lua/ge/extensions/core/modmanager.lua:974
---@param modname string Clé de mod.
---@param preventStateChange boolean|nil Si vrai, ne met pas à jour l'état (stateChanged).
---@param deferFileChanged boolean|nil Si vrai, ne notifie pas tout de suite : la liste est seulement renvoyée.
---@return table[]|nil  Liste { filename, type = 'deleted' }, ou nil si le mod n'existe pas.
function core_modmanager.deactivateMod(modname, preventStateChange, deferFileChanged) end

--- Comme deactivateMod, par ID repository (tagid) ou modname.
---Source : lua/ge/extensions/core/modmanager.lua:1014
---@param modID string tagid ou modname.
function core_modmanager.deactivateModId(modID) end

--- Supprime tous les mods installés depuis le repository (/mods/repo/) et demande au serveur de désabonner l'utilisateur de tous les mods.
---Source : lua/ge/extensions/core/modmanager.lua:1139
function core_modmanager.deleteAllMods() end

--- Démonte puis supprime le fichier ou dossier du mod (seulement sous /mods/) et le retire de la base.
---Source : lua/ge/extensions/core/modmanager.lua:1116
---@param modname string Clé de mod.
---@return boolean|nil  true si supprimé, false si la suppression échoue, nil si le mod n'existe pas.
function core_modmanager.deleteMod(modname) end

--- Désactive le montage automatique des zips qui apparaissent dans /mods/.
---Source : lua/ge/extensions/core/modmanager.lua:1497
function core_modmanager.disableAutoMount() end

--- Réactive le montage automatique et relance initDB pour rattraper les changements.
---Source : lua/ge/extensions/core/modmanager.lua:1501
function core_modmanager.enableAutoMount() end

--- Désactive le réglage disableModsAfterUpdate et initialise le gestionnaire de mods.
---Source : lua/ge/extensions/core/modmanager.lua:808
function core_modmanager.enableModsAfterUpdate() end

--- Renvoie la liste des conflits calculée par checkMod.
---Source : lua/ge/extensions/core/modmanager.lua:1437
---@param modname string Clé de mod.
---@return table[]|nil  Éléments { file, path } ou nil.
function core_modmanager.getConflict(modname) end

--- Renvoie la fiche d'un mod dans la base.
---Source : lua/ge/extensions/core/modmanager.lua:1442
---@param modname string Clé de mod.
---@return table|nil  Fiche du mod.
function core_modmanager.getModDB(modname) end

--- Cherche, à partir du chemin réel d'un fichier virtuel, le mod zip du dossier utilisateur qui le contient. Ne gère pas les mods dépaquetés.
---Source : lua/ge/extensions/core/modmanager.lua:1461
---@param filename_virtual string Chemin virtuel.
---@return string|nil  modname.
---@return table|nil  fiche du mod.
function core_modmanager.getModForFilename(filename_virtual) end

--- Retrouve la fiche d'un mod à partir du chemin de son archive d'origine (converti en modname).
---Source : lua/ge/extensions/core/modmanager.lua:196
---@param originArchivePath string|nil Chemin de l'archive.
---@return table|nil  Fiche du mod.
function core_modmanager.getModFromOriginArchivePath(originArchivePath) end

--- Trouve le mod qui fournit un fichier virtuel, via l'archive d'origine du fichier. Lent : à utiliser avec précaution.
---Source : lua/ge/extensions/core/modmanager.lua:202
---@param vfsPath string Chemin virtuel (ex. '/levels/x/info.json').
---@return table|nil  Fiche du mod, nil si le fichier vient du jeu de base.
function core_modmanager.getModFromPath(vfsPath) end

--- Ancien nom de getModFromPath, conservé pour compatibilité.
---Source : lua/ge/extensions/core/modmanager.lua:202
---@param vfsPath string Chemin virtuel.
---@return table|nil  Fiche du mod.
function core_modmanager.getModFromPathSUPERSLOW(vfsPath) end

--- Cherche le modname dont le tagid (ID repository) vaut modID, ou dont le nom est modID.
---Source : lua/ge/extensions/core/modmanager.lua:1004
---@param modID string ID repository ou modname.
---@return string|nil  modname trouvé.
function core_modmanager.getModNameFromID(modID) end

--- Renvoie la table interne de tous les mods (pas une copie).
---Source : lua/ge/extensions/core/modmanager.lua:1521
---@return table<string, table>  modname -> fiche.
function core_modmanager.getMods() end

--- Compte les mods : disabled (non actifs), zip (actifs en fichier), unpacked (actifs en dossier).
---Source : lua/ge/extensions/core/modmanager.lua:1506
---@return table  { zip, unpacked, disabled }
function core_modmanager.getStats() end

--- Indique si la base de mods a été initialisée et les mods montés.
---Source : lua/ge/extensions/core/modmanager.lua:1337
---@return boolean|nil  true quand prêt, nil avant.
function core_modmanager.isReady() end

--- Indique si le mod est dépaqueté (dossier dans /mods/unpacked/).
---Source : lua/ge/extensions/core/modmanager.lua:1450
---@param modname string Nom ou chemin du mod.
---@return boolean  true si dépaqueté.
function core_modmanager.modIsUnpacked(modname) end

--- Hook de changement de fichier : si un .zip apparaît ou change dans /mods/ (hors /mods/unpacked et mods/db.json) et que le montage auto est actif, appelle workOffChangedMod.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/modmanager.lua:1330
---@param filename string Chemin virtuel du fichier.
---@param type string 'added', 'modified' ou 'deleted'.
function core_modmanager.onFileChanged(filename, type) end

--- Hook appelé quand l'interface est prête : charge mods/db.json puis lance initDB (sauf si les mods sont désactivés après mise à jour ou si déjà prêt).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/modmanager.lua:792
function core_modmanager.onUiReady() end

--- Ouvre le dossier dépaqueté du mod dans l'explorateur de fichiers du système.
---Source : lua/ge/extensions/core/modmanager.lua:163
---@param filename string Clé de mod (modname).
function core_modmanager.openEntryInExplorer(filename) end

--- Ouvre le dossier /mods/ dans l'explorateur de fichiers.
---Source : lua/ge/extensions/core/modmanager.lua:1446
function core_modmanager.openModFolderInExplorer() end

--- Recrée le zip d'un mod dépaqueté à partir de son dossier, supprime le dossier et remet la fiche en mode zip.
---Source : lua/ge/extensions/core/modmanager.lua:1227
---@param dirPath string Chemin du dossier dépaqueté (ex. '/mods/unpacked/monMod').
---@return boolean|nil  false en cas d'erreur ; nil en cas de succès (pas de return explicite).
function core_modmanager.packMod(dirPath) end

--- Envoie à l'interface l'état courant : liste des mods (ModManagerModsChanged), liste des véhicules (ModManagerVehiclesChanged) et la liste des niveaux (core_levels.requestData).
---Source : lua/ge/extensions/core/modmanager.lua:40
function core_modmanager.requestState() end

--- Extrait un mod zip vers /mods/unpacked/<nom>, supprime le zip, monte le dossier et met à jour la fiche (unpackedPath, orgZipFilename, fullpath). Affiche une progression dans la barre des tâches.
---Source : lua/ge/extensions/core/modmanager.lua:1149
---@param modname string Clé de mod.
function core_modmanager.unpackMod(modname) end

--- Remplace un zip de mod par un nouveau fichier : supprime l'ancien (et sa fiche) puis renomme le nouveau avec l'ancien nom, dans /mods/. Contient un bug (voir notes).
---Source : lua/ge/extensions/core/modmanager.lua:1525
---@param oldFileName string Nom de l'ancien zip (relatif à /mods/).
---@param newFileName string Nom du nouveau zip (relatif à /mods/).
function core_modmanager.updateZipMod(oldFileName, newFileName) end

--- Traite un zip ajouté ou modifié dans /mods/ : met à jour la base, active le mod s'il n'est pas désactivé et prévient le moteur des fichiers changés. Refuse (et supprime le zip) si une version dépaquetée du même mod existe.
---Source : lua/ge/extensions/core/modmanager.lua:1307
---@param filename string Chemin du zip.
---@param type string 'added' ou 'modified' pour agir.
function core_modmanager.workOffChangedMod(filename, type) end


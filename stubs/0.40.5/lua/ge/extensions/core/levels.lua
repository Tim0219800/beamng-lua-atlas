---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/levels.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_levels` : catalogue des niveaux (dossiers de /levels/), lecture de leur info.json, et lancement d'un niveau (startLevel). Un moddeur s'en sert pour lister les cartes disponibles (y compris celles venant de mods), retrouver le titre ou l'aperçu d'une carte, ou charger une carte par script. La liste est calculée une fois (lecture disque lente) puis mise en cache ; le cache est invalidé quand un fichier sous /levels/ change.
--- Accès : extension `core_levels` : `extensions.load("core_levels")`, puis la globale `core_levels`
---@class core_levels
---@field dependencies string[] Extensions chargées avant celle-ci : { "freeroam_levelStats" }.
---@field levelsDir string Toujours '/levels/', conservé pour compatibilité avec d'anciens scripts.
core_levels = {}

--- Résout un nom de fichier de niveau : renvoie tel quel un dossier existant, sinon le fichier développé s'il existe, sinon essaie les variantes .level.json et .mis.
---Source : lua/ge/extensions/core/levels.lua:443
---@param missionFileName string Chemin du niveau (dossier, .mis, .level.json ou sans extension).
---@return string|nil  Chemin existant trouvé, ou nil (aucun return explicite).
function core_levels.expandMissionFileName(missionFileName) end

--- Cherche un niveau par son nom de dossier, sans tenir compte de la casse.
---Source : lua/ge/extensions/core/levels.lua:246
---@param levelName string Nom du niveau (ex. 'west_coast_usa').
---@return table|nil  L'entrée de getList, ou nil si introuvable.
function core_levels.getLevelByName(levelName) end

--- Extrait le nom du niveau d'un chemin de la forme '/levels/<nom>/...'.
---Source : lua/ge/extensions/core/levels.lua:512
---@param path string Chemin virtuel contenant levels/<nom>/.
---@return string|nil  Nom du niveau, ou nil si le motif ne correspond pas.
function core_levels.getLevelName(path) end

--- Renvoie seulement les noms (levelName) des niveaux, dans l'ordre de getList.
---Source : lua/ge/extensions/core/levels.lua:225
---@return string[]  Noms de dossiers des niveaux.
function core_levels.getLevelNames() end

--- Renvoie les dossiers des niveaux, chacun terminé par '/'.
---Source : lua/ge/extensions/core/levels.lua:233
---@return string[]  Chemins du type '/levels/gridmap_v2/'.
function core_levels.getLevelPaths() end

--- Renvoie le premier chemin d'image d'aperçu du niveau. Résultat mis en cache ; écrit une ligne dans le log à chaque calcul.
---Source : lua/ge/extensions/core/levels.lua:281
---@param levelName string|nil Nom du niveau.
---@return string|nil  Chemin de l'image, ou nil.
function core_levels.getLevelPreview(levelName) end

--- Renvoie le titre affichable du niveau (champ title, sinon levelName). Résultat mis en cache.
---Source : lua/ge/extensions/core/levels.lua:256
---@param levelName string|nil Nom du niveau ; nil renvoie nil.
---@return string|nil  Titre, ou nil si le niveau est inconnu.
function core_levels.getLevelTitle(levelName) end

--- Renvoie le tableau de tous les niveaux valides, triés par nom sans tenir compte de la casse. Construit au premier appel (lent, accès disque) puis mis en cache. Renvoie {} si /levels/ n'existe pas.
---Source : lua/ge/extensions/core/levels.lua:74
---@return table[]  Liste des infos de niveau (info.json enrichi, voir notes).
function core_levels.getList() end

--- Renvoie la liste des niveaux avec les statistiques d'interface fournies par freeroam_levelStats.
---Source : lua/ge/extensions/core/levels.lua:567
---@return table  { levels = getList(), uiStats = freeroam_levelStats.getUiStats() }
function core_levels.getListWithStats() end

--- Alias de getLevelNames, gardé pour compatibilité.
---Source : lua/ge/extensions/core/levels.lua:225
---@return string[]  Noms de dossiers des niveaux.
function core_levels.getSimpleList() end

--- Renvoie les choix d'heure de la journée proposés pour le niveau (pris dans core_environment.getDefaultTimeOfDayOptions), uniquement si le niveau a supportsTimeOfDay. Triés : valeurs > 0.5 en premier (croissantes), puis valeurs <= 0.5 (croissantes).
---Source : lua/ge/extensions/core/levels.lua:311
---@param levelName string|nil Nom du niveau ; nil renvoie {}.
---@return table[]  Éléments { key, value, label }. Vide si non supporté ou niveau inconnu.
function core_levels.getTimeOfDayOptions(levelName) end

--- Indique si le cache de la liste des niveaux est déjà construit.
---Source : lua/ge/extensions/core/levels.lua:220
---@return boolean  true si getList a déjà été calculée et pas invalidée depuis.
function core_levels.isListLoaded() end

--- Fait apparaître le véhicule joueur ('thePlayer') choisi via startLevel (ou le véhicule par défaut) au point d'apparition 'player', l'ajoute à MissionCleanup et MissionGroup et le marque canSave = false. Appelé par le flux de chargement de niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/levels.lua:382
function core_levels.maybeSpawnDefaultVehicle() end

--- Hook appelé après le démarrage d'un niveau côté client : régénère tous les DecalRoad de la scène.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/levels.lua:434
function core_levels.onClientPostStartMission() end

--- Hook appelé quand des fichiers changent. Si un chemin commence par '/levels/', vide tous les caches et renvoie la liste à l'interface (onLevelsChanged).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/levels.lua:359
---@param files table[] Éléments avec un champ filename.
function core_levels.onFilesChanged(files) end

--- Hook de collecte des points d'intérêt d'un niveau : ajoute à `elements` un POI de type spawnPoint (marqueur de grande carte, voyage rapide) pour chaque spawnPoint qui a un objectname trouvé dans la scène. En mode carrière, seuls les points découverts sont ajoutés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/levels.lua:539
---@param levelIdentifier string Nom du niveau.
---@param elements table[] Liste de POI à compléter (modifiée en place).
function core_levels.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- Alias de notifyUI : envoie à l'interface la liste avec statistiques via guihooks.trigger('onLevelsChanged', levels, uiStats).
---Source : lua/ge/extensions/core/levels.lua:241
function core_levels.requestData() end

--- Charge un niveau avec écran de chargement 'levels'. Se déconnecte d'abord si un niveau est déjà chargé. Ignoré si un chargement est déjà en cours.
---Source : lua/ge/extensions/core/levels.lua:516
---@param levelPath string Dossier du niveau ou fichier main.level.json (converti en dossier si le fichier n'existe pas).
---@param delayedStart boolean|nil Si vrai, termine d'abord le mode de jeu actif (endActiveGameMode) puis charge.
---@param customLoadingFunction function|nil Transmise à server.createGame pour remplacer le chargement standard (déduit du code).
---@param spawnVehicle table|false|nil Véhicule à faire apparaître au chargement : { modèle, options } ; false = aucun ; nil = véhicule par défaut.
---@return any  Résultat de la déconnexion ou du chargement ; false si le chemin est invalide ; nil sinon.
function core_levels.startLevel(levelPath, delayedStart, customLoadingFunction, spawnVehicle) end


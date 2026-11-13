---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/quickRaceLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chargeur des courses rapides (quickrace). Il parcourt les niveaux (levels/<niveau>/quickrace/*.json, fichiers .race.json compris) et les pistes du Track Editor (dossier trackEditor/ des documents utilisateur), fabrique la liste des niveaux et pistes affichée par l'écran de sélection, puis transforme un choix (piste, véhicule, type de course) en scénario via scenario_scenariosLoader.processScenarioData et le lance. Un moddeur de piste de quickrace s'en sert indirectement : ses fichiers sont lus par getTracks.
--- Accès : extension `scenario_quickRaceLoader` : `extensions.load("scenario_quickRaceLoader")`, puis la globale `scenario_quickRaceLoader`
---@class scenario_quickRaceLoader
---@field quickRaceModules string[] Extensions chargées au démarrage d'une quickrace : scenario_scenarios, statistics_statistics, scenario_waypoints, scenario_quickRace, core_hotlapping.
scenario_quickRaceLoader = {}

--- Détermine les images d'aperçu d'un niveau : levelInfo.previews préfixés par le dossier du niveau, sinon les fichiers <niveau>_preview*.png puis .jpg à la racine du niveau. Écrit levelInfo.directory et levelInfo.previews.
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:189
---@param levelInfo table Entrée de niveau en cours de construction (doit avoir levelInfo.levelInfo).
---@param levelName string Nom de dossier du niveau.
---@return string[]  Liste de chemins d'images (avertissement dans le log si vide).
function scenario_quickRaceLoader.customPreviewLoader(levelInfo, levelName) end

--- Retrouve un niveau de la liste des quickraces par son nom de dossier ou son titre.
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:162
---@param levelName string Nom de dossier ou titre (levelInfo.title).
---@return table|nil  Entrée de niveau, ou nil.
function scenario_quickRaceLoader.getLevel(levelName) end

--- Renvoie la liste des noms de niveaux (dossiers de levels/ contenant info.json).
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:17
---@return string[]  Noms de niveaux ; liste vide si le dossier levels/ n'existe pas.
function scenario_quickRaceLoader.getLevelList() end

--- Retrouve une piste d'un niveau par son nom.
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:175
---@param levelName string Nom ou titre du niveau.
---@param trackName string Champ name de la piste.
---@return table|nil  La piste, ou nil.
function scenario_quickRaceLoader.getLevelTrack(levelName, trackName) end

--- Construit la liste des niveaux qui contiennent des quickraces (fichiers JSON de levels/<niveau>/quickrace/ ou pistes Track Editor). Chaque entrée décrit un pseudo-scénario pour l'UI : levelName, levelInfo, name, previews, tracks, trackCount, vehicles (scenario_player0 joueur), playersCountRange, etc.
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:49
---@param levelList string[]|nil Niveaux à examiner ; défaut getLevelList().
---@return table[]  Liste d'entrées de niveau avec au moins une piste.
function scenario_quickRaceLoader.getQuickraceList(levelList) end

--- Lit les fichiers trackEditor/*.json de l'utilisateur et crée une piste quickrace pour chacun (nom, auteur, difficulté 37 par défaut, lapCount selon connected/defaultLaps, aperçu jpg/png, spawnSpheres '_standing_spawn' etc., luaFile util/trackBuilder/quickraceSetup).
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:233
---@return table<string, table[]>  Pistes regroupées par nom de niveau.
function scenario_quickRaceLoader.getTrackEditorTracks() end

--- Analyse les fichiers quickrace d'un niveau et renvoie la liste des pistes complétées avec les valeurs par défaut (voir notes), triée par nom.
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:339
---@param quickraceFiles string[] Chemins des fichiers JSON de quickrace.
---@param levelName string Nom du dossier du niveau.
---@param lvlName string Nom du niveau, utilisé pour détecter 'driver_training' (pistes procédurales).
---@return table[]  Pistes, avec trackName, directory, previews, spawnSpheres, official, etc.
function scenario_quickRaceLoader.getTracks(quickraceFiles, levelName, lvlName) end

--- Transforme une piste et un véhicule choisis en scénario complet : renseigne scenarioFile (track, vehicle, name, lapCount, lapConfig, prefabs, startHTML, introType, isReverse, rollingStart, levelObjects.tod, isQuickRace, quickraceType) puis appelle scenario_scenariosLoader.processScenarioData.
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:451
---@param scenarioKey string|nil Clé du scénario (nil depuis startQuickrace).
---@param scenarioFile table Entrée de niveau de getQuickraceList, modifiée en place.
---@param trackFile table Piste choisie ; track.reverse, track.rollingStart et track.tod sont lus.
---@param vehicleFile table Véhicule choisi (model, config, file...).
---@param raceType string Type de course, stocké dans quickraceType (déduit du code).
---@return table  Scénario traité.
function scenario_quickRaceLoader.loadQuickrace(scenarioKey, scenarioFile, trackFile, vehicleFile, raceType) end

--- Lit le JSON d'une piste du Track Editor : trackEditor/<nom>.json.
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:320
---@param originalFilename string Nom de la piste sans dossier ni extension.
---@return table|nil  Contenu du JSON, ou nil (fichier absent ou illisible, message d'info dans le log).
function scenario_quickRaceLoader.loadTrackBuilderJSON(originalFilename) end

--- Démarre une quickrace. Si un niveau est déjà chargé, décale le démarrage jusqu'à son déchargement. Sinon charge les extensions de quickRaceModules, le luaFile de la piste (et util/trackBuilder/splineTrack pour une piste Track Editor), construit le scénario avec loadQuickrace et appelle scenario_scenarios.executeScenario.
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:551
---@param scenarioFile table Entrée de niveau.
---@param trackFile table Piste choisie.
---@param vehicleFile table Véhicule choisi.
---@param raceType string Type de course.
function scenario_quickRaceLoader.startQuickrace(scenarioFile, trackFile, vehicleFile, raceType) end

--- Appelé par l'UI (application hotlapping) : charge core_hotlapping à la demande si aucun scénario n'est en cours puis appelle core_hotlapping.startHotlapping().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:581
function scenario_quickRaceLoader.uiEventStartHotlapping() end

--- Appelé par l'UI quand l'application hotlapping est détruite : décharge core_hotlapping si aucun scénario n'est en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRaceLoader.lua:593
function scenario_quickRaceLoader.uiHotlappingAppDestroyed() end


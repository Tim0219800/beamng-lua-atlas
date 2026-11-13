---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/scenariosLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Charge et normalise les fichiers de scénario (.json dans levels/<niveau>/scenarios/), les listes pour l'UI et les démarre. processScenarioData complète la table lue du JSON avec des valeurs par défaut (véhicules, extensions, prefabs, aperçus, nombre de joueurs, lapConfig, listes d'actions autorisées/interdites, tentatives). start() décharge le niveau courant si besoin, charge les extensions de scénario (scenario_scenarios, scenario_waypoints, statistics_statistics, scenario_raceUI, scenario_raceGoals) et appelle scenario_scenarios.executeScenario, ou lance un flowgraph. Un moddeur l'utilise pour lister (getList) ou lancer (startByPath, load) un scénario.
--- Accès : extension `scenario_scenariosLoader` : `extensions.load("scenario_scenariosLoader")`, puis la globale `scenario_scenariosLoader`
---@class scenario_scenariosLoader
---@field dependencies table<integer, string> {'core_levels'}
---@field prefabCache table Cache [cheminDuNiveau][dossier][nomMinuscule] = chemin du prefab, rempli par buildPrefabCache.
---@field processedScenarioCache table Table vide, jamais utilisée dans ce fichier.
---@field scenarioModules table<integer, string> Extensions chargées par start() : scenario_scenarios, scenario_waypoints, statistics_statistics, scenario_raceUI, scenario_raceGoals.
scenario_scenariosLoader = {}

--- Liste les niveaux contenant un sous-dossier de scénarios (cas des routes de bus) avec, pour chaque ligne de bus (*.buslines.json), une copie du premier scénario du niveau adaptée à la route (nom, aperçu, véhicule, point de départ, busdriver.routeID, variance, strictStop=true, traffic=false).
---Source : lua/ge/extensions/scenario/scenariosLoader.lua:552
---@param subdirectory string sous-dossier dans scenarios/ (ex. 'busdriver')
---@param levelList table<integer, string>|nil niveaux à parcourir (tous par défaut)
---@return table<integer, table>  niveaux {levelName, levelInfo, official, previews, scenarios}
function scenario_scenariosLoader.getLevels(subdirectory, levelList) end

--- Liste tous les scénarios disponibles : fichiers .json des niveaux, flowgraphs isScenario, et missions disponibles comme scénarios. Sert à l'UI et à techCore.
---Source : lua/ge/extensions/scenario/scenariosLoader.lua:326
---@param subdirectory string|nil sous-dossier de scenarios/ à restreindre
---@param includeAll boolean|nil inclure aussi les scénarios restreints à la campagne et toutes les missions
---@param skipMissions boolean|nil ne pas ajouter les missions
---@return table<integer, table>  scénarios
function scenario_scenariosLoader.getList(subdirectory, includeAll, skipMissions) end

--- Transforme une mission (gameplay_missions) en scénario utilisable par l'UI (flowgraph loadMissionAsScenario.flow.json, variables level et missionId, previews, auteur, difficulté, infos de mod).
---Source : lua/ge/extensions/scenario/scenariosLoader.lua:283
---@param m table mission
---@return table  scénario normalisé
function scenario_scenariosLoader.getScenarioDataForMission(m) end

--- Cherche dans getList() les scénarios dont name == name et démarre chacun (pas de break).
---Source : lua/ge/extensions/scenario/scenariosLoader.lua:515
---@param name string nom du scénario
function scenario_scenariosLoader.load(name) end

--- Lit un fichier de scénario (JSON, tableau à 1 élément) et le passe à processScenarioData. Logue une erreur si le fichier est introuvable.
---Source : lua/ge/extensions/scenario/scenariosLoader.lua:261
---@param scenarioPath string chemin du fichier
---@param key any clé de scénario (facultatif)
---@return table|nil  scénario normalisé
function scenario_scenariosLoader.loadScenario(scenarioPath, key) end

--- Hook (émis par main.lua pour chaque fichier modifié) : censé recharger le scénario si son fichier source change (inopérant, voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/scenariosLoader.lua:506
---@param filename string fichier modifié
---@param type string type de changement
function scenario_scenariosLoader.onFileChanged(filename, type) end

--- Complète et normalise une table de scénario (voir notes) : déduit levelName, scenarioName, directory, mission, previews, prefabs, métadonnées de mod, applique les valeurs par défaut et renvoie la même table.
---Source : lua/ge/extensions/scenario/scenariosLoader.lua:39
---@param scenarioKey any clé mémorisée dans scenarioData.scenarioKey (nil possible)
---@param scenarioData table scénario brut (modifié en place)
---@param scenarioFilename string|nil chemin du .json ; nil pour un scénario créé depuis une mission
---@return table  scénario normalisé
function scenario_scenariosLoader.processScenarioData(scenarioKey, scenarioData, scenarioFilename) end

--- Appelée quand l'utilisateur choisit un scénario dans l'UI : arrête la campagne, décharge le niveau en cours si besoin, puis lance le scénario (classique ou flowgraph).
---Source : lua/ge/extensions/scenario/scenariosLoader.lua:426
---@param sc table scénario normalisé
---@return boolean|nil  true si le flowgraph est introuvable
function scenario_scenariosLoader.start(sc) end

--- Charge puis démarre le scénario d'un fichier (ajoute .json si absent).
---Source : lua/ge/extensions/scenario/scenariosLoader.lua:470
---@param path string chemin du scénario
---@return boolean  false si le fichier n'existe pas, sinon true
function scenario_scenariosLoader.startByPath(path) end


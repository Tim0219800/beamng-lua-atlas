---@meta
-- tim19Atlas stub generated from lua/ge/extensions/scenario/quickRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique d'une course rapide (quickrace) : charge les prefabs et le flowgraph de la piste, crée le véhicule du joueur à la position de départ, convertit le chemin de course (fichier raceFile) en noeuds et configuration de tour (lapConfig) pour le système de scénario, puis enregistre les temps et les highscores. Elle ne s'active que pour les scénarios fabriqués par scenario_quickRaceLoader (scenario.isQuickRace).
--- Accès : extension `scenario_quickRace` : `extensions.load("scenario_quickRace")`, puis la globale `scenario_quickRace`
---@class scenario_quickRace
---@field addCheckPoint any
---@field loadCheckpoints any
scenario_quickRace = {}

--- Bascule l'écran de configuration quickrace en cours de course : ouvre le menu 'menu.quickrace' en mettant la simulation en pause, ou ferme et reprend (simTimeAuthority.pause).
---Source : lua/ge/extensions/scenario/quickRace.lua:365
function scenario_quickRace.changeTimeTrialConfig() end

--- Construit la clé de configuration utilisée pour les highscores : 'standing' ou 'rolling', suffixe 'Reverse' si reverse, puis le nombre de tours. Les arguments nil se rabattent sur scenario.rollingStart, scenario.isReverse et scenario.lapCount.
---Source : lua/ge/extensions/scenario/quickRace.lua:238
---@param rolling boolean|nil Départ lancé.
---@param reverse boolean|nil Sens inverse.
---@param laps integer|nil Nombre de tours.
---@return string  Par exemple 'rollingReverse3'.
function scenario_quickRace.getConfigKey(rolling, reverse, laps) end

--- Parcourt récursivement les segments d'un chemin de course et renvoie la liste des noms de noeuds générés (_generatedName) ; aux embranchements, ajoute une sous-liste de marqueurs '__b<id>' et remplit config.branches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRace.lua:67
---@param segment table Segment de départ (objet de path.segments).
---@param config table Table de configuration modifiée : reçoit config.branches.
---@return table  Liste ordonnée de noms de noeuds (pouvant contenir des sous-listes pour les embranchements).
function scenario_quickRace.getNodesOnBranch(segment, config) end

--- Renvoie la marque du véhicule du scénario (scenario.vehicle.file.Brand).
---Source : lua/ge/extensions/scenario/quickRace.lua:310
---@param scenario table Scénario quickrace.
---@return string  Marque.
function scenario_quickRace.getVehicleBrand(scenario) end

--- Renvoie le nom du véhicule du scénario (scenario.vehicle.file.Name).
---Source : lua/ge/extensions/scenario/quickRace.lua:314
---@param scenario table Scénario quickrace.
---@return string  Nom.
function scenario_quickRace.getVehicleName(scenario) end

--- Crée le véhicule du joueur (scenario.vehicle) nommé 'scenario_player0' avec core_vehicles.spawnNewVehicle, à la position de départ calculée (startTransform du raceFile, ou à défaut la spawnSphere standing/rolling[/Reverse] de la piste), puis l'ajoute au groupe ScenarioObjectsGroup. Si la spawnSphere est introuvable, utilise 0/0/0 avec une erreur dans le log.
---Source : lua/ge/extensions/scenario/quickRace.lua:167
---@param scenario table Scénario quickrace (scenario.vehicle, scenario.track).
function scenario_quickRace.loadVehicle(scenario) end

--- Hook de fin de mission : arrête et supprime le flowgraph de la piste s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRace.lua:140
function scenario_quickRace.onClientEndMission() end

--- Hook appelé par l'UI à la fin du compte à rebours : dégèle le véhicule joueur (controller.setFreeze(0)) et vide la liste des temps.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRace.lua:227
function scenario_quickRace.onCountdownEnded() end

--- Hook appelé par le chargeur de scénario. Inverse le chemin si track.reverse, lance path:autoConfig(), génère sc.generatedNodes (noeuds nommés '__generated_from_path__<id>' avec pos, radius, rot), sc.startTimerCheckpoint, sc.lapConfig, sc.initialLapConfig, et éventuellement sc.BranchLapConfig et sc.lapConfigBranches, puis les fusionne dans sc.nodes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRace.lua:89
---@param sc table Scénario quickrace.
function scenario_quickRace.onCustomWaypoints(sc) end

--- Hook appelé par le chargeur de scénario. Si la piste (sc.track) définit un flowgraph, le charge et le lance en mode transitoire ; si elle définit raceFile, lit le JSON, construit un gameplay/race/path dans sc.path et calcule sc.track.startTransform selon rollingStart et reverse. Termine par loadVehicle(sc).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRace.lua:17
---@param sc table Scénario quickrace (sc.track, sc.vehicle).
function scenario_quickRace.onLoadCustomPrefabs(sc) end

--- Hook appelé à la fin de la course. Enregistre le temps final (final.finalTime en secondes, converti en ms) dans les highscores, remplit scenario.highscores (scores, place, singleScores) et scenario.detailedRecord pour l'écran de résultats.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRace.lua:318
---@param final table Résultat final, avec finalTime en secondes.
function scenario_quickRace.onRaceResult(final) end

--- Hook appelé par le système de course à chaque waypoint. Au dernier waypoint (ou retour au premier), calcule le temps du tour, l'enregistre dans les highscores (core_highscores.setScenarioHighscoresCustom) et met à jour scenario.highscores.singleRound.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRace.lua:260
---@param wpInfo table Informations de waypoint : next, time (temps cumulé).
function scenario_quickRace.onRaceWaypointReached(wpInfo) end

--- Hook appelé quand le scénario est chargé. Allume les antibrouillards et les feux du véhicule joueur si track.tod vaut 0, 1 ou 8 (nuit), et inverse la direction (rot) des noeuds si track.reverse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRace.lua:148
---@param sc table Scénario quickrace.
function scenario_quickRace.onScenarioLoaded(sc) end

--- Hook appelé quand l'état de l'UI change : si on revient de 'menu.quickrace' vers 'menu' alors que timeTrialOpen est vrai, referme la configuration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/scenario/quickRace.lua:381
---@param curUIState string Nouvel état de l'UI.
---@param prevUIState string État précédent.
function scenario_quickRace.onUiChangedState(curUIState, prevUIState) end


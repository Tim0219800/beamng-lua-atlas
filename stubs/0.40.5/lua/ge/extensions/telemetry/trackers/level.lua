---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/level.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des niveaux et des scénarios : quels niveaux sont joués et combien de temps (activité « levelLoaded »), plus le cycle de vie des scénarios (activité « scenarioRunning » avec le résultat). Le temps de chargement du niveau (loadMs) est ajouté à la fin de l'activité levelLoaded, car le chargement n'est terminé que bien après son ouverture. Le suivi par image des collisions et dégâts qui existait ici a été retiré (trop d'évènements).
--- Accès : extension `telemetry_trackers_level` : `extensions.load("telemetry_trackers_level")`, puis la globale `telemetry_trackers_level`
---@class telemetry_trackers_level
---@field dependencies string[] telemetry_core.
telemetry_trackers_level = {}

--- Hook appelé à la sortie du niveau : termine scénario éventuel et niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:84
---@param levelPath string Chemin du niveau.
function telemetry_trackers_level.onClientEndMission(levelPath) end

--- Hook appelé tout en haut de la chaîne de chargement (avant datablocks, objets et physique), à chaque chargement y compris les redémarrages : mémorise l'heure de début de chargement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:57
---@param levelPath string Chemin du niveau.
function telemetry_trackers_level.onClientPreStartMission(levelPath) end

--- Hook appelé au démarrage du niveau (écran de chargement encore affiché) : démarre l'activité levelLoaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:62
---@param levelPath string Chemin du niveau.
function telemetry_trackers_level.onClientStartMission(levelPath) end

--- Hook appelé à la fermeture du jeu : ferme les activités ouvertes pour ne pas laisser de débuts sans fin dans le fichier de session.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:114
function telemetry_trackers_level.onExit() end

--- Hook appelé au chargement : déchargement manuel ; si un niveau est déjà chargé, démarre l'activité immédiatement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:103
function telemetry_trackers_level.onExtensionLoaded() end

--- Hook appelé au déchargement : un rechargement Lua détruit les suiveurs sans onExit, donc les activités sont fermées ici aussi (même fonction que endLevel).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:39
function telemetry_trackers_level.onExtensionUnloaded() end

--- Hook appelé au démarrage d'un scénario flowgraph ; même fonction que onScenarioLoaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:88
---@param scenario table Scénario.
function telemetry_trackers_level.onFlowgraphScenarioStarted(scenario) end

--- Hook appelé à la fin d'un scénario : termine l'activité avec « failed » ou « success » selon pooledResults[1].failed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:93
---@param scenario table Scénario terminé.
function telemetry_trackers_level.onScenarioFinished(scenario) end

--- Hook appelé au chargement d'un scénario : démarre l'activité scenarioRunning (nom et fichier source).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:88
---@param scenario table Scénario (name, sourceFile).
function telemetry_trackers_level.onScenarioLoaded(scenario) end

--- Hook appelé au redémarrage d'un scénario : termine l'activité avec « restarted » puis en démarre une nouvelle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:98
---@param scenario table Scénario.
function telemetry_trackers_level.onScenarioRestarted(scenario) end

--- Hook appelé aux changements d'état de préparation du monde. L'état 2 est le premier moment où le joueur peut conduire (caméra avec son objet de contrôle, matériaux du véhicule prêts) : calcule loadMs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/level.lua:77
---@param state integer État de préparation (seul 2 est utilisé).
function telemetry_trackers_level.onWorldReadyState(state) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/gameplay/missions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des missions : suit l'entonnoir (quelles missions démarrent, comment elles sont configurées, comment elles finissent). L'activité « missionRunning » porte la durée ; des évènements ponctuels signalent le clic sur Démarrer, l'ouverture des écrans de début/fin, chaque tentative terminée, les redémarrages, reconfigurations et abandons.
--- Accès : extension `telemetry_trackers_gameplay_missions` : `extensions.load("telemetry_trackers_gameplay_missions")`, puis la globale `telemetry_trackers_gameplay_missions`
---@class telemetry_trackers_gameplay_missions
---@field dependencies string[] telemetry_core.
telemetry_trackers_gameplay_missions = {}

--- Hook appelé quand la mission tourne réellement, pour tous les chemins de démarrage (y compris ceux qui chargent d'abord un niveau). Démarre l'activité missionRunning. startedFrom : missionScreen (en niveau), gameplaySelector, discover, withinMission (nouvel essai, mission suivante ou reconfiguration depuis l'écran de fin) ; les départs depuis tutoriels de carrière, flux d'activité, multijoueur ou scénarios donnent « other ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:24
---@param state string État ; seul « started » est pris en compte.
---@param mission table Mission (doit avoir _isOngoing).
---@param userSettings table Réglages du joueur pour la mission.
---@param startedFrom string|nil Origine du démarrage.
function telemetry_trackers_gameplay_missions.onAnyMissionChanged(state, mission, userSettings, startedFrom) end

--- Hook appelé avant tout arrêt de mission, y compris l'arrêt instantané lors d'un changement de niveau, d'un retour au menu ou d'un démarrage de carrière (qui saute onMissionStopped). Termine l'activité avec l'issue « stopped ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:163
---@param state string Seul « stopped » est pris en compte.
---@param mission table Mission concernée.
function telemetry_trackers_gameplay_missions.onAnyMissionWillChange(state, mission) end

--- Hook appelé à l'ouverture de l'écran de fin : émet missionEndScreenOpened (sans résultat).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:67
function telemetry_trackers_gameplay_missions.onEndScreenUIOpened() end

--- Hook appelé au chargement : déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:169
function telemetry_trackers_gameplay_missions.onExtensionLoaded() end

--- Hook appelé au déchargement (fermeture du jeu, rechargement Lua, suiveur désactivé) : termine l'activité avec l'issue trackerUnloaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:176
function telemetry_trackers_gameplay_missions.onExtensionUnloaded() end

--- Hook appelé quand la mission est fermée prématurément : émet missionAbandoned (byPlayer, attemptsCompleted, qui vaut 0 si aucun essai n'a été terminé) et termine l'activité avec l'issue « abandoned ». byPlayer est false quand le jeu ferme lui-même la mission, par exemple après un échec d'apparition de véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:149
---@param mission table Mission.
---@param byPlayer boolean true si le joueur a abandonné.
function telemetry_trackers_gameplay_missions.onMissionAbandoned(mission, byPlayer) end

--- Hook appelé quand une tentative est enregistrée (seul moment où le résultat complet existe en une table) : émet missionAttemptCompleted (issue, numéro, étoiles, temps, pénalité, points, modèle et config du véhicule). Les champs remplis dépendent du type de mission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:87
---@param attempt table Tentative (type, attemptNumber, unlockedStars, data).
---@param mission table Mission.
---@param progressKey string Clé de progression.
function telemetry_trackers_gameplay_missions.onMissionAttemptAggregated(attempt, mission, progressKey) end

--- Hook appelé quand les réglages d'une mission changent : émet missionReconfigured avec les seuls réglages modifiés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:130
---@param data table {mission, oldUserSettings, newUserSettings}
function telemetry_trackers_gameplay_missions.onMissionReconfigured(data) end

--- Hook appelé au clic d'un bouton du message de récupération : si id vaut restartMission, émet missionRestarted.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:121
---@param id string Identifiant du bouton.
function telemetry_trackers_gameplay_missions.onRecoveryPromptButtonPressed(id) end

--- Hook appelé quand l'écran de départ est construit : émet missionStartScreenOpened une seule fois par mission.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:110
function telemetry_trackers_gameplay_missions.onStartScreenFinishedBuilding() end

--- Hook appelé au clic sur le bouton Démarrer : émet missionStartButtonClicked (seulement pendant une mission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/missions.lua:56
function telemetry_trackers_gameplay_missions.onUIStartButtonClicked() end


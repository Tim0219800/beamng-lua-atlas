---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie du didacticiel « First Drive » : la session (activité « firstDriveActive »), ses leçons (démarrées, arrêtées, terminées, avec durée) et les récupérations de véhicule faites pendant la session. Hors session, seul un instantané « firstDriveProgress » (leçons terminées, lu dans settings/firstDriveLearning.json) est envoyé, au plus une fois par intervalle de sondage ou quand la progression change.
--- Accès : extension `telemetry_trackers_gameplay_firstDrive` : `extensions.load("telemetry_trackers_gameplay_firstDrive")`, puis la globale `telemetry_trackers_gameplay_firstDrive`
---@class telemetry_trackers_gameplay_firstDrive
---@field dependencies string[] telemetry_core.
telemetry_trackers_gameplay_firstDrive = {}

--- Hook appelé au chargement : déchargement manuel, puis envoi éventuel de l'instantané de progression.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:171
function telemetry_trackers_gameplay_firstDrive.onExtensionLoaded() end

--- Hook appelé au déchargement (fermeture du jeu, rechargement Lua ou suiveur désactivé) : termine la session avec la raison trackerUnloaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:179
function telemetry_trackers_gameplay_firstDrive.onExtensionUnloaded() end

--- Hook appelé à la fin de First Drive : termine l'activité ; si reason vaut completed, émet aussi firstDriveCompleted avec la durée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:120
---@param reason string completed, skipToFreeroam, mainMenu, startFailed ou clientEndMission.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveEnded(reason) end

--- Hook appelé quand une leçon est réussie : émet firstDriveLessonCompleted avec durée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:153
---@param id string Identifiant de leçon.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonCompleted(id) end

--- Hook appelé au début d'une leçon : émet firstDriveLessonStarted (ignoré hors session).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:124
---@param id string Identifiant de leçon.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStarted(id) end

--- Hook appelé quand une leçon est interrompue : émet firstDriveLessonStopped avec raison et durée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:149
---@param id string Identifiant de leçon.
---@param reason string Raison de l'arrêt.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveLessonStopped(id, reason) end

--- Hook appelé au démarrage de First Drive (aussi lors d'un redémarrage depuis le menu pause, qui ferme la session précédente) : démarre l'activité firstDriveActive avec leçons terminées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:104
---@param startAtLookout boolean true si le départ se fait au belvédère.
function telemetry_trackers_gameplay_firstDrive.onFirstDriveStarted(startAtLookout) end

--- Hook appelé quand la récupération de véhicule s'arrête : émet firstDriveVehicleRecovered avec la durée de maintien, la phase et la leçon (ignoré pendant l'aperçu de récupération).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/gameplay/firstDrive.lua:157
---@param timer number Durée de maintien en secondes.
function telemetry_trackers_gameplay_firstDrive.onStopRecovering(timer) end


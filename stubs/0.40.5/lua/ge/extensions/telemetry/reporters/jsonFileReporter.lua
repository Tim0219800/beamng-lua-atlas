---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/reporters/jsonFileReporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Envoyeur de télémétrie : au chargement, une tâche du jobsystem attend 5 s puis envoie au serveur (appel core_online s11/v2/telemetryReports) les fichiers de session /telemetry/sessions/*.jsonl écrits par telemetry_core, groupés en un seul envoi. L'envoi n'a lieu que si la plus ancienne session en attente date de plus de l'intervalle configuré (reportIntervalHours, 12 h par défaut, avec jitter aléatoire de 1x à 2x). Le fichier de la session en cours est ignoré.
--- Accès : extension `telemetry_reporters_jsonFileReporter` : `extensions.load("telemetry_reporters_jsonFileReporter")`, puis la globale `telemetry_reporters_jsonFileReporter`
---@class telemetry_reporters_jsonFileReporter
---@field dependencies string[] telemetry_core et telemetry_configManager.
telemetry_reporters_jsonFileReporter = {}

--- Hook appelé au chargement : passe l'extension en déchargement manuel et lance la tâche d'envoi (jobsystem, priorité 0,5).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/reporters/jsonFileReporter.lua:139
function telemetry_reporters_jsonFileReporter.onExtensionLoaded() end


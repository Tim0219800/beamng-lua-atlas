---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/hardware.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie matérielle : collecte les informations système, graphiques, d'affichage, audio, stockage et périphériques d'entrée pour les décisions de configuration minimale et d'optimisation. L'enquête « hardwareSurvey » est volumineuse et change peu : elle n'est envoyée que tous les 30 jours (24*30 h par défaut, modifiable via la config serveur). Les changements de manettes, de sortie audio et de mode d'affichage sont des évènements ponctuels distincts.
--- Accès : extension `telemetry_trackers_hardware` : `extensions.load("telemetry_trackers_hardware")`, puis la globale `telemetry_trackers_hardware`
---@class telemetry_trackers_hardware
---@field dependencies string[] telemetry_core.
telemetry_trackers_hardware = {}

--- Hook appelé quand la sortie audio change : émet « audioOutputChanged » (fréquence d'échantillonnage, mode d'enceintes, canaux).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/hardware.lua:197
function telemetry_trackers_hardware.onAudioOutputDeviceChanged() end

--- Hook appelé quand un périphérique d'entrée change : compare aux manettes connues et émet un évènement « inputDeviceConnection » par différence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/hardware.lua:185
function telemetry_trackers_hardware.onDeviceChanged() end

--- Hook appelé au changement de mode d'affichage : émet « displayModeChanged » seulement pour les transitions suivies.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/hardware.lua:208
---@param from string Ancien mode.
---@param to string Nouveau mode.
function telemetry_trackers_hardware.onDisplayModeChanged(from, to) end

--- Hook appelé au chargement : mémorise les manettes connectées, émet les instantanés mémoire GPU, envoie l'enquête matérielle si elle est due, puis passe en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/hardware.lua:278
function telemetry_trackers_hardware.onExtensionLoaded() end


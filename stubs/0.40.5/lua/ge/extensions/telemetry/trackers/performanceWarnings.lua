---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/performanceWarnings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des avertissements matériels de performance affichés au joueur : chaque avertissement (catégorie + message) n'est rapporté qu'une seule fois par session (évènement « performanceHardwareWarning » avec catégorie, message, gravité, contexte et acquittement).
--- Accès : extension `telemetry_trackers_performanceWarnings` : `extensions.load("telemetry_trackers_performanceWarnings")`, puis la globale `telemetry_trackers_performanceWarnings`
---@class telemetry_trackers_performanceWarnings
---@field dependencies string[] telemetry_core.
telemetry_trackers_performanceWarnings = {}

--- Hook appelé au chargement : déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performanceWarnings.lua:27
function telemetry_trackers_performanceWarnings.onExtensionLoaded() end

--- Hook appelé quand le jeu émet un avertissement matériel de performance ; dédoublonne par catégorie et message.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/performanceWarnings.lua:12
---@param category string Catégorie de l'avertissement.
---@param warning table {msg, type (gravité), context, ack}
function telemetry_trackers_performanceWarnings.onPerformanceHardwareWarning(category, warning) end


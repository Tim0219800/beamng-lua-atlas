---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/mods.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des mods : rapporte quels mods sont installés et actifs, pour distinguer plantages et performances entre installations modées et propres. Seuls le nom, le type, l'identifiant du dépôt (modID), l'état actif et si le mod est décompressé sont envoyés, jamais les chemins de fichiers (évènement « modSurvey » avec les décomptes du gestionnaire de mods).
--- Accès : extension `telemetry_trackers_mods` : `extensions.load("telemetry_trackers_mods")`, puis la globale `telemetry_trackers_mods`
---@class telemetry_trackers_mods
---@field dependencies string[] telemetry_core.
telemetry_trackers_mods = {}

--- Hook appelé au chargement : déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/mods.lua:84
function telemetry_trackers_mods.onExtensionLoaded() end

--- Hook appelé quand le gestionnaire de mods est prêt : collecte la liste triée des mods et envoie l'enquête si nécessaire (une fois par session).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/mods.lua:57
function telemetry_trackers_mods.onModManagerReady() end


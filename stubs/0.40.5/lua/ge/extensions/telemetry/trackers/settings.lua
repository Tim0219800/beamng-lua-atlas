---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie des réglages : enregistre les réglages déclarés du jeu (settings.impl.defaults) avec leur valeur courante et leur valeur par défaut, pour lire framerate et plantages en regard de ce que le joueur a demandé. Les adresses locales, chemins et listes/préréglages créés par l'utilisateur sont exclus. Un changement est rapporté au démarrage suivant ; un jeu inchangé est renvoyé tous les surveyIntervalHours (7 jours par défaut).
--- Accès : extension `telemetry_trackers_settings` : `extensions.load("telemetry_trackers_settings")`, puis la globale `telemetry_trackers_settings`
---@class telemetry_trackers_settings
---@field dependencies string[] telemetry_core.
telemetry_trackers_settings = {}

--- Hook appelé au chargement : passe en déchargement manuel, collecte les réglages et envoie l'enquête si elle est due ou si les réglages ont changé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/settings.lua:94
function telemetry_trackers_settings.onExtensionLoaded() end


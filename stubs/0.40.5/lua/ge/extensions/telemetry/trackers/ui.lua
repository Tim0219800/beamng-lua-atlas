---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/ui.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traceur de télémétrie de l'interface. Il suit les écrans (routes UI) que le joueur ouvre et quitte : chaque écran est une activité `uiScreen` dont la durée est le temps passé dessus, avec le champ `from` (écran d'origine) pour reconstituer le parcours dans les menus. Seuls les noms de routes sont rapportés, jamais les paramètres d'écran. Dépend de `telemetry_core`.
--- Accès : extension `telemetry_trackers_ui` : `extensions.load("telemetry_trackers_ui")`, puis la globale `telemetry_trackers_ui`
---@class telemetry_trackers_ui
---@field dependencies table<integer, string> Extensions à charger avant celle-ci : `{'telemetry_core'}`.
telemetry_trackers_ui = {}

--- Hook appelé par le routeur UI une fois une navigation terminée : l'écran affiché est alors `entry.request.name`. Ferme l'activité de l'écran précédent puis ouvre `uiScreen` avec `screen` et `from` (`entry.origin.route`). Sans nom d'écran, ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/ui.lua:56
---@param entry table Entrée de navigation du routeur ; champs lus : `request.name` et `origin.route`.
function telemetry_trackers_ui.onAfterRouteChange(entry) end

--- Hook appelé à la fermeture du jeu. Ferme l'écran ouvert, sinon le dernier n'aurait pas de durée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/ui.lua:82
function telemetry_trackers_ui.onExit() end

--- Hook appelé au chargement de l'extension. Passe l'extension en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/ui.lua:77
function telemetry_trackers_ui.onExtensionLoaded() end

--- Hook appelé au déchargement de l'extension (un rechargement Lua ne passe pas par onExit). Ferme l'écran ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/ui.lua:32
function telemetry_trackers_ui.onExtensionUnloaded() end

--- Hook appelé par le routeur après qu'il a validé la route, donc juste après l'ouverture de l'activité. Mémorise les temps si la route correspond à l'écran courant ; ils sont envoyés à la fermeture.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/ui.lua:72
---@param routeName string Nom de la route concernée.
---@param timings table Temps de la navigation ; champs lus : total, mountAcked, enter, ready.
function telemetry_trackers_ui.onRouteTiming(routeName, timings) end


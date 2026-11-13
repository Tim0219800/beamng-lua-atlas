---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/traffic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traceur de télémétrie du trafic. Il répond à la question « combien de trafic est réellement utilisé » : il ouvre l'activité `trafficActive` quand le trafic démarre et la ferme quand il s'arrête, en y joignant le pic de véhicules actifs. Dépend de `telemetry_core` et ne sert qu'à la collecte de statistiques, pas au gameplay.
--- Accès : extension `telemetry_trackers_traffic` : `extensions.load("telemetry_trackers_traffic")`, puis la globale `telemetry_trackers_traffic`
---@class telemetry_trackers_traffic
---@field dependencies table<integer, string> Extensions à charger avant celle-ci : `{'telemetry_core'}`.
telemetry_trackers_traffic = {}

--- Hook appelé à la fin de la mission/du niveau côté client. Ferme l'activité de trafic si elle est ouverte (même code que onTrafficStopped).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:46
function telemetry_trackers_traffic.onClientEndMission() end

--- Hook appelé à la fermeture du jeu. Alias de onClientEndMission : ferme l'activité de trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:46
function telemetry_trackers_traffic.onExit() end

--- Hook appelé au chargement de l'extension. Passe l'extension en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:50
function telemetry_trackers_traffic.onExtensionLoaded() end

--- Hook appelé au déchargement de l'extension (par exemple lors d'un rechargement Lua, qui ne passe pas par onExit). Ferme l'activité de trafic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:46
function telemetry_trackers_traffic.onExtensionUnloaded() end

--- Hook appelé chaque fois que des véhicules entrent ou sortent du pool de trafic. Ne garde que le maximum, sans créer d'événement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:39
---@param activeAmount integer Nombre de véhicules de trafic actifs.
function telemetry_trackers_traffic.onTrafficAmountChanged(activeAmount) end

--- Hook appelé quand le trafic démarre. Remet le pic à 0 et ouvre l'activité `trafficActive` avec le niveau courant (`getCurrentLevelIdentifier()` ou "unknown").
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:22
function telemetry_trackers_traffic.onTrafficStarted() end

--- Hook appelé quand le trafic s'arrête. Ne fait rien si le trafic n'était pas en cours ; sinon ferme l'activité `trafficActive` avec `peakAmount`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/traffic.lua:31
function telemetry_trackers_traffic.onTrafficStopped() end


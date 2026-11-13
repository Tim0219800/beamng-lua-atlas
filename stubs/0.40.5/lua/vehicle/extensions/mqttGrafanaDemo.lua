---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/mqttGrafanaDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Démonstration : publie la télémétrie du véhicule vers un broker MQTT (127.0.0.1) sur le sujet 'car_data', en JSON, à chaque frame, pour l'afficher par exemple dans Grafana. Données : géométrie et état de chaque roue, valeurs d'electrics du tableau de bord, capteurs d'accélération et de force du volant, position et attitude.
--- Accès : extension `mqttGrafanaDemo` : `extensions.load (VM véhicule)("mqttGrafanaDemo")`, puis la globale `mqttGrafanaDemo`
---@class mqttGrafanaDemo
---@field reset any
mqttGrafanaDemo = {}

--- Appelé au chargement : crée le client MQTT et démarre la connexion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/mqttGrafanaDemo.lua:142
function mqttGrafanaDemo.onExtensionLoaded() end

--- Appelé au déchargement : déconnecte le client MQTT.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/mqttGrafanaDemo.lua:155
function mqttGrafanaDemo.onExtensionUnloaded() end

--- Appelé chaque frame : collecte les données et les publie sur le sujet 'car_data' si le client est connecté.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/mqttGrafanaDemo.lua:116
---@param dt number Pas de temps en secondes (non utilisé).
function mqttGrafanaDemo.updateGFX(dt) end


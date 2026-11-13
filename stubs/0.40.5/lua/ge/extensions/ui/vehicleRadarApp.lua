---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/vehicleRadarApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Partie Lua de l'application d'interface « vehicle radar » (radar de proximité des véhicules). À chaque frame GUI, elle sélectionne les véhicules visibles proches du véhicule joueur, calcule pour chacun centre, taille, orientation, type (vehicle, traffic, parked, trailer), couleur de peinture, points d'attelage (fifthwheel) et distance minimale entre boîtes englobantes orientées (OOBB), puis envoie le tout dans le flux 'vehicleRadar'. Elle charge et sauvegarde les réglages de l'application.
--- Accès : extension `ui_vehicleRadarApp` : `extensions.load("ui_vehicleRadarApp")`, puis la globale `ui_vehicleRadarApp`
---@class ui_vehicleRadarApp
ui_vehicleRadarApp = {}

--- Hook appelé au chargement : lit le fichier de réglages et envoie les réglages à l'UI par 'VehicleRadarSettingsLoaded'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleRadarApp.lua:58
function ui_vehicleRadarApp.onExtensionLoaded() end

--- Hook appelé à chaque frame GUI : construit {playerVehicleId, playerVehicleSpeed, objects} et l'envoie via guihooks.queueStream('vehicleRadar', data). Les objets sont indexés par id de véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleRadarApp.lua:153
---@param dtReal number Durée réelle de la frame (s).
---@param dtSim number Durée simulée de la frame (s).
---@param dtRaw number Durée brute de la frame (s).
function ui_vehicleRadarApp.onGuiUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé à l'apparition d'un véhicule : vide les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleRadarApp.lua:296
function ui_vehicleRadarApp.onVehicleSpawned() end

--- Hook appelé au changement de véhicule contrôlé : vide les caches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/vehicleRadarApp.lua:292
function ui_vehicleRadarApp.onVehicleSwitched() end

--- Modifie un réglage existant et sauvegarde le fichier de réglages. Ne fait rien si la clé n'existe pas ou si la valeur est inchangée.
---Source : lua/ge/extensions/ui/vehicleRadarApp.lua:63
---@param key string Nom du réglage (rangeMeters, rangeSeconds, foreAftOffsetPct, rangeType, minimalLook, coloredCars).
---@param value any Nouvelle valeur.
function ui_vehicleRadarApp.updateSetting(key, value) end

---@type number
i = nil

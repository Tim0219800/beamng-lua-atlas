---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/vehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Traceur de télémétrie des véhicules. Il enregistre quels véhicules sont créés (événement `vehicleSpawned`), conduits et pendant combien de temps (activité `vehicleUsed`), et les réinitialisations (événement `vehicleReset`). Les configurations personnalisées sont rapportées comme ":custom" au lieu du contenu de la configuration. S'appuie sur `telemetry_core`, `telemetry_vehicleInfo` et `telemetry_configManager`.
--- Accès : extension `telemetry_trackers_vehicle` : `extensions.load("telemetry_trackers_vehicle")`, puis la globale `telemetry_trackers_vehicle`
---@class telemetry_trackers_vehicle
---@field dependencies table<integer, string> Extensions à charger avant celle-ci : `{'telemetry_core'}`.
telemetry_trackers_vehicle = {}

--- Hook appelé à la fin de la mission/du niveau côté client. Ferme l'activité `vehicleUsed`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:78
function telemetry_trackers_vehicle.onClientEndMission() end

--- Hook appelé à la fermeture du jeu. Ferme l'activité `vehicleUsed`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:91
function telemetry_trackers_vehicle.onExit() end

--- Hook appelé au chargement de l'extension. Passe l'extension en déchargement manuel et, si le joueur 0 conduit déjà un véhicule, ouvre son activité `vehicleUsed`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:82
function telemetry_trackers_vehicle.onExtensionLoaded() end

--- Hook appelé au déchargement de l'extension (un rechargement Lua ne passe pas par onExit). Ferme l'activité `vehicleUsed`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:21
function telemetry_trackers_vehicle.onExtensionUnloaded() end

--- Hook appelé quand un véhicule est créé. Envoie l'événement `vehicleSpawned` avec le modèle, la configuration et le niveau courant. Ne fait rien si les infos du véhicule sont introuvables.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:37
---@param vid integer Id du véhicule créé.
function telemetry_trackers_vehicle.onVehicleSpawned(vid) end

--- Hook appelé quand le véhicule contrôlé change. Pour le joueur 0, ferme l'activité `vehicleUsed` en cours puis en ouvre une pour le nouveau véhicule (ou seulement la ferme si newId vaut -1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:49
---@param oldId integer Id de l'ancien véhicule.
---@param newId integer Id du nouveau véhicule, -1 si le joueur n'est plus dans un véhicule.
---@param player integer Indice du joueur ; seul 0 est traité.
function telemetry_trackers_vehicle.onVehicleSwitched(oldId, newId, player) end

--- Envoie l'événement `vehicleReset` (modèle et dégâts du véhicule du joueur 0, lus dans `map.objects[vid].damage`). Désactivable via `trackResets = false` dans la configuration du module `vehicle`. Ignoré si le joueur n'a pas de véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/vehicle.lua:61
function telemetry_trackers_vehicle.trackVehReset() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/vehicleInfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaires partagés par les traceurs de télémétrie pour décrire un véhicule : modèle et configuration (`getData`) et mod d'origine (`getMod`). Ce n'est pas un traceur lui-même, d'où sa place hors du dossier `trackers`.
--- Accès : extension `telemetry_vehicleInfo` : `extensions.load("telemetry_vehicleInfo")`, puis la globale `telemetry_vehicleInfo`
---@class telemetry_vehicleInfo
telemetry_vehicleInfo = {}

--- Renvoie le modèle (`vehicle.JBeam`) et la configuration d'un véhicule. La configuration est le nom du fichier sans extension, ou ":custom" si elle est personnalisée. Renvoie nil (avec un avertissement dans le log si l'id est inconnu) si le véhicule n'existe pas ou n'est pas un BeamNGVehicle.
---Source : lua/ge/extensions/telemetry/vehicleInfo.lua:14
---@param vid integer Id de l'objet véhicule.
---@return table|nil  `{model = string, config = string}` ou nil.
function telemetry_vehicleInfo.getData(vid) end

--- Renvoie le mod d'où provient un modèle de véhicule, via `core_modmanager.getModForFilename('/vehicles/<model>/info.json')`. Nil pour le contenu d'origine, si le modèle est nil ou si `core_modmanager` est absent.
---Source : lua/ge/extensions/telemetry/vehicleInfo.lua:37
---@param model string|nil Nom du modèle de véhicule (dossier sous /vehicles).
---@return table|nil  `{name = string, modID = any}` (modID peut être nil), ou nil.
function telemetry_vehicleInfo.getMod(model) end


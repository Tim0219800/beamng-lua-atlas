---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Transforme une configuration de filtre de véhicules de mission (filterData : liste blanche/noire, réglages de probabilité, ajouts et retraits manuels, maxVehicles) en liste plate de couples modèle/configuration. S'appuie sur util/configListGenerator pour obtenir les véhicules éligibles.
--- Accès : extension `gameplay_missions_vehicleFilterResolver` : `extensions.load("gameplay_missions_vehicleFilterResolver")`, puis la globale `gameplay_missions_vehicleFilterResolver`
---@class gameplay_missions_vehicleFilterResolver
gameplay_missions_vehicleFilterResolver = {}

--- Indique si filterData contient une contrainte réelle : liste blanche ou noire non vide, probabilitySettings, manualAdditions, manualRemovals ou maxVehicles > 0.
---Source : lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua:172
---@param filterData table|any Données de filtre ; tout non-table donne false.
---@return boolean  true si le filtre contraint l'ensemble de véhicules.
function gameplay_missions_vehicleFilterResolver.hasAnyConfiguration(filterData) end

--- Résout filterData en liste {model, config, name}. Applique le filtre de base, les probabilitySettings (qui remplacent le résultat s'ils trouvent des véhicules), la limite maxVehicles, les retraits manuels (clés 'modèle/config') puis ajoute les ajouts manuels non déjà présents, sans doublon. allowAuxiliaryVehicles et allowLoadedTrailers contrôlent l'éligibilité.
---Source : lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua:189
---@param filterData table|any Champs lus : allowAuxiliaryVehicles, allowLoadedTrailers, baseFilter, probabilitySettings, maxVehicles, manualRemovals, manualAdditions.
---@return table[]  Liste de {model = string, config = string, name = string} (vide si filterData n'est pas une table).
function gameplay_missions_vehicleFilterResolver.resolveFilteredConfigs(filterData) end


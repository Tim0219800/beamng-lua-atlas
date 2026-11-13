---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/facilities/fuelPrice.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Génère les prix du carburant des stations-service du niveau et les affiche sur les panneaux à afficheurs 7 segments de la scène. Au démarrage du niveau, pour chaque station ayant `prices`, calcule un prix (base + aléa) et remplace les objets d'affichage par des copies TSStatic des chiffres (`art/shapes/quarter_mile_display/display_<c>.dae`). Se décharge tout seul si aucune donnée de prix. Global : freeroam_facilities_fuelPrice.
--- Accès : extension `freeroam_facilities_fuelPrice` : `extensions.load("freeroam_facilities_fuelPrice")`, puis la globale `freeroam_facilities_fuelPrice`
---@class freeroam_facilities_fuelPrice
freeroam_facilities_fuelPrice = {}

--- Prix courant (unité métrique) d'un carburant dans une station.
---Source : lua/ge/extensions/freeroam/facilities/fuelPrice.lua:99
---@param stationId string Id de la station.
---@param fuelType string Type d'énergie (ex. gasoline, diesel).
---@return number|nil  Prix ou nil.
function freeroam_facilities_fuelPrice.getFuelPrice(stationId, fuelType) end

--- Hook au démarrage du niveau : appelle setDisplayPrices ; s'il n'y a pas de données de prix, décharge l'extension.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/facilities/fuelPrice.lua:108
---@param levelPath string Chemin du niveau (non utilisé).
function freeroam_facilities_fuelPrice.onClientStartMission(levelPath) end

--- Appelé après rechargement Lua : restaure les prix si on est dans le même niveau, sinon régénère les prix (onClientStartMission).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/facilities/fuelPrice.lua:130
---@param data table Table renvoyée par onSerialize.
function freeroam_facilities_fuelPrice.onDeserialized(data) end

--- Appelé avant un rechargement Lua : sauvegarde cachedPriceData, le niveau courant et l'unité locale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/facilities/fuelPrice.lua:122
---@return table  {cachedPriceData, currentLevel, levelUnit}
function freeroam_facilities_fuelPrice.onSerialize() end

--- Supprime les copies de chiffres et restaure les panneaux d'origine (afficheur 8), éventuellement cachés. Utile avant de déplacer un panneau dans l'éditeur.
---Source : lua/ge/extensions/freeroam/facilities/fuelPrice.lua:141
---@param hide boolean|nil true = cacher les panneaux d'origine.
function freeroam_facilities_fuelPrice.restoreSign(hide) end

--- Calcule les prix de toutes les stations du niveau courant et met à jour les afficheurs.
---Source : lua/ge/extensions/freeroam/facilities/fuelPrice.lua:29
---@return boolean  true si au moins un prix a été généré.
function freeroam_facilities_fuelPrice.setDisplayPrices() end


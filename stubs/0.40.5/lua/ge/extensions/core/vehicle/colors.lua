---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/vehicle/colors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_vehicle_colors` : change en direct la couleur ou la peinture d'un des 3 emplacements de peinture du véhicule configuré (core_vehicle_configTarget), met à jour les meshes via core_vehicle_manager.liveUpdateVehicleColors, puis enregistre les peintures dans la config via core_vehicle_partmgmt.setConfigPaints (sans respawn). Utilisé par l'UI de configuration du véhicule.
--- Accès : extension `core_vehicle_colors` : `extensions.load("core_vehicle_colors")`, puis la globale `core_vehicle_colors`
---@class core_vehicle_colors
---@field dependencies string[] {'core_vehicle_configTarget'}
core_vehicle_colors = {}

--- Convertit une chaîne 'r g b a [...]' (nombres séparés par des espaces) en tableau de nombres ; le 4e élément (0..2) est ramené à 0..1 (multiplié par 0.5 et borné).
---Source : lua/ge/extensions/core/vehicle/colors.lua:9
---@param colorString string|nil ex. '0.5 0.2 0.1 1.2'
---@return number[]|nil  tableau de nombres ; nil si colorString est nil
function core_vehicle_colors.colorStringToColorTable(colorString) end

--- Hook : un véhicule apparaît. Recopie ses 3 couleurs réelles (veh.color, colorPalette0, colorPalette1 + données métalliques) dans vehicleData.config.paints, arrondies à 4 décimales, pour que la config reflète la peinture réelle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/vehicle/colors.lua:73
---@param vehId integer véhicule
function core_vehicle_colors.onVehicleSpawned(vehId) end

--- Définit la couleur d'un emplacement de peinture depuis une chaîne (8 nombres : r g b a puis 4 valeurs métalliques), met à jour le véhicule en direct et enregistre toutes les peintures dans la config.
---Source : lua/ge/extensions/core/vehicle/colors.lua:36
---@param index integer emplacement de peinture, base 0 (0 à 2)
---@param colorString string 'r g b a metallic roughness clearcoat clearcoatRoughness'
---@param objID integer|nil véhicule ; nil = cible de configuration ou joueur 0
function core_vehicle_colors.setVehicleColor(index, colorString, objID) end

--- Applique une table de peinture à un emplacement, met à jour le véhicule en direct et enregistre les peintures dans la config.
---Source : lua/ge/extensions/core/vehicle/colors.lua:53
---@param index integer emplacement de peinture, base 1 (1 à 3)
---@param paint table peinture {baseColor, metallic, roughness, clearcoat, clearcoatRoughness}
---@param objID integer|nil véhicule ; nil = cible de configuration ou joueur 0
function core_vehicle_colors.setVehiclePaint(index, paint, objID) end


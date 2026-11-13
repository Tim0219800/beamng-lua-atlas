---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/lights/taxiLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire pour l'enseigne de taxi (type "auxiliary"). Il mémorise un état parmi available, occupied, reserved, offDuty (défaut), driverDistress et expose chaque état comme une valeur electrics nommée "<nomContrôleur>_<état>" valant 1 pour l'état actif et 0 pour les autres.
--- Accès : contrôleur `lights/taxiLights` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_lights_taxiLights
---@field type string "auxiliary".
local controller_lights_taxiLights = {}

--- Renvoie l'état pour la sauvegarde.
---Source : lua/vehicle/controller/lights/taxiLights.lua:57
---@return table  Table d'état (réutilisée).
function controller_lights_taxiLights.getState() end

--- Renvoie l'état courant.
---Source : lua/vehicle/controller/lights/taxiLights.lua:35
---@return string  État de l'enseigne.
function controller_lights_taxiLights.getTaxiState() end

--- Initialise l'état offDuty et les noms d'electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/lights/taxiLights.lua:43
---@param jbeamData table Données jbeam du contrôleur.
function controller_lights_taxiLights.init(jbeamData) end

--- Remet l'état offDuty.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/lights/taxiLights.lua:39
---@param jbeamData table Données jbeam du contrôleur.
function controller_lights_taxiLights.reset(jbeamData) end

--- Restaure l'état renvoyé par getState (si valide).
---Source : lua/vehicle/controller/lights/taxiLights.lua:62
---@param data table|nil Table d'état.
function controller_lights_taxiLights.setState(data) end

--- Change l'état de l'enseigne.
---Source : lua/vehicle/controller/lights/taxiLights.lua:31
---@param state string "available", "occupied", "reserved", "offDuty" ou "driverDistress".
function controller_lights_taxiLights.setTaxiState(state) end

--- Écrit les valeurs electrics 0/1 de chaque état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/lights/taxiLights.lua:24
---@param dt number Pas de temps (s).
function controller_lights_taxiLights.updateGFX(dt) end

return controller_lights_taxiLights

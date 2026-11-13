---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/trafficModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module flowgraph (moduleOrder 0) qui enveloppe gameplay_traffic et gameplay_parking pour les nœuds de trafic. Il retient si le flowgraph a lui-même activé le trafic (trafficActive) ou les voitures garées (parkedCarsActive) afin de ne les désactiver à l'arrêt que si c'est lui qui les a activés, sauf si keepTrafficState est vrai.
--- Accès : `require("extensions/flowgraph/modules/trafficModule")` (fichier sous extensions/ mais pas une extension classique)
---@class flowgraph_modules_trafficModule
flowgraph_modules_trafficModule = {}

--- Active les voitures garées (gameplay_parking.processVehicles(vehList)). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
---@param vehList integer[]|nil ids des véhicules (déduit du code)
function flowgraph_modules_trafficModule.activateParkedCars(vehList) end

--- Active le trafic (gameplay_traffic.activate) avec une liste de véhicules. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
---@param vehList integer[]|nil ids des véhicules (déduit du code)
function flowgraph_modules_trafficModule.activateTraffic(vehList) end

--- Désactive les voitures garées (processVehicles sans argument), seulement si activées par le flowgraph. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.deactivateParkedCars() end

--- Désactive le trafic (gameplay_traffic.deactivate), seulement s'il a été activé par le flowgraph. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.deactivateTraffic() end

--- Appelé à l'arrêt du projet : remet à zéro les variables de trafic, poursuite et stationnement puis désactive trafic et voitures garées, sauf si keepTrafficState est vrai. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.executionStopped() end

--- Appelé à la création du module : trafficActive, parkedCarsActive et keepTrafficState valent false. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.init() end

--- Ajoute un véhicule au trafic (gameplay_traffic.insertTraffic) et met à jour l'état. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
---@param id integer id du véhicule
function flowgraph_modules_trafficModule.insertTraffic(id) end

--- Retire un véhicule du trafic (gameplay_traffic.removeTraffic) et met à jour l'état. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
---@param id integer id du véhicule
function flowgraph_modules_trafficModule.removeTraffic(id) end

--- Met à jour parkedCarsActive d'après gameplay_parking.getParkedCarsData(). (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.updateParkedCarsState() end

--- Met à jour trafficActive d'après gameplay_traffic.getTrafficData(). À n'utiliser que si le flowgraph a modifié l'état du trafic. (assignée dynamiquement)
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:dyn
function flowgraph_modules_trafficModule.updateTrafficState() end

--- Classe locale `C` de lua/ge/extensions/flowgraph/modules/trafficModule.lua
---@class flowgraph_modules_trafficModule_C
local flowgraph_modules_trafficModule_C = {}

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:45
---@param vehList any
function flowgraph_modules_trafficModule_C:activateParkedCars(vehList) end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:33
---@param vehList any
function flowgraph_modules_trafficModule_C:activateTraffic(vehList) end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:50
function flowgraph_modules_trafficModule_C:deactivateParkedCars() end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:38
function flowgraph_modules_trafficModule_C:deactivateTraffic() end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:57
function flowgraph_modules_trafficModule_C:executionStopped() end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:8
function flowgraph_modules_trafficModule_C:init() end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:23
---@param id any
function flowgraph_modules_trafficModule_C:insertTraffic(id) end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:28
---@param id any
function flowgraph_modules_trafficModule_C:removeTraffic(id) end

---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:19
function flowgraph_modules_trafficModule_C:updateParkedCarsState() end

--- trafficActive and parkedCarsActive should only get updated if the flowgraph itself alters the traffic state
---Source : lua/ge/extensions/flowgraph/modules/trafficModule.lua:15
function flowgraph_modules_trafficModule_C:updateTrafficState() end


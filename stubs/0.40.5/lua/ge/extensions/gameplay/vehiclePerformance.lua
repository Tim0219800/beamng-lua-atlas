---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/vehiclePerformance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcule l'indice de performance (PI) et la classe (X, S, A, B, C, D) d'un véhicule à partir de ses résultats de test automatique (temps 0-60, 1/8 et 1/4 de mile, vitesses de passage, freinage en g, etc.). Fournit aussi les scores agrégés comparés à un véhicule de référence, des utilitaires de classes pour l'interface (exigence de classe minimale) et le choix du véhicule par défaut d'une mission. Les données viennent des configs de véhicule (« Performance Data », « Drag Times », « Power », « Weight »).
--- Accès : extension `gameplay_vehiclePerformance` : `extensions.load("gameplay_vehiclePerformance")`, puis la globale `gameplay_vehiclePerformance`
---@class gameplay_vehiclePerformance
gameplay_vehiclePerformance = {}

--- Construit une table au format du badge d'indice de performance pour une exigence de classe seule ; isThreshold = true indique à l'interface d'afficher un seuil minimal (>=).
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:150
---@param name string Lettre de classe.
---@return table|nil  {class = {name, description, minPI}, performanceIndex = minPI, isThreshold = true} ou nil si classe inconnue.
function gameplay_vehiclePerformance.buildClassRequirement(name) end

--- Calcule des scores agrégés (puissance, rapport puissance/poids, 0-60 mph, 60 ft, quart de mile, progression de vitesse, freinage) en pourcentage du véhicule de référence.
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:48
---@param testData table|nil Données de test : time_60, time_1_4, time_0_60, velAt_1_8, velAt_1_4, brakingG, power ({propulsionPowerCombined}), weight.
---@return table|nil  {powerScore, powerToWeightScore, timeTo60Score, quarterMileScore, speedProgressionScore, brakingGForceScore, time0To60Score}
function gameplay_vehiclePerformance.getAggregateScores(testData) end

--- Renvoie la ligne de classe correspondant à la lettre donnée.
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:131
---@param name string|nil Lettre de classe (X, S, A, B, C, D).
---@return table|nil  {name, minPI, description} ou nil.
function gameplay_vehiclePerformance.getClassByName(name) end

--- Classe d'une config de véhicule identifiée par modèle et nom de config (core_vehicles.getConfig).
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:123
---@param model string Modèle de véhicule.
---@param configName string Nom de la config.
---@return table|nil  {class, performanceIndex} ou nil.
function gameplay_vehiclePerformance.getClassFromConfig(model, configName) end

--- Lit la classe et le PI déjà enregistrés par le test automatique (config["Performance Data"]) ; à défaut, les recalcule depuis config["Drag Times"], config["Power"] et config["Weight"].
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:99
---@param configTable table|nil Table de config de véhicule.
---@return table|nil  {class, performanceIndex} ou nil si aucune donnée.
function gameplay_vehiclePerformance.getClassFromConfigTable(configTable) end

--- Calcule le PI à partir des données de test et renvoie la première classe dont le PI minimal est atteint.
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:85
---@param testData table Données de test (time_60, time_330, time_1000, time_1_8, time_1_4, time_0_60, velAt_1_8, velAt_1_4, brakingG).
---@return table|nil  {class = {name, description, minPI}, performanceIndex}
function gameplay_vehiclePerformance.getClassFromData(testData) end

--- Classe d'un véhicule présent dans le jeu, via core_vehicles.getVehicleDetails(vehId).configs.
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:116
---@param vehId integer Id du véhicule.
---@return table|nil  {class, performanceIndex} ou nil.
function gameplay_vehiclePerformance.getClassFromVehId(vehId) end

--- Liste les noms de classes, de la plus haute à la plus basse.
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:139
---@return string[]  {"X","S","A","B","C","D"}
function gameplay_vehiclePerformance.getClassNames() end

--- Détermine le véhicule par défaut impliqué par le bloc setupModules.vehicles d'une mission (celui que l'interface de réglages présélectionne) : le véhicule du joueur, le premier préréglage, ou rien.
---Source : lua/ge/extensions/gameplay/vehiclePerformance.lua:166
---@param setupModule table|nil Module de setup : enabled, includePlayerVehicle, prioritizePlayerVehicle, vehicles ({model, config}).
---@return table|nil  {kind = "player"} ou {kind = "preset", model, config} ou nil.
function gameplay_vehiclePerformance.getDefaultMissionVehicleSpec(setupModule) end


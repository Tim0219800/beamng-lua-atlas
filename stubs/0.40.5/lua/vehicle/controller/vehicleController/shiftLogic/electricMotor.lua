---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de « boîte » pour véhicules électriques : modes P R N D qui fixent le sens de rotation (motorDirection) des moteurs électriques, freinage régénératif (régénération au frein, conduite à une pédale par niveaux de force), compensation par freins à friction à basse vitesse et arrêt en douceur. Chargé par vehicleController quand le device « gearbox » est de type electricMotor (ou shiftLogicName). Il calcule M.regen (coefficient 0..1 appliqué aux moteurs) et ajuste M.brake pour les freins à friction. Publie electrics.values.regenFromBrake, regenFromOnePedal, regenThrottle, maxRegenStrength et lit regenStrength.
--- Accès : contrôleur `vehicleController/shiftLogic/electricMotor` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vehicleController_shiftLogic_electricMotor
---@field brake number Frein à friction final après déduction de la régénération.
---@field checkEngine boolean Déclaré booléen, mais mis à 0 (nombre) par updateExposedData.
---@field clutchRatio number Toujours 1.
---@field currentGearIndex integer R -1, N/P 0, D 1.
---@field energyStorages table<integer, string> Batteries des moteurs.
---@field engineLoad number Charge moyenne des moteurs.
---@field engineThrottle number Recopie de throttle.
---@field engineTorque number Somme des couples moteurs.
---@field flywheelTorque number Idem engineTorque.
---@field gearboxHandling table|nil Injecté par vehicleController.
---@field gearboxTorque number Idem engineTorque.
---@field idleRPM number 0.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injecté.
---@field isArcadeSwitched boolean Gaz/frein permutés (arcade, marche arrière).
---@field isEngineRunning number Toujours 1.
---@field isSportModeActive boolean Toujours false en pratique.
---@field maxGearIndex integer Plus grand index.
---@field maxRPM number Plus grand régime max des moteurs.
---@field minGearIndex integer Valeur absolue du plus petit index.
---@field oilTemp number 0.
---@field regen number Coefficient de régénération courant (0..1) appliqué aux moteurs.
---@field rpm number Plus grand régime des moteurs (tr/min, valeur absolue).
---@field shiftBehavior table|nil Injecté.
---@field shiftPreventionData table|nil Injecté.
---@field shiftingAggression number 0 par défaut.
---@field smoothedAvgAVInput number Vitesse angulaire moyenne des devices de catégorie « engine » (rad/s).
---@field smoothedValues table|nil Injecté.
---@field throttle number Gaz (0..1), remappés en conduite à une pédale.
---@field throttleInput number
---@field timer table|nil Injecté.
---@field timerConstants table|nil Injecté.
---@field updateGearboxGFX function nop puis inGear du mode actif.
---@field waterTemp number 0.
local controller_vehicleController_shiftLogic_electricMotor = {}

--- Toujours false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:105
---@return boolean  false
function controller_vehicleController_shiftLogic_electricMotor.areShiftLEDsInUse() end

--- Sélectionne la logique arcade ou realistic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:117
---@param behavior string "arcade" ou "realistic".
function controller_vehicleController_shiftLogic_electricMotor.gearboxBehaviorChanged(behavior) end

--- Nom du mode (P, R, N, D).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:109
---@return string  Mode.
function controller_vehicleController_shiftLogic_electricMotor.getGearName() end

--- Position du levier normalisée et index de mode.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:113
---@return number  Position 0..1.
---@return integer  Index de mode.
function controller_vehicleController_shiftLogic_electricMotor.getGearPosition() end

--- État sauvegardable {grb_mde = mode}.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:661
---@return table|nil  État.
function controller_vehicleController_shiftLogic_electricMotor.getState() end

--- Récupère les moteurs, construit les courbes frein/régénération, les lisseurs, les modes, enregistre le menu rapide et applique le mode par défaut. Appelé par vehicleController (init et reset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:499
---@param jbeamData table Données jbeam.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_electricMotor.init(jbeamData, sharedFunctionTable) end

--- Hook de chargement : restaure electrics.values.regenStrength (borné).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:651
---@param data table Table produite par onSerialize.
function controller_vehicleController_shiftLogic_electricMotor.onDeserialize(data) end

--- Hook de sauvegarde : {regenLevel = niveau de régénération}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:657
---@return table  Données.
function controller_vehicleController_shiftLogic_electricMotor.onSerialize() end

--- Demande à chaque moteur d'envoyer ses courbes de couple à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:415
function controller_vehicleController_shiftLogic_electricMotor.sendTorqueData() end

--- Allume ou coupe l'allumage de tous les moteurs ; appelé par vehicleController.setEngineIgnition quand il n'y a pas de device moteur principal.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:421
---@param enabled boolean Allumage actif ?
function controller_vehicleController_shiftLogic_electricMotor.setIgnition(enabled) end

--- Restaure le mode depuis data.grb_mde.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:667
---@param data table Table produite par getState.
function controller_vehicleController_shiftLogic_electricMotor.setState(data) end

--- Realistic : mode précédent.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:159
function controller_vehicleController_shiftLogic_electricMotor.shiftDown() end

--- Realistic : sélectionne le mode du levier ; inexistant -> message et N.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:170
---@param index integer Position du levier (-1 R, 0 N, 1 P, 2 D).
function controller_vehicleController_shiftLogic_electricMotor.shiftToGearIndex(index) end

--- Realistic : mode suivant dans la liste (P->R->N->D) et mise à jour du sens des moteurs.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/electricMotor.lua:148
function controller_vehicleController_shiftLogic_electricMotor.shiftUp() end

return controller_vehicleController_shiftLogic_electricMotor

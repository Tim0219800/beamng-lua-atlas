---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module de logique de boîte « neutre » chargé par vehicleController quand le véhicule n'a pas de device « gearbox » (ou via jbeam shiftLogicName = "dummy"). Il recopie simplement les entrées throttle/brake du conducteur, lit le régime du moteur « mainEngine » s'il existe et remplit les valeurs (températures, charge, couples, état moteur) que vehicleController publie dans electrics. Aucun passage de rapport.
--- Accès : contrôleur `vehicleController/shiftLogic/dummy` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vehicleController_shiftLogic_dummy
---@field brake number Recopie de inputValues.brake.
---@field checkEngine boolean Vrai si le moteur est désactivé (isDisabled).
---@field clutchRatio number Toujours 0.
---@field currentGearIndex integer Toujours 0.
---@field energyStorages table<integer, string> Noms des réservoirs du moteur (sharedFunctions.getEnergyStorages).
---@field engineLoad number Charge instantanée du moteur.
---@field engineThrottle number Gaz envoyés au moteur (0 si moteur désactivé).
---@field engineTorque number Couple de combustion du moteur.
---@field flywheelTorque number Couple de sortie du moteur (outputTorque1).
---@field gearboxBehaviorChanged function nop.
---@field gearboxHandling table|nil Injecté par vehicleController.
---@field gearboxTorque number Couple de sortie du device gearbox.
---@field idleRPM number Ralenti du moteur (tr/min) lu à l'init.
---@field ignition boolean Vrai si electrics.values.ignitionLevel > 1.
---@field inputValues table|nil Injecté : {throttle, clutch} bornés 0..1 (ou overrides electrics).
---@field isArcadeSwitched boolean Toujours false.
---@field isEngineRunning number 1 si le moteur tourne (régime > 80% de starterMaxAV et démarreur dégagé) ou s'il n'a pas de démarreur, sinon 0.
---@field isSportModeActive boolean Toujours false.
---@field maxGearIndex integer Toujours 0.
---@field maxRPM number Régime max du moteur lu à l'init.
---@field minGearIndex integer Toujours 0.
---@field oilTemp number Température d'huile du moteur.
---@field rpm number Régime moteur en tr/min (outputAV1 du mainEngine).
---@field shiftBehavior table|nil Injecté par vehicleController.
---@field shiftDown function nop.
---@field shiftPreventionData table|nil Injecté par vehicleController.
---@field shiftToGearIndex function nop.
---@field shiftUp function nop.
---@field shiftingAggression number Toujours 0.
---@field smoothedAvgAVInput number Vitesse angulaire (rad/s) de sortie du device « gearbox » (0 si absent).
---@field smoothedValues table|nil Injecté par vehicleController.
---@field throttle number Recopie de inputValues.throttle.
---@field timer table|nil Injecté par vehicleController.
---@field timerConstants table|nil Injecté par vehicleController.
---@field waterTemp number Température de liquide de refroidissement (ou d'huile à défaut).
local controller_vehicleController_shiftLogic_dummy = {}

--- Toujours false : pas de LEDs de changement de rapport.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:55
---@return boolean  false
function controller_vehicleController_shiftLogic_dummy.areShiftLEDsInUse() end

--- Nom de rapport affiché : chaîne vide.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:59
---@return string  ""
function controller_vehicleController_shiftLogic_dummy.getGearName() end

--- Position du levier pour animation : 0, 0.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:63
---@return number  gear_A
---@return number  gearModeIndex
function controller_vehicleController_shiftLogic_dummy.getGearPosition() end

--- Mémorise sharedFunctions, récupère les devices mainEngine et gearbox, remet les valeurs à zéro et lit maxRPM/idleRPM/énergie du moteur. Appelé par vehicleController à l'init et au reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:94
---@param jbeamData table Données jbeam (non utilisées).
---@param sharedFunctionTable table Utilitaires sharedFunctions de vehicleController.
function controller_vehicleController_shiftLogic_dummy.init(jbeamData, sharedFunctionTable) end

--- Demande au moteur d'envoyer ses courbes de couple à l'UI (si un moteur existe).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:88
function controller_vehicleController_shiftLogic_dummy.sendTorqueData() end

--- Chaque frame : recopie les entrées et met à jour rpm, températures, charge, couples, ignition et état du moteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dummy.lua:67
---@param dt number Pas de temps en secondes.
function controller_vehicleController_shiftLogic_dummy.updateGearboxGFX(dt) end

return controller_vehicleController_shiftLogic_dummy

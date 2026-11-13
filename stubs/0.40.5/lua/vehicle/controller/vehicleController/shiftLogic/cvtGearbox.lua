---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de boîte à variation continue (CVT), modes P R N D. Chargé par vehicleController quand le device « gearbox » est de type cvtGearbox. Au lieu de choisir un rapport discret, il règle chaque frame le rapport continu (gearbox:setGearRatio) pour amener le régime moteur vers un régime cible interpolé entre cvtLowRPM et cvtHighRPM selon l'agressivité de conduite, et pilote un verrouillage de convertisseur simple (electrics.values.lockupClutchRatio).
--- Accès : contrôleur `vehicleController/shiftLogic/cvtGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vehicleController_shiftLogic_cvtGearbox
---@field brake number Frein (0..1), au moins arcadeAutoBrakeAmount à l'arrêt en arcade.
---@field checkEngine boolean Moteur désactivé.
---@field clutchRatio number Toujours 1 (pas d'embrayage piloté).
---@field currentGearIndex integer Index virtuel (R -1, N/P 0, D 1).
---@field energyStorages table<integer, string> Réservoirs du moteur.
---@field engineLoad number Charge moteur.
---@field engineThrottle number Gaz appliqués au moteur.
---@field engineTorque number Couple de combustion.
---@field flywheelTorque number Couple moteur.
---@field gearboxHandling table|nil Injecté par vehicleController.
---@field gearboxTorque number Couple de sortie de boîte.
---@field idleRPM number Ralenti.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injecté.
---@field isArcadeSwitched boolean Gaz/frein permutés.
---@field isEngineRunning number 1 si le moteur tourne.
---@field isManualModeActive boolean Vrai en modes M (non disponibles en pratique).
---@field isSportModeActive boolean Vrai en mode S (non disponible en pratique).
---@field maxGearIndex integer Plus grand index de la boîte.
---@field maxRPM number Régime max.
---@field minGearIndex integer Valeur absolue du plus petit index (init), puis non mise à jour.
---@field oilTemp number Température d'huile.
---@field rpm number Régime moteur (tr/min).
---@field shiftBehavior table|nil Injecté.
---@field shiftPreventionData table|nil Injecté.
---@field shiftingAggression number Recopie de smoothedValues.drivingAggression.
---@field smoothedAvgAVInput number Vitesse angulaire de sortie de boîte (rad/s).
---@field smoothedValues table|nil Injecté.
---@field throttle number Gaz (0..1), permutés avec le frein en marche arrière arcade.
---@field throttleInput number
---@field timer table|nil Injecté.
---@field timerConstants table|nil Injecté.
---@field updateGearboxGFX function nop puis inGear du mode actif.
---@field waterTemp number Température du liquide de refroidissement.
local controller_vehicleController_shiftLogic_cvtGearbox = {}

--- Vrai hors arcade en mode manuel (jamais en pratique).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:98
---@return boolean  LEDs utilisées ?
function controller_vehicleController_shiftLogic_cvtGearbox.areShiftLEDsInUse() end

--- Sélectionne la logique arcade ou realistic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:132
---@param behavior string "arcade" ou "realistic".
function controller_vehicleController_shiftLogic_cvtGearbox.gearboxBehaviorChanged(behavior) end

--- Nom du mode courant (P, R, N, D).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:102
---@return string  Mode.
function controller_vehicleController_shiftLogic_cvtGearbox.getGearName() end

--- Position du levier normalisée et index de mode.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:106
---@return number  (index-1)/(nombre de modes-1)
---@return integer  Index de mode.
function controller_vehicleController_shiftLogic_cvtGearbox.getGearPosition() end

--- État sauvegardable {grb_mde = mode}.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:454
---@return table|nil  État.
function controller_vehicleController_shiftLogic_cvtGearbox.getState() end

--- Crée les lisseurs de rapport et de régime cible, la liste des modes, les paramètres de lockup et applique le mode par défaut. Appelé par vehicleController (init et reset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:333
---@param jbeamData table Données jbeam.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_cvtGearbox.init(jbeamData, sharedFunctionTable) end

--- Demande au moteur d'envoyer ses courbes de couple à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:327
function controller_vehicleController_shiftLogic_cvtGearbox.sendTorqueData() end

--- Restaure le mode depuis data.grb_mde.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:460
---@param data table Table produite par getState.
function controller_vehicleController_shiftLogic_cvtGearbox.setState(data) end

--- Realistic : passe au mode précédent.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:173
function controller_vehicleController_shiftLogic_cvtGearbox.shiftDown() end

--- Realistic : choisit le mode correspondant à la position du levier (-1 R, 0 N, 1 P, 2 D) ; inexistant -> message et N.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:185
---@param index integer Position du levier.
function controller_vehicleController_shiftLogic_cvtGearbox.shiftToGearIndex(index) end

--- Realistic : passe au mode suivant dans la liste (P->R->N->D).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox.lua:161
function controller_vehicleController_shiftLogic_cvtGearbox.shiftUp() end

return controller_vehicleController_shiftLogic_cvtGearbox

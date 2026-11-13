---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de boîte séquentielle (un cran à la fois avec monter/descendre, sans levier en H) avec coupure d'allumage à la montée et embrayage automatique optionnel. Chargé par vehicleController quand le device « gearbox » est de type sequentialGearbox. En arcade la boîte choisit seule le rapport selon les points de passage ; en realistic le conducteur passe les rapports et le changement est quasi instantané (coupure d'allumage puis setGearIndex).
--- Accès : contrôleur `vehicleController/shiftLogic/sequentialGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vehicleController_shiftLogic_sequentialGearbox
---@field brake number Frein décidé (0..1).
---@field checkEngine boolean Moteur désactivé.
---@field clutchRatio number Taux d'embrayage (1 = embrayé).
---@field currentGearIndex integer Rapport courant.
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
---@field isArcadeSwitched boolean Gaz/frein permutés (arcade, marche arrière).
---@field isEngineRunning number 1 si le moteur tourne.
---@field isSportModeActive boolean Toujours false.
---@field maxGearIndex integer Plus grand rapport avant.
---@field maxRPM number Régime max.
---@field minGearIndex integer Plus petit index (marche arrière).
---@field oilTemp number Température d'huile.
---@field rpm number Régime moteur (tr/min).
---@field shiftBehavior table|nil Injecté.
---@field shiftPreventionData table|nil Injecté.
---@field shiftingAggression number Toujours 1.
---@field smoothedAvgAVInput number Vitesse angulaire de sortie de boîte (rad/s).
---@field smoothedValues table|nil Injecté.
---@field throttle number Gaz décidés (0..1).
---@field timer table|nil Injecté.
---@field timerConstants table|nil Injecté.
---@field updateGearboxGFX function nop puis inGear/whileShifting du mode actif.
---@field waterTemp number Température du liquide de refroidissement.
local controller_vehicleController_shiftLogic_sequentialGearbox = {}

--- Vrai hors arcade.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:74
---@return boolean  LEDs utilisées ?
function controller_vehicleController_shiftLogic_sequentialGearbox.areShiftLEDsInUse() end

--- Choisit la logique du mode ; passer en realistic sans autoClutch avec rapport 1/-1 remet la boîte au point mort.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:86
---@param behavior string "arcade" ou "realistic".
function controller_vehicleController_shiftLogic_sequentialGearbox.gearboxBehaviorChanged(behavior) end

--- Index de rapport numérique de la boîte.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:78
---@return integer  gearbox.gearIndex
function controller_vehicleController_shiftLogic_sequentialGearbox.getGearName() end

--- Toujours 0, 0 (non utilisé).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:82
---@return number  0
---@return number  0
function controller_vehicleController_shiftLogic_sequentialGearbox.getGearPosition() end

--- État sauvegardable {grb_idx = rapport courant}.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:483
---@return table|nil  État.
function controller_vehicleController_shiftLogic_sequentialGearbox.getState() end

--- Récupère mainEngine et gearbox, construit les logiques arcade/realistic, lit ignitionCutTime et les paramètres de lancement d'embrayage. Appelé par vehicleController (init et reset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:418
---@param jbeamData table Données jbeam.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_sequentialGearbox.init(jbeamData, sharedFunctionTable) end

--- Demande au moteur d'envoyer ses courbes de couple à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:412
function controller_vehicleController_shiftLogic_sequentialGearbox.sendTorqueData() end

--- Restaure le rapport (saut libre).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:489
---@param data table Table produite par getState.
function controller_vehicleController_shiftLogic_sequentialGearbox.setState(data) end

--- Rapport précédent (borné, sécurité surrégime).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:116
function controller_vehicleController_shiftLogic_sequentialGearbox.shiftDown() end

--- Demande un rapport (par défaut limité à +/-1 du courant).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:134
---@param index integer Rapport voulu.
---@param ignoreSequentialBounds boolean|nil Si vrai, autorise un saut de plusieurs rapports.
function controller_vehicleController_shiftLogic_sequentialGearbox.shiftToGearIndex(index, ignoreSequentialBounds) end

--- Rapport suivant (borné, sécurité surrégime) ; sera exécuté dans whileShifting.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/sequentialGearbox.lua:98
function controller_vehicleController_shiftLogic_sequentialGearbox.shiftUp() end

return controller_vehicleController_shiftLogic_sequentialGearbox

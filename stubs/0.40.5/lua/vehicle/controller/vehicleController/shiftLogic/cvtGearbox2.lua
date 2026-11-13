---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Seconde logique de boîte CVT, pilotée par une carte (régime cible = f(vitesse roues, agressivité)) au lieu d'un simple interpolateur. Modes P R N D S. Le mode S active des rapports fixes simulés (« paliers » sport) avec délai entre changements. Chargé par vehicleController via jbeam shiftLogicName = "cvtGearbox2" (le device « gearbox » doit être de type cvtGearbox pour la sélection automatique, sinon nommer le module explicitement). Règle le rapport continu par gearbox:setGearRatio et un verrouillage de convertisseur par hystérésis.
--- Accès : contrôleur `vehicleController/shiftLogic/cvtGearbox2` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vehicleController_shiftLogic_cvtGearbox2
---@field brake number Frein (0..1).
---@field checkEngine boolean Moteur désactivé.
---@field clutchRatio number Toujours 1.
---@field currentGearIndex integer Index virtuel (R -1, N/P 0, D 1, S 2).
---@field energyStorages table<integer, string> Réservoirs du moteur.
---@field engineLoad number Charge moteur.
---@field engineThrottle number Gaz appliqués au moteur.
---@field engineTorque number Couple de combustion.
---@field engineTorqueData table
---@field flywheelTorque number Couple moteur.
---@field gearboxHandling table|nil Injecté par vehicleController.
---@field gearboxTorque number Couple de sortie de boîte.
---@field idleRPM number Ralenti.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injecté.
---@field isArcadeSwitched boolean Gaz/frein permutés.
---@field isEngineRunning number 1 si le moteur tourne.
---@field isManualModeActive boolean Vrai en modes M (non disponibles en pratique).
---@field isSportModeActive boolean Vrai en mode S.
---@field maxGearIndex integer Plus grand index de la boîte.
---@field maxRPM number Régime max.
---@field minGearIndex integer Valeur absolue du plus petit index (init).
---@field oilTemp number Température d'huile.
---@field rpm number Régime moteur (tr/min).
---@field shiftBehavior table|nil Injecté.
---@field shiftPreventionData table|nil Injecté.
---@field shiftingAggression number Recopie de drivingAggression.
---@field smoothedAvgAVInput number Vitesse angulaire de sortie de boîte (rad/s).
---@field smoothedValues table|nil Injecté.
---@field throttle number Gaz (0..1), permutés avec le frein en marche arrière arcade.
---@field throttleInput number
---@field timer table|nil Injecté.
---@field timerConstants table|nil Injecté.
---@field torqueToMinRPM table
---@field updateGearboxGFX function nop puis inGear du mode actif.
---@field waterTemp number Température du liquide de refroidissement.
local controller_vehicleController_shiftLogic_cvtGearbox2 = {}

--- Vrai hors arcade en mode manuel (jamais en pratique).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:104
---@return boolean  LEDs utilisées ?
function controller_vehicleController_shiftLogic_cvtGearbox2.areShiftLEDsInUse() end

--- Sélectionne la logique arcade ou realistic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:144
---@param behavior string "arcade" ou "realistic".
function controller_vehicleController_shiftLogic_cvtGearbox2.gearboxBehaviorChanged(behavior) end

--- Nom du mode : P, R, N, D, ou "S<n>" en sport (n = palier fixe courant).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:108
---@return string  Nom affiché.
function controller_vehicleController_shiftLogic_cvtGearbox2.getGearName() end

--- Position du levier normalisée et index de mode.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:118
---@return number  (index-1)/(nombre de modes-1)
---@return integer  Index de mode.
function controller_vehicleController_shiftLogic_cvtGearbox2.getGearPosition() end

--- État sauvegardable {grb_mde = mode}.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:588
---@return table|nil  État.
function controller_vehicleController_shiftLogic_cvtGearbox2.getState() end

--- Crée lisseurs, liste des modes, paramètres de lockup, carte de régime cible et rapports fixes du mode S ; applique le mode par défaut. Appelé par vehicleController (init et reset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:430
---@param jbeamData table Données jbeam.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_cvtGearbox2.init(jbeamData, sharedFunctionTable) end

--- Demande au moteur d'envoyer ses courbes de couple à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:424
function controller_vehicleController_shiftLogic_cvtGearbox2.sendTorqueData() end

--- Restaure le mode depuis data.grb_mde.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:594
---@param data table Table produite par getState.
function controller_vehicleController_shiftLogic_cvtGearbox2.setState(data) end

--- Realistic : mode précédent.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:189
function controller_vehicleController_shiftLogic_cvtGearbox2.shiftDown() end

--- Realistic : mode correspondant à la position du levier ; inexistant -> message et N.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:201
---@param index integer Position du levier (-1 R, 0 N, 1 P, 2 D, 3 S).
function controller_vehicleController_shiftLogic_cvtGearbox2.shiftToGearIndex(index) end

--- Realistic : mode suivant (P->R->N->D->S).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/cvtGearbox2.lua:177
function controller_vehicleController_shiftLogic_cvtGearbox2.shiftUp() end

return controller_vehicleController_shiftLogic_cvtGearbox2

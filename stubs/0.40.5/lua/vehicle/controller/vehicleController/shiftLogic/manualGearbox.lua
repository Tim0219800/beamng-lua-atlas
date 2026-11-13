---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de boîte manuelle (levier en H ou touches monter/descendre) avec embrayage automatique ou manuel. Chargé par vehicleController quand le device « gearbox » est de type manualGearbox. En arcade, la boîte choisit seule le rapport (points de passage, marche arrière auto) et pilote l'embrayage au démarrage ; en realistic, le conducteur choisit le rapport, la machine à états gère embrayage, point mort, synchronisation (rev-match) et engagement.
--- Accès : contrôleur `vehicleController/shiftLogic/manualGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vehicleController_shiftLogic_manualGearbox
---@field brake number Frein décidé (0..1).
---@field checkEngine boolean Moteur désactivé.
---@field clutchRatio number Taux d'embrayage (1 = embrayé).
---@field currentGearIndex integer Rapport courant de la boîte.
---@field energyStorages table<integer, string> Réservoirs du moteur.
---@field engineLoad number Charge moteur.
---@field engineThrottle number Gaz appliqués au moteur.
---@field engineTorque number Couple de combustion.
---@field flywheelTorque number Couple volant moteur.
---@field gearboxHandling table|nil Injecté par vehicleController.
---@field gearboxTorque number Couple de sortie de boîte.
---@field idleRPM number Régime de ralenti.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injecté.
---@field isArcadeSwitched boolean Gaz/frein permutés (arcade marche arrière).
---@field isEngineRunning number 1 si le moteur tourne.
---@field isShifting boolean Vrai pendant un changement de rapport (hors attente du conducteur).
---@field isSportModeActive boolean Toujours false.
---@field maxGearIndex integer Plus grand rapport avant.
---@field maxRPM number Régime maximal.
---@field minGearIndex integer Plus petit index (marche arrière).
---@field oilTemp number Température d'huile.
---@field rpm number Régime moteur (tr/min).
---@field shiftBehavior table|nil Injecté.
---@field shiftPreventionData table|nil Injecté.
---@field shiftingAggression number Coefficient 0.3..1 de vitesse de passage calculé par calculateShiftAggression.
---@field smoothedAvgAVInput number Vitesse angulaire de sortie de boîte (rad/s).
---@field smoothedValues table|nil Injecté.
---@field throttle number Gaz décidés (0..1), nuls pendant un changement de rapport au-delà du 1er sauf rev-match.
---@field timer table|nil Injecté.
---@field timerConstants table|nil Injecté.
---@field updateGearboxGFX function nop puis inGear/whileShifting du mode actif.
---@field waterTemp number Température de liquide de refroidissement.
local controller_vehicleController_shiftLogic_manualGearbox = {}

--- Vrai hors arcade.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:82
---@return boolean  LEDs de passage utilisées ?
function controller_vehicleController_shiftLogic_manualGearbox.areShiftLEDsInUse() end

--- Sélectionne la logique du mode (arcade/realistic) et réaffecte les fonctions de passage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:94
---@param behavior string "arcade" ou "realistic".
function controller_vehicleController_shiftLogic_manualGearbox.gearboxBehaviorChanged(behavior) end

--- Renvoie l'index de rapport numérique de la boîte (pas de chaîne).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:86
---@return integer  gearbox.gearIndex
function controller_vehicleController_shiftLogic_manualGearbox.getGearName() end

--- Toujours 0, 0 (non utilisé pour manuelles et séquentielles).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:90
---@return number  0
---@return number  0
function controller_vehicleController_shiftLogic_manualGearbox.getGearPosition() end

--- État sauvegardable : {grb_idx = rapport courant}.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:683
---@return table|nil  État.
function controller_vehicleController_shiftLogic_manualGearbox.getState() end

--- Récupère mainEngine et gearbox, construit les logiques arcade/realistic, lit les paramètres d'embrayage (voir notes). Appelé par vehicleController à l'init et au reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:605
---@param jbeamData table Données jbeam.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_manualGearbox.init(jbeamData, sharedFunctionTable) end

--- Demande au moteur d'envoyer ses courbes de couple à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:599
function controller_vehicleController_shiftLogic_manualGearbox.sendTorqueData() end

--- Restaure le rapport via shiftToGearIndex(data.grb_idx).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:689
---@param data table Table produite par getState.
function controller_vehicleController_shiftLogic_manualGearbox.setState(data) end

--- Appui sur descendre : demande le rapport inférieur et lance la séquence.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:152
function controller_vehicleController_shiftLogic_manualGearbox.shiftDownOnDown() end

--- Relâchement de descendre, même logique que shiftUpOnUp.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:176
function controller_vehicleController_shiftLogic_manualGearbox.shiftDownOnUp() end

--- Demande directement un rapport (borné, sécurité surrégime) ; passage direct (levier en H). Index 0 depuis gearGrind remet au point mort.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:185
---@param index integer Rapport voulu.
function controller_vehicleController_shiftLogic_manualGearbox.shiftToGearIndex(index) end

--- Appui sur monter : demande le rapport suivant (borné min/max, sécurité surrégime) et lance la séquence de passage.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:119
function controller_vehicleController_shiftLogic_manualGearbox.shiftUpOnDown() end

--- Relâchement de monter : en attente de passage, déclenche l'engagement ; sinon mémorise que l'entrée est terminée.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/manualGearbox.lua:143
function controller_vehicleController_shiftLogic_manualGearbox.shiftUpOnUp() end

return controller_vehicleController_shiftLogic_manualGearbox

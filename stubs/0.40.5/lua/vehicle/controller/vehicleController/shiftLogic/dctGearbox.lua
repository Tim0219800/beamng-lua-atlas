---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de boîte à double embrayage (DCT) à modes automatiques P R N D S 1 2 M. Chargé par vehicleController quand le device « gearbox » est de type dctGearbox. Deux arbres (access1/access2 : gearIndex1/2, clutchRatio1/2, setGearIndex1/2) alternent : l'arbre primaire est engagé, le secondaire pré-sélectionne le rapport suivant (dctPredictNextGear) et le changement croise les deux embrayages. Gère le rev-match en rétrogradage, le lancement et les modes arcade/realistic.
--- Accès : contrôleur `vehicleController/shiftLogic/dctGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vehicleController_shiftLogic_dctGearbox
---@field brake number Frein décidé (0..1).
---@field checkEngine boolean Moteur désactivé.
---@field clutchRatio number Taux d'embrayage global (les ratios par arbre sont dans electrics clutchRatio1/2).
---@field currentGearIndex integer Rapport courant ou rapport visé pendant un changement.
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
---@field isManualModeActive boolean Vrai en modes M.
---@field isSportModeActive boolean Vrai en mode S.
---@field maxGearIndex integer Plus grand rapport avant.
---@field maxRPM number Régime max.
---@field minGearIndex integer Plus petit index (marche arrière).
---@field oilTemp number Température d'huile.
---@field rpm number Régime moteur (tr/min).
---@field shiftBehavior table|nil Injecté.
---@field shiftPreventionData table|nil Injecté.
---@field shiftingAggression number Agressivité de changement de rapport.
---@field smoothedAvgAVInput number Vitesse angulaire de sortie de boîte (rad/s).
---@field smoothedValues table|nil Injecté.
---@field throttle number Gaz décidés (0..1) ; conservés en montée, coupés en descente sauf rev-match.
---@field timer table|nil Injecté.
---@field timerConstants table|nil Injecté.
---@field updateGearboxGFX function nop puis inGear/whileShifting du mode actif.
---@field waterTemp number Température du liquide de refroidissement.
local controller_vehicleController_shiftLogic_dctGearbox = {}

--- Vrai hors arcade en mode manuel M.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:98
---@return boolean  LEDs utilisées ?
function controller_vehicleController_shiftLogic_dctGearbox.areShiftLEDsInUse() end

--- Sélectionne la logique arcade/realistic.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:142
---@param behavior string "arcade" ou "realistic".
function controller_vehicleController_shiftLogic_dctGearbox.gearboxBehaviorChanged(behavior) end

--- Nom du rapport affiché (mode, ou S/M + rapport).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:102
---@return string  Nom affiché.
function controller_vehicleController_shiftLogic_dctGearbox.getGearName() end

--- Position du levier normalisée et index de mode.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:116
---@return number  Position 0..1.
---@return integer  Index de mode.
function controller_vehicleController_shiftLogic_dctGearbox.getGearPosition() end

--- État sauvegardable {grb_mde = mode}.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:866
---@return table|nil  État.
function controller_vehicleController_shiftLogic_dctGearbox.getState() end

--- Récupère mainEngine et gearbox, construit modes, logiques arcade/realistic, paramètres d'embrayage et DCT, applique le mode avant par défaut puis le mode courant. Appelé par vehicleController (init et reset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:750
---@param jbeamData table Données jbeam.
---@param sharedFunctionTable table sharedFunctions.
function controller_vehicleController_shiftLogic_dctGearbox.init(jbeamData, sharedFunctionTable) end

--- Demande au moteur d'envoyer ses courbes de couple à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:744
function controller_vehicleController_shiftLogic_dctGearbox.sendTorqueData() end

--- Définit le mode avant par défaut (D, S, M1...) et l'applique si on est déjà en marche avant.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:197
---@param mode string Nom du mode.
function controller_vehicleController_shiftLogic_dctGearbox.setDefaultForwardMode(mode) end

--- Restaure le mode depuis data.grb_mde.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:872
---@param data table Table produite par getState.
function controller_vehicleController_shiftLogic_dctGearbox.setState(data) end

--- Realistic : mode précédent / rapport inférieur en M.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:244
function controller_vehicleController_shiftLogic_dctGearbox.shiftDown() end

--- Realistic : sélectionne le mode correspondant à la position du levier.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:278
---@param index integer Position du levier.
function controller_vehicleController_shiftLogic_dctGearbox.shiftToGearIndex(index) end

--- Realistic : mode suivant dans la liste ; en manuel M monte d'un rapport (avec sécurité surrégime si gearboxSafety).
---Source : lua/vehicle/controller/vehicleController/shiftLogic/dctGearbox.lua:211
function controller_vehicleController_shiftLogic_dctGearbox.shiftUp() end

return controller_vehicleController_shiftLogic_dctGearbox

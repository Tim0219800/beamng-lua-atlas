---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Logique de boîte automatique (modes P R N D S 1-9 M, convertisseur de couple avec verrouillage partiel). Chargé par vehicleController quand le device « gearbox » est de type automaticGearbox. Selon le mode de boîte (arcade ou realistic), il décide du rapport cible à partir des points de passage (agressivité, patinage), gère les gaz/frein (inversion automatique en marche arrière en arcade, frein auto à l'arrêt) et le verrouillage du convertisseur (electrics.values.lockupClutchRatio).
--- Accès : contrôleur `vehicleController/shiftLogic/automaticGearbox` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vehicleController_shiftLogic_automaticGearbox
---@field brake number Frein décidé (0..1) ; en arcade, au moins arcadeAutoBrakeAmount à l'arrêt sans gaz.
---@field checkEngine boolean Vrai si le moteur est désactivé.
---@field clutchRatio number Toujours 1 (boîte automatique, pas d'embrayage piloté).
---@field currentGearIndex integer Index de rapport visé par la logique.
---@field energyStorages table<integer, string> Réservoirs du moteur principal.
---@field engineLoad number Charge moteur.
---@field engineThrottle number Gaz effectivement appliqués au moteur.
---@field engineTorque number Couple de combustion.
---@field flywheelTorque number Couple moteur en sortie.
---@field gearboxHandling table|nil Injecté par vehicleController.
---@field gearboxTorque number Couple de sortie de boîte.
---@field idleRPM number Régime de ralenti.
---@field ignition boolean ignitionLevel > 1.
---@field inputValues table|nil Injecté.
---@field isArcadeSwitched boolean Vrai quand gaz et frein sont permutés (arcade, marche arrière).
---@field isEngineRunning number 1 si le moteur tourne, 0 sinon.
---@field isManualModeActive boolean Vrai en modes M1..Mn.
---@field isSportModeActive boolean Vrai en mode S.
---@field maxGearIndex integer Plus grand rapport avant.
---@field maxRPM number Régime maximal.
---@field minGearIndex integer Plus petit index de rapport (marche arrière) ; voir notes sur le signe.
---@field oilTemp number Température d'huile moteur.
---@field rpm number Régime moteur en tr/min.
---@field shiftBehavior table|nil Injecté (shiftUpAV / shiftDownAV en rad/s).
---@field shiftPreventionData table|nil Injecté.
---@field shiftingAggression number Recopie de smoothedValues.drivingAggression.
---@field smoothedAvgAVInput number Vitesse angulaire de sortie de la boîte (rad/s), sert à vehicleController.
---@field smoothedValues table|nil Injecté.
---@field throttle number Gaz décidés (0..1), éventuellement inversés en marche arrière arcade ou limités pendant un passage.
---@field timer table|nil Injecté.
---@field timerConstants table|nil Injecté.
---@field updateGearboxGFX function Boucle de décision courante : nop, puis inGear/whileShifting du mode de boîte actif.
---@field waterTemp number Température liquide de refroidissement.
local controller_vehicleController_shiftLogic_automaticGearbox = {}

--- Vrai si on n'est pas en arcade et en mode manuel M.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:95
---@return boolean  Utiliser les LEDs de régime ?
function controller_vehicleController_shiftLogic_automaticGearbox.areShiftLEDsInUse() end

--- Appelé par vehicleController lors d'un changement arcade/realistic : choisit la logique correspondante et, en arcade, recale le mode (mode avant par défaut, R ou N selon le rapport).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:159
---@param behavior string "arcade" ou "realistic".
function controller_vehicleController_shiftLogic_automaticGearbox.gearboxBehaviorChanged(behavior) end

--- Nom du rapport affiché : P/R/N/D, "S<n>" en mode S, "M<n>" en manuel, sinon le nom du mode.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:99
---@return string  Nom affiché.
function controller_vehicleController_shiftLogic_automaticGearbox.getGearName() end

--- Position du levier pour animation : (index-1)/(nombre de modes-1) et index de mode.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:109
---@return number  Position normalisée 0..1.
---@return integer  Index de mode.
function controller_vehicleController_shiftLogic_automaticGearbox.getGearPosition() end

--- État sauvegardable : {grb_mde = mode courant}.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:723
---@return table|nil  Table d'état.
function controller_vehicleController_shiftLogic_automaticGearbox.getState() end

--- Lit les devices (mainEngine, gearbox, torqueConverter), construit la liste des modes, la table du levier en H, les paramètres de verrouillage et applique le mode par défaut. Appelé par vehicleController (init et reset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:594
---@param jbeamData table Données jbeam (voir notes).
---@param sharedFunctionTable table sharedFunctions de vehicleController.
function controller_vehicleController_shiftLogic_automaticGearbox.init(jbeamData, sharedFunctionTable) end

--- Demande au moteur d'envoyer ses courbes de couple à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:588
function controller_vehicleController_shiftLogic_automaticGearbox.sendTorqueData() end

--- Définit le mode « avant » par défaut (D, S, M1...) et l'applique si on roule déjà en avant.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:182
---@param mode string Nom du mode ("M1" bascule en manuel sur le rapport courant).
function controller_vehicleController_shiftLogic_automaticGearbox.setDefaultForwardMode(mode) end

--- Restaure le mode courant depuis data.grb_mde.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:729
---@param data table Table produite par getState.
function controller_vehicleController_shiftLogic_automaticGearbox.setState(data) end

--- Mode realistic : recule d'un cran dans la liste des modes. Avec gearboxSafety, refuse de descendre sous M1 au-dessus de 2 m/s ou un rapport qui ferait surrégimer.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:239
function controller_vehicleController_shiftLogic_automaticGearbox.shiftDown() end

--- Mode realistic : sélectionne le mode correspondant à la position du levier en H (hShifterModePositions) ; mode inexistant -> message et N.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:283
---@param index integer Position du levier (-1 R, 0 N, 1.. selon table).
function controller_vehicleController_shiftLogic_automaticGearbox.shiftToGearIndex(index) end

--- Mode realistic : avance d'un cran dans la liste des modes (P->R->N->D...). Avec gearboxSafety, refuse un rapport manuel qui ferait dépasser maxAV au moteur.
---Source : lua/vehicle/controller/vehicleController/shiftLogic/automaticGearbox.lua:196
function controller_vehicleController_shiftLogic_automaticGearbox.shiftUp() end

return controller_vehicleController_shiftLogic_automaticGearbox

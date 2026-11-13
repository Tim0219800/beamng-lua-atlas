---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de glissement (type "auxiliary", defaultOrder 70, providerOrder 10) qui compare la vitesse de chaque roue à la vitesse virtuelle du véhicule (virtualSensors.virtual.speed) pour estimer le glissement. Il s'enregistre auprès des superviseurs tractionControl et absControl (si présents) et leur répond via calculateSlipTractionControl et calculateSlipABSControl. Les résultats sont écrits dans les structures de roue du superviseur (wheelData.slip, wheelGroup.maxSlip/minSlip/slipRange).
--- Accès : contrôleur `drivingDynamics/supervisors/slipProviders/virtualSpeedSlip` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip
---@field defaultOrder number Ordre d'exécution par défaut (70).
---@field isActive boolean Vrai après init.
---@field providerOrder number Ordre de priorité parmi les fournisseurs (10, plus petit = essayé en premier).
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip = {}

--- Calcule le glissement (en valeur absolue) d'une seule roue pour l'ABS. Appelé par le superviseur absControl.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:65
---@param wheelData table Données de roue {wd, slip, slipSmoother}.
---@param velocityOffset number Décalage de vitesse (m/s).
---@param dt number Pas de temps (s), non utilisé.
---@return boolean  Vrai si le glissement a été calculé, false si désactivé.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipABSControl(wheelData, velocityOffset, dt) end

--- Calcule le glissement de chaque roue d'un groupe motorisé et les extrêmes du groupe. Appelé par tractionControl.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:27
---@param wheelGroup table Groupe de roues {motor, wheels, wheelCount, maxSlip, minSlip, slipRange}.
---@param steeringCoef number Facteur 0.5..1 lié au braquage.
---@param velocityOffset number Décalage de vitesse (m/s) évitant la division par ~0 à basse vitesse.
---@param dt number Pas de temps (s), non utilisé.
---@return boolean  Vrai si le glissement a été calculé, false si désactivé.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.calculateSlipTractionControl(wheelGroup, steeringCoef, velocityOffset, dt) end

--- Renvoie une copie de la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:144
---@return table  Copie.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.getConfig() end

--- Passe isActive à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:109
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.init(jbeamData) end

--- Sauvegarde les paramètres initiaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:125
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initLastStage(jbeamData) end

--- S'enregistre comme fournisseur de glissement auprès de tractionControl et absControl.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:113
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:102
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.registerCMU(cmu) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:106
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.reset() end

--- Envoie la configuration au CMU.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:148
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.sendConfigData() end

--- Remplace la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:140
---@param configTable table Table {tractionControl = {isEnabled}, absControl = {isEnabled}}.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setConfig(configTable) end

--- Active/désactive les paquets de debug.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:96
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setDebugMode(debugEnabled) end

--- Applique tractionControl.isEnabled et absControl.isEnabled.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:135
---@param parameters table<string, any> Paramètres à appliquer.
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.setParameters(parameters) end

--- Désactive le fournisseur.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:129
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.shutdown() end

--- Vide (version debug : envoie l'état d'activation).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/slipProviders/virtualSpeedSlip.lua:84
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip.updateGFX(dt) end

return controller_drivingDynamics_supervisors_slipProviders_virtualSpeedSlip

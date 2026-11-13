---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur de lacet attendu (type "auxiliary", defaultOrder 80, providerOrder 20) pour le superviseur yawControl. Il estime le taux de lacet que le conducteur demande avec le modèle de bicyclette à rigidité de dérive (angle de roue avant, empattement, vitesse caractéristique), limité par une accélération latérale maximale. S'enregistre via yawControl.registerYawProvider ; si yawControl est absent, il se désactive.
--- Accès : contrôleur `drivingDynamics/supervisors/yawProviders/STMEstimate` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_supervisors_yawProviders_STMEstimate
---@field defaultOrder number Ordre d'exécution par défaut (80).
---@field isActive boolean Vrai après init, faux si yawControl est absent.
---@field providerOrder number Priorité parmi les fournisseurs de lacet (20).
---@field type string "auxiliary".
local controller_drivingDynamics_supervisors_yawProviders_STMEstimate = {}

--- Renvoie le taux de lacet attendu (rad/s, positif) d'après l'angle de roue avant et la vitesse ; appelé par yawControl à chaque pas fixe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:25
---@param dt number Déclaré dt mais reçoit la vitesse (voir notes) ; non utilisé.
---@return number  Lacet attendu en rad/s.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.calculateExpectedYaw(dt) end

--- Renvoie une copie de la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:103
---@return table  Copie.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.getConfig() end

--- Passe isActive à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:66
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:85
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initLastStage(jbeamData) end

--- S'enregistre auprès de yawControl et lit maxLateralAcceleration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:70
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.initSecondStage(jbeamData) end

--- Mémorise la référence au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:59
---@param cmu table Contrôleur CMU.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.registerCMU(cmu) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:63
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.reset() end

--- Envoie la configuration au CMU.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:107
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.sendConfigData() end

--- Remplace la configuration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:99
---@param configTable table Table {isEnabled, maxLateralAcceleration}.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setConfig(configTable) end

--- Active/désactive les paquets de debug.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:53
---@param debugEnabled boolean Vrai pour activer.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setDebugMode(debugEnabled) end

--- Applique isEnabled et maxLateralAcceleration.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:94
---@param parameters table<string, any> Paramètres à appliquer.
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.setParameters(parameters) end

--- Désactive le fournisseur.
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:88
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.shutdown() end

--- Vide (version debug : envoie isEnabled).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/supervisors/yawProviders/STMEstimate.lua:42
---@param dt number Pas de temps graphique (s).
function controller_drivingDynamics_supervisors_yawProviders_STMEstimate.updateGFX(dt) end

return controller_drivingDynamics_supervisors_yawProviders_STMEstimate

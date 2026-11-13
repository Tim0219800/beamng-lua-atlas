---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Actionneur de la Driving Dynamics Suite : verrouillage actif du différentiel central (embrayage à commande électronique). À chaque étape physique intermédiaire, il lit les vitesses de sortie du différentiel central, mesure l'écart de vitesse entre essieux et règle, par un PID, un coefficient de verrouillage 0..1 écrit dans `relevantDiff.activeLockCoef`. Le verrouillage est coupé au freinage, sans accélérateur ou au frein de stationnement, figé pendant un changement de rapport, et peut avoir un minimum. Les superviseurs du CMU peuvent le limiter avec `overrideMin`/`overrideMax`. Ordre d'appel : `defaultOrder = 80`.
--- Accès : contrôleur `drivingDynamics/actuators/activeCenterDiffLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_drivingDynamics_actuators_activeCenterDiffLock
---@field defaultOrder number 80.
---@field isActing boolean true si le coefficient de verrouillage dépasse 0.01.
---@field isActive boolean true si le système a trouvé son différentiel et son CMU.
---@field overrideMax number Borne haute imposée par un superviseur (1 par défaut).
---@field overrideMin number Borne basse imposée par un superviseur (0 par défaut).
---@field type string "auxiliary".
local controller_drivingDynamics_actuators_activeCenterDiffLock = {}

--- Renvoie une copie des paramètres.
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:232
---@return table  Copie profonde des paramètres.
function controller_drivingDynamics_actuators_activeCenterDiffLock.getConfig() end

--- Lit les paramètres jbeam et crée le PID de verrouillage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:147
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_activeCenterDiffLock.init(jbeamData) end

--- Retrouve le différentiel central (`centerDiffName`) et active le système ; l'arrête si le CMU est absent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:176
---@param jbeamData table Données jbeam.
function controller_drivingDynamics_actuators_activeCenterDiffLock.initSecondStage(jbeamData) end

--- Appelée par le CMU pour donner une référence vers lui.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:206
---@param cmu table Module CMU.
function controller_drivingDynamics_actuators_activeCenterDiffLock.registerCMU(cmu) end

--- Remet les états, vitesses lissées, override et `activeLockCoef` à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:132
function controller_drivingDynamics_actuators_activeCenterDiffLock.reset() end

--- Remet les bornes d'override à 0 et 1.
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:43
function controller_drivingDynamics_actuators_activeCenterDiffLock.resetOverride() end

--- Envoie les paramètres au CMU dans un paquet de debug de type config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:236
function controller_drivingDynamics_actuators_activeCenterDiffLock.sendConfigData() end

--- Remplace toute la table de paramètres (utilisé par l'outil de debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:228
---@param configTable table Nouveaux paramètres.
function controller_drivingDynamics_actuators_activeCenterDiffLock.setConfig(configTable) end

--- Active ou désactive l'envoi de paquets de debug à chaque frame.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:200
---@param debugEnabled boolean true pour envoyer.
function controller_drivingDynamics_actuators_activeCenterDiffLock.setDebugMode(debugEnabled) end

--- Modifie à chaud les paramètres (avDiffThreshold, avThreshold, minimumLock, isEnabled, clutchPIDkP/kI/kD) via CMU.applyParameter ; la valeur "default" restaure l'initial.
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:210
---@param parameters table Table des paramètres à changer.
function controller_drivingDynamics_actuators_activeCenterDiffLock.setParameters(parameters) end

--- Arrête l'actionneur (appelée par le CMU en cas de système incomplet).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:125
function controller_drivingDynamics_actuators_activeCenterDiffLock.shutdown() end

--- Chaque frame : ne fait rien d'utile (retourne si désactivé). Variante debug : envoie les valeurs au CMU.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:98
---@param dt number Pas de temps en secondes.
function controller_drivingDynamics_actuators_activeCenterDiffLock.updateGFX(dt) end

--- Étape physique intermédiaire : calcule le coefficient de verrouillage (PID sur l'écart de vitesse entre sorties, conditions de frein, accélérateur, rapport et frein de stationnement), applique l'override et l'écrit dans `activeLockCoef` du différentiel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/drivingDynamics/actuators/activeCenterDiffLock.lua:48
---@param dt number Pas en secondes.
function controller_drivingDynamics_actuators_activeCenterDiffLock.updateWheelsIntermediate(dt) end

return controller_drivingDynamics_actuators_activeCenterDiffLock

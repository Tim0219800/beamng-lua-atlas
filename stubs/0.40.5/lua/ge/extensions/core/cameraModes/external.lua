---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/external.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode externe. Champs : isFanMode, camPos, camVel, camChangeTimeMin/Base/Max, invisibleTime, et les filtres autozoom, autopoint, noise, smooth, bobbing, handheld, predictor.
---@class core_cameraModes_external
local core_cameraModes_external = {}

--- Définit le point visé par autopoint (décalage local au véhicule, ignoré en OpenXR).
---Source : lua/ge/extensions/core/cameraModes/external.lua:186
---@param nx vec3 axe x du véhicule
---@param ny vec3 axe y du véhicule
---@param nz vec3 axe z du véhicule
---@param offset vec3|nil décalage monde
---@param openxrSessionRunning boolean|nil vrai en session OpenXR
function core_cameraModes_external:applyOffset(nx, ny, nz, offset, openxrSessionRunning) end

--- La caméra s'est téléportée : réinitialise autozoom et handheld.
---Source : lua/ge/extensions/core/cameraModes/external.lua:373
function core_cameraModes_external:camTeleported() end

--- Le véhicule s'est téléporté : appelle reset.
---Source : lua/ge/extensions/core/cameraModes/external.lua:370
function core_cameraModes_external:carTeleported() end

--- Choisit une position de caméra près de la position future prédite du véhicule, et la vitesse de panoramique (nulle en mode fan).
---Source : lua/ge/extensions/core/cameraModes/external.lua:117
---@param carPos vec3 position actuelle du véhicule
---@param futureCarPos vec3 position future prédite
---@param velLength number vitesse (m/s)
---@param chancesMultiplier number 1 vers 0 : restreint la zone de tirage au fil des essais
---@param carStopped boolean véhicule quasi arrêté (< 0.5 m/s)
function core_cameraModes_external:findNewCamPosVel(carPos, futureCarPos, velLength, chancesMultiplier, carStopped) end

--- Initialise l'état, les temporisations et les filtres, puis appelle onSettingsChanged, onVehicleCameraConfigChanged et reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/external.lua:19
function core_cameraModes_external:init() end

--- Hook : relit cameraFanVsTV et relaie au filtre bobbing.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/external.lua:67
function core_cameraModes_external:onSettingsChanged() end

--- Hook : transmet refNodes à autopoint.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/external.lua:63
function core_cameraModes_external:onVehicleCameraConfigChanged() end

--- Tire la période de changement du point visé et le ressort d'autopoint.
---Source : lua/ge/extensions/core/cameraModes/external.lua:347
---@param paused boolean simulation en pause
---@param carStopped boolean véhicule arrêté
function core_cameraModes_external:randomizeOffsetSpeeds(paused, carStopped) end

--- Force le choix d'une nouvelle caméra à la prochaine image (« switch to a new camera »).
---Source : lua/ge/extensions/core/cameraModes/external.lua:96
function core_cameraModes_external:reset() end

--- Définit les nœuds de référence du véhicule (aussi pour autopoint).
---Source : lua/ge/extensions/core/cameraModes/external.lua:72
---@param centerNodeID integer nœud centre
---@param leftNodeID integer nœud gauche
---@param backNodeID integer nœud arrière
function core_cameraModes_external:setRefNodes(centerNodeID, leftNodeID, backNodeID) end

--- Dit s'il faut changer de caméra : démarrage, ou délai minimal écoulé et (véhicule invisible trop longtemps ou trop loin après le délai maximal).
---Source : lua/ge/extensions/core/cameraModes/external.lua:306
---@param carPos vec3 position véhicule
---@param carVel vec3 vitesse véhicule
---@param dt number secondes
---@return boolean  true pour changer
function core_cameraModes_external:shouldSwitchCamera(carPos, carVel, dt) end

--- Choisit un nouveau point de vue : tire le style (fan/TV), les paliers de zoom et les durées, puis cherche un emplacement dégagé (40 essais), et règle handheld, noise, smooth.
---Source : lua/ge/extensions/core/cameraModes/external.lua:193
---@param carVel vec3 vitesse véhicule
---@param carPos vec3 position véhicule
---@param veh userdata objet véhicule
---@param nx vec3 axe x véhicule
---@param ny vec3 axe y véhicule
---@param nz vec3 axe z véhicule
---@param carStopped boolean véhicule arrêté
---@param openxrSessionRunning boolean|nil OpenXR actif
function core_cameraModes_external:switchCamera(carVel, carPos, veh, nx, ny, nz, carStopped, openxrSessionRunning) end

--- Boucle principale : gère les téléportations, le changement de point visé et de caméra, déplace la caméra, puis passe data par les filtres.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/external.lua:380
---@param data table camData (data.dt est remplacé par data.dtSim)
---@return boolean  true
function core_cameraModes_external:update(data) end


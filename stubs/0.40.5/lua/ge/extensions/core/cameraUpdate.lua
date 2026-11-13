---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraUpdate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boucle de mise à jour de la caméra à chaque image, séparée de core/camera.lua. Elle traite la vue principale du joueur puis les contextes de rendu supplémentaires (écran partagé, flux vidéo) : remplit camData (position, vitesse, dt, véhicule suivi), appelle le mode de caméra sélectionné (caméra globale ou caméra du véhicule), puis les caméras « en cours d'exécution » (filtres), et copie le résultat dans finalCameraData. core_camera injecte son état via setup() et expose onPreRender / onClientPostStartMission comme ses propres callbacks ; un moddeur n'appelle normalement rien ici.
--- Accès : extension `core_cameraUpdate` : `extensions.load("core_cameraUpdate")`, puis la globale `core_cameraUpdate`
---@class core_cameraUpdate
core_cameraUpdate = {}

--- Hook appelé après le démarrage d'un niveau : oublie le nearClip du niveau et l'état intérieur/extérieur de la caméra pour que le rayon SSAO soit réappliqué.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraUpdate.lua:79
function core_cameraUpdate.onClientPostStartMission() end

--- Appelé à chaque image avant le rendu (via core_camera) : met à jour la vue principale puis chaque contexte supplémentaire. Ne fait rien tant que levelLoaded est faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraUpdate.lua:308
---@param dtReal number dt de rendu lissé, en secondes
---@param dtSim number dt de simulation lissé (tient compte du ralenti/pause), en secondes
---@param dtRaw number dt de rendu brut, horloge réelle, en secondes
function core_cameraUpdate.onPreRender(dtReal, dtSim, dtRaw) end

--- Reçoit de core/camera.lua ses tables d'état et ses fonctions utilitaires (extraContexts, mainContext, moveManager, getGlobalCameras, getVehicleData, getRunningCamsOrder, setGlobalCameraByName, set, vehicleChanged, isInsideBasedOnCameras, isUnicycle, cameraM). Appelé une fois par core_camera.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraUpdate.lua:22
---@param deps table Table des dépendances injectées par core_camera, clés citées ci-dessus.
function core_cameraUpdate.setup(deps) end


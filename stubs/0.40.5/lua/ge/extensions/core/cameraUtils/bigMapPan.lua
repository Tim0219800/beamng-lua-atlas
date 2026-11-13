---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraUtils/bigMapPan.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide partagée de déplacement et de zoom fluides pour les modes de caméra de la grande carte (bigMap / bigMapOrtho). Placée hors de cameraModes/ car les fichiers de ce dossier sont chargés automatiquement comme constructeurs de caméra. Les fonctions modifient directement les champs du mode de caméra passé en paramètre (cam).
--- Accès : extension `core_cameraUtils_bigMapPan` : `extensions.load("core_cameraUtils_bigMapPan")`, puis la globale `core_cameraUtils_bigMapPan`
---@class core_cameraUtils_bigMapPan
core_cameraUtils_bigMapPan = {}

--- Fixe cam.panTarget pour centrer la vue sur worldPos : x,y = worldPos moins le décalage ; z = celui de cam.bigMapCamPosition (sinon celui de worldPos). Ne fait rien si worldPos est nil.
---Source : lua/ge/extensions/core/cameraUtils/bigMapPan.lua:11
---@param cam table mode de caméra appelant
---@param worldPos vec3|nil point du monde à centrer
---@param lookAtOffset vec3|nil vecteur caméra -> point visé (camToLookAtPoint) du mode appelant ; (0,0,0) par défaut
function core_cameraUtils_bigMapPan.setTarget(cam, worldPos, lookAtOffset) end

--- À appeler à chaque image : rapproche manualzoom.fov de zoomTarget et bigMapCamPosition (x,y) de panTarget, et annule les cibles si l'utilisateur bouge ou zoome.
---Source : lua/ge/extensions/core/cameraUtils/bigMapPan.lua:25
---@param cam table mode de caméra appelant
---@param dt number durée de l'image en secondes
---@param userMoving boolean vrai si l'utilisateur déplace la caméra (annule les cibles)
function core_cameraUtils_bigMapPan.update(cam, dt, userMoving) end

--- Fixe cam.zoomTarget par interpolation entre fovMax (facteur 0, dézoomé) et fovMin (facteur 1, zoomé).
---Source : lua/ge/extensions/core/cameraUtils/bigMapPan.lua:19
---@param cam table mode de caméra appelant
---@param factor number 0 = dézoomé (fovMax), 1 = zoomé (fovMin) ; borné à [0,1], non numérique = 0
function core_cameraUtils_bigMapPan.zoomToFactor(cam, factor) end


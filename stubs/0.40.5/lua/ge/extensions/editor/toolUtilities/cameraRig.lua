---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/cameraRig.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rig de caméra réutilisable pour les outils de l'éditeur : état de panoramique (pan, vue quasi aérienne nord en haut) et d'orbite avec inertie, qui produit une pose (pos, yaw, pitch, roll) pour une caméra pilotée par script (scriptedFree). Module d'état et de maths pur, sans couplage moteur : l'outil hôte lit les entrées, appelle update() chaque frame et pousse la pose renvoyée. Les transitions chronométrées entre focus restent à la charge de l'hôte.
--- Accès : extension `editor_toolUtilities_cameraRig` : `extensions.load("editor_toolUtilities_cameraRig")`, puis la globale `editor_toolUtilities_cameraRig`
---@class editor_toolUtilities_cameraRig
editor_toolUtilities_cameraRig = {}

--- Passe en mode PAN centré sur l'origine d'une emprise et renvoie sa pose cible vue de dessus.
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:196
---@param originXY table|nil {x=,y=} centre (0,0 si nil).
---@param terrainH number|nil Altitude du sol ; si nil on garde la dernière connue.
---@param height number|nil Hauteur de la caméra au-dessus du sol (bornée à 15-3000 m).
---@return vec3  Position
---@return number  yaw
---@return number  pitch
---@return number  roll
function editor_toolUtilities_cameraRig.focusFootprint(originXY, terrainH, height) end

--- Passe en mode ORBITE centré sur le centroïde d'un bâtiment et renvoie sa pose cible en 3/4. La distance vaut radius*2.4 (bornée), sinon 130 m.
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:209
---@param centroid vec3|nil Pivot (origine si nil).
---@param radius number|nil Rayon englobant ; utilisé seulement s'il est > 1.
---@param yawDeg number|nil Yaw initial (défaut 30).
---@param pitchDeg number|nil Pitch initial (défaut 32, borné -30..88).
---@return vec3  Position
---@return number  yaw
---@return number  pitch
---@return number  roll (0)
function editor_toolUtilities_cameraRig.focusMassing(centroid, radius, yawDeg, pitchDeg) end

--- Mode courant du rig.
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:241
---@return string  'pan' (emprise) ou 'orbit' (volume).
function editor_toolUtilities_cameraRig.getMode() end

--- Déplace le PIVOT de l'orbite vers `centroid` en gardant yaw/pitch/distance, et renvoie la pose qui conserve le cadrage. Passe en mode orbite et annule l'inertie.
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:223
---@param centroid vec3|nil Nouveau pivot (chaque composante manquante garde l'ancienne).
---@return vec3  Position
---@return number  yaw
---@return number  pitch
---@return number  roll (0)
function editor_toolUtilities_cameraRig.recenter(centroid) end

--- Annule toute inertie résiduelle (pan et orbite) et l'état de glissé ; à appeler quand une transition chronométrée se termine avant de rendre la main à l'interaction.
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:234
function editor_toolUtilities_cameraRig.settle() end

--- Avance la caméra interactive d'une frame et renvoie la pose à pousser. En pan, un glissé attrape le sol (avec inertie) ; en orbite il fait tourner autour du pivot (avec inertie) ; la molette zoome/dolly.
---Source : lua/ge/extensions/editor/toolUtilities/cameraRig.lua:98
---@param dt number|nil Durée de frame en secondes (plafonnée à 0.05).
---@param input table|nil { dragActive:boolean, dragDX:number, dragDY:number (pixels écran), wheel:number (crans), groundZAt:function(x,y[,heightAbove])->number|nil (altitude du sol ; moyenne sur la vue si heightAbove), limitXY:function(x,y)->x,y (borne le centre du pan) }
---@return vec3  Position de la caméra (vec3 partagé).
---@return number  yaw en degrés
---@return number  pitch en degrés
---@return number  roll en degrés
function editor_toolUtilities_cameraRig.update(dt, input) end


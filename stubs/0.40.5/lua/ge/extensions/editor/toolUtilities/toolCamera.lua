---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/toolCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Caméra d'outil réutilisable : prend la main sur la caméra de l'éditeur avec la caméra pilotée par script 'scriptedFree' de BeamNG, la pilote chaque frame avec le glisser du bouton droit et la molette dans le viewport (via cameraRig), et lance des transitions lissées (smoothstep) vers un cadrage « pan » (vue de dessus) ou « orbite ». Pendant qu'elle conduit, elle bloque dans le groupe de filtre 'toolCameraZoom' les actions editorCameraZoom et changeCameraSpeed.
--- Accès : extension `editor_toolUtilities_toolCamera` : `extensions.load("editor_toolUtilities_toolCamera")`, puis la globale `editor_toolUtilities_toolCamera`
---@class editor_toolUtilities_toolCamera
editor_toolUtilities_toolCamera = {}

--- Pilotage interactif par frame : collecte le glisser bouton droit et la molette dans le viewport (ignorés si l'UI ou un état occupé déclaré par l'hôte capte la souris) et applique la pose de cameraRig à scriptedFree. Force l'affichage du curseur pendant le glisser pour que MouseDelta continue à être renseigné.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:183
---@param blocked boolean|nil Vrai : ne pas déplacer la caméra (interaction modale de l'outil).
function editor_toolUtilities_toolCamera.drive(blocked) end

--- Vol vers un cadrage ORBITE sur (x, y, z). `radius` dimensionne le recul pour bien cadrer le sujet ; yaw et pitch remplacent l'angle 3/4 par défaut (pour aborder un détail depuis une direction extérieure connue).
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:160
---@param x number X monde.
---@param y number Y monde.
---@param z number Z monde.
---@param radius number|nil Rayon du sujet.
---@param yaw number|nil Lacet imposé.
---@param pitch number|nil Tangage imposé.
---@param time number|nil Durée en secondes (nil = selon la distance).
function editor_toolUtilities_toolCamera.flyOrbit(x, y, z, radius, yaw, pitch, time) end

--- Vol vers un cadrage PAN vu de dessus. Le point est tenu dans l'emprise du terrain. Si groundZ est absent, la hauteur du sol est échantillonnée sur le terrain.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:137
---@param x number X monde.
---@param y number Y monde.
---@param groundZ number|nil Altitude du sol sous le point.
---@param height number|nil Altitude absolue visée pour la caméra.
---@param time number|nil Durée en secondes (0 = saut immédiat, nil = selon la distance).
function editor_toolUtilities_toolCamera.flyPan(x, y, groundZ, height, time) end

--- Rend la caméra de l'éditeur : débloque la molette et revient à la caméra globale mémorisée. Sans effet si on ne conduit pas.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:121
---@param animate boolean Vrai : revient d'abord à la pose mémorisée par un vol lissé avant de rendre la main.
function editor_toolUtilities_toolCamera.handBack(animate) end

--- Vrai si le module conduit scriptedFree.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:132
---@return boolean  État actif.
function editor_toolUtilities_toolCamera.isActive() end

--- Glisse le PIVOT d'orbite sur (x, y, z) en GARDANT lacet, tangage et distance : le geste doux « recentrer sur ce que je viens de sélectionner », contrairement à flyOrbit qui recadre en 3/4.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:172
---@param x number X monde.
---@param y number Y monde.
---@param z number Z monde.
---@param time number|nil Durée en secondes (0.5 par défaut).
function editor_toolUtilities_toolCamera.recenterOrbit(x, y, z, time) end

--- Prend la main sur la caméra de l'éditeur : mémorise la caméra globale et sa pose, passe à 'scriptedFree' (locked, driveRot) à la même pose et bloque la molette de zoom standard. Sans effet si déjà actif ou sans core_camera.
---Source : lua/ge/extensions/editor/toolUtilities/toolCamera.lua:96
function editor_toolUtilities_toolCamera.takeOver() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/cameraTransition.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire du Track Builder qui déplace en douceur la caméra libre vers une position et une rotation cibles. Il interpole position (linéaire) et rotation (nlerp) avec une courbe d'accélération quadratique inversée (1-(1-t)²), à chaque onPreRender, via core_camera.setPosRot.
--- Accès : extension `util_trackBuilder_cameraTransition` : `extensions.load("util_trackBuilder_cameraTransition")`, puis la globale `util_trackBuilder_cameraTransition`
---@class util_trackBuilder_cameraTransition
util_trackBuilder_cameraTransition = {}

--- Lance une transition de la caméra actuelle vers (pos, rot) en time secondes. Si time <= 0, place la caméra immédiatement.
---Source : lua/ge/extensions/util/trackBuilder/cameraTransition.lua:39
---@param pos vec3 Position cible dans le monde.
---@param rot quat Rotation cible.
---@param time number Durée en secondes ; 0 ou moins pour un saut immédiat.
function util_trackBuilder_cameraTransition.lerpTo(pos, rot, time) end

--- Hook appelé avant chaque rendu : fait avancer la transition, calcule position et rotation interpolées et les applique à la caméra libre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/trackBuilder/cameraTransition.lua:22
---@param dt number Temps écoulé depuis la frame précédente (s).
function util_trackBuilder_cameraTransition.onPreRender(dt) end


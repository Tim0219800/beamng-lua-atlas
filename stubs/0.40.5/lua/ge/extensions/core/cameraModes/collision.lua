---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/collision.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filtre de collision de caméra.
---@class core_cameraModes_collision
local core_cameraModes_collision = {}

--- Distance cible -> caméra imposée par la collision.
---Source : lua/ge/extensions/core/cameraModes/collision.lua:142
---@return number|nil  distance en mètres, nil s'il n'y a pas de collision
function core_cameraModes_collision:collidingCamDistance() end

--- Réinitialise l'état (distances, indice de rayon, lissage) et lit le réglage cameraCollision.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/collision.lua:18
function core_cameraModes_collision:init() end

--- Détecte une géométrie que les rayons de coin ne voient pas : traversée complète d'un mur en une image, ou arête du plan proche qui coupe une surface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/collision.lua:36
---@param rayDestinations vec3[] les 4 coins du plan proche
---@param cornerIdx integer coin 1 à 4 à tester
---@return boolean  true si obstacle
function core_cameraModes_collision:isObstacleInFrontOfCam(rayDestinations, cornerIdx) end

--- Hook : relit le réglage 'cameraCollision' (true par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/collision.lua:30
function core_cameraModes_collision:onSettingsChanged() end

--- Hook : réinitialise le filtre (appelle init).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/collision.lua:138
function core_cameraModes_collision:onVehicleSwitched() end

--- Calcule la nouvelle position de caméra sur l'axe cible -> caméra et écrit data.res.pos.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/collision.lua:54
---@param data table camData
function core_cameraModes_collision:update(data) end


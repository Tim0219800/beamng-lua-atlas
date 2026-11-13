---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orbite autour d'un point. Champs : fixedTargetPos, fov, camRot (vec3 degrés : x lacet, y tangage), camDist, defaultDistance, camMinDist, camMaxDist.
---@class core_cameraModes_pacenoteOrbit
local core_cameraModes_pacenoteOrbit = {}

--- isGlobal = true, FOV 65, puis setupStuff, onSettingsChanged, reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:10
function core_cameraModes_pacenoteOrbit:init() end

--- Hook : relit les réglages cameraOrbit* (fovModifier, relaxation, maxDynamicFov, maxDynamicPitch, maxDynamicOffset, smoothing).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:35
function core_cameraModes_pacenoteOrbit:onSettingsChanged() end

--- Code mort (voir notes).
---Source : lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:45
function core_cameraModes_pacenoteOrbit:reset() end

--- Change defaultDistance (sans modifier la distance courante camDist).
---Source : lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:56
---@param d number mètres
function core_cameraModes_pacenoteOrbit:setDefaultDistance(d) end

--- Définit le point autour duquel orbiter ; seul center est utilisé.
---Source : lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:52
---@param center vec3 point cible monde
---@param left any ignoré
---@param back any ignoré
function core_cameraModes_pacenoteOrbit:setRef(center, left, back) end

--- Définit rotation par défaut (0, -17, 0), bornes de distance 10-1500 m et distance par défaut 300 m.
---Source : lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:22
function core_cameraModes_pacenoteOrbit:setupStuff() end

--- Calcule la position orbitale, la clippe au terrain et écrit data.res (collisionCompatible = true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua:60
---@param data table camData
---@return boolean  true
function core_cameraModes_pacenoteOrbit:update(data) end


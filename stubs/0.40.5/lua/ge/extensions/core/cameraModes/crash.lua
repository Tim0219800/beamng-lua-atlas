---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/crash.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Caméra de crash. Champs : camMode, veh1Id, veh2Id, hitPoint, camOffset, camPos, fov, cockpitView.
---@class core_cameraModes_crash
local core_cameraModes_crash = {}

--- camMode = 1, hidden = true, cockpitView = false.
---Source : lua/ge/extensions/core/cameraModes/crash.lua:8
function core_cameraModes_crash:init() end

--- Configure la prise de vue (appelé lors du choix de la caméra globale).
---Source : lua/ge/extensions/core/cameraModes/crash.lua:43
---@param data table veh1Id (véhicule touché), veh2Id (optionnel), camMode (1|2), hitPoint (vec3), camOffset (vec3, mode 1)
function core_cameraModes_crash:setCustomData(data) end

--- Écrit data.res.pos / rot / fov selon le mode.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/crash.lua:73
---@param data table camData
---@return boolean  toujours true
function core_cameraModes_crash:update(data) end


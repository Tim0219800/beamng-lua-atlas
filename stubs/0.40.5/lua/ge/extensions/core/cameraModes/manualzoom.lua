---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/manualzoom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filtre de zoom. Champs : fov (courant), fovDefault, fovMin, fovMax, uiTxt.
---@class core_cameraModes_manualzoom
local core_cameraModes_manualzoom = {}

--- Initialise les bornes et remet le FOV à fovDefault.
---Source : lua/ge/extensions/core/cameraModes/manualzoom.lua:8
---@param fovDefault number|nil FOV initial en degrés (80)
---@param fovMin number|nil FOV minimal (10)
---@param fovMax number|nil FOV maximal (120)
---@param uiTxt string|nil clé de traduction du message (ui.camera.fov)
function core_cameraModes_manualzoom:init(fovDefault, fovMin, fovMax, uiTxt) end

--- Remet fov à fovDefault.
---Source : lua/ge/extensions/core/cameraModes/manualzoom.lua:18
function core_cameraModes_manualzoom:reset() end

--- Applique le zoom des entrées et écrit data.res.fov.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/manualzoom.lua:22
---@param data table camData
---@return boolean  true si le FOV a changé d'au moins 0.1 degré (message affiché) ; false en OpenXR
function core_cameraModes_manualzoom:update(data) end


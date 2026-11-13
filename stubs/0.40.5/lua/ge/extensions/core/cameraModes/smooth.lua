---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/smooth.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filtre de lissage de position.
---@class core_cameraModes_smooth
local core_cameraModes_smooth = {}

--- Crée les ressorts ; si pos est donné, les initialise à cette position.
---Source : lua/ge/extensions/core/cameraModes/smooth.lua:8
---@param spring number|nil raideur (30)
---@param damp number|nil amortissement (10)
---@param pos vec3|nil position initiale des ressorts
function core_cameraModes_smooth:init(spring, damp, pos) end

--- Lisse data.res.pos axe par axe avec data.dt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/smooth.lua:23
---@param data table camData
---@return boolean  toujours true
function core_cameraModes_smooth:update(data) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/noise.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bruit de position de la caméra.
---@class core_cameraModes_noise
local core_cameraModes_noise = {}

--- Prépare le décalage ; chaque appel force un nouveau tirage au premier update.
---Source : lua/ge/extensions/core/cameraModes/noise.lua:8
---@param factor number|nil amplitude totale du bruit en mètres (0.2 par défaut, ou self.factor existant)
function core_cameraModes_noise:init(factor) end

--- Ajoute le décalage courant à data.res.pos.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/noise.lua:15
---@param data table camData
function core_cameraModes_noise:update(data) end


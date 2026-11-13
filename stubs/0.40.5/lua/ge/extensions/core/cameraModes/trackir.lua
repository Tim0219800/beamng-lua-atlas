---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/trackir.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filtre TrackIR. Champ working : vrai si TrackIR a pu démarrer.
---@class core_cameraModes_trackir
local core_cameraModes_trackir = {}

--- Marque le mode global/filtre/masqué et démarre TrackIR s'il est disponible.
---Source : lua/ge/extensions/core/cameraModes/trackir.lua:20
function core_cameraModes_trackir:init() end

--- Lit TrackIR.getData et applique translation et rotation à data.res.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/trackir.lua:39
---@param data table camData
---@return boolean|nil  true ; nil si TrackIR n'est pas actif
function core_cameraModes_trackir:update(data) end


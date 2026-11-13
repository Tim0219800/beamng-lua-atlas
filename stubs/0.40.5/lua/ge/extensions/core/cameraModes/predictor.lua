---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/predictor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Filtre de prédiction de cible.
---@class core_cameraModes_predictor
local core_cameraModes_predictor = {}

--- Définit isFilter, hidden et dtFuture.
---Source : lua/ge/extensions/core/cameraModes/predictor.lua:8
---@param dtFuture number|nil avance en secondes (0.1 par défaut)
function core_cameraModes_predictor:init(dtFuture) end

--- Avance targetPos et met data.res.rot à jour.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/predictor.lua:14
---@param data table camData
---@return boolean  toujours true
function core_cameraModes_predictor:update(data) end


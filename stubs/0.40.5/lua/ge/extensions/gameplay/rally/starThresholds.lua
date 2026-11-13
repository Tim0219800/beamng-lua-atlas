---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/starThresholds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_rally_starThresholds` : `extensions.load("gameplay_rally_starThresholds")`, puis la globale `gameplay_rally_starThresholds`
---@class gameplay_rally_starThresholds
---@field bronzePaceMult number
---@field bronzeResetsPerKm number
---@field goldMult number
---@field perResetSeconds number
---@field silverPaceMult number
---@field silverResetsPerKm number
gameplay_rally_starThresholds = {}

--- baselineSeconds: authored reference time; lengthKm: stage race distance.
---  Missing/zero length -> pace-only (no reset headroom).
---Source : lua/ge/extensions/gameplay/rally/starThresholds.lua:39
---@param baselineSeconds any
---@param lengthKm any
function gameplay_rally_starThresholds.compute(baselineSeconds, lengthKm) end


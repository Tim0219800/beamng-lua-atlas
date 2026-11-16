---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/starThresholds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Computes the star time thresholds (gold, silver, bronze) of a rally special stage from a hand-made reference time (baseline) and the stage length. Gold = baseline x 1.03 (tight pace, no margin for resets). Silver and bronze = baseline x pace multiplier + an additive margin that forgives a certain number of resets per km.
--- Access: extension `gameplay_rally_starThresholds`: `extensions.load("gameplay_rally_starThresholds")`, then the global `gameplay_rally_starThresholds`
---@class gameplay_rally_starThresholds
---@field bronzePaceMult number Bronze pace multiplier (1.23).
---@field bronzeResetsPerKm number Resets per km forgiven for bronze (2.233, i.e. ~5 resets on the shortest special stages).
---@field goldMult number Gold pace multiplier (1.03), deliberately tight.
---@field perResetSeconds number Seconds added per reset in the margin: timer penalty (~5 s) plus loss of momentum (~3.5 s), i.e. 8.5.
---@field silverPaceMult number Silver pace multiplier (1.13).
---@field silverResetsPerKm number Resets per km forgiven for silver (0.9, i.e. ~2 resets on the shortest special stages of about 2.2 km).
gameplay_rally_starThresholds = {}

--- Computes the gold/silver/bronze thresholds in seconds, rounded to the tenth.
---Source: lua/ge/extensions/gameplay/rally/starThresholds.lua:39
---@param baselineSeconds number|string Stage reference time in seconds (converted by tonumber, 0 if invalid)
---@param lengthKm number|string Stage length in km (0 if invalid)
---@return table  {gold=number, silver=number, bronze=number} in seconds
function gameplay_rally_starThresholds.compute(baselineSeconds, lengthKm) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/distance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Distance call configuration of the English styles: link words depending on the gap between two notes, spoken units, rounding rules and maximum spoken distance. Read by textCompositor (roundDistance, distanceToString, getDistanceCallShorthand...).
--- Access: extension `gameplay_rally_compositors_styles_english_distance`: `extensions.load("gameplay_rally_compositors_styles_english_distance")`, then the global `gameplay_rally_compositors_styles_english_distance`
---@class gameplay_rally_compositors_styles_english_distance
---@field links table[] Ordered links {threshold, text} with strictly increasing thresholds (5, 20, 40 m).
---@field max number Maximum spoken distance: 2000 m.
---@field rounding table {small=10, medium=50, mediumThreshold=100, large=250, largeThreshold=1000} (meters).
---@field units table {base='m', large='km', point='point'}.
gameplay_rally_compositors_styles_english_distance = {}


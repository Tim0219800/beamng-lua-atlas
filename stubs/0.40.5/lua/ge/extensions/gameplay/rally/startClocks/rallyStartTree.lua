---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- LED display of BeamNG's start clock panel ("rally start tree"). It finds in the scene the TSStatics using the s_rally_start_tree.dae shape, then draws into two textures (color and opacity, 900x540) an LED grid: traffic lights (R/A/G), a 6-digit clock in green, a stage label in amber and a countdown in red. Also helps choose the display's orientation toward a target point. Simple module (table C), without a constructor.
--- Access: extension `gameplay_rally_startClocks_rallyStartTree`: `extensions.load("gameplay_rally_startClocks_rallyStartTree")`, then the global `gameplay_rally_startClocks_rallyStartTree`
---@class gameplay_rally_startClocks_rallyStartTree
---@field textures table Definition of the two dynamic textures: color (transparent clearColor) and opacity (black clearColor), each with tag, width and height.
gameplay_rally_startClocks_rallyStartTree = {}

--- Draws the display's full state into the textures: lights, clock, stage label and countdown ("-N", "M:SS" or one or two digits format).
---Source: lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua:130
---@param textures table {color, opacity}: target texture objects
---@param display table {clock=string "HH:MM:SS" style, label=string, countdown=string, semaphore="R"|"A"|"G"}
function gameplay_rally_startClocks_rallyStartTree.draw(textures, display) end

--- Walks through the scene's TSStatics and returns those whose shapeName is the start tree's shape.
---Source: lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua:66
---@return table[]  List of {anchor, shapeName (display shape), transform, scale}
function gameplay_rally_startClocks_rallyStartTree.findClocks() end

--- Computes an aiming vector for a clock's display: combines the tangent and the normal of the clock's surface, oriented in the direction of the road and inward, depending on whether the clock is to the right or to the left of the start line.
---Source: lua/ge/extensions/gameplay/rally/startClocks/rallyStartTree.lua:178
---@param clock table Element returned by findClocks (uses clock.anchor)
---@param startLine table {pos, rot} of the start line; rot required
---@param targetPos vec3 Target position (side where the clock is relative to the road)
---@return vec3|nil  Composed direction; nil if the rotation is absent or degenerate
function gameplay_rally_startClocks_rallyStartTree.getView(clock, startLine, targetPos) end


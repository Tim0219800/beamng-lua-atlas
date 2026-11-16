---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/showroom.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small "showroom" utility: spawns on demand a garage prefab (art/prefabs/garage_simple.prefab) at the fixed position (0, 0, 1000) in the current level and lets you move a vehicle into it. The prefab is loaded at the first call that needs its position (moveInside, getPosRot) and unloaded at the end of the level (onClientEndMission).
--- Access: extension `util_showroom`: `extensions.load("util_showroom")`, then the global `util_showroom`
---@class util_showroom
util_showroom = {}

--- Returns the position and rotation of the garage interior (loads the prefab if needed).
---Source: lua/ge/extensions/util/showroom.lua:39
---@return vec3  World position of the garage (0, 0, 1000).
---@return quat  Identity rotation (0, 0, 0, 1).
function util_showroom.getPosRot() end

--- Indicates whether a position is in the garage (distance to center < 20 m). With no argument, uses the player vehicle's position or, failing that, the camera's.
---Source: lua/ge/extensions/util/showroom.lua:49
---@param pos vec3|nil World position to test.
---@return boolean|nil  true if inside; false outside the garage; nil if the prefab is not loaded.
function util_showroom.isInside(pos) end

--- Loads the garage if needed, places the vehicle at its position (setPosRot) then calls veh:autoplace(false) to set it down.
---Source: lua/ge/extensions/util/showroom.lua:42
---@param veh table Vehicle object to move.
function util_showroom.moveInside(veh) end

--- Hook called at the end of the level: removes the prefab and reloads collision (be:reloadCollision).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/util/showroom.lua:26
function util_showroom.onClientEndMission() end


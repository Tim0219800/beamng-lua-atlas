---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/multiseatCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_multiseatCamera`: shared camera for local multiplayer (multiseat) mode when all players see the same screen. It computes the average position of the assigned players' vehicles, sets the camera distance so that all are visible (maximum distance to the average, x2 + 10 m, FOV 40) and places it on player 0's vehicle via core_camera. It activates when the 'multiseat' setting is true, there is more than one player, and the screen is not split (or the split mode is 'shared').
--- Access: extension `core_multiseatCamera`: `extensions.load("core_multiseatCamera")`, then the global `core_multiseatCamera`
---@class core_multiseatCamera
---@field onUpdate function nop until the camera is activated, then the shared camera computation loop.
core_multiseatCamera = {}

--- Before a Lua reload: deactivates the shared camera if it was active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseatCamera.lua:106
function core_multiseatCamera.onSerialize() end

--- Hook called when settings change: enables or disables the shared camera depending on whether the multiseat setting is true, render_splitScreen is loaded, there is more than one player and split-screen is inactive or in 'shared' mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseatCamera.lua:98
function core_multiseatCamera.onSettingsChanged() end

--- Hook called when the split-screen configuration changes: the shared camera is active if split-screen is disabled or in 'shared' mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/multiseatCamera.lua:102
---@param splitScreenEnabled boolean Split-screen active.
---@param playerCount integer Number of players (unused).
---@param layout any Layout (unused).
---@param mode string Split-screen mode, 'shared' for a common screen.
function core_multiseatCamera.onSplitScreenChanged(splitScreenEnabled, playerCount, layout, mode) end


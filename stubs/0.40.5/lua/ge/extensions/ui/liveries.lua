---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UI livery editor (paint/decals) orchestrator. It relies on the editor API `editor_api_dynamicDecals`: on opening it stores the player vehicle's current skin, enables the `dynamicTextures` skin, prepares the layer stack (blank livery in the vehicle's color or existing save) and starts the camera. On closing it restores the original skin.
--- Access: extension `ui_liveries`: `extensions.load("ui_liveries")`, then the global `ui_liveries`
---@class ui_liveries
---@field dependencies table<integer, string> editor_api_dynamicDecals, ui_liveries_camera, ui_liveries_fill, ui_liveries_saves.
ui_liveries = {}

--- Returns whether the livery editor is active.
---Source: lua/ge/extensions/ui/liveries.lua:115
---@return boolean  true between setup and teardown.
function ui_liveries.isRunning() end

--- Hook called every frame by the extension system; calls api.onUpdate_() while the editor is running.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/liveries.lua:107
---@param dtReal number Real time delta (s).
---@param dtSim number Simulated time delta (s).
---@param dtRaw number Raw time delta (s).
function ui_liveries.onUpdate(dtReal, dtSim, dtRaw) end

--- Starts the livery editor on the player vehicle (dynamicTextures skin, layers, history cleared, camera).
---Source: lua/ge/extensions/ui/liveries.lua:60
---@param saveName string|nil Name of a save to load; nil = blank livery in the vehicle's color.
---@return boolean  true if the layer stack was initialized correctly.
function ui_liveries.setup(saveName) end

--- Stops the editor: camera, API deactivation, restoring the previous skin and cleaning up the fill. No effect if not started.
---Source: lua/ge/extensions/ui/liveries.lua:90
---@return nil
function ui_liveries.teardown() end


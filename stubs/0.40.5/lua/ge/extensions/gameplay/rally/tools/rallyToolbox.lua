---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rally debug tools. Fields: rallyManager, race, recce, debugLogging, debug (drawing options), vehiclePlacementActive, vehiclePlacementMessage, selectedPrefabId, _vpCache, as well as imgui IntPtrs for the audio delays (cornerGapMsPtr, phraseGapMsPtr, linkWordGapMsPtr, pacenoteGapMsPtr) and for recovery (rallyRecoveryCorridorWidthPtr = 8, rallyRecoveryBackoffDistancePtr = 3).
---@class gameplay_rally_tools_rallyToolbox
local gameplay_rally_tools_rallyToolbox = {}

--- Cancels the vehicle placement.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:386
function gameplay_rally_tools_rallyToolbox:_cancelVehiclePlacement() end

--- Clears the local cache of the voicepack selector entries.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:117
function gameplay_rally_tools_rallyToolbox:_invalidateVoicepackCache() end

--- Teleports player vehicle 0 to the given position keeping its orientation (spawn.safeTeleport, protected by pcall).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:391
---@param pos vec3 World position.
---@return boolean  true if successful.
---@return string|nil  Cause of the failure.
function gameplay_rally_tools_rallyToolbox:_placeVehicleAt(pos) end

--- Spawns a prefab in MissionGroup (position 0 0 0) and selects it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:489
---@param filepath string Path of the .prefab or .prefab.json file.
---@param ownerMissionId string|nil Mission id used to name the object; defaults to the manager's mission.
function gameplay_rally_tools_rallyToolbox:_spawnPrefab(filepath, ownerMissionId) end

--- Enables the vehicle placement mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:381
function gameplay_rally_tools_rallyToolbox:_startVehiclePlacement() end

--- Each frame in placement mode: draws a sphere at the point under the mouse (cameraMouseRayCast) and handles left click (place) and right click (cancel).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:414
function gameplay_rally_tools_rallyToolbox:_updateVehiclePlacementMode() end

--- Forgets the displayed recce points (self.recce = nil).
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:1076
function gameplay_rally_tools_rallyToolbox:clearReccePoints() end

--- Draws the whole window (to be called inside an im.Begin/im.End): mission header, reload buttons and sections.
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:644
function gameplay_rally_tools_rallyToolbox:draw() end

--- 3D debug drawing according to self.debug: race path and segments, splits, start and finish lines, stop zone, pacenotes, driveline route, vehicle tracking, etc. Also handles the vehicle placement mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:1195
function gameplay_rally_tools_rallyToolbox:drawDebug() end

--- "Rally Loop" section: state of the gameplay_rallyLoop extension, Load, Unload and Toggle Loop Debug Window buttons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:255
function gameplay_rally_tools_rallyToolbox:drawLoopTools() end

--- "Prefabs" section: spawn buttons for the mission's prefabs and those of the loops that contain it, and deletion.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:562
function gameplay_rally_tools_rallyToolbox:drawPrefabTools() end

--- "Recovery" section: corridor width and backoff distance, checkboxes (repair the vehicle, tracking markers) and "Run Recovery" button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:287
---@param rm table RallyManager.
function gameplay_rally_tools_rallyToolbox:drawRallyRecoveryTools(rm) end

--- "Vehicle" section with a Place Vehicle / Cancel button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:444
function gameplay_rally_tools_rallyToolbox:drawVehicleTools() end

--- Voicepack dropdown with entry cache; changing the voicepack clears the recce points and calls rm:reloadVoicepackAssets(pick, {writeSettings = false}). Refresh button to invalidate the caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:150
---@param rm table RallyManager.
function gameplay_rally_tools_rallyToolbox:drawVoicepackPicker(rm) end

--- Debug log state.
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:137
---@return boolean  debugLogging.
function gameplay_rally_tools_rallyToolbox:getDebugLogging() end

--- Current race object of gameplay_rally (if the extension is loaded), coloring the path segments for debug.
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:216
---@return table|nil  Race.
function gameplay_rally_tools_rallyToolbox:getRace() end

--- Bound manager, otherwise that of gameplay_rally.getRallyManager().
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:129
---@return table|nil  RallyManager.
function gameplay_rally_tools_rallyToolbox:getRallyManager() end

--- Constructor: initializes all the state fields and the default drawing options.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:41
function gameplay_rally_tools_rallyToolbox:init() end

--- Enables or disables debug logging.
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:125
---@param debugLogging boolean New value.
function gameplay_rally_tools_rallyToolbox:setDebugLogging(debugLogging) end

--- Enables or disables the driveline route's "mouse as vehicle" mode (the position under the mouse is used as the vehicle position).
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:240
---@param enabled boolean true to enable.
function gameplay_rally_tools_rallyToolbox:setMouseAsVehicleEnabled(enabled) end

--- Binds the window to a RallyManager and invalidates the voicepack selector cache.
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:107
---@param rallyManager table|nil RallyManager.
function gameplay_rally_tools_rallyToolbox:setRallyManager(rallyManager) end

--- Toggles the "mouse as vehicle" mode.
---Source: lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua:251
function gameplay_rally_tools_rallyToolbox:toggleMouseMovementCheckbox() end


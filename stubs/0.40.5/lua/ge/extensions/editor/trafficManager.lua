---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/trafficManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor "Traffic Manager": lets you compose a traffic session (vehicles and props placed on the map, traffic lights, signs), start/stop the simulation (AI of unlocked vehicles, signals), then save the session as JSON with an associated prefab. Windows: main (trafficEditMode edit mode), "Traffic Vehicles & Props", "Traffic Lights", "Traffic Signs" and "Options". Created objects are stored in the "TrafficSession" SimGroup. A modder uses it through the editor menu; the public Lua API is limited to loading/saving a session, reading the data and the simulation.
--- Access: extension `editor_trafficManager`: `extensions.load("editor_trafficManager")`, then the global `editor_trafficManager`
---@class editor_trafficManager
---@field assertLevel boolean True by default: loadSession compares the file's level with the current level and asks for confirmation if they differ.
---@field debugMode boolean False by default: enables debug drawing (AI target, box under the vehicle) even for active vehicles; copied from the loaded file.
editor_trafficManager = {}

--- Stops the simulation: disables the AI of unlocked vehicles and the signals, sets session.play to false.
---Source: lua/ge/extensions/editor/trafficManager.lua:603
---@return boolean  False if no session exists, true otherwise.
function editor_trafficManager.disableSimulation() end

--- Starts the simulation: enables the AI of all unlocked vehicles and the signals, reloads the collision if the editor is modified, sets session.play to true.
---Source: lua/ge/extensions/editor/trafficManager.lua:586
---@return boolean  False if no session exists, true otherwise.
function editor_trafficManager.enableSimulation() end

--- Returns the current session table (vehicles, lights, signs, name, author, play...), not copied.
---Source: lua/ge/extensions/editor/trafficManager.lua:2305
---@return table|nil  Session, nil until it is created.
function editor_trafficManager.getSessionData() end

--- Loads a session from a JSON file: resets the session, restores options and metadata, loads the associated prefab if it exists then recreates vehicles and signals. Without an argument, resumes the remembered file after a level confirmation request (and disables assertLevel). Failure notification if the file is unreadable.
---Source: lua/ge/extensions/editor/trafficManager.lua:2088
---@param filePath string|nil Path of the .json file (or .prefab.json, converted).
function editor_trafficManager.loadSession(filePath) end

--- Hook after Lua reload; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficManager.lua:2554
---@param data table Value of onSerialize.
function editor_trafficManager.onDeserialized(data) end

--- Editor frame hook: draws the Traffic Manager windows (only when the current edit mode is Traffic Manager) and the debug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficManager.lua:2341
function editor_trafficManager.onEditorGui() end

--- Editor initialization hook: creates the trafficEditMode edit mode (shortcuts click, Shift+click move, Alt) and registers the windows.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficManager.lua:2566
function editor_trafficManager.onEditorInitialized() end

--- Hook before Lua reload; returns an empty table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficManager.lua:2549
---@return table  Empty table.
function editor_trafficManager.onSerialize() end

--- Update hook: if the SimGroup has disappeared, resets the session; otherwise stores the vehicles that appeared in the SimGroup, updates the statistics and a 0.25 s timer.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficManager.lua:2423
---@param dt number Real-time delta (s).
---@param dtSim number Simulation time delta (s).
function editor_trafficManager.onUpdate(dt, dtSim) end

--- Hook called when a vehicle is reset: recreates its session data (statistics reset to zero).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficManager.lua:2526
---@param vehId integer Vehicle identifier.
function editor_trafficManager.onVehicleResetted(vehId) end

--- Hook called when a vehicle spawns: if the vehicles or signs window is active, creates the SimGroup if needed and queues the vehicle to be added to the session on the next frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficManager.lua:2513
---@param vehId integer Vehicle identifier.
function editor_trafficManager.onVehicleSpawned(vehId) end

--- Menu hook: creates the session and checks the SimGroup if needed, clears the selection and shows the main window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/trafficManager.lua:2557
function editor_trafficManager.onWindowMenuItem() end

--- Saves the session to a JSON file and a prefab of the same name. No effect without a path.
---Source: lua/ge/extensions/editor/trafficManager.lua:2212
---@param filePath string Path of the .json file (or .prefab.json, converted).
function editor_trafficManager.saveSession(filePath) end


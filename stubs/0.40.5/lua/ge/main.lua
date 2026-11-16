---@meta
-- tim19Atlas stub generated from lua/ge/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Called by the C++ when the CEF input field loses focus; relays the UI event 'CEFTypingLostFocus'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1264
function CEFTypingLostFocus() end

--- Empty global callback for the imgui console; an extension can redefine it to receive the input.
---Source: lua/ge/main.lua:80
function ConsoleInputCallback() end

--- Once per session: reads Engine.Platform.getFSInfo(); if an error is reported, displays an error toast in the UI and logs an installation corruption message.
---Source: lua/ge/main.lua:923
function checkFSErrors() end

--- Called at the end/unloading of the level. Emits onClientPreEndMission, stops the physics simulation (be:physicsStopSimulation), removes the time pause, then emits onClientEndMission(levelPath).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:839
---@param levelPath string level path
function clientEndMission(levelPath) end

--- Called when the level and the vehicles are loaded (after clientPreStartMission). Sets the default 'freeroam' game state (core_gamestate) then emits onClientPostStartMission(levelPath).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:819
---@param levelPath string level path
function clientPostStartMission(levelPath) end

--- Called by the engine before the level resources are loaded. Sets worldReadyState=0, records the action, emits onClientPreStartMission(levelPath) and the UI event 'PreStartMission'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:809
---@param levelPath string level path
function clientPreStartMission(levelPath) end

--- Called when the level objects are loaded (after clientPostStartMission). Stops the menu music (except keepAlive), emits onClientStartMission(levelPath) via hookNotify, then map.assureLoad() and empties the Sim cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:826
---@param levelPath string level path
function clientStartMission(levelPath) end

--- Dev tool: runs TorqueScript scripts (.cs), detects the created objects and saves them in the new JSON format via a PersistenceManager, then deletes the objects (except SimSet/SimGroup).
---Source: lua/ge/main.lua:176
---@param filenames table<integer, string> .cs scripts to convert
---@param newExtSuffix string not used in the function body
function convertCStoJson(filenames, newExtSuffix) end

--- Dev tool: finds all *.prefab / *.prefab.json under levelPath and calls convertPrefabtoJson on each.
---Source: lua/ge/main.lua:145
---@param levelPath string level folder
function convertLevelPrefabs(levelPath) end

--- Dev tool: loads a .prefab (TorqueScript) prefab at the origin, saves it as .prefab.json then unloads and deletes it.
---Source: lua/ge/main.lua:130
---@param filepath string path of the .prefab file
function convertPrefabtoJson(filepath) end

--- Called by the engine when the editor is enabled/disabled (and on the first frame). Emits onEditorEnabled(enabled) and informs map via map.setEditorState.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:863
---@param enabled boolean editor state
function editorEnabled(enabled) end

--- Enables the communityTranslations setting then launches updateTranslations().
---Source: lua/ge/main.lua:1319
function enableCommunityTranslations() end

--- Disconnects from the local server (serverConnection.disconnect, asynchronous state machine) then, in the callback, unloads all non-manual extensions and calls callback.
---Source: lua/ge/main.lua:456
---@param callback function|nil called once the mode has finished
function endActiveGameMode(callback) end

--- Before a Lua reload: serializes the extensions' packages (serializePackages), levelLoaded and the music source id into be.persistenceLuaData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1268
function exportPersistentData() end

--- Backward compatibility: returns the global gameConnection, which is nil (no longer a scene object).
---Source: lua/ge/main.lua:83
---@return nil  always nil in this file
function getGame() end

--- Inverse of exportPersistentData, called at the end of init(). On a deserialization error, logs and writes persistentDataError.txt.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1278
function importPersistentData() end

--- Initializes the GE VM at startup and on reload (Ctrl+L): initSettings, reserves _tr, enables detectGlobalWrites, loads the startup extensions (+ util_materialHotReload on Windows), opens the online session, importPersistentData, requests the UI state (guihooks 'isUIReady'), calls core_modmanager.onUiReady(), map.assureLoad(), creates the mods and trackEditor folders, then luaReady=true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1044
---@param reason string 'startup' or 'reload'; copied into the global luaVmStartReason
function init(reason) end

--- Lets the UI know whether init() has finished.
---Source: lua/ge/main.lua:1039
---@return boolean  true once init() has run to completion
function isLuaReady() end

--- Indicates whether the game was launched with the command-line argument -safemode.
---Source: lua/ge/main.lua:126
---@return integer|nil  key found in the arguments (truthy) or nil
function isSafeMode() end

--- Recursively loads the materials of a folder: first *materials.cs (TorqueScript), then *materials.json, then *datablocks.json.
---Source: lua/ge/main.lua:1393
---@param dir string folder to walk
function loadDirRec(dir) end

--- OBSOLETE: unloadAutoExtensions() + loadPresetExtensions() + extensions.load(...) with error logging.
---Source: lua/ge/main.lua:1627
---@param ... any extensions to load in addition
function loadGameModeModules(...) end

--- Loads all extensions in unloadMode 'manual'.
---Source: lua/ge/main.lua:405
function loadManualUnloadExtensions() end

--- Loads the presetExtensions list (+ those requested on the command line via queueCmdlineLevelLoadExtension), then empties this command-line list (single use).
---Source: lua/ge/main.lua:415
function loadPresetExtensions() end

--- Dev test: spawnPrefab of test_v2.prefab.json via spawnPrefab.
---Source: lua/ge/main.lua:1808
function load_spawn_prefabv2_indirect() end

--- Dev test: spawns the prefab /levels/smallgrid/test_v1.prefab.json.
---Source: lua/ge/main.lua:1717
function load_test_prefabv1() end

--- Dev test: loads /levels/smallgrid/test_v2.prefab.json as PrefabV2 'test_v2'.
---Source: lua/ge/main.lua:1724
function load_test_prefabv2() end

--- Global replacement of log: forwards all arguments to Lua:log (level 'D','I','W','E','A', origin, message).
---Source: lua/ge/main.lua:30
---@param ... any level, tag, message
function log(...) end

--- Called every frame by the engine, just before rendering and after the physics. Order: map.updateGFX, onPreRender(dtReal, dtSim, dtRaw) hook, onDrawDebug(Lua.lastDebugFocusPos, dtReal, dtSim, dtRaw) hook, then, if worldReadyState==1, waits for the player vehicle's materials to be ready (max 5 s) to dismiss the loading screen, set worldReadyState to 2 and emit onWorldReadyState(2).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:878
---@param dtReal number real time delta (s)
---@param dtSim number simulation time delta (s)
---@param dtRaw number raw time delta (s)
function luaPreRender(dtReal, dtSim, dtRaw) end

--- A vehicle's AI mode has changed; emits onAiModeChange.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1221
---@param vehicleID integer vehicle id
---@param newAiMode string new AI mode (inferred from the name)
function onAiModeChange(vehicleID, newAiMode) end

--- The AI has finished its route; emits onAiRouteDone(vehicleID).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1225
---@param vehicleID integer vehicle id
function onAiRouteDone(vehicleID) end

--- Default callback function name of the BeamNGTrigger on the C++ side; emits the onBeamNGTrigger(data) hook.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1122
---@param data table trigger data (structure provided by the C++)
function onBeamNGTrigger(data) end

--- Called by the engine when a vehicle crosses a BeamNG waypoint (scene object). Calls map.onWaypoint then emits onBeamNGWaypoint(args).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1116
---@param args table waypoint data (structure provided by the C++)
function onBeamNGWaypoint(args) end

--- A coupler attached; emits onCouplerAttached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1208
---@param objId1 integer vehicle 1
---@param objId2 integer vehicle 2
---@param nodeId integer coupler node of vehicle 1
---@param obj2nodeId integer coupler node of vehicle 2
function onCouplerAttached(objId1, objId2, nodeId, obj2nodeId) end

--- Triggered when the user deliberately detaches a trailer's coupler; emits onCouplerDetach(objId, nodeId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1217
---@param objId integer vehicle id
---@param nodeId integer coupler node
function onCouplerDetach(objId, nodeId) end

--- A coupler detached; emits onCouplerDetached.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1212
---@param objId1 integer vehicle 1
---@param objId2 integer vehicle 2
---@param nodeId integer node of vehicle 1
---@param obj2nodeId integer node of vehicle 2
---@param breakForce number breaking force (inferred from the name)
function onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce) end

--- Called directly by the C++ on exit: emits onExit, disconnects the server, destroys PhysicsPlugin, posts the 'onExit' event of the MainEventManager, then settings.exit().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1456
function onExit() end

--- Called by the engine when watched files change. Calls settings.onFilesChanged and map.onFilesChanged, emits onFilesChanged(files), then for each file onFileChanged(filename, type), finally onFileChangedEnd.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1126
---@param files table list of entries {filename, type}
function onFileChanged(files) end

--- Called once by the engine at VM startup: creates the settings/ and screenshots/ folders, the 'MainEventManager' EventManager, parses the command line, initializes the core and the client (client/core, client/init), PhysicsPlugin, then loads the $levelToLoad level if any via core_loadMapCmd (deferred until the mod manager is ready).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1493
function onGameEngineStartup() end

--- Called by the physics engine when a vehicle is unstable: logs the nearby vehicles (< 1 m), displays a UI message, emits onInstabilityDetected(vid, returnData), then, if not handled, puts the vehicle in ghost mode and teleports it in place; a 2nd instability within the second deletes the vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1328
---@param vid integer id of the unstable vehicle
function onInstabilityDetected(vid) end

--- Logs the total reload duration and clears luaReloadStartTime. Called by tryCompleteLuaReload when jobs, settings, UI, mod manager (and MCP) are ready.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1589
function onLuaReloadCompleted() end

--- Signals that the mod manager has finished after a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1585
function onLuaReloadModManagerCompleted() end

--- Called after a Lua reload (Ctrl+L): client/core reloadCore, client/init reloadClient, measures the duration and arms the reload-completion tracking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1573
---@param reloadStartTime number os.clockhp() at the start of the reload (s)
function onLuaReloaded(reloadStartTime) end

--- Called when the cursor is locked/unlocked; emits onMouseLocked(locked).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1196
---@param locked boolean lock state
function onMouseLocked(locked) end

--- Called before the game exits; emits onPreExit (profiled).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1448
function onPreExit() end

--- Entry point called by the engine before onGameEngineStartup; empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1440
function onPreStart() end

--- Called before the window closes; emits onPreWindowClose.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1444
function onPreWindowClose() end

--- The virtual keyboard is closed; emits onScreenKeyboardClosed(applied, text).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1324
---@param applied boolean input confirmed
---@param text string text entered
function onScreenKeyboardClosed(applied, text) end

--- Asynchronous callback when a vehicle's node cluster is teleported; emits onSetClusterPosRelRot(vehicleID, cNodeId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1181
---@param vehicleID integer vehicle id
---@param cNodeId integer cluster node id
function onSetClusterPosRelRot(vehicleID, cNodeId) end

--- Vehicle creation error: logs and displays an error toast in the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1374
---@param status any error code
---@param jbeamFilename string vehicle concerned
function onSpawnError(status, jbeamFilename) end

--- A drawn texture is compressed; emits onTexDrawPrimCompressDone(textureName).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1594
---@param textureName string texture name
function onTexDrawPrimCompressDone(textureName) end

--- Forwards to render_openxr.errorDetected if this module exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1238
---@param ... any error details
function openXRErrorDetected(...) end

--- Forwards to render_openxr.stateChanged if this module exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1233
---@param state any OpenXR state
function openXRStateChanged(state) end

--- Relays a physics engine event: onPhysicsEngineEvent hook. Only the first argument is passed on (see notes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1139
---@param ... any event arguments
function physicsEngineEvent(...) end

--- The physics simulation is paused/resumed. Relays the UI event 'physicsStateChanged' then emits onPhysicsUnpaused (val true) or onPhysicsPaused.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1296
---@param val boolean true if the physics is running
function physicsStateChanged(val) end

--- If PlatformSwitches.useEditor is true, adds editor_main and editor_veMain to the startup extension list; recomputes the list of manual-unload extensions. Called by init().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:393
function prepareStartupExtensionsList() end

--- Global replacement of print: writes via log('A','print', tostring(...)). Only the first argument is converted and logged.
---Source: lua/ge/main.lua:34
---@param ... any values to display
function print(...) end

--- Adds an extension to load at the next loadPresetExtensions (used for extensions requested on the command line).
---Source: lua/ge/main.lua:469
---@param extension string extension name
function queueCmdlineLevelLoadExtension(extension) end

--- Reads the current route from ui_router.getCurrent() and calls setMainMenuMusicRouteState.
---Source: lua/ge/main.lua:801
function refreshMainMenuMusicRouteState() end

--- OBSOLETE: equivalent to setExtensionUnloadMode(name, 'manual').
---Source: lua/ge/main.lua:1639
---@param extensionName string Lua path or extension name
function registerCoreModule(extensionName) end

--- Called by the replay engine to recreate a vehicle at (0,0,0); the player is installed in it only if they do not have a vehicle yet. If there is only one enterable vehicle, switches to the game camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1244
---@param jbeamFilename string vehicle
---@param partConfigData table parts configuration
---@return table|nil  created vehicle object
function replaySpawnVehicle(jbeamFilename, partConfigData) end

--- Called by the replay: core_replay.startLevel(levelPath).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1256
---@param levelPath string level to load
function replayStartLevel(levelPath) end

--- Forwards to core_replay.stateChanged(...).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1229
---@param ... any engine arguments
function replayStateChanged(...) end

--- Called by the C++ when a performance log is wanted: creates a LuaProfiler for the next frame (update + luaPreRender), enabled in the extensions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:873
function requestGeluaProfile() end

--- Emits onResetGameplay(playerID).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1379
---@param playerID integer player concerned
function resetGameplay(playerID) end

--- Leaves the active game mode (endActiveGameMode) and requests the default game state (main menu). The callback is called when the level is unloaded and a new one can be loaded.
---Source: lua/ge/main.lua:848
---@param callback function|nil called once the level is unloaded
function returnToMainMenu(callback) end

--- Debug: calls Engine.Debug.mimalloc_test().
---Source: lua/ge/main.lua:859
function runMimalloc_test() end

--- Sends to the UI ('onUIBootstrap' event) the list of the folders in /ui/modModules/; empty list on error.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1383
function sendUIModules() end

--- Defines whether an extension survives level changes ('manual') or can be unloaded automatically ('auto', default). Logs an error if the extension or the mode is unknown.
---Source: lua/ge/main.lua:425
---@param extension table|string module M (its __extensionName__ is read) or extension name
---@param unloadMode string 'manual' or 'auto'
function setExtensionUnloadMode(extension, unloadMode) end

--- Forces the main menu music to continue (true) or hands control back to the per-UI-route logic (false). Does nothing if the state does not change.
---Source: lua/ge/main.lua:704
---@param active boolean true to keep the music
function setMainMenuMusicKeepAlive(active) end

--- Registers or removes a menu music pause request identified by requestId, then refreshes the state.
---Source: lua/ge/main.lua:715
---@param requestId string non-empty identifier
---@param active boolean true to request the pause
---@return boolean  false if requestId is invalid, otherwise true
function setMainMenuMusicPauseRequest(requestId, active) end

--- Applies the music logic according to the UI route: requested pause > keepAlive > 'menu' route (resume) > level loaded (stop with 0.6 s fade) > 'menu.credits' route (ui_credits extension) > 'menu.uiSounds' route (pause) > resume.
---Source: lua/ge/main.lua:757
---@param routeName string|nil name of the current UI route
function setMainMenuMusicRouteState(routeName) end

--- Dev test: builds SimGroup and TSStatic objects in MissionGroup then deletes thePlayer, spawn_default, ParticleEmitter.
---Source: lua/ge/main.lua:1649
function test_prefabv2() end

--- Dev test: instantiates 'test_v2' at (6,3,2), scale 1.5, 45° rotation around Z.
---Source: lua/ge/main.lua:1743
function test_spawn_prefabv2() end

--- Dev test: instantiates count random copies of 'test_v2' in MissionGroup.
---Source: lua/ge/main.lua:1770
---@param count integer|nil number of instances (1000 by default)
function test_spawn_prefabv2_massive(count) end

--- Dev test: deletes the object 'test_v2'.
---Source: lua/ge/main.lua:1800
function test_unload_prefabv2() end

--- Called when the UI is ready. Emits onUiReady and marks the UI as ready for the finalization of a Lua reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1032
function uiReady() end

--- Unloads all extensions except those in 'manual' mode (extensions.unloadExcept). Call when changing game mode/level.
---Source: lua/ge/main.lua:410
function unloadAutoExtensions() end

--- Called every frame by the engine, after the inputs and before the physics. See notes: settingsTick, core_input_bindings.updateGFX, simTimeAuthority.update, onUpdate(dtReal, dtSim, dtRaw) hook, handling of unstable vehicles, and if the UI must be refreshed onGuiUpdate hook + sending of the guihooks streams.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:991
---@param dtReal number real time delta (s)
---@param dtSim number simulation time delta (s)
---@param dtRaw number raw time delta (s)
function update(dtReal, dtSim, dtRaw) end

--- Called by the engine on the first frame. Emits onFirstUpdate, settings.finalizeInit(), synchronizes the editor state, processes the first-frame command-line arguments (-flowgraph, -compilemeshes, -convertCSMaterials, -deps, -disableDynamicCollision, -enablemcp, etc.) and calls uiReady() directly with -noui or in headless mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:973
function updateFirstFrame() end

--- Updates the UI loading bar ('UpdateProgress' event) and forces a Canvas repaint while a level is loading; stores $lastProgress and $$lastProgressTxt.
---Source: lua/ge/main.lua:1598
---@param val number progress between 0 and 1
---@param txt string displayed text
function updateLoadingProgress(val, txt) end

--- Uses updateTSShapeLoadProgress if defined (editor loaded), otherwise updateLoadingProgress.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1615
---@param progress number progress
---@param msg string text
function updateTSShapeLoadProgressDynamic(progress, msg) end

--- Unmounts mods/translations.zip if mounted, downloads locales_v2.zip via core_repository.installMod, then reloads the settings.
---Source: lua/ge/main.lua:1305
function updateTranslations() end

--- Dev tool: calls validatePrefabJson on each *.prefab.json of levelPath.
---Source: lua/ge/main.lua:168
---@param levelPath string level folder
function validateLevelPrefabs(levelPath) end

--- Dev tool: reloads a .prefab.json and saves it again in the same place (format normalization).
---Source: lua/ge/main.lua:153
---@param filepath string path of the .prefab.json
function validatePrefabJson(filepath) end

--- Called when a vehicle is activated/deactivated (e.g. traffic pooling). Unrelated to the player's vehicle switch. Emits onVehicleActiveChanged.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1192
---@param vehicleID integer vehicle id
---@param active boolean new state
---@param setActiveCount any passed as is (inferred from code)
function vehicleActiveChanged(vehicleID, active, setActiveCount) end

--- Called when a vehicle is deleted: forgets its instability timers, emits onVehicleDestroyed(vid), invalidates the vehicle caches.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1200
---@param vid integer vehicle id
function vehicleDestroyed(vid) end

--- Asynchronous callback after a vehicle reset; emits onVehicleResetted(vehicleID).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1186
---@param vehicleID integer vehicle id
function vehicleReset(vehicleID) end

--- Called by the engine when a vehicle appears. Invalidates the vehicle caches, sets the vehicle's gravity (core_environment.getGravity), then emits onPreVehicleSpawned(vid, veh) then onVehicleSpawned(vid, veh). Does nothing if the object does not exist.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1144
---@param vid integer vehicle object id
function vehicleSpawned(vid) end

--- Called when the player switches vehicle. Emits onVehicleSwitched(oldId, newId, player) (id -1 if absent) and the UI event 'VehicleFocusChanged'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/main.lua:1166
---@param oldVehicle table|nil old vehicle object
---@param newVehicle table|nil new vehicle object
---@param player integer player index
function vehicleSwitched(oldVehicle, newVehicle, player) end

---@type table
MoveManager = nil
---@type vec3
Point3F = nil
---@type any
WinInput = nil
---@type any
bullettime = nil
---@type any
commands = nil
---@type any
doStartupProfiling = nil
---@type table
editor = nil
---@type any
extensions = nil
---@type any
guihooks = nil
---@type any
json = nil
---@type any
logAlways = nil
---@type any
map = nil
---@type any
parseArgs = nil
---@type any
perf = nil
---@type boolean
photoModeOpen = nil
---@type any
sailingTheHighSeas = nil
---@type any
screenshot = nil
---@type any
server = nil
---@type any
serverConnection = nil
---@type any
setSpawnpoint = nil
---@type any
settings = nil
---@type any
simTimeAuthority = nil
---@type any
spawn = nil
---@type string
vmType = nil
---@type any
worldReadyState = nil

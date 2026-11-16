# `main`

*File: `lua/ge/main.lua` · VM: Game Engine (GE) · 1814 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("main")`

Entry point of the "Game Engine" Lua VM (GE, vmType = 'game'). The C++ engine loads this file at startup then calls its global functions (onGameEngineStartup, init, update, luaPreRender, clientPreStartMission, vehicleSpawned, onExit…). Each one generally relays the event to the extensions via extensions.hook('onXxx', ...). A modder almost never calls these functions: they listen to the corresponding hooks in their extension (onUpdate, onPreRender, onClientStartMission, onVehicleSpawned…). They do use setExtensionUnloadMode, loadPresetExtensions, unloadAutoExtensions, returnToMainMenu and endActiveGameMode, however.

## Example

```lua
-- GE extension (lua/ge/extensions/monmod.lua)
local M = {}
local function onInit() setExtensionUnloadMode(M, 'manual') end -- survives level changes
local function onUpdate(dtReal, dtSim, dtRaw) end -- called from update() in main.lua
local function onPreRender(dtReal, dtSim, dtRaw) end -- called from luaPreRender()
local function onVehicleSpawned(vid, veh) end
M.onInit, M.onUpdate, M.onPreRender, M.onVehicleSpawned = onInit, onUpdate, onPreRender, onVehicleSpawned
return M
```

## Notes

- File load order (top-level): vmType='game', package.path, require luaCore and common/cdefs, definition of log/print (log -> Lua:log, print -> log('A','print',...)), then mathlib, utils, devUtils, ge_utils, luaProfiler, StackTracePlus (replaces debug.traceback), then the global modules below.
- Modules loaded and exposed as globals by main.lua: Point3F (= vec3), json, guihooks, screenshot, simTimeAuthority (backward-compatible alias bullettime), WinInput (= Input), extensions (paths lua/ge/extensions/ and lua/common/extensions/), map, settings (= extensions.core_settings_settings), perf (utils/perf), spawn, setSpawnpoint, serverConnection, server (server/server), commands (server/commands), editor (empty table; if PlatformSwitches.useEditor is false: editor.isEditorActive returns false and editor.toggleActive does nothing), parseArgs (client/parseArgs), MoveManager (empty table), sailingTheHighSeas, photoModeOpen=false, levelLoaded=nil, worldReadyState=-1, logAlways (= print), doStartupProfiling. gameConnection=nil (backward compatibility, getGame() returns it).
- Startup order: (1) file load; (2) C++ calls onPreStart() (empty) then onGameEngineStartup() which creates the settings/ and screenshots/ folders, the 'MainEventManager' EventManager, parseArgs.defaultParseArgs(), client/core initializeCore, client/init initClient, PhysicsPlugin.init, posts the 'onStart' event, then loads a level passed on the command line ($levelToLoad) via core_loadMapCmd; (3) init(reason) loads the startup extensions (startupExtensions); (4) on the first frame updateFirstFrame(); (5) the UI calls uiReady(). In the code read, the exact caller of init is not in this file: the comment says it is also called on reload (Ctrl+L), reason being 'startup' or 'reload'.
- Update loop: update(dtReal, dtSim, dtRaw) is called every frame after the inputs and before the physics. It does: menu music fade, settings.settingsTick, core_input_bindings.updateGFX(dtRaw), simTimeAuthority.update(dtReal), onUpdate hook, handling of unstable vehicles, then (only if be:getUpdateUIflag()) onGuiUpdate hook and sending of the UI streams (guihooks.sendStreams), perf.update(), tryCompleteLuaReload. luaPreRender(dtReal, dtSim, dtRaw) is called just before rendering and after the physics: map.updateGFX(dtReal, dtSim), onPreRender hook, onDrawDebug(Lua.lastDebugFocusPos, dtReal, dtSim, dtRaw) hook, then the end-of-loading detection (worldReadyState).
- Order when loading a level: clientPreStartMission (worldReadyState=0, onClientPreStartMission hook, UI 'PreStartMission') -> clientPostStartMission ('freeroam' game state by default, onClientPostStartMission hook) -> clientStartMission (onClientStartMission hook, then map.assureLoad()). worldReadyState goes to 1 (value set by code outside this file, not seen here); in luaPreRender, when player vehicle 0 has its materials ready (or after 5 s of cumulative dtRaw), the loading screen is dismissed, worldReadyState=2 and the onWorldReadyState(2) hook is emitted. At the end: clientEndMission emits onClientPreEndMission, stops the physics simulation, removes the pause then emits onClientEndMission.
- Units: dtReal, dtSim, dtRaw in seconds (dtSim is the simulated time, accounts for slow motion/pause; dtRaw is the raw time).
- Extensions: the startupExtensions are all in unloadMode 'manual' (never unloaded on level change). The presetExtensions (core_environment, core_weather, gameplay_traffic, gameplay_parking, core_groundMarkers…) are loaded by loadPresetExtensions() when setting up a game mode. The others are in 'auto' mode and unloaded by unloadAutoExtensions().
- Physics instability: onInstabilityDetected enables the vehicle's ghost mode and teleports it in place for 1 s (instabilityDetectionTime); a second instability during this delay deletes the vehicle. A hook onInstabilityDetected(vid, returnData) lets an extension handle the case itself by setting returnData.instabilityHandled = true.
- Bug/inconsistency: physicsEngineEvent(...) does "local args = unpack({...})": only the first value is kept and passed to the onPhysicsEngineEvent hook.
- Bug/inconsistency: onInstabilityDetected calls v:getJBeamFilename() before testing "if v"; if the vehicle no longer exists, the function crashes (the guard further down is useless).
- Bug/inconsistency: validatePrefabJson computes newPath without using it; loadModScriptsRec is local, never called in this file; handleCommandLineFirstFrame and loadRequiredExtension are local (inaccessible to extensions).
- Obsolete functions: loadGameModeModules and registerCoreModule log "OUTDATED MOD CODE" and are due to disappear; use unloadAutoExtensions()+loadPresetExtensions()+extensions.load(...) and setExtensionUnloadMode(M,'manual').
- Test/debug functions (test_prefabv2, load_test_prefabv1/2, test_spawn_prefabv2, test_spawn_prefabv2_massive, test_unload_prefabv2, load_spawn_prefabv2_indirect, runMimalloc_test, convert*/validate* prefab): development tools callable from the console.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `CEFTypingLostFocus()` | Called by the C++ when the CEF input field loses focus; relays the UI event 'CEFTypingLostFocus'. | 1264 |
| `ConsoleInputCallback()` | Empty global callback for the imgui console; an extension can redefine it to receive the input. | 80 |
| `checkFSErrors()` | Once per session: reads Engine.Platform.getFSInfo(); if an error is reported, displays an error toast in the UI and logs an installation corruption message. | 923 |
| `clientEndMission(levelPath)` | Called at the end/unloading of the level. Emits onClientPreEndMission, stops the physics simulation (be:physicsStopSimulation), removes the time pause, then emits onClientEndMission(levelPath). | 839 |
| `clientPostStartMission(levelPath)` | Called when the level and the vehicles are loaded (after clientPreStartMission). Sets the default 'freeroam' game state (core_gamestate) then emits onClientPostStartMission(levelPath). | 819 |
| `clientPreStartMission(levelPath)` | Called by the engine before the level resources are loaded. Sets worldReadyState=0, records the action, emits onClientPreStartMission(levelPath) and the UI event 'PreStartMission'. | 809 |
| `clientStartMission(levelPath)` | Called when the level objects are loaded (after clientPostStartMission). Stops the menu music (except keepAlive), emits onClientStartMission(levelPath) via hookNotify, then map.assureLoad() and empties the Sim cache. | 826 |
| `convertCStoJson(filenames, newExtSuffix)` | Dev tool: runs TorqueScript scripts (.cs), detects the created objects and saves them in the new JSON format via a PersistenceManager, then deletes the objects (except SimSet/SimGroup). | 176 |
| `convertLevelPrefabs(levelPath)` | Dev tool: finds all *.prefab / *.prefab.json under levelPath and calls convertPrefabtoJson on each. | 145 |
| `convertPrefabtoJson(filepath)` | Dev tool: loads a .prefab (TorqueScript) prefab at the origin, saves it as .prefab.json then unloads and deletes it. | 130 |
| `editorEnabled(enabled)` | Called by the engine when the editor is enabled/disabled (and on the first frame). Emits onEditorEnabled(enabled) and informs map via map.setEditorState. | 863 |
| `enableCommunityTranslations()` | Enables the communityTranslations setting then launches updateTranslations(). | 1319 |
| `endActiveGameMode(callback)` | Disconnects from the local server (serverConnection.disconnect, asynchronous state machine) then, in the callback, unloads all non-manual extensions and calls callback. | 456 |
| `exportPersistentData()` | Before a Lua reload: serializes the extensions' packages (serializePackages), levelLoaded and the music source id into be.persistenceLuaData. | 1268 |
| `getGame()` | Backward compatibility: returns the global gameConnection, which is nil (no longer a scene object). | 83 |
| `importPersistentData()` | Inverse of exportPersistentData, called at the end of init(). On a deserialization error, logs and writes persistentDataError.txt. | 1278 |
| `init(reason)` | Initializes the GE VM at startup and on reload (Ctrl+L): initSettings, reserves _tr, enables detectGlobalWrites, loads the startup extensions (+ util_materialHotReload on Windows), opens the online session, importPersistentData, requests the UI state (guihooks 'isUIReady'), calls core_modmanager.onUiReady(), map.assureLoad(), creates the mods and trackEditor folders, then luaReady=true. | 1044 |
| `isLuaReady()` | Lets the UI know whether init() has finished. | 1039 |
| `isSafeMode()` | Indicates whether the game was launched with the command-line argument -safemode. | 126 |
| `loadDirRec(dir)` | Recursively loads the materials of a folder: first *materials.cs (TorqueScript), then *materials.json, then *datablocks.json. | 1393 |
| `loadGameModeModules(...)` | OBSOLETE: unloadAutoExtensions() + loadPresetExtensions() + extensions.load(...) with error logging. | 1627 |
| `loadManualUnloadExtensions()` | Loads all extensions in unloadMode 'manual'. | 405 |
| `loadPresetExtensions()` | Loads the presetExtensions list (+ those requested on the command line via queueCmdlineLevelLoadExtension), then empties this command-line list (single use). | 415 |
| `load_spawn_prefabv2_indirect()` | Dev test: spawnPrefab of test_v2.prefab.json via spawnPrefab. | 1808 |
| `load_test_prefabv1()` | Dev test: spawns the prefab /levels/smallgrid/test_v1.prefab.json. | 1717 |
| `load_test_prefabv2()` | Dev test: loads /levels/smallgrid/test_v2.prefab.json as PrefabV2 'test_v2'. | 1724 |
| `log(...)` | Global replacement of log: forwards all arguments to Lua:log (level 'D','I','W','E','A', origin, message). | 30 |
| `luaPreRender(dtReal, dtSim, dtRaw)` | Called every frame by the engine, just before rendering and after the physics. Order: map.updateGFX, onPreRender(dtReal, dtSim, dtRaw) hook, onDrawDebug(Lua.lastDebugFocusPos, dtReal, dtSim, dtRaw) hook, then, if worldReadyState==1, waits for the player vehicle's materials to be ready (max 5 s) to dismiss the loading screen, set worldReadyState to 2 and emit onWorldReadyState(2). | 878 |
| `onAiModeChange(vehicleID, newAiMode)` | A vehicle's AI mode has changed; emits onAiModeChange. | 1221 |
| `onAiRouteDone(vehicleID)` | The AI has finished its route; emits onAiRouteDone(vehicleID). | 1225 |
| `onBeamNGTrigger(data)` | Default callback function name of the BeamNGTrigger on the C++ side; emits the onBeamNGTrigger(data) hook. | 1122 |
| `onBeamNGWaypoint(args)` | Called by the engine when a vehicle crosses a BeamNG waypoint (scene object). Calls map.onWaypoint then emits onBeamNGWaypoint(args). | 1116 |
| `onCouplerAttached(objId1, objId2, nodeId, obj2nodeId)` | A coupler attached; emits onCouplerAttached. | 1208 |
| `onCouplerDetach(objId, nodeId)` | Triggered when the user deliberately detaches a trailer's coupler; emits onCouplerDetach(objId, nodeId). | 1217 |
| `onCouplerDetached(objId1, objId2, nodeId, obj2nodeId, breakForce)` | A coupler detached; emits onCouplerDetached. | 1212 |
| `onExit()` | Called directly by the C++ on exit: emits onExit, disconnects the server, destroys PhysicsPlugin, posts the 'onExit' event of the MainEventManager, then settings.exit(). | 1456 |
| `onFileChanged(files)` | Called by the engine when watched files change. Calls settings.onFilesChanged and map.onFilesChanged, emits onFilesChanged(files), then for each file onFileChanged(filename, type), finally onFileChangedEnd. | 1126 |
| `onGameEngineStartup()` | Called once by the engine at VM startup: creates the settings/ and screenshots/ folders, the 'MainEventManager' EventManager, parses the command line, initializes the core and the client (client/core, client/init), PhysicsPlugin, then loads the $levelToLoad level if any via core_loadMapCmd (deferred until the mod manager is ready). | 1493 |
| `onInstabilityDetected(vid)` | Called by the physics engine when a vehicle is unstable: logs the nearby vehicles (< 1 m), displays a UI message, emits onInstabilityDetected(vid, returnData), then, if not handled, puts the vehicle in ghost mode and teleports it in place; a 2nd instability within the second deletes the vehicle. | 1328 |
| `onLuaReloadCompleted()` | Logs the total reload duration and clears luaReloadStartTime. Called by tryCompleteLuaReload when jobs, settings, UI, mod manager (and MCP) are ready. | 1589 |
| `onLuaReloadModManagerCompleted()` | Signals that the mod manager has finished after a Lua reload. | 1585 |
| `onLuaReloaded(reloadStartTime)` | Called after a Lua reload (Ctrl+L): client/core reloadCore, client/init reloadClient, measures the duration and arms the reload-completion tracking. | 1573 |
| `onMouseLocked(locked)` | Called when the cursor is locked/unlocked; emits onMouseLocked(locked). | 1196 |
| `onPreExit()` | Called before the game exits; emits onPreExit (profiled). | 1448 |
| `onPreStart()` | Entry point called by the engine before onGameEngineStartup; empty body. | 1440 |
| `onPreWindowClose()` | Called before the window closes; emits onPreWindowClose. | 1444 |
| `onScreenKeyboardClosed(applied, text)` | The virtual keyboard is closed; emits onScreenKeyboardClosed(applied, text). | 1324 |
| `onSetClusterPosRelRot(vehicleID, cNodeId)` | Asynchronous callback when a vehicle's node cluster is teleported; emits onSetClusterPosRelRot(vehicleID, cNodeId). | 1181 |
| `onSpawnError(status, jbeamFilename)` | Vehicle creation error: logs and displays an error toast in the UI. | 1374 |
| `onTexDrawPrimCompressDone(textureName)` | A drawn texture is compressed; emits onTexDrawPrimCompressDone(textureName). | 1594 |
| `openXRErrorDetected(...)` | Forwards to render_openxr.errorDetected if this module exists. | 1238 |
| `openXRStateChanged(state)` | Forwards to render_openxr.stateChanged if this module exists. | 1233 |
| `physicsEngineEvent(...)` | Relays a physics engine event: onPhysicsEngineEvent hook. Only the first argument is passed on (see notes). | 1139 |
| `physicsStateChanged(val)` | The physics simulation is paused/resumed. Relays the UI event 'physicsStateChanged' then emits onPhysicsUnpaused (val true) or onPhysicsPaused. | 1296 |
| `prepareStartupExtensionsList()` | If PlatformSwitches.useEditor is true, adds editor_main and editor_veMain to the startup extension list; recomputes the list of manual-unload extensions. Called by init(). | 393 |
| `print(...)` | Global replacement of print: writes via log('A','print', tostring(...)). Only the first argument is converted and logged. | 34 |
| `queueCmdlineLevelLoadExtension(extension)` | Adds an extension to load at the next loadPresetExtensions (used for extensions requested on the command line). | 469 |
| `refreshMainMenuMusicRouteState()` | Reads the current route from ui_router.getCurrent() and calls setMainMenuMusicRouteState. | 801 |
| `registerCoreModule(extensionName)` | OBSOLETE: equivalent to setExtensionUnloadMode(name, 'manual'). | 1639 |
| `replaySpawnVehicle(jbeamFilename, partConfigData)` | Called by the replay engine to recreate a vehicle at (0,0,0); the player is installed in it only if they do not have a vehicle yet. If there is only one enterable vehicle, switches to the game camera. | 1244 |
| `replayStartLevel(levelPath)` | Called by the replay: core_replay.startLevel(levelPath). | 1256 |
| `replayStateChanged(...)` | Forwards to core_replay.stateChanged(...). | 1229 |
| `requestGeluaProfile()` | Called by the C++ when a performance log is wanted: creates a LuaProfiler for the next frame (update + luaPreRender), enabled in the extensions. | 873 |
| `resetGameplay(playerID)` | Emits onResetGameplay(playerID). | 1379 |
| `returnToMainMenu(callback)` | Leaves the active game mode (endActiveGameMode) and requests the default game state (main menu). The callback is called when the level is unloaded and a new one can be loaded. | 848 |
| `runMimalloc_test()` | Debug: calls Engine.Debug.mimalloc_test(). | 859 |
| `sendUIModules()` | Sends to the UI ('onUIBootstrap' event) the list of the folders in /ui/modModules/; empty list on error. | 1383 |
| `setExtensionUnloadMode(extension, unloadMode)` | Defines whether an extension survives level changes ('manual') or can be unloaded automatically ('auto', default). Logs an error if the extension or the mode is unknown. | 425 |
| `setMainMenuMusicKeepAlive(active)` | Forces the main menu music to continue (true) or hands control back to the per-UI-route logic (false). Does nothing if the state does not change. | 704 |
| `setMainMenuMusicPauseRequest(requestId, active)` | Registers or removes a menu music pause request identified by requestId, then refreshes the state. | 715 |
| `setMainMenuMusicRouteState(routeName)` | Applies the music logic according to the UI route: requested pause > keepAlive > 'menu' route (resume) > level loaded (stop with 0.6 s fade) > 'menu.credits' route (ui_credits extension) > 'menu.uiSounds' route (pause) > resume. | 757 |
| `test_prefabv2()` | Dev test: builds SimGroup and TSStatic objects in MissionGroup then deletes thePlayer, spawn_default, ParticleEmitter. | 1649 |
| `test_spawn_prefabv2()` | Dev test: instantiates 'test_v2' at (6,3,2), scale 1.5, 45° rotation around Z. | 1743 |
| `test_spawn_prefabv2_massive(count)` | Dev test: instantiates count random copies of 'test_v2' in MissionGroup. | 1770 |
| `test_unload_prefabv2()` | Dev test: deletes the object 'test_v2'. | 1800 |
| `uiReady()` | Called when the UI is ready. Emits onUiReady and marks the UI as ready for the finalization of a Lua reload. | 1032 |
| `unloadAutoExtensions()` | Unloads all extensions except those in 'manual' mode (extensions.unloadExcept). Call when changing game mode/level. | 410 |
| `update(dtReal, dtSim, dtRaw)` | Called every frame by the engine, after the inputs and before the physics. See notes: settingsTick, core_input_bindings.updateGFX, simTimeAuthority.update, onUpdate(dtReal, dtSim, dtRaw) hook, handling of unstable vehicles, and if the UI must be refreshed onGuiUpdate hook + sending of the guihooks streams. | 991 |
| `updateFirstFrame()` | Called by the engine on the first frame. Emits onFirstUpdate, settings.finalizeInit(), synchronizes the editor state, processes the first-frame command-line arguments (-flowgraph, -compilemeshes, -convertCSMaterials, -deps, -disableDynamicCollision, -enablemcp, etc.) and calls uiReady() directly with -noui or in headless mode. | 973 |
| `updateLoadingProgress(val, txt)` | Updates the UI loading bar ('UpdateProgress' event) and forces a Canvas repaint while a level is loading; stores $lastProgress and $$lastProgressTxt. | 1598 |
| `updateTSShapeLoadProgressDynamic(progress, msg)` | Uses updateTSShapeLoadProgress if defined (editor loaded), otherwise updateLoadingProgress. | 1615 |
| `updateTranslations()` | Unmounts mods/translations.zip if mounted, downloads locales_v2.zip via core_repository.installMod, then reloads the settings. | 1305 |
| `validateLevelPrefabs(levelPath)` | Dev tool: calls validatePrefabJson on each *.prefab.json of levelPath. | 168 |
| `validatePrefabJson(filepath)` | Dev tool: reloads a .prefab.json and saves it again in the same place (format normalization). | 153 |
| `vehicleActiveChanged(vehicleID, active, setActiveCount)` | Called when a vehicle is activated/deactivated (e.g. traffic pooling). Unrelated to the player's vehicle switch. Emits onVehicleActiveChanged. | 1192 |
| `vehicleDestroyed(vid)` | Called when a vehicle is deleted: forgets its instability timers, emits onVehicleDestroyed(vid), invalidates the vehicle caches. | 1200 |
| `vehicleReset(vehicleID)` | Asynchronous callback after a vehicle reset; emits onVehicleResetted(vehicleID). | 1186 |
| `vehicleSpawned(vid)` | Called by the engine when a vehicle appears. Invalidates the vehicle caches, sets the vehicle's gravity (core_environment.getGravity), then emits onPreVehicleSpawned(vid, veh) then onVehicleSpawned(vid, veh). Does nothing if the object does not exist. | 1144 |
| `vehicleSwitched(oldVehicle, newVehicle, player)` | Called when the player switches vehicle. Emits onVehicleSwitched(oldId, newId, player) (id -1 if absent) and the UI event 'VehicleFocusChanged'. | 1166 |

**Globals assigned:** `MoveManager`, `Point3F`, `WinInput`, `bullettime`, `commands`, `doStartupProfiling`, `editor`, `extensions`, `guihooks`, `json`, `logAlways`, `map`, `parseArgs`, `perf`, `photoModeOpen`, `sailingTheHighSeas`, `screenshot`, `server`, `serverConnection`, `setSpawnpoint`, `settings`, `simTimeAuthority`, `spawn`, `vmType`, `worldReadyState`

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onAiModeChange`
- `onAiRouteDone` — listened to by 1 module(s)
- `onBeamNGTrigger` — listened to by 8 module(s)
- `onBeamNGWaypoint`
- `onClientEndMission` — listened to by 83 module(s)
- `onClientPostStartMission` — listened to by 15 module(s)
- `onClientPreEndMission`
- `onClientPreStartMission` — listened to by 6 module(s)
- `onClientStartMission` — listened to by 40 module(s)
- `onCouplerAttached` — listened to by 4 module(s)
- `onCouplerDetach`
- `onCouplerDetached` — listened to by 4 module(s)
- `onDrawDebug` — listened to by 3 module(s)
- `onEditorEnabled`
- `onExit` — listened to by 16 module(s)
- `onFileChanged` — listened to by 13 module(s)
- `onFileChangedEnd` — listened to by 1 module(s)
- `onFilesChanged` — listened to by 12 module(s)
- `onFirstUpdate` — listened to by 10 module(s)
- `onGuiUpdate` — listened to by 6 module(s)
- `onInstabilityDetected` — listened to by 4 module(s)
- `onMouseLocked` — listened to by 2 module(s)
- `onPhysicsEngineEvent`
- `onPhysicsPaused` — listened to by 3 module(s)
- `onPhysicsUnpaused` — listened to by 3 module(s)
- `onPreExit` — listened to by 1 module(s)
- `onPreRender` — listened to by 53 module(s)
- `onPreVehicleSpawned` — listened to by 1 module(s)
- `onPreWindowClose` — listened to by 1 module(s)
- `onResetGameplay` — listened to by 5 module(s)
- `onScreenKeyboardClosed` — listened to by 1 module(s)
- `onSetClusterPosRelRot`
- `onTexDrawPrimCompressDone`
- `onUiReady` — listened to by 6 module(s)
- `onUpdate` — listened to by 186 module(s)
- `onVehicleActiveChanged` — listened to by 8 module(s)
- `onVehicleDestroyed` — listened to by 39 module(s)
- `onVehicleResetted` — listened to by 29 module(s)
- `onVehicleSpawned` — listened to by 34 module(s)
- `onVehicleSwitched` — listened to by 57 module(s)
- `onWorldReadyState` — listened to by 4 module(s)

**UI events (guihooks.trigger):** `CEFTypingLostFocus`, `PreStartMission`, `UpdateProgress`, `VehicleFocusChanged`, `isUIReady`, `onUIBootstrap`, `physicsStateChanged`, `toastrMsg`

## Calls into the engine (C++)

- `Engine.` `getEditorEnabled`, `getStartingArgs`
- `FS:` `directoryCreate`, `directoryExists`, `directoryList`, `fileExists`, `findFiles`, `getFileRealPath`, `getUserPath`, `isMounted`, `unmount`
- `Lua:` `log`
- `Sim.` `clearSimObjectCache`
- `TorqueScriptLua.` `exec`
- `be:` `getEnterableObjectCount`, `getUpdateUIflag`, `physicsStopSimulation`, `queueObjectFastLua`, `setDynamicCollisionEnabled`
- `core_environment.` `getGravity`
- `obj:` `delete`, `getClassName`, `getName`, `registerObject`, `setField`, `setPosition`
- `scenetree.` `findObject`, `findObjectById`, `getAllObjects`

**Loads extensions:** `core_loadMapCmd`, `editor_flowgraphEditor`, `util_materialHotReload`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/main.lua`.*

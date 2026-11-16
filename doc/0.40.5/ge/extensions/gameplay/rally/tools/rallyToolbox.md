# `gameplay_rally_tools_rallyToolbox`

*File: `lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua` · VM: Game Engine (GE) · 1882 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/tools/rallyToolbox")` (file under extensions/ but not a regular extension)

RallyManager (gameplay_rally) debug imgui window: displays the current mission and the driveline distance, offers Warm Reload (resyncs the runtime state without reloading), Cold Reload (clears the voicepack caches, reloads route, notebook, driveline and resyncs the vehicle) and opening the recce window. It contains collapsible sections: Rally Loop (load/unload the extension, open the Loop Toolbox window), Recovery (test route recovery), Vehicle (place the vehicle with a click in the 3D view), Prefabs (spawn the mission's or loop's prefabs), Voicepack (selector and timing info), Visual Pacenotes, and many visualization checkboxes (driveline, race, low level, mouse as vehicle). The module returns a constructor: `require(...)()`; the 3D drawing is done in drawDebug.

## Notes

- The drawing options are in self.debug (drawRacePath, drawRaceSplits, drawRaceAiRoute, drawRaceCurrentSeg, drawStartFinishLines, drawStopZone, drawNotebookPacenotes, drawDrivelineRouteStatic, useMouseRayCast, drawRoutePacenotes, drawRoutePacenoteText, drawRoutePathnodes, drawRoutePointI, drawRoutePointMetadata, drawRouteHiddenPathnodes, drawRouteShort, drawReccePacenotes, drawDynamicTriggerPoint, drawStageNextPathnode, drawRouteCompletion, drawStageTimingFootprints, drawVehicleTracker…).
- Vehicle placement: left click = teleports the player vehicle (spawn.safeTeleport) keeping its orientation; right click = cancels. The RallyManager keeps the recovery tracking during this reset.
- Prefab files searched in the mission folder: <name>.prefab then <name>.prefab.json; the created objects are added to MissionGroup and named '<missionId> - <name>'.
- The voicepack selector caches its entries per mission (self._vpCache); "Refresh" clears the voicepack.lua caches.
- getRace colors the race path segments alternately orange and yellow for debug (_rallyDebugColor field).
- The init constructor contains the same assignment of nextPacenoteIdxForAudioTriggerTesting twice (duplicate with no effect).

## Class `C`

Rally debug tools. Fields: rallyManager, race, recce, debugLogging, debug (drawing options), vehiclePlacementActive, vehiclePlacementMessage, selectedPrefabId, _vpCache, as well as imgui IntPtrs for the audio delays (cornerGapMsPtr, phraseGapMsPtr, linkWordGapMsPtr, pacenoteGapMsPtr) and for recovery (rallyRecoveryCorridorWidthPtr = 8, rallyRecoveryBackoffDistancePtr = 3).

The module returns a constructor: `local obj = require("gameplay_rally_tools_rallyToolbox")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:_cancelVehiclePlacement()` | Cancels the vehicle placement. | 386 |
| `C:_invalidateVoicepackCache()` | Clears the local cache of the voicepack selector entries. | 117 |
| `C:_placeVehicleAt(pos)` | Teleports player vehicle 0 to the given position keeping its orientation (spawn.safeTeleport, protected by pcall). | 391 |
| `C:_spawnPrefab(filepath, ownerMissionId)` | Spawns a prefab in MissionGroup (position 0 0 0) and selects it. | 489 |
| `C:_startVehiclePlacement()` | Enables the vehicle placement mode. | 381 |
| `C:_updateVehiclePlacementMode()` | Each frame in placement mode: draws a sphere at the point under the mouse (cameraMouseRayCast) and handles left click (place) and right click (cancel). | 414 |
| `C:clearReccePoints()` | Forgets the displayed recce points (self.recce = nil). | 1076 |
| `C:draw()` | Draws the whole window (to be called inside an im.Begin/im.End): mission header, reload buttons and sections. | 644 |
| `C:drawDebug()` | 3D debug drawing according to self.debug: race path and segments, splits, start and finish lines, stop zone, pacenotes, driveline route, vehicle tracking, etc. Also handles the vehicle placement mode. | 1195 |
| `C:drawLoopTools()` | "Rally Loop" section: state of the gameplay_rallyLoop extension, Load, Unload and Toggle Loop Debug Window buttons. | 255 |
| `C:drawPrefabTools()` | "Prefabs" section: spawn buttons for the mission's prefabs and those of the loops that contain it, and deletion. | 562 |
| `C:drawRallyRecoveryTools(rm)` | "Recovery" section: corridor width and backoff distance, checkboxes (repair the vehicle, tracking markers) and "Run Recovery" button. | 287 |
| `C:drawVehicleTools()` | "Vehicle" section with a Place Vehicle / Cancel button. | 444 |
| `C:drawVoicepackPicker(rm)` | Voicepack dropdown with entry cache; changing the voicepack clears the recce points and calls rm:reloadVoicepackAssets(pick, {writeSettings = false}). Refresh button to invalidate the caches. | 150 |
| `C:getDebugLogging()` | Debug log state. | 137 |
| `C:getRace()` | Current race object of gameplay_rally (if the extension is loaded), coloring the path segments for debug. | 216 |
| `C:getRallyManager()` | Bound manager, otherwise that of gameplay_rally.getRallyManager(). | 129 |
| `C:init()` | Constructor: initializes all the state fields and the default drawing options. | 41 |
| `C:setDebugLogging(debugLogging)` | Enables or disables debug logging. | 125 |
| `C:setMouseAsVehicleEnabled(enabled)` | Enables or disables the driveline route's "mouse as vehicle" mode (the position under the mouse is used as the vehicle position). | 240 |
| `C:setRallyManager(rallyManager)` | Binds the window to a RallyManager and invalidates the voicepack selector cache. | 107 |
| `C:toggleMouseMovementCheckbox()` | Toggles the "mouse as vehicle" mode. | 251 |

## Calls into the engine (C++)

- `FS:` `fileExists`
- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getClassName`, `getID`, `getName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua`.*

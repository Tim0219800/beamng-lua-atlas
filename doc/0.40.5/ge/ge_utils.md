# `ge_utils`

*File: `lua/ge/ge_utils.lua` · VM: Game Engine (GE) · 1784 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("ge_utils")`

Global utility functions of the GE VM, loaded by main.lua (require('ge_utils')) before the extensions. They are accessible everywhere without require: getPlayerVehicle, getObjectByID, getAllVehicles, vehiclesIterator, scenetree, spawnPrefab, castRay, getTimeOfDay/setTimeOfDay, sanitizeVehicleSpawnOptions, translateDistance/translateVelocity, etc. The file also defines the global scenetree (read-only: scenetree.ObjectName returns the scene object) and a module loader (advancedModuleLoader) installed in 2nd position of package.loaders.

## Example

```lua
local veh = getPlayerVehicle(0)
if veh then
  local pos = veh:getPosition()
  local hit = castRay(pos, pos - vec3(0,0,5), true, false)
  if hit then log('I','', 'ground at '..hit.pt.z) end
end
for vid, v in vehiclesIterator() do print(vid, v:getJBeamFilename()) end
setTimeOfDay('13:30')
```

## Notes

- Cache: getPlayerVehicle(player) and getObjectByID(id) memoize their result (internal false, returned as nil). main.lua calls invalidatePlayerVehicles() / invalidateVehicleCache() on every vehicleSpawned, vehicleSwitched, vehicleDestroyed. getAllVehicles() returns the cached table: do not modify it.
- vehiclesIterator(ctx) returns (id, object); iteration runs over the cache created on the first call. activeVehiclesIterator keeps only the vehicles with veh:getActive() true.
- Defined globals: scenetree (read-only singleton whose __index does findObject), TorqueScriptLua (obsolete call: only logs an error; callNoReturn calls it; exec -> TorqueScript.exec; getBoolVar/getVar/setVar obsolete -> VariableRegistry), moduleLoaderFallback, serializeJsonToFile (= jsonWriteFile, obsolete), string.c_str (backward compatibility).
- scenetree table: findObject(name), findObjectById(id), objectExists(id), objectExistsById(id), decalRoadContainsPoint(id, point), findClassObjects(className) (list of names or nil), findSubClassObjects(className), getAllObjects() (names or nil). Any other key is treated as an object name: scenetree.MissionGroup. Writes are ignored.
- The position/rotation/scale strings of spawnPrefab for a PrefabV2 are read with the pattern [0-9]*: negative or decimal numbers are not recognized (probable bug; pass vec3/QuatF instead of strings).
- Bug/inconsistency: convertVehicleColorsToPaints logs the nonexistent variable 'colors' (instead of colorTable); convertVehicleNameKeysToVehicleIdKeys logs 'vid', which does not exist in this function (nil value in the message).
- Bug/inconsistency: canSpawnAnotherVehicle returns true except on PS5/PS5 Pro; when memory is short, the function ends without an explicit return (so it returns nil, not false).
- Bug/inconsistency: translateDistance returns nothing if the uiUnitLength setting is neither 'metric' nor 'imperial'; translateVelocity would then fail.
- Bug/inconsistency: the getDirs pattern excludes entries containing a dot after a '/', so it ignores folders whose name contains a dot.
- Test/dev functions not documented in detail: scenetree_tests, scenetree_test_fields, test_GE_fields, testGBitmap, testZIP, collisionReloadTest, testSounds, test_lua, testRaycasting. Local functions of the file (colorDifference, prefabFilenameToTemplateName, comparisons...) are not exported.
- the_high_sea_crap_detector, called by main.lua, looks for .url files at the root whose SHA1 hash is known, and returns true if found (affects the global sailingTheHighSeas).
- getTimeOfDay/setTimeOfDay: the TimeOfDay object stores time as a fraction of day offset by 0.5 (hours = ((time+0.5)%1)*24). The functions do the conversion; time in 24 h format. setTimeOfDay accepts 'HH', 'HH:MM', 'HH:MM:SS' or {hours, mins, secs}.

## Global functions defined here

| Function | Description | Line |
|---|---|---|
| `activeVehiclesIterator(ctx)` | Like vehiclesIterator but only walks the active vehicles (veh:getActive()). | 563 |
| `addPrefab(objName, objFileName, objPos, objRotation, objScale, useGlobalTranslation)` | Creates a Prefab object (v1, manual loading) without loading it. Logs an error and returns nil if the name already exists. | 722 |
| `canSpawnAnotherVehicle(minGB)` | On PS5/PS5 Pro only, checks that enough memory remains (default 1 GB); otherwise displays a toast, logs and emits onVehicleSpawnBlocked(availableGB, minGB). On other platforms always returns true. | 891 |
| `castRay(origin, target, includeTerrain, renderGeometry)` | Slow raycast (Engine.castRay) between two points. Returns nil with no hit, otherwise the engine's table with pt and norm converted to vec3. | 1329 |
| `castRayDebug(origin, target, includeTerrain, renderGeometry)` | Like castRay with debug drawing (start/end spheres, green line if hit, red otherwise, normal). | 1342 |
| `checkVehicleProperty(vid, propertyName, value)` | Tests whether the field propertyName of the vehicle's scene object equals value. | 854 |
| `collisionReloadTest()` | Debug: reloads the collision (be:reloadCollision) and displays the duration in ms. | 427 |
| `convertVehicleColorsToPaints(colorTable)` | Converts a list of {r,g,b,a} colors into a list of paints (createVehiclePaint + validateVehiclePaint). | 933 |
| `convertVehicleIdKeysToVehicleNameKeys(data)` | Transforms a table keyed by vehicle id into a table keyed by vehicle name ('name' field). | 1375 |
| `convertVehicleNameKeysToVehicleIdKeys(data)` | Inverse: transforms a table keyed by vehicle name into a table keyed by id. | 1398 |
| `copyfile(src, dst)` | Copies a text file ('r'/'w' modes: can corrupt a binary file on Windows). Returns nil if it cannot be opened. | 1582 |
| `createObject(className)` | Creates an object of the C++ class exposed as a global (e.g. 'SimGroup', 'TSStatic') and increments its reference count. Logs an error and returns nil if the class does not exist. You must then call :registerObject(name). | 414 |
| `createPlayerSpawningData(model, config, color, licenseText, vehicleName, pos, rot)` | Builds the table {model=, options={config, paint, licenseText, vehicleName, pos, rot}} for spawning a player vehicle. | 1274 |
| `createVehiclePaint(color, metallicData)` | Builds a paint table {baseColor={r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness}. Default values: white color, metallic 0.2, roughness 0.5, clearcoat 0.8, clearcoatRoughness 0. | 949 |
| `deleteObject(name)` | Deletes the scene object with this name if it exists. | 281 |
| `dirContent(path)` | Recursive list of all the content (files) of path via FS:findFiles. | 1438 |
| `dumpGfxResourcesMemory()` | Logs GPU memory by category (Engine.Render.calculateGfxMemory), in MB, for those exceeding 1 MB. | 1747 |
| `escape_magic(str)` | Escapes the magic characters of a Lua pattern for literal use. | 1478 |
| `extractVehicleData(vid)` | Extracts {config, licenseText, color, model, vehicleName} from a scene vehicle, or returns the current campaign's user vehicle if there is one. | 1301 |
| `fileExistsOrNil(path)` | Returns path if it is an existing file, otherwise nil. | 1442 |
| `fillVehicleSpawnOptionDefaults(modelName, opt)` | Completes a vehicle spawn options table: resolves config (.pc or name), paints (color/paintName/paint for 1 to 3 colors), the model's default config. Modifies and returns opt. | 1091 |
| `forEachAudioChannel(callback)` | Calls callback(name, channel) for each SFXSourceChannel object in the scene. | 598 |
| `generateObjectNameForClass(className, objectName)` | Generates a name objectName + (largest object id of the class + 1). | 1676 |
| `getAllVehicles()` | Returns the (cached) list of all BeamNGVehicle objects present in the level. | 503 |
| `getAllVehiclesByType(typeList)` | Filters getAllVehicles by model type (core_vehicles.getModel(veh.jbeam).model.Type). | 518 |
| `getAudioChannelsVolume()` | Returns the current volumes of all audio channels. | 609 |
| `getClosestVehicle(requesterID, callbackfct)` | Finds the active vehicle closest to requesterID and calls back the requesting vehicle's Lua: callbackfct(id, distance) or callbackfct(-1,-1) if none. | 574 |
| `getComparisonOps()` | Returns the list of comparison operators {opSymbol, op, opName, opNameLc}: ==, <, >, <=, >=, ~=. | 1704 |
| `getDateTimeUTCString()` | Current UTC date and time in ISO 8601 format with milliseconds, e.g. 2023-01-01T12:00:00.123Z. | 1648 |
| `getDirectories(path)` | Lists the immediate subfolders (full paths) of path. | 1593 |
| `getDirs(path, recursiveLevels)` | List of the subfolders of path over recursiveLevels levels (filters entries that look like files). | 1449 |
| `getFileSize(filename)` | Size of a file in bytes (opened with io.open), -1 if unreadable. | 1466 |
| `getFunctionParameters(func)` | Returns the parameter names of a Lua function (debug.getlocal) and whether it is variadic. Slow. | 1667 |
| `getMaxVehicleAmount(limit)` | Estimates the maximum number of vehicles: number of physical cores, limited by the available memory in GB and by limit. | 867 |
| `getObjectByClass(className)` | Returns the first scene object of the given class (e.g. 'TimeOfDay'). | 650 |
| `getObjectByID(id)` | Cached version of be:getObjectByID(id): returns the vehicle with the given id. | 450 |
| `getObjectsByClass(className)` | Returns all the scene objects of the given class (e.g. 'CloudLayer'). | 659 |
| `getOwningPrefab(obj)` | Walks up the Prefab (v1) parents of obj and returns the topmost prefab. | 380 |
| `getOwningPrefabInstance(obj)` | Same for PrefabV2 instances (Engine.Prefab.findContainingPrefabInstance), returns the topmost instance. | 393 |
| `getPlayerVehicle(player)` | Cached version of be:getPlayerVehicle(player) (avoids generating garbage). Returns the vehicle controlled by the player, or nil. | 441 |
| `getRandomPaint(vehId, commonPaintProb)` | Picks a paint at random from the model's. With commonPaintProb, favors common real-world colors (white, black, gray, silver, blue, red) by choosing the model's closest paint. Fallback model: 'pessima'. | 1025 |
| `getSceneWaypointRadius(o)` | Radius of a scene waypoint: the largest of the 3 scale components. | 849 |
| `getTimeOfDay(asString)` | Returns the game time (TimeOfDay object), 24 h format. Nil if there is no TimeOfDay object in the scene. | 671 |
| `getVehicleColor(vehicleID)` | Returns the vehicle's main color as a string 'r g b a metallic roughness clearcoat clearcoatRoughness' (values rounded to 0.01). Player vehicle 0 if vehicleID is nil; empty string if not found. | 478 |
| `getVehicleColorPalette(index, vehicleId)` | Like getVehicleColor but for colorPalette<index> (index 0 or 1 depending on the vehicle), with the current metallic data. | 489 |
| `getVehiclePaint(vehicleId)` | Current paint of a vehicle (color and metallic data of the scene object). | 966 |
| `imageExistsDefault(path, fallbackPath)` | Returns path if it exists, otherwise fallbackPath or '/ui/images/appDefault.png'. | 1430 |
| `invalidatePlayerVehicles()` | Empties the getPlayerVehicle and getObjectByID caches. Called by main.lua on every vehicle spawn, switch or destruction. | 436 |
| `invalidateVehicleCache()` | Invalidates the getAllVehicles / vehiclesIterator cache. Called by main.lua. | 497 |
| `isOfficialContent(path)` | True if the real path starts with the game folder. | 1416 |
| `isOfficialContentVPath(vpath)` | Same for a virtual path (resolved by FS:getFileRealPath). | 1420 |
| `isPlayerVehConfig(vpath)` | True if the file is a .pc located in the user's vehicles/ folder (config created by the player). | 1424 |
| `loadPrefabv2Template(filename)` | Loads a PrefabV2 prefab file as a model named after its path (/ -> _, _ -> __). | 710 |
| `logMemoryInfo(lovLevel)` | Logs the RAM statistics (Engine.Platform.getMemoryInfo) at the given log level. | 885 |
| `moduleLoaderFallback(modulename)` | Fallback loader called when the default loader does not find a module: can load workbench/panels/... plugins from their literal VFS path. | 1715 |
| `newFPSLimiter(targetFPS)` | Creates a rate limiter: limiter:update(dt) returns true about targetFPS times per second. Call from onPreRender/onUpdate. | 1615 |
| `parseISO8601Date(isoString)` | Converts an ISO 8601 string (YYYY-MM-DDTHH:MM:SS.mmmZ) to os.time; milliseconds are ignored and the time zone is the machine's (os.time). | 1659 |
| `popActionMap(map)` | Deactivates the ActionMap named <map>ActionMap (pop). | 830 |
| `prefabIsChildOfGroup(obj, groupName)` | Indicates whether obj is in the SimGroup named groupName, either directly or via its parent prefab. | 359 |
| `pushActionMap(map)` | Activates the ActionMap named <map>ActionMap (push). | 818 |
| `pushActionMapHighestPriority(map)` | Like pushActionMap but with maximum priority (pushFirst). | 824 |
| `queueCallbackInVehicle(veh, geluaFunctionName, vluaCommand, ...)` | Runs vluaCommand in the vehicle's Lua then calls back the GE function geluaFunctionName with the command's result followed by ...  Prefer the vehicleBridge API when possible. | 837 |
| `randomASCIIString(len)` | Generates a random string of digits and letters. | 1546 |
| `recordPlayerAction(text)` | Records an action in an engine circular buffer, printed to the log on crash or at shutdown; consecutive identical actions are merged. | 905 |
| `removePrefab(objName)` | Unloads and deletes the prefab with this name if it exists. | 809 |
| `replace_char(pos, str, r)` | Replaces the character at position pos of str with r. | 221 |
| `sanitizeVehicleSpawnOptions(model, opt)` | Calls fillVehicleSpawnOptionDefaults, validates the paints, copies licenseText and vehicleName, and computes the default pos/rot: 5 m to the left of the player vehicle and same orientation, or in front of the free camera. | 1217 |
| `scenetree_test_fields()` | Dev tests for scene object fields. | 144 |
| `scenetree_tests()` | Dev tests for scenetree (marked to be converted into real unit tests). | 96 |
| `setAudioChannelsVolume(data)` | Applies volumes to audio channels by name (getAudioChannelsVolume format). | 618 |
| `setCEFFocus()` | OBSOLETE: no longer has any effect, logs an error (at most 5 times). | 1773 |
| `setMaxVehicleAmountForTraffic(limit)` | Sets the trafficAmount and trafficParkingAmount settings to (estimated max - 1, minimum 1). Used by the main options. | 874 |
| `setTimeOfDay(inp)` | Sets the game time. | 687 |
| `setVehicleProperty(vid, propertyName, value)` | Writes the field propertyName of the vehicle's scene object. | 859 |
| `spaceSeparated4Values(a, b, c, d)` | Concatenates 4 values with spaces, reusing an internal table (no allocation). | 1577 |
| `spawnPrefab(objName, objFileName, objPos, objRotation, objScale, useGlobalTranslation)` | Creates and loads a prefab in MissionGroup. If the file ends with .prefab.json and describes a PrefabV2 class, instantiates the model (created if needed); otherwise uses addPrefab + load. Enables collision rebuilding if the editor is active. | 744 |
| `stringToTable(str, sep)` | Splits a string by a separator (character-class pattern, default '%s' = whitespace); empty fields are ignored. | 1562 |
| `tableChooseRandomKey(t)` | Returns a randomly chosen key from the table (math.random seeded on the first call). | 1529 |
| `testGBitmap()` | Dev test for GBitmap (loading, colors). | 225 |
| `testRaycasting(dtReal)` | Dev test: sweeps an animated castRayDebug; call every frame with dtReal. | 1367 |
| `testSounds()` | Dev test (marked TODO remove): creates test SFXParameterGroup and audio sources. | 626 |
| `testZIP()` | Dev test for ZIP reading. | 323 |
| `test_GE_fields()` | Dev tests for GE fields. | 165 |
| `test_lua()` | Dev test: creates/deletes a SimGroup 'hey'. | 920 |
| `the_high_sea_crap_detector()` | Detects known .url files at the game root (pirated version); called by main.lua to set sailingTheHighSeas. | 1630 |
| `translateDistance(value, big)` | Converts a distance in m to the unit of the uiUnitLength setting: km/m in metric, mi/ft in imperial. big=true forces the large unit, 'auto' chooses from 1000 m (metric) or 1 mile. | 1486 |
| `translateVelocity(value, big)` | Converts a speed in m/s to the setting's unit: km/h or m/s (metric), mph or ft/s (imperial). big=true multiplies the value by 3600 for the large units. | 1511 |
| `triggerDelayedStartGenerator(logTag, startType, func, waitForCleanup)` | Returns a function (via core_jobsystem.wrap) that, once called, runs func in a job; with waitForCleanup, waits 3 render frames to let GPU resources be freed. | 81 |
| `validateVehicleDataColor(color)` | Normalizes a color (string or table of 4 values) into a string 'r g b a' with 2 decimals; default '1 1 1 1'. | 1003 |
| `validateVehiclePaint(paint)` | Fills a paint table with the missing default values (modifies and returns the table). | 972 |
| `vehicleMetallicPaintDataFromColor(colorTable)` | Extracts metallic, roughness, clearcoat, clearcoatRoughness from elements 5 to 8 of a color array. | 985 |
| `vehicleMetallicPaintString(metallic, roughness, clearcoat, clearcoatRoughness)` | Formats 4 values into a string 'metallic roughness clearcoat clearcoatRoughness'. | 998 |
| `vehicleSetPositionRotation(id, px, py, pz, rx, ry, rz, rw)` | Places a vehicle at a position and rotation (quaternion). Logs an error if the vehicle does not exist. | 459 |
| `vehiclesIterator(ctx)` | Generic iterator over all vehicles: for id, veh in vehiclesIterator() do ... end. | 541 |

**Globals assigned:** `TorqueScriptLua`, `scenetree`, `serializeJsonToFile`

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onVehicleSpawnBlocked`

**UI events (guihooks.trigger):** `toastrMsg`

## Calls into the engine (C++)

- `Engine.` `castRay`, `setNeedCollisionRebuild`
- `FS:` `directoryExists`, `fileExists`, `findFiles`, `getFileRealPath`, `getGamePath`, `getUserPath`
- `Lua:` `findObjectsByClassAsTable`, `findObjectsBySubClassAsTable`, `getAllObjects`
- `Sim.` `decalRoadContainsPoint`, `findObject`, `findObjectById`, `objectExists`, `objectExistsById`, `upcast`
- `TorqueScriptLua.` `call`
- `be:` `getObject`, `getObjectByID`, `getObjectCount`, `getPlayerVehicle`, `reloadCollision`
- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `delete`, `get`, `getDeclarationLine`, `incRefCount`, `isChildOfGroup`, `registerObject`, `set`, `unload`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/ge_utils.lua`.*

---@meta
-- tim19Atlas stub generated from lua/ge/ge_utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Like vehiclesIterator but only walks the active vehicles (veh:getActive()).
---Source: lua/ge/ge_utils.lua:563
---@param ctx table|nil reusable context
---@return function  iterator
---@return table  context
function activeVehiclesIterator(ctx) end

--- Creates a Prefab object (v1, manual loading) without loading it. Logs an error and returns nil if the name already exists.
---Source: lua/ge/ge_utils.lua:722
---@param objName string prefab name
---@param objFileName string prefab file
---@param objPos string position 'x y z' (TorqueScript field)
---@param objRotation string rotation 'x y z angle'
---@param objScale string scale 'x y z'
---@param useGlobalTranslation boolean|nil default false
---@return table|nil  created prefab
function addPrefab(objName, objFileName, objPos, objRotation, objScale, useGlobalTranslation) end

--- On PS5/PS5 Pro only, checks that enough memory remains (default 1 GB); otherwise displays a toast, logs and emits onVehicleSpawnBlocked(availableGB, minGB). On other platforms always returns true.
---Source: lua/ge/ge_utils.lua:891
---@param minGB number|nil minimum free memory (GB)
---@return boolean|nil  true if possible, nil otherwise (no explicit return)
function canSpawnAnotherVehicle(minGB) end

--- Slow raycast (Engine.castRay) between two points. Returns nil with no hit, otherwise the engine's table with pt and norm converted to vec3.
---Source: lua/ge/ge_utils.lua:1329
---@param origin vec3 start point (m)
---@param target vec3 end point (m)
---@param includeTerrain boolean|nil include the terrain (false by default)
---@param renderGeometry boolean|nil use the render geometry (false by default)
---@return table|nil  result with pt and norm
function castRay(origin, target, includeTerrain, renderGeometry) end

--- Like castRay with debug drawing (start/end spheres, green line if hit, red otherwise, normal).
---Source: lua/ge/ge_utils.lua:1342
---@param origin vec3 start
---@param target vec3 end
---@param includeTerrain boolean|nil terrain
---@param renderGeometry boolean|nil render geometry
---@return table|nil  result
function castRayDebug(origin, target, includeTerrain, renderGeometry) end

--- Tests whether the field propertyName of the vehicle's scene object equals value.
---Source: lua/ge/ge_utils.lua:854
---@param vid integer vehicle id
---@param propertyName string field
---@param value any value compared
---@return boolean|nil  result (nil/false if not found)
function checkVehicleProperty(vid, propertyName, value) end

--- Debug: reloads the collision (be:reloadCollision) and displays the duration in ms.
---Source: lua/ge/ge_utils.lua:427
function collisionReloadTest() end

--- Converts a list of {r,g,b,a} colors into a list of paints (createVehiclePaint + validateVehiclePaint).
---Source: lua/ge/ge_utils.lua:933
---@param colorTable table<integer, number[]> 4-component colors
---@return table<integer, table>  paints
function convertVehicleColorsToPaints(colorTable) end

--- Transforms a table keyed by vehicle id into a table keyed by vehicle name ('name' field).
---Source: lua/ge/ge_utils.lua:1375
---@param data table table by id
---@return table|nil  table by name; nil if data is not a table
function convertVehicleIdKeysToVehicleNameKeys(data) end

--- Inverse: transforms a table keyed by vehicle name into a table keyed by id.
---Source: lua/ge/ge_utils.lua:1398
---@param data table table by name
---@return table  table by id (empty on error)
function convertVehicleNameKeysToVehicleIdKeys(data) end

--- Copies a text file ('r'/'w' modes: can corrupt a binary file on Windows). Returns nil if it cannot be opened.
---Source: lua/ge/ge_utils.lua:1582
---@param src string source
---@param dst string destination
function copyfile(src, dst) end

--- Creates an object of the C++ class exposed as a global (e.g. 'SimGroup', 'TSStatic') and increments its reference count. Logs an error and returns nil if the class does not exist. You must then call :registerObject(name).
---Source: lua/ge/ge_utils.lua:414
---@param className string class name
---@return table|nil  new object
function createObject(className) end

--- Builds the table {model=, options={config, paint, licenseText, vehicleName, pos, rot}} for spawning a player vehicle.
---Source: lua/ge/ge_utils.lua:1274
---@param model string model
---@param config string configuration
---@param color string|table|nil color
---@param licenseText string|nil license plate
---@param vehicleName string|nil object name
---@param pos vec3|nil position
---@param rot quat|nil rotation
---@return table  spawn data
function createPlayerSpawningData(model, config, color, licenseText, vehicleName, pos, rot) end

--- Builds a paint table {baseColor={r,g,b,a}, metallic, roughness, clearcoat, clearcoatRoughness}. Default values: white color, metallic 0.2, roughness 0.5, clearcoat 0.8, clearcoatRoughness 0.
---Source: lua/ge/ge_utils.lua:949
---@param color table|nil {x,y,z,w} (r,g,b,a)
---@param metallicData table|nil {metallic=,roughness=,clearcoat=,clearcoatRoughness=} or array of 4 numbers
---@return table  paint
function createVehiclePaint(color, metallicData) end

--- Deletes the scene object with this name if it exists.
---Source: lua/ge/ge_utils.lua:281
---@param name string object name
function deleteObject(name) end

--- Recursive list of all the content (files) of path via FS:findFiles.
---Source: lua/ge/ge_utils.lua:1438
---@param path string folder
---@return table<integer, string>  paths
function dirContent(path) end

--- Logs GPU memory by category (Engine.Render.calculateGfxMemory), in MB, for those exceeding 1 MB.
---Source: lua/ge/ge_utils.lua:1747
function dumpGfxResourcesMemory() end

--- Escapes the magic characters of a Lua pattern for literal use.
---Source: lua/ge/ge_utils.lua:1478
---@param str string text
---@return string  escaped text
function escape_magic(str) end

--- Extracts {config, licenseText, color, model, vehicleName} from a scene vehicle, or returns the current campaign's user vehicle if there is one.
---Source: lua/ge/ge_utils.lua:1301
---@param vid integer vehicle id
---@return table|nil  data; nil and a warning if the id is invalid
function extractVehicleData(vid) end

--- Returns path if it is an existing file, otherwise nil.
---Source: lua/ge/ge_utils.lua:1442
---@param path string file
---@return string|nil  path or nil
function fileExistsOrNil(path) end

--- Completes a vehicle spawn options table: resolves config (.pc or name), paints (color/paintName/paint for 1 to 3 colors), the model's default config. Modifies and returns opt.
---Source: lua/ge/ge_utils.lua:1091
---@param modelName string vehicle model name
---@param opt table|nil options (config, color, paintName, paint…)
---@return table  completed options
function fillVehicleSpawnOptionDefaults(modelName, opt) end

--- Calls callback(name, channel) for each SFXSourceChannel object in the scene.
---Source: lua/ge/ge_utils.lua:598
---@param callback function function(name, channel)
function forEachAudioChannel(callback) end

--- Generates a name objectName + (largest object id of the class + 1).
---Source: lua/ge/ge_utils.lua:1676
---@param className string class
---@param objectName string prefix
---@return string  name
function generateObjectNameForClass(className, objectName) end

--- Returns the (cached) list of all BeamNGVehicle objects present in the level.
---Source: lua/ge/ge_utils.lua:503
---@return table<integer, table>  vehicles
function getAllVehicles() end

--- Filters getAllVehicles by model type (core_vehicles.getModel(veh.jbeam).model.Type).
---Source: lua/ge/ge_utils.lua:518
---@param typeList table<integer, string>|nil wanted types; default {'Car','Truck','Automation','Traffic'}
---@return table<integer, table>  vehicles kept
function getAllVehiclesByType(typeList) end

--- Returns the current volumes of all audio channels.
---Source: lua/ge/ge_utils.lua:609
---@return table<string, number>  volume by channel name
function getAudioChannelsVolume() end

--- Finds the active vehicle closest to requesterID and calls back the requesting vehicle's Lua: callbackfct(id, distance) or callbackfct(-1,-1) if none.
---Source: lua/ge/ge_utils.lua:574
---@param requesterID integer id of the requesting vehicle
---@param callbackfct string name of a function on the requester's VLua side
function getClosestVehicle(requesterID, callbackfct) end

--- Returns the list of comparison operators {opSymbol, op, opName, opNameLc}: ==, <, >, <=, >=, ~=.
---Source: lua/ge/ge_utils.lua:1704
---@return table<integer, table>  operators
function getComparisonOps() end

--- Current UTC date and time in ISO 8601 format with milliseconds, e.g. 2023-01-01T12:00:00.123Z.
---Source: lua/ge/ge_utils.lua:1648
---@return string  timestamp
function getDateTimeUTCString() end

--- Lists the immediate subfolders (full paths) of path.
---Source: lua/ge/ge_utils.lua:1593
---@param path string folder
---@return table<integer, string>  folders
function getDirectories(path) end

--- List of the subfolders of path over recursiveLevels levels (filters entries that look like files).
---Source: lua/ge/ge_utils.lua:1449
---@param path string folder
---@param recursiveLevels integer recursion levels (-1 unlimited)
---@return table<integer, string>  unique folders
function getDirs(path, recursiveLevels) end

--- Size of a file in bytes (opened with io.open), -1 if unreadable.
---Source: lua/ge/ge_utils.lua:1466
---@param filename string file
---@return integer  size or -1
function getFileSize(filename) end

--- Returns the parameter names of a Lua function _anon(debug.getlocal) and whether it is variadic. Slow.
---Source: lua/ge/ge_utils.lua:1667
---@param func function function
---@return table<integer, string>  names
---@return boolean  variadic
function getFunctionParameters(func) end

--- Estimates the maximum number of vehicles: number of physical cores, limited by the available memory in GB and by limit.
---Source: lua/ge/ge_utils.lua:867
---@param limit integer|nil cap (128 by default)
---@return integer  estimated number
function getMaxVehicleAmount(limit) end

--- Returns the first scene object of the given class (e.g. 'TimeOfDay').
---Source: lua/ge/ge_utils.lua:650
---@param className string C++ class
---@return table|nil  object or nil
function getObjectByClass(className) end

--- Cached version of be:getObjectByID(id): returns the vehicle with the given id.
---Source: lua/ge/ge_utils.lua:450
---@param id integer vehicle object id
---@return table|nil  BeamNGVehicle object
function getObjectByID(id) end

--- Returns all the scene objects of the given class (e.g. 'CloudLayer').
---Source: lua/ge/ge_utils.lua:659
---@param className string C++ class
---@return table<integer, table>|nil  objects; nil if none
function getObjectsByClass(className) end

--- Walks up the Prefab (v1) parents of obj and returns the topmost prefab.
---Source: lua/ge/ge_utils.lua:380
---@param obj table scene object
---@return table|nil  root prefab, nil if there is none
function getOwningPrefab(obj) end

--- Same for PrefabV2 instances (Engine.Prefab.findContainingPrefabInstance), returns the topmost instance.
---Source: lua/ge/ge_utils.lua:393
---@param obj table scene object
---@return table|nil  root instance or nil
function getOwningPrefabInstance(obj) end

--- Cached version of be:getPlayerVehicle(player) (avoids generating garbage). Returns the vehicle controlled by the player, or nil.
---Source: lua/ge/ge_utils.lua:441
---@param player integer player index (0 = main player)
---@return table|nil  BeamNGVehicle object
function getPlayerVehicle(player) end

--- Picks a paint at random from the model's. With commonPaintProb, favors common real-world colors (white, black, gray, silver, blue, red) by choosing the model's closest paint. Fallback model: 'pessima'.
---Source: lua/ge/ge_utils.lua:1025
---@param vehId integer|nil id of the model vehicle
---@param commonPaintProb number|nil probability 0 to 1 of aiming for a common color (0 by default)
---@return string  paint name
---@return table  paint
function getRandomPaint(vehId, commonPaintProb) end

--- Radius of a scene waypoint: the largest of the 3 scale components.
---Source: lua/ge/ge_utils.lua:849
---@param o table scene object
---@return number  radius (m)
function getSceneWaypointRadius(o) end

--- Returns the game time (TimeOfDay object), 24 h format. Nil if there is no TimeOfDay object in the scene.
---Source: lua/ge/ge_utils.lua:671
---@param asString boolean|nil true: 'HH:MM:SS' string; otherwise table {hours, mins, secs}
---@return string|table|nil  time
function getTimeOfDay(asString) end

--- Returns the vehicle's main color as a string 'r g b a metallic roughness clearcoat clearcoatRoughness' (values rounded to 0.01). Player vehicle 0 if vehicleID is nil; empty string if not found.
---Source: lua/ge/ge_utils.lua:478
---@param vehicleID integer|nil vehicle id
---@return string  string of 8 space-separated values
function getVehicleColor(vehicleID) end

--- Like getVehicleColor but for colorPalette<index> (index 0 or 1 depending on the vehicle), with the current metallic data.
---Source: lua/ge/ge_utils.lua:489
---@param index integer palette number
---@param vehicleId integer|nil vehicle id (player 0 by default)
---@return string|nil  string of 8 values, nil if no vehicle
function getVehicleColorPalette(index, vehicleId) end

--- Current paint of a vehicle (color and metallic data of the scene object).
---Source: lua/ge/ge_utils.lua:966
---@param vehicleId integer|nil id (player 0 by default)
---@return table|nil  paint
function getVehiclePaint(vehicleId) end

--- Returns path if it exists, otherwise fallbackPath or '/ui/images/appDefault.png'.
---Source: lua/ge/ge_utils.lua:1430
---@param path string|nil image
---@param fallbackPath string|nil fallback image
---@return string  path chosen
function imageExistsDefault(path, fallbackPath) end

--- Empties the getPlayerVehicle and getObjectByID caches. Called by main.lua on every vehicle spawn, switch or destruction.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/ge_utils.lua:436
function invalidatePlayerVehicles() end

--- Invalidates the getAllVehicles / vehiclesIterator cache. Called by main.lua.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/ge_utils.lua:497
function invalidateVehicleCache() end

--- True if the real path starts with the game folder.
---Source: lua/ge/ge_utils.lua:1416
---@param path string real path
---@return boolean  result
function isOfficialContent(path) end

--- Same for a virtual path (resolved by FS:getFileRealPath).
---Source: lua/ge/ge_utils.lua:1420
---@param vpath string virtual path
---@return boolean  result
function isOfficialContentVPath(vpath) end

--- True if the file is a .pc located in the user's vehicles/ folder (config created by the player).
---Source: lua/ge/ge_utils.lua:1424
---@param vpath string virtual path of the .pc
---@return boolean  result
function isPlayerVehConfig(vpath) end

--- Loads a PrefabV2 prefab file as a model named after its path (/ -> _, _ -> __).
---Source: lua/ge/ge_utils.lua:710
---@param filename string path of the .prefab.json
function loadPrefabv2Template(filename) end

--- Logs the RAM statistics (Engine.Platform.getMemoryInfo) at the given log level.
---Source: lua/ge/ge_utils.lua:885
---@param lovLevel string log level ('I','W'...); parameter name as is in the code
function logMemoryInfo(lovLevel) end

--- Fallback loader called when the default loader does not find a module: can load workbench/panels/... plugins from their literal VFS path.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/ge_utils.lua:1715
---@param modulename string module name
---@return function|nil  loaded chunk or nil
function moduleLoaderFallback(modulename) end

--- Creates a rate limiter: limiter:update(dt) returns true about targetFPS times per second. Call from onPreRender/onUpdate.
---Source: lua/ge/ge_utils.lua:1615
---@param targetFPS number desired rate (Hz)
---@return table  object with update(self, dt)
function newFPSLimiter(targetFPS) end

--- Converts an ISO 8601 string (YYYY-MM-DDTHH:MM:SS.mmmZ) to os.time; milliseconds are ignored and the time zone is the machine's (os.time).
---Source: lua/ge/ge_utils.lua:1659
---@param isoString string date
---@return integer  epoch seconds
function parseISO8601Date(isoString) end

--- Deactivates the ActionMap named <map>ActionMap (pop).
---Source: lua/ge/ge_utils.lua:830
---@param map string name without the ActionMap suffix
---@return any  result, or false if not found
function popActionMap(map) end

--- Indicates whether obj is in the SimGroup named groupName, either directly or via its parent prefab.
---Source: lua/ge/ge_utils.lua:359
---@param obj table|nil scene object
---@param groupName string SimGroup name
---@return boolean  true if contained
function prefabIsChildOfGroup(obj, groupName) end

--- Activates the ActionMap named <map>ActionMap (push).
---Source: lua/ge/ge_utils.lua:818
---@param map string name without the ActionMap suffix
---@return any  result of push, or false if not found
function pushActionMap(map) end

--- Like pushActionMap but with maximum priority (pushFirst).
---Source: lua/ge/ge_utils.lua:824
---@param map string name without the ActionMap suffix
---@return any  result, or false if not found
function pushActionMapHighestPriority(map) end

--- Runs vluaCommand in the vehicle's Lua then calls back the GE function geluaFunctionName with the command's result followed by ...  Prefer the vehicleBridge API when possible.
---Source: lua/ge/ge_utils.lua:837
---@param veh table vehicle object
---@param geluaFunctionName string GE function name (global or path)
---@param vluaCommand string Lua expression evaluated on the vehicle side
---@param ... any additional serializable arguments
function queueCallbackInVehicle(veh, geluaFunctionName, vluaCommand, ...) end

--- Generates a random string of digits and letters.
---Source: lua/ge/ge_utils.lua:1546
---@param len integer length
---@return string  string
function randomASCIIString(len) end

--- Records an action in an engine circular buffer, printed to the log on crash or at shutdown; consecutive identical actions are merged.
---Source: lua/ge/ge_utils.lua:905
---@param text string action text
function recordPlayerAction(text) end

--- Unloads and deletes the prefab with this name if it exists.
---Source: lua/ge/ge_utils.lua:809
---@param objName string prefab name
function removePrefab(objName) end

--- Replaces the character at position pos of str with r.
---Source: lua/ge/ge_utils.lua:221
---@param pos integer position (1 = first)
---@param str string string
---@param r string replacement
---@return string  str with the character at pos replaced by r
function replace_char(pos, str, r) end

--- Calls fillVehicleSpawnOptionDefaults, validates the paints, copies licenseText and vehicleName, and computes the default pos/rot: 5 m to the left of the player vehicle and same orientation, or in front of the free camera.
---Source: lua/ge/ge_utils.lua:1217
---@param model string model
---@param opt table spawn options
---@return table  final options (pos vec3, rot quat, paint, paint2, paint3…)
function sanitizeVehicleSpawnOptions(model, opt) end

--- Dev tests for scene object fields.
---Source: lua/ge/ge_utils.lua:144
function scenetree_test_fields() end

--- Dev tests for scenetree (marked to be converted into real unit tests).
---Source: lua/ge/ge_utils.lua:96
function scenetree_tests() end

--- Applies volumes to audio channels by name (getAudioChannelsVolume format).
---Source: lua/ge/ge_utils.lua:618
---@param data table<string, number> volume by channel name
function setAudioChannelsVolume(data) end

--- OBSOLETE: no longer has any effect, logs an error (at most 5 times).
---Source: lua/ge/ge_utils.lua:1773
function setCEFFocus() end

--- Sets the trafficAmount and trafficParkingAmount settings to (estimated max - 1, minimum 1). Used by the main options.
---Source: lua/ge/ge_utils.lua:874
---@param limit integer|nil cap (8 by default)
function setMaxVehicleAmountForTraffic(limit) end

--- Sets the game time.
---Source: lua/ge/ge_utils.lua:687
---@param inp string|table '13:00', '13:00:30' or {hours=, mins=, secs=}
---@return boolean|nil  false if there is no TimeOfDay object; nil otherwise
function setTimeOfDay(inp) end

--- Writes the field propertyName of the vehicle's scene object.
---Source: lua/ge/ge_utils.lua:859
---@param vid integer vehicle id
---@param propertyName string field
---@param value any value
function setVehicleProperty(vid, propertyName, value) end

--- Concatenates 4 values with spaces, reusing an internal table (no allocation).
---Source: lua/ge/ge_utils.lua:1577
---@param a any value 1
---@param b any value 2
---@param c any value 3
---@param d any value 4
---@return string  'a b c d'
function spaceSeparated4Values(a, b, c, d) end

--- Creates and loads a prefab in MissionGroup. If the file ends with .prefab.json and describes a PrefabV2 class, instantiates the model (created if needed); otherwise uses addPrefab + load. Enables collision rebuilding if the editor is active.
---Source: lua/ge/ge_utils.lua:744
---@param objName string instance name
---@param objFileName string prefab file
---@param objPos string|vec3 position
---@param objRotation string|QuatF rotation
---@param objScale string|vec3 scale
---@param useGlobalTranslation boolean|nil only for v1 prefabs
---@return table|nil  created prefab or instance
function spawnPrefab(objName, objFileName, objPos, objRotation, objScale, useGlobalTranslation) end

--- Splits a string by a separator (character-class pattern, default '%s' = whitespace); empty fields are ignored.
---Source: lua/ge/ge_utils.lua:1562
---@param str string string
---@param sep string|nil content of a [^...] class; default '%s'
---@return table<integer, string>  pieces
function stringToTable(str, sep) end

--- Returns a randomly chosen key from the table (math.random seeded on the first call).
---Source: lua/ge/ge_utils.lua:1529
---@param t table|nil table
---@return any  key, or nil
function tableChooseRandomKey(t) end

--- Dev test for GBitmap (loading, colors).
---Source: lua/ge/ge_utils.lua:225
function testGBitmap() end

--- Dev test: sweeps an animated castRayDebug; call every frame with dtReal.
---Source: lua/ge/ge_utils.lua:1367
---@param dtReal number delta time (s)
function testRaycasting(dtReal) end

--- Dev test (marked TODO remove): creates test SFXParameterGroup and audio sources.
---Source: lua/ge/ge_utils.lua:626
function testSounds() end

--- Dev test for ZIP reading.
---Source: lua/ge/ge_utils.lua:323
function testZIP() end

--- Dev tests for GE fields.
---Source: lua/ge/ge_utils.lua:165
function test_GE_fields() end

--- Dev test: creates/deletes a SimGroup 'hey'.
---Source: lua/ge/ge_utils.lua:920
function test_lua() end

--- Detects known .url files at the game root (pirated version); called by main.lua to set sailingTheHighSeas.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/ge_utils.lua:1630
---@return boolean  true if detected
function the_high_sea_crap_detector() end

--- Converts a distance in m to the unit of the uiUnitLength setting: km/m in metric, mi/ft in imperial. big=true forces the large unit, 'auto' chooses from 1000 m (metric) or 1 mile.
---Source: lua/ge/ge_utils.lua:1486
---@param value number|nil distance in meters (0 if nil)
---@param big boolean|string|nil true, false or 'auto'
---@return number  converted value
---@return string  unit: 'km','m','mi','ft'
---@return string  system 'metric' or 'imperial'
---@return boolean  large unit used
function translateDistance(value, big) end

--- Converts a speed in m/s to the setting's unit: km/h or m/s (metric), mph or ft/s (imperial). big=true multiplies the value by 3600 for the large units.
---Source: lua/ge/ge_utils.lua:1511
---@param value number speed in m/s
---@param big boolean|string|nil true for km/h or mph (value x3600 after distance conversion); otherwise m/s or ft/s
---@return number  converted value
---@return string  unit
---@return string  system
---@return boolean|string  big as passed
function translateVelocity(value, big) end

--- Returns a function _anon(via core_jobsystem.wrap) that, once called, runs func in a job; with waitForCleanup, waits 3 render frames to let GPU resources be freed.
---Source: lua/ge/ge_utils.lua:81
---@param logTag string log tag
---@param startType string log message text
---@param func function function to run after the wait
---@param waitForCleanup boolean wait 3 frames before running func
---@return function  wrapper function to call to start the job
function triggerDelayedStartGenerator(logTag, startType, func, waitForCleanup) end

--- Normalizes a color (string or table of 4 values) into a string 'r g b a' with 2 decimals; default '1 1 1 1'.
---Source: lua/ge/ge_utils.lua:1003
---@param color string|table|nil color
---@return string  normalized string
function validateVehicleDataColor(color) end

--- Fills a paint table with the missing default values (modifies and returns the table).
---Source: lua/ge/ge_utils.lua:972
---@param paint table paint
---@return table  validated paint
function validateVehiclePaint(paint) end

--- Extracts metallic, roughness, clearcoat, clearcoatRoughness from elements 5 to 8 of a color array.
---Source: lua/ge/ge_utils.lua:985
---@param colorTable table array of 8 numbers
---@return number  metallic
---@return number  roughness
---@return number  clearcoat
---@return number  clearcoatRoughness
function vehicleMetallicPaintDataFromColor(colorTable) end

--- Formats 4 values into a string 'metallic roughness clearcoat clearcoatRoughness'.
---Source: lua/ge/ge_utils.lua:998
---@param metallic number metallic
---@param roughness number roughness
---@param clearcoat number clearcoat
---@param clearcoatRoughness number clearcoatRoughness
---@return string  string
function vehicleMetallicPaintString(metallic, roughness, clearcoat, clearcoatRoughness) end

--- Places a vehicle at a position and rotation (quaternion). Logs an error if the vehicle does not exist.
---Source: lua/ge/ge_utils.lua:459
---@param id integer vehicle id
---@param px number x (m)
---@param py number y (m)
---@param pz number z (m)
---@param rx number quaternion x
---@param ry number quaternion y
---@param rz number quaternion z
---@param rw number quaternion w
function vehicleSetPositionRotation(id, px, py, pz, rx, ry, rz, rw) end

--- Generic iterator over all vehicles: for id, veh in vehiclesIterator() do ... end.
---Source: lua/ge/ge_utils.lua:541
---@param ctx table|nil reusable context to avoid allocation
---@return function  iterator
---@return table  context
function vehiclesIterator(ctx) end

---@type table
TorqueScriptLua = nil
---@type any
scenetree = nil
---@type any
serializeJsonToFile = nil

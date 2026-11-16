---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/testDrive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Test drive of a vehicle at a dealership in career. start() puts the player in the vehicle, creates a snapshot of the part conditions (key "beforeTestDrive"), disables autosave and activates the test drive. Each frame, onUpdate counts down the time limit (timeLimit), checks that the player stays within 10 m of the vehicle (otherwise abandon with fees) and detects damage every 2 s. stop() brings the vehicle back to the starting point with a fade and puts the player back on foot.
--- Access: extension `career_modules_testDrive`: `extensions.load("career_modules_testDrive")`, then the global `career_modules_testDrive`
---@class career_modules_testDrive
---@field dependencies table Empty table: no dependency.
career_modules_testDrive = {}

--- Abandons the test drive (no effect if inactive): deactivates the test drive, re-enables autosave, then after 0.2 s displays and pays any abandon fees, resets the data and notifies inspectVehicle.
---Source: lua/ge/extensions/career/modules/testDrive.lua:217
function career_modules_testDrive.abandonTestDrive() end

--- Adds to elements the test drive end POI (id testDrive-<dealership>-<route>-parkingEnd, parking marker and big map marker) if an end spot exists and was created.
---Source: lua/ge/extensions/career/modules/testDrive.lua:279
---@param elements table[] List of raw POIs to fill.
function career_modules_testDrive.formatTestDriveToRawPoi(elements) end

--- Remaining test drive time in seconds (nil if there is no test drive or no limit).
---Source: lua/ge/extensions/career/modules/testDrive.lua:266
---@return number|nil  Remaining seconds.
function career_modules_testDrive.getTimeLeft() end

--- Indicates whether a test drive is in progress.
---Source: lua/ge/extensions/career/modules/testDrive.lua:270
---@return boolean|nil  true if active.
function career_modules_testDrive.isActive() end

--- Indicates whether damage was detected on the vehicle during the test drive (detection by career_modules_insurance_insurance.genericVehNeedsRepair).
---Source: lua/ge/extensions/career/modules/testDrive.lua:274
---@return boolean  true if damage detected.
function career_modules_testDrive.isDamageDetected() end

--- Hook before the radial menu opens: once only, adds a "stop the test drive" entry (visible only during a test drive) to the quick menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/testDrive.lua:322
function career_modules_testDrive.onBeforeRadialOpened() end

--- Hook: resets the test drive data when the career is activated.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/testDrive.lua:316
---@param active boolean Nothing if false.
function career_modules_testDrive.onCareerActive(active) end

--- POI list hook: adds the test drive end POI via formatTestDriveToRawPoi.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/testDrive.lua:294
---@param levelIdentifier string Level (unused).
---@param elements table[] POI list to complete.
function career_modules_testDrive.onGetRawPoiListForLevel(levelIdentifier, elements) end

--- POI detail open hook: if it is the testDriveEnd POI, adds a "stop the test drive" button calling stop(false).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/testDrive.lua:298
---@param elemData table[] POI elements.
---@param promptData table[] Buttons to fill.
function career_modules_testDrive.onPoiDetailPromptOpening(elemData, promptData) end

--- Frame hook: if a test drive is active, handles the time limit, the player moving away and damage detection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/testDrive.lua:252
---@param dtReal number Real time (s).
---@param dtSim number Simulation time (s).
---@param dtRaw number Raw time (s).
function career_modules_testDrive.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook called after an insurance repair: displays the repair cost after 1.8 s (real-time message and purchase sound).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/testDrive.lua:203
---@param amount number Repair amount.
function career_modules_testDrive.onVehicleRepairedByInsurance(amount) end

--- Deactivates the test drive and clears the raw POIs.
---Source: lua/ge/extensions/career/modules/testDrive.lua:55
function career_modules_testDrive.resetData() end

--- Starts the test drive: copies testDriveInfo, puts the player in the vehicle, remembers its starting position/rotation, creates and selects the beforeTestDrive parts snapshot, unfreezes the vehicle, emits onTestDriveStarted, clears the raw POIs and disables autosave.
---Source: lua/ge/extensions/career/modules/testDrive.lua:111
---@param _vehicleId integer Object id of the test drive vehicle.
---@param testDriveInfo table Test drive parameters (timeLimit, abandonFees, endParkingSpot, dealershipName, route...).
function career_modules_testDrive.start(_vehicleId, testDriveInfo) end

--- Ends the test drive normally (no effect if inactive): re-enables autosave and launches the end job that teleports the vehicle to the start with a fade.
---Source: lua/ge/extensions/career/modules/testDrive.lua:207
---@param userAborted boolean|nil Emits onGameplayActivityAborted unless false.
function career_modules_testDrive.stop(userAborted) end


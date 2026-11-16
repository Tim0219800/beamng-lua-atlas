---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Entry point of career mode. It activates and deactivates the career: loads the level (west_coast_usa by default, or the one from the save), loads all modules in lua/ge/extensions/career/modules/ (except /tutorial/step), blocks certain input actions (vehicleTeleporting, vehicleMenues, physicsControls, aiControls…), shows an imgui debug menu, handles the starting modes (startingModes), the starter vehicle, interactions with organizations, the profile/save list sent to the UI and the saving of general.json (level, starting options, boughtStarterVehicle, organizationInteraction).
--- Access: extension `career_career`: `extensions.load("career_career")`, then the global `career_career`
---@class career_career
---@field dependencies string[] career_saveSystem, core_recoveryPrompt, gameplay_traffic.
---@field startingOptions table Starting options of the game (e.g. startMode), coming from createOrLoadCareerAndStart or from the save.
---@field tutorialEnabled boolean True during the career tutorial (see notes).
career_career = {}

--- Activates the career for the current profile (career_saveSystem.getCurrentProfile): no effect if already active or without a profile. Loads the level and the modules (see notes).
---Source: lua/ge/extensions/career/career.lua:257
---@param removeVehicles boolean|nil Remove all vehicles from the already loaded level; true by default.
function career_career.activateCareer(removeVehicles) end

--- Closes the menus by navigating to the "play" screen.
---Source: lua/ge/extensions/career/career.lua:715
function career_career.closeAllMenus() end

--- Selects (or creates) a save profile with career_saveSystem.setProfile then activates the career with the given starting options.
---Source: lua/ge/extensions/career/career.lua:342
---@param name string Profile name.
---@param specificAutosave string|nil Name of a specific autosave to load.
---@param startingOptions table|nil Starting options (copied).
---@return boolean  false if the profile could not be selected.
function career_career.createOrLoadCareerAndStart(name, specificAutosave, startingOptions) end

--- Deactivates the career: unloads the modules, unblocks the actions, resets the freeroam recovery values and hides the task list.
---Source: lua/ge/extensions/career/career.lua:317
---@param saveCareer boolean|nil Not used.
function career_career.deactivateCareer(saveCareer) end

--- Deactivates the career then restarts the current level in freeroam.
---Source: lua/ge/extensions/career/career.lua:332
---@param saveCareer boolean|nil Passed to deactivateCareer.
function career_career.deactivateCareerAndReloadLevel(saveCareer) end

--- Buttons added to the pause menu: map (or "my load" during delivery), progress (if the starter vehicle is bought and outside the tutorial), certification cancellation, road test cancellation.
---Source: lua/ge/extensions/career/career.lua:728
---@return table[]  Buttons {label, luaFun, showIndicator?}.
function career_career.getAdditionalMenuButtons() end

--- For each save folder of the profile, returns the content of playerAttributes.json with id and autosaveName.
---Source: lua/ge/extensions/career/career.lua:599
---@param profile string Profile name.
---@return table[]  Attributes of each autosave.
function career_career.getAutosavesForProfile(profile) end

--- Computes the BeamXP level: thresholds 0, 100, 300, 600, 1000. Returns -1 for the progress values if there is no next level.
---Source: lua/ge/extensions/career/career.lua:451
---@param xp number BeamXP value.
---@return integer  Level (1 to 5).
---@return number  Progress within the current level (-1 at the maximum).
---@return number  Threshold required for the next level (-1 at the maximum).
function career_career.getBeamXPLevel(xp) end

--- Returns the full definition of the current game's starting mode (startingOptions.startMode), or nil.
---Source: lua/ge/extensions/career/career.lua:398
---@return table|nil  Starting mode data.
function career_career.getCurrentStartingModeData() end

--- Returns the list of a profile's save folders with what the UI needs to choose (name, dates, version, corrupted, isCurrent, incompatibleVersion, outdatedVersion, money, beamXP, vehicleCount), sorted from newest to oldest.
---Source: lua/ge/extensions/career/career.lua:614
---@param profile string|nil Profile name; empty list if nil.
---@return table[]  Save folders.
function career_career.getSaveFoldersForProfile(profile) end

--- Lists the starting modes (*.lua files of lua/ge/extensions/career/startingModes/ run by dofile, except those with ignore) and returns for the UI: id, order, tier, title, description, image, tag, sorted by order then id.
---Source: lua/ge/extensions/career/career.lua:359
---@return table[]  Starting modes.
function career_career.getStartingModeOptions() end

--- Indicates whether the player has bought their starter vehicle.
---Source: lua/ge/extensions/career/career.lua:688
---@return boolean|nil  Result.
function career_career.hasBoughtStarterVehicle() end

--- Indicates whether the player has already interacted with an organization.
---Source: lua/ge/extensions/career/career.lua:692
---@param id string Organization identifier.
---@return boolean|nil  true if already interacted.
function career_career.hasInteractedWithOrganization(id) end

--- Notes that the player has interacted with an organization (saved in general.json).
---Source: lua/ge/extensions/career/career.lua:696
---@param id string Organization identifier.
function career_career.interactWithOrganization(id) end

--- Indicates whether the career is active.
---Source: lua/ge/extensions/career/career.lua:338
---@return boolean  true if active.
function career_career.isActive() end

--- Indicates whether autosave is allowed.
---Source: lua/ge/extensions/career/career.lua:720
---@return boolean  State.
function career_career.isAutosaveEnabled() end

--- Challenge state change hook: blocks the input actions when it stops ("stopped") and unblocks them when it starts ("started").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:677
---@param state string "started" or "stopped".
---@param mission table|nil Challenge concerned.
function career_career.onAnyMissionChanged(state, mission) end

--- Hook called before changing profile: deactivates the career if it is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:438
---@param currentSavePath string Current save folder.
function career_career.onBeforeSetProfile(currentSavePath) end

--- Camera mode change hook: updates the nodegrabber blocking if the career is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:69
---@param modeName string Mode name.
function career_career.onCameraModeChanged(modeName) end

--- onCareerActive hook received by this module itself (emitted by initAfterLevelLoad and deactivateCareer). On activation: applies the career or tutorial recovery values, clears the task list and raw POIs, installs M.onUpdate (debug menu), blocks the input actions and sets the game state to "career". Does nothing if active is false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:158
---@param active boolean true on activation.
function career_career.onCareerActive(active) end

--- End-of-level hook: deactivates the career if the level is west_coast_usa.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:654
---@param levelPath string Path of the level that is ending.
function career_career.onClientEndMission(levelPath) end

--- Hook after a level starts: runs the career's deferred initialization (emits onCareerActive(true, newSave)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:240
function career_career.onClientPostStartMission() end

--- Post-reload hook: reactivates the career (activateCareer(false)) if v.reactivate.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:671
---@param v table Data from onSerialize.
function career_career.onDeserialized(v) end

--- Global camera change hook: updates the nodegrabber blocking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:74
---@param modeName string Mode name.
function career_career.onGlobalCameraSet(modeName) end

--- Navigates to "play" exactly once, at the end of the loading screen fade that follows the activation (the router resends the request until the UI confirms).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:250
function career_career.onLoadingScreenFadeout() end

--- Profile save hook: writes career/general.json (level, startingOptions, boughtStarterVehicle, organizationInteraction, debug window states).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:417
---@param currentSavePath string Save folder.
function career_career.onSaveCurrentProfile(currentSavePath) end

--- Extension reload hook: deactivates the career and notes reactivate = true if it was active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:662
---@return table  Data ({reactivate = true} if active).
function career_career.onSerialize() end

--- Hook for adding a vehicle to the inventory: marks the starter vehicle as bought (immediate save) and unlocks the FIRST_SET_OF_KEYS achievement for an instant purchase at apmStarterVehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/career.lua:701
---@param data table Contains purchaseData and vehicleInfo.
function career_career.onVehicleAddedToInventory(data) end

--- Builds the info of each profile (money, beamXP, vouchers, insurance score, "apm" branches, current vehicle, vehicle count, versions) and sends it to the UI via guihooks "allCareerProfiles"; sorts by creationDate.
---Source: lua/ge/extensions/career/career.lua:569
---@return table[]  Profile data.
function career_career.sendAllCareerProfilesData() end

--- Returns the info of the current profile (same format as a profile from sendAllCareerProfilesData). Nil if the career is not active.
---Source: lua/ge/extensions/career/career.lua:591
---@return table|nil  Profile data.
function career_career.sendCurrentProfileData() end

--- Enables or disables autosave.
---Source: lua/ge/extensions/career/career.lua:724
---@param enabled boolean New state.
function career_career.setAutosaveEnabled(enabled) end

--- Enables or disables the career's imgui debug menu.
---Source: lua/ge/extensions/career/career.lua:749
---@param enabled boolean New state.
function career_career.setDebugMenuEnabled(enabled) end


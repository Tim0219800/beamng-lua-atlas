---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `career_career` : `extensions.load("career_career")`, puis la globale `career_career`
---@class career_career
---@field dependencies table
---@field startingOptions table
---@field tutorialEnabled boolean
career_career = {}

---Source : lua/ge/extensions/career/career.lua:257
---@param removeVehicles any
function career_career.activateCareer(removeVehicles) end

---Source : lua/ge/extensions/career/career.lua:715
function career_career.closeAllMenus() end

---Source : lua/ge/extensions/career/career.lua:342
---@param name any
---@param specificAutosave any
---@param startingOptions any
function career_career.createOrLoadCareerAndStart(name, specificAutosave, startingOptions) end

---Source : lua/ge/extensions/career/career.lua:317
---@param saveCareer any
function career_career.deactivateCareer(saveCareer) end

---Source : lua/ge/extensions/career/career.lua:332
---@param saveCareer any
function career_career.deactivateCareerAndReloadLevel(saveCareer) end

---Source : lua/ge/extensions/career/career.lua:728
function career_career.getAdditionalMenuButtons() end

---Source : lua/ge/extensions/career/career.lua:599
---@param profile any
function career_career.getAutosavesForProfile(profile) end

---Source : lua/ge/extensions/career/career.lua:451
---@param xp any
function career_career.getBeamXPLevel(xp) end

---Source : lua/ge/extensions/career/career.lua:398
function career_career.getCurrentStartingModeData() end

--- Returns the list of save folders (autosaves) for a profile with enough info
---  for the UI to display and let the player pick one to load.
---Source : lua/ge/extensions/career/career.lua:614
---@param profile any
function career_career.getSaveFoldersForProfile(profile) end

---Source : lua/ge/extensions/career/career.lua:359
function career_career.getStartingModeOptions() end

---Source : lua/ge/extensions/career/career.lua:688
function career_career.hasBoughtStarterVehicle() end

---Source : lua/ge/extensions/career/career.lua:692
---@param id any
function career_career.hasInteractedWithOrganization(id) end

---Source : lua/ge/extensions/career/career.lua:696
---@param id any
function career_career.interactWithOrganization(id) end

---Source : lua/ge/extensions/career/career.lua:338
function career_career.isActive() end

---Source : lua/ge/extensions/career/career.lua:720
function career_career.isAutosaveEnabled() end

---Source : lua/ge/extensions/career/career.lua:677
---@param state any
---@param mission any
function career_career.onAnyMissionChanged(state, mission) end

---Source : lua/ge/extensions/career/career.lua:438
---@param currentSavePath any
function career_career.onBeforeSetProfile(currentSavePath) end

---Source : lua/ge/extensions/career/career.lua:69
---@param modeName any
function career_career.onCameraModeChanged(modeName) end

---Source : lua/ge/extensions/career/career.lua:158
---@param active any
function career_career.onCareerActive(active) end

---Source : lua/ge/extensions/career/career.lua:654
---@param levelPath any
function career_career.onClientEndMission(levelPath) end

---Source : lua/ge/extensions/career/career.lua:240
function career_career.onClientPostStartMission() end

---Source : lua/ge/extensions/career/career.lua:671
---@param v any
function career_career.onDeserialized(v) end

---Source : lua/ge/extensions/career/career.lua:74
---@param modeName any
function career_career.onGlobalCameraSet(modeName) end

--- Navigate to "play" exactly once, when the loading screen fades out after this activation.
---  The router keeps resending the route change until the UI reports navigation started, so we
---  only gate on the loading screen fade-out here.
---Source : lua/ge/extensions/career/career.lua:250
function career_career.onLoadingScreenFadeout() end

---Source : lua/ge/extensions/career/career.lua:417
---@param currentSavePath any
function career_career.onSaveCurrentProfile(currentSavePath) end

---Source : lua/ge/extensions/career/career.lua:662
function career_career.onSerialize() end

---Source : lua/ge/extensions/career/career.lua:701
---@param data any
function career_career.onVehicleAddedToInventory(data) end

---Source : lua/ge/extensions/career/career.lua:569
function career_career.sendAllCareerProfilesData() end

---Source : lua/ge/extensions/career/career.lua:591
function career_career.sendCurrentProfileData() end

---Source : lua/ge/extensions/career/career.lua:724
---@param enabled any
function career_career.setAutosaveEnabled(enabled) end

---Source : lua/ge/extensions/career/career.lua:749
---@param enabled any
function career_career.setDebugMenuEnabled(enabled) end


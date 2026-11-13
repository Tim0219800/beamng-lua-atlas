---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/setup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_tutorial_setup` : `extensions.load("gameplay_tutorial_setup")`, puis la globale `gameplay_tutorial_setup`
---@class gameplay_tutorial_setup
---@field blockedActions table
---@field blockedActionsTemplates table
---@field loadingScreenFadeoutComplete boolean
---@field outOfBoundsSystemActive boolean
---@field tutorialSites any
---@field tutorialVehicleId any
---@field vehicleSetupComplete boolean
gameplay_tutorial_setup = {}

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:39
function gameplay_tutorial_setup.activateOutOfBoundsSystem() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:115
function gameplay_tutorial_setup.cleanup() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:31
function gameplay_tutorial_setup.isOutOfBoundsResetAllowed() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:144
function gameplay_tutorial_setup.loadTutorialSites() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:195
function gameplay_tutorial_setup.onLoadingScreenFadeout() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:339
---@param state any
function gameplay_tutorial_setup.onScreenFadeState(state) end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:353
function gameplay_tutorial_setup.placePlayerAtDragStart() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:376
function gameplay_tutorial_setup.placePlayerBackInTutorialVehicle() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:288
function gameplay_tutorial_setup.placePlayerBackToParkingStart() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:322
function gameplay_tutorial_setup.runCurrentStepOutOfBoundsReset() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:315
---@param resetCallback any
function gameplay_tutorial_setup.runOutOfBoundsResetWithFade(resetCallback) end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:69
---@param prefabStates any
function gameplay_tutorial_setup.setActivePrefabs(prefabStates) end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:27
---@param allowed any
function gameplay_tutorial_setup.setOutOfBoundsResetAllowed(allowed) end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:35
---@param resetCallback any
function gameplay_tutorial_setup.setOutOfBoundsResetHandler(resetCallback) end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:390
function gameplay_tutorial_setup.setupBlockedActions() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:199
function gameplay_tutorial_setup.setupPlayer() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:189
function gameplay_tutorial_setup.setupVehicles() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:331
function gameplay_tutorial_setup.showOutOfBoundsWarning() end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:43
---@param prefabPath any
---@param pos any
---@param rot any
---@param name any
function gameplay_tutorial_setup.spawnPrefab(prefabPath, pos, rot, name) end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:223
---@param thenFunction any
function gameplay_tutorial_setup.spawnTutorialVehicle(thenFunction) end

---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:281
function gameplay_tutorial_setup.unblockGearActions() end


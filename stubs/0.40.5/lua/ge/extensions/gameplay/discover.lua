---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/discover.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_discover` : `extensions.load("gameplay_discover")`, puis la globale `gameplay_discover`
---@class gameplay_discover
---@field dependencies table
gameplay_discover = {}

---Source : lua/ge/extensions/gameplay/discover.lua:437
function gameplay_discover.basicControlsIntroPopup() end

---Source : lua/ge/extensions/gameplay/discover.lua:523
---@param minPlayers any
---@param maxPlayers any
function gameplay_discover.canStartSplitscreenDiscover(minPlayers, maxPlayers) end

---Source : lua/ge/extensions/gameplay/discover.lua:369
function gameplay_discover.clearTasksOnClientEndMission() end

---Source : lua/ge/extensions/gameplay/discover.lua:500
---@param deviceId any
---@param operation any
---@param direction any
function gameplay_discover.cycleSplitscreenDevicePlayer(deviceId, operation, direction) end

---Source : lua/ge/extensions/gameplay/discover.lua:213
function gameplay_discover.getDiscoverPages() end

---Source : lua/ge/extensions/gameplay/discover.lua:519
function gameplay_discover.getSplitscreenOptedInPlayers() end

---Source : lua/ge/extensions/gameplay/discover.lua:496
function gameplay_discover.getSplitscreenPlayerOptIns() end

---Source : lua/ge/extensions/gameplay/discover.lua:466
---@param id any
function gameplay_discover.introPopup(id) end

---Source : lua/ge/extensions/gameplay/discover.lua:511
---@param groupId any
function gameplay_discover.joinSplitscreenDeviceGroup(groupId) end

---Source : lua/ge/extensions/gameplay/discover.lua:527
function gameplay_discover.leaveSplitscreenMenuSetup() end

--- -- use this to get the position, rotation and partConfig of all vehicles
--- for id in activeVehiclesIterator() do local veh = scenetree.findObjectById(id) print(veh) dump({veh:getPosition(), quatFromDir(veh:getDirectionVector(), veh:getDirectionVectorUp()), veh.jbeam, veh.partConfig}) end
---Source : lua/ge/extensions/gameplay/discover.lua:125
function gameplay_discover.loadDiscovers() end

---Source : lua/ge/extensions/gameplay/discover.lua:386
---@param extensionName any
function gameplay_discover.loadExt(extensionName) end

---Source : lua/ge/extensions/gameplay/discover.lua:350
function gameplay_discover.navigateToPostLoadRoute() end

---Source : lua/ge/extensions/gameplay/discover.lua:375
function gameplay_discover.onClientEndMission() end

--- can be started with -discover <discoverName>
---  -discover firstStart replays the first-launch onboarding popup in the main menu instead
---Source : lua/ge/extensions/gameplay/discover.lua:420
function gameplay_discover.onInit() end

---Source : lua/ge/extensions/gameplay/discover.lua:152
function gameplay_discover.onLanguageChanged() end

---Source : lua/ge/extensions/gameplay/discover.lua:350
function gameplay_discover.onLoadingScreenFadeout() end

---Source : lua/ge/extensions/gameplay/discover.lua:507
---@param deviceId any
---@param personaNumber any
function gameplay_discover.setSplitscreenDevicePlayer(deviceId, personaNumber) end

---Source : lua/ge/extensions/gameplay/discover.lua:515
---@param player any
---@param optedIn any
function gameplay_discover.setSplitscreenPlayerOptIn(player, optedIn) end

---Source : lua/ge/extensions/gameplay/discover.lua:285
---@param discoverId any
function gameplay_discover.startDiscover(discoverId) end


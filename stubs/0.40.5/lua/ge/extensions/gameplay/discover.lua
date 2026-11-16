---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/discover.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the "discovers" (experiences of the Discover/Play screen). It loads all *.lua files in /gameplay/discover/: each one can export pageInfo (page with sections and discoverIds), experiences (list of experiences with id, type 'mission' or 'freeroam', trigger, onLoaded, onUnloaded, playerCount...) and getProgressTag. getDiscoverPages assembles the pages for the UI (cards, images, official/mod/players/duration tags), startDiscover starts an experience (mission or trigger function), and the module handles navigation after the loading fade, intro popups and the split screen configuration (splitscreen).
--- Access: extension `gameplay_discover`: `extensions.load("gameplay_discover")`, then the global `gameplay_discover`
---@class gameplay_discover
---@field dependencies table<integer, string> Extensions loaded beforehand: {'ui_multiseat_multiseatConfiguration'}.
gameplay_discover = {}

--- Shows the basic controls intro window, choosing the first existing basicDriving_<imagePack> popup according to the detected devices (wheel, joystick, xinput, gamepad, mouse, keyboard, then fallback).
---Source: lua/ge/extensions/gameplay/discover.lua:437
function gameplay_discover.basicControlsIntroPopup() end

--- Indicates whether the experience can start with the number of signed-up players.
---Source: lua/ge/extensions/gameplay/discover.lua:523
---@param minPlayers integer Minimum number of players.
---@param maxPlayers integer Maximum number of players.
---@return boolean  Result of canStartWithOptIns (inferred from code).
function gameplay_discover.canStartSplitscreenDiscover(minPlayers, maxPlayers) end

--- Requests that the UI event 'ClearTasklist' be sent at the next level end.
---Source: lua/ge/extensions/gameplay/discover.lua:369
function gameplay_discover.clearTasksOnClientEndMission() end

--- Changes the player associated with a device: 'toggle' switches, 'move' moves according to direction, otherwise moves to the next player.
---Source: lua/ge/extensions/gameplay/discover.lua:500
---@param deviceId any Device identifier.
---@param operation string|nil 'toggle', 'move' or other to cycle.
---@param direction any Direction for 'move'.
---@return any  Result of the splitscreen module function.
function gameplay_discover.cycleSplitscreenDevicePlayer(deviceId, operation, direction) end

--- Builds the list of pages for the UI: each page is copied, its sections filled with cards (formatDiscover), the tags (players, version, duration, type, progress, official, mod) added, the image chosen, then everything is sorted by descending date then sortBias.
---Source: lua/ge/extensions/gameplay/discover.lua:213
---@return table[]  Pages with title, image, description, sections[].cards[], tagList, pageKind ('minor' by default), date, version, duration, isOfficial, isMod, modID, modName, modTitle, showMultiseatControllers.
function gameplay_discover.getDiscoverPages() end

--- Lists the players signed up to split screen.
---Source: lua/ge/extensions/gameplay/discover.lua:519
---@return any  Signed-up players (inferred from code).
function gameplay_discover.getSplitscreenOptedInPlayers() end

--- Returns the sign-up state of players in split screen (module gameplay/discover/multiseat/splitscreen).
---Source: lua/ge/extensions/gameplay/discover.lua:496
---@return table  Sign-up state (inferred from code).
function gameplay_discover.getSplitscreenPlayerOptIns() end

--- Opens an intro popup (/gameplay/discover/popups/<id>/content.json) via ui_popup, only once per id and per session.
---Source: lua/ge/extensions/gameplay/discover.lua:466
---@param id string Popup identifier.
function gameplay_discover.introPopup(id) end

--- Makes a device group join the split screen configuration.
---Source: lua/ge/extensions/gameplay/discover.lua:511
---@param groupId any Group identifier.
---@return any  Result of the splitscreen module function.
function gameplay_discover.joinSplitscreenDeviceGroup(groupId) end

--- Leaves the menu's split screen configuration.
---Source: lua/ge/extensions/gameplay/discover.lua:527
---@return any  Result of the splitscreen module function.
function gameplay_discover.leaveSplitscreenMenuSetup() end

--- Loads all /gameplay/discover/*.lua files once: registers their pageInfo (with folder and official/mod metadata), their experiences by id and their progress tags. Called automatically by getDiscoverPages and startDiscover.
---Source: lua/ge/extensions/gameplay/discover.lua:125
function gameplay_discover.loadDiscovers() end

--- Loads an extension only once (extensions.load) and, if the current experience has onUnloaded, wraps the extension's onExtensionUnloaded to call onUnloaded when it is unloaded.
---Source: lua/ge/extensions/gameplay/discover.lua:386
---@param extensionName string Name of the extension to load.
function gameplay_discover.loadExt(extensionName) end

--- Releases lastDiscover and, if a navigation was pending, opens the end-of-loading UI route (playRoute or 'play'), unless a mission start/end screen is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/discover.lua:350
---@return boolean  true if the navigation took place.
function gameplay_discover.navigateToPostLoadRoute() end

--- Hook called at the end of a level: resets the navigation if no experience is loading, and empties the task list if requested.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/discover.lua:375
function gameplay_discover.onClientEndMission() end

--- Initialization hook: sets the unload mode to manual and handles the command line arguments -discover <id> and -discover firstStart.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/discover.lua:420
function gameplay_discover.onInit() end

--- Hook called on language change: forgets the loaded experiences so they are reloaded (translations).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/discover.lua:152
function gameplay_discover.onLanguageChanged() end

--- Hook called at the loading screen fade-out; same function as navigateToPostLoadRoute.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/discover.lua:350
---@return boolean  true if the navigation took place.
function gameplay_discover.onLoadingScreenFadeout() end

--- Associates a device with a player (persona).
---Source: lua/ge/extensions/gameplay/discover.lua:507
---@param deviceId any Device identifier.
---@param personaNumber integer Player number.
---@return any  Result of the splitscreen module function.
function gameplay_discover.setSplitscreenDevicePlayer(deviceId, personaNumber) end

--- Signs a player up to or out of split screen.
---Source: lua/ge/extensions/gameplay/discover.lua:515
---@param player integer Player index.
---@param optedIn boolean true to sign up.
---@return any  Result of the splitscreen module function.
function gameplay_discover.setSplitscreenPlayerOptIn(player, optedIn) end

--- Starts an experience by id. For a mission (missionId), starts via gameplay_missions_missionManager.startWithLoadingLevel; for an experience with a trigger function, calls trigger(M) then onLoaded(M). First validates the split screen configuration if playerCount is set.
---Source: lua/ge/extensions/gameplay/discover.lua:285
---@param discoverId string Experience id (id key in experiences).
---@return boolean|nil  false if the split screen configuration is invalid; nil otherwise (even on failure or success).
function gameplay_discover.startDiscover(discoverId) end


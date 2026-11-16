---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markerInteraction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages every frame (onPreRender) the display and interaction of mission/activity markers in freeroam and career: selects the clusters of nearby markers (radius 100 m) via the gameplay_playmodeMarkers quadtree, displays them, updates their ground decals, and opens the activity acceptance window when the player is stopped (less than 1 km/h, with hysteresis up to 3 km/h) or on foot in a zone. Also handles clearing the guidance on arrival (less than 7 m), single-screen multiplayer mode (multiseat) and mission formatting for the UI. The old mission launch functions are deprecated.
--- Access: extension `gameplay_markerInteraction`: `extensions.load("gameplay_markerInteraction")`, then the global `gameplay_markerInteraction`
---@class gameplay_markerInteraction
---@field abandonCurrent nil Always nil: reference to an undefined local variable.
---@field dependencies string[] gameplay_missions_missions, gameplay_missions_missionManager, freeroam_bigMapMode, gameplay_playmodeMarkers, freeroam_bigMapPoiProvider, ui_missionInfo.
---@field getClusterMarker nil Always nil: reference to an undefined local variable.
---@field restartCurrent nil Always nil: reference to an undefined local variable.
gameplay_markerInteraction = {}

--- Deprecated: logs an error and a stack trace.
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:138
---@param id string Mission ID (ignored).
---@param settings table Ignored.
function gameplay_markerInteraction.changeUserSettings(id, settings) end

--- Forces the acceptance window to be re-evaluated on the next pass.
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:651
function gameplay_markerInteraction.clearCache() end

--- If force is true, closes the acceptance window, sends onMissionAvailabilityChanged with missionCount = 0 to the UI and the extensions.
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:211
---@param force boolean|nil Without true, does nothing.
function gameplay_markerInteraction.closeViewDetailPrompt(force) end

--- Formats the missions of the current interactive elements for the UI, sorted by gameplay_missions_unlocks.depthIdSort.
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:114
---@return table[]|nil  List of formatted missions, or nil.
function gameplay_markerInteraction.formatDataForUi() end

--- Builds a mission's data table for the UI (name, description, preview, settings, attributes, progress, unlocks, context buttons).
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:66
---@param m table Mission object.
---@return table  Mission information formatted for the interface.
function gameplay_markerInteraction.formatMission(m) end

--- Returns the list of currently interactive elements (those of the open acceptance window).
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:61
---@return table[]  Marker interaction elements.
function gameplay_markerInteraction.getCurrentInteractableElements() end

--- Returns the mission screen data via gameplay_missions_missionScreen.getMissionScreenData().
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:149
---@param fromMissionMenu boolean|nil Not used.
---@return table  Mission screen data.
function gameplay_markerInteraction.getGameContext(fromMissionMenu) end

--- Hook: on any mission state change, forces the POIs to be sent again; at start (state == "started"), deselects the big map, removes the focuses and closes the acceptance window if open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:666
---@param state string Mission state (for example "started").
function gameplay_markerInteraction.onAnyMissionChanged(state) end

--- Level end hook: forgets the navigation POI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:685
---@param levelPath string Level path.
function gameplay_markerInteraction.onClientEndMission(levelPath) end

--- Hook: resets the marker focuses then stores the POI being navigated to.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:678
---@param poiId string ID of the target POI.
function gameplay_markerInteraction.onNavigateToMission(poiId) end

--- Pre-render hook, every frame: if the game state has play mode markers, handles arrival at the target, guidance and calls the display of the current level's mission markers; otherwise clears gameplay_playmodeMarkers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:603
---@param dtReal number Real-time delta in seconds.
---@param dtSim number Simulation time delta in seconds.
function gameplay_markerInteraction.onPreRender(dtReal, dtSim) end

--- Called by the UI when the player chooses an entry of the acceptance window: closes the dialog, clears ActivityAcceptUpdate and executes the chosen entry's buttonFun.
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:199
---@param idx integer Index of the entry (1-based) in promptData.
function gameplay_markerInteraction.onSelectDetailPromptClicked(idx) end

--- Settings change hook: re-reads the resolution (GFXDevice.getVideoMode) and the aspect ratio.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:221
function gameplay_markerInteraction.onSettingsChanged() end

--- Hook: on entering play mode (enteredPlay true), forces the acceptance window to be re-evaluated.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:713
---@param enteredPlay boolean true if the UI switches to play mode.
function gameplay_markerInteraction.onUIPlayStateChanged(enteredPlay) end

--- Forces the acceptance window to be re-evaluated on the next frame.
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:709
function gameplay_markerInteraction.setForceReevaluateOpenPrompt() end

--- Temporarily shows or hides all markers (except the focused cluster).
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:689
---@param visible boolean true to show.
function gameplay_markerInteraction.setMarkersVisibleTemporary(visible) end

--- Stores a preselected mission ID (the variable is not read anywhere in this file).
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:144
---@param mId string|nil Mission ID.
function gameplay_markerInteraction.setPreselectedMissionId(mId) end

--- To be called when the marker display setting changes: clears the raw POIs (gameplay_rawPois.clear) and forces the big map POIs to be sent again.
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:660
---@param active boolean New state (unused).
function gameplay_markerInteraction.showMissionMarkersToggled(active) end

--- Enables a local flag skipIconFading reset to false at the end of the next frame (no read in this file).
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:656
function gameplay_markerInteraction.skipNextIconFading() end

--- Deprecated: logs an error and a stack trace, starts nothing.
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:128
---@param id string Mission ID (ignored).
---@param userSettings table|nil Ignored.
---@param startingOptions table|nil Ignored.
function gameplay_markerInteraction.startMissionById(id, userSettings, startingOptions) end

--- Deprecated: logs an error and a stack trace.
---Source: lua/ge/extensions/gameplay/markerInteraction.lua:133
---@param id string Mission ID (ignored).
---@param force boolean|nil Ignored.
function gameplay_markerInteraction.stopMissionById(id, force) end


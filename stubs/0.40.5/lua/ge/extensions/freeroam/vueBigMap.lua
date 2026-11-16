---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/vueBigMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lua backend of the big map in the Vue UI: prepares for the UI the list of points of interest (POIs: missions, garages, stations, dealerships, dragstrips, spawn points, the player's vehicle...), the filters and groups of the side list, the game state, and relays the UI's actions (selection, hover, navigation, panning, execution of POI actions) to freeroam_bigMapMode. The data is cached on opening (enterBigMap) and freed on closing (exitBigMap). UI-side calls go through bngApi.engineLua (see the file's header comment); Lua -> Vue goes through guihooks.trigger('showPoiDetails', {poiIds, ignoreReduction}). Depends on gameplay_missions_missions, freeroam_bigMapMode, gameplay_rawPois, gameplay_missions_missionScreen. Global: freeroam_vueBigMap.
--- Access: extension `freeroam_vueBigMap`: `extensions.load("freeroam_vueBigMap")`, then the global `freeroam_vueBigMap`
---@class freeroam_vueBigMap
---@field actionFunctions table<integer, function> POI action callbacks, by id.
---@field actionIdCounter integer POI action id counter.
---@field dependencies string[] Extensions loaded before.
freeroam_vueBigMap = {}

--- Registers an action callback and returns the meta table enriched with actionId.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:134
---@param callback function Function to call.
---@param meta table|nil Metadata (label, etc.).
---@return table  meta with actionId.
function freeroam_vueBigMap.addAction(callback, meta) end

--- Empties the actions table.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:129
function freeroam_vueBigMap.clearActionFunctions() end

--- Opens the big map: delegates to freeroam_bigMapMode.enterBigMap (instant), generates the POI/filter/group caches and applies the POIs' visibility.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:809
---@param options table|nil {controllerUsed?: boolean, isMenuBigmap?: boolean, ignoreUiStateChange?: boolean}; ignoreUiStateChange defaults to isMenuBigmap; the action maps are ignored if controllerUsed and isMenuBigmap.
function freeroam_vueBigMap.enterBigMap(options) end

--- Runs an action's callback; error log if unknown.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:144
---@param actionId integer Identifier.
---@return string  'success' or 'error'.
function freeroam_vueBigMap.executeAction(actionId) end

--- Runs a registered POI action (see executeAction).
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:992
---@param actionId integer Action identifier.
function freeroam_vueBigMap.executePoiAction(actionId) end

--- Closes the big map (freeroam_bigMapMode.exitBigMap(true)), empties the caches and the actions.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:830
function freeroam_vueBigMap.exitBigMap() end

--- Retrieves then clears the POI id to auto-select requested when the map opened, from freeroam_bigMapMode.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:996
---@return string|nil  POI id.
function freeroam_vueBigMap.getAndClearPendingAutoSelectPoiId() end

--- Filter sections, each group with its current `visible` state.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:850
---@return table[]  Filter sections.
function freeroam_vueBigMap.getFilters() end

--- Increments and returns a new action identifier.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:123
---@return integer  Identifier.
function freeroam_vueBigMap.getFreeActionId() end

--- Game state information for the POI list, with poiListDisplayMode (setting, 'tree' by default).
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:907
---@return table  State.
function freeroam_vueBigMap.getGameStateInfo() end

--- Groups for the POI list: visible, non-empty sections and groups.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:862
---@return table[]  Sections {key, icon, title, groups[{key, label, icon, elementIds, visible, openByDefault}]}.
function freeroam_vueBigMap.getGroups() end

--- Full POI data by id (name, preview, aggregates, available actions), generated if the cache is invalid.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:843
---@return table  POIs by id.
function freeroam_vueBigMap.getPoiData() end

--- Highlights the marker of the POI hovered in the list.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:985
---@param poiId string POI id.
---@param active boolean Active hover.
---@return string  'success'
---@return boolean  active
function freeroam_vueBigMap.hoverPoiFromList(poiId, active) end

--- Computes a route to the POI (freeroam_bigMapMode.navigateToMission).
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:951
---@param poiId string|nil POI id.
---@return string  'success'
function freeroam_vueBigMap.navigateToPoi(poiId) end

--- Called by the map when a POI is selected on it: sends showPoiDetails to the UI with the POI ids grouped under the mouse (freeroam_bigMapMarkers.getIdsFromHoveredPoiId) or an empty list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:967
---@param poiId string|nil Id of the selected POI.
function freeroam_vueBigMap.onPoiSelectedFromBigmap(poiId) end

--- Centers the map view on the POI.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:959
---@param poiId string|nil POI id.
---@return string  'success'
function freeroam_vueBigMap.panToPoi(poiId) end

--- Selects a POI from the list (freeroam_bigMapMode.selectPoi) or deselects if the id is null.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:935
---@param poiId string|nil POI id ('undefined'/'null' = none).
---@param isCollapsedMode boolean|nil If false, the next group reduction is ignored.
---@return string  'success'
function freeroam_vueBigMap.selectPoiFromList(poiId, isCollapsedMode) end

--- Sets the list display mode ('hidden', 'tree', 'simple') in the settings.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:1002
---@param mode string Mode.
---@return string  'success' or 'invalid_mode'.
function freeroam_vueBigMap.setPoiListDisplayMode(mode) end

--- Computes the POI ids of the visible groups and calls freeroam_bigMapMode.setOnlyIdsVisible.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:918
function freeroam_vueBigMap.setVisibleIds() end

--- Shows all groups (sectionId 'everything') or only those of the given section.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:95
---@param sectionId string Section key or 'everything'.
function freeroam_vueBigMap.toggleFilterSectionById(sectionId) end

--- Makes visible only the groups whose keys are given (all the others are hidden) and updates the visibility on the map.
---Source: lua/ge/extensions/freeroam/vueBigMap.lua:85
---@param filterIds string[] Group keys.
function freeroam_vueBigMap.toggleFiltersByIds(filterIds) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/oneshotRaceSelector/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Common base of the ui_gridSelector back-ends for the three "oneshot race" selectors (quickraceSelector, lightRunnerSelector, busRouteSelector). It provides text search, persistence of display options, empty filters, building of the title and breadcrumb, and the dispatch of getDetails according to the shape of the path (levels or items of a level: tracks/routes). Formatting of tiles and details is left to a "descriptor" passed to createBackend.
--- Access: extension `ui_oneshotRaceSelector_core`: `extensions.load("ui_oneshotRaceSelector_core")`, then the global `ui_oneshotRaceSelector_core`
---@class ui_oneshotRaceSelector_core
ui_oneshotRaceSelector_core = {}

--- Builds a gridSelector back-end from a descriptor. The back-end exposes findLevel, findMiddle, getTiles, getFilters, getActiveFilters, getSearchText/setSearchText, getDisplayDataOptions/setDisplayDataOption/resetDisplayDataToDefaults, getScreenHeaderTitleAndPath, getDetails, getManagementDetails, executeButton, executeDoubleClick, toggleFavourite, profilerFinish and closedFromUI. Descriptor contract: backendName (string); middlePathKey ("tracks" or "routes", path.keys[1] of the detail level); levelListTitleKey and middleListTitleKey (translation ids); getLevels(); findLevel(levelName) optional (otherwise search on level.levelName); getMiddleItems(level); middleName(middle); levelDisplayName(level) and middleDisplayName(middle) (already translated); levelToTile(level); middleToTile(middle, levelName); getLevelDetails(level); getMiddleDetails(middle, levelName).
---Source: lua/ge/extensions/ui/oneshotRaceSelector/core.lua:42
---@param descriptor table Table describing the mode (see desc for the full contract).
---@return table  Back-end usable by ui_gridSelector.
function ui_oneshotRaceSelector_core.createBackend(descriptor) end

--- Converts a numeric difficulty value (0-99) to a translated label (easy/medium/hard/very hard) via _tr. Returns nil if the value is not numeric or outside the four tiers.
---Source: lua/ge/extensions/ui/oneshotRaceSelector/core.lua:23
---@param value number|string|nil Difficulty; the tier is floor(value / 25).
---@return string|nil  Translated label, or nil.
function ui_oneshotRaceSelector_core.difficultyLabel(value) end


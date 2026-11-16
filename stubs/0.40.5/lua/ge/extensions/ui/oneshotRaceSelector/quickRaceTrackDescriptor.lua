---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/oneshotRaceSelector/quickRaceTrackDescriptor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- gridSelector back-end descriptor shared by quickrace and lightRunner. Both draw their lists of levels and tracks from scenario_quickRaceLoader.getQuickraceList() and differ only by the back-end name (vehicle restrictions and start behavior are handled elsewhere). The result of build is meant for ui_oneshotRaceSelector_core.createBackend.
--- Access: extension `ui_oneshotRaceSelector_quickRaceTrackDescriptor`: `extensions.load("ui_oneshotRaceSelector_quickRaceTrackDescriptor")`, then the global `ui_oneshotRaceSelector_quickRaceTrackDescriptor`
---@class ui_oneshotRaceSelector_quickRaceTrackDescriptor
ui_oneshotRaceSelector_quickRaceTrackDescriptor = {}

--- Returns the descriptor table (backendName, middlePathKey = "tracks", quickrace title keys, getLevels, getMiddleItems, middleName, display names, levelToTile, middleToTile, getLevelDetails, getMiddleDetails) for the named back-end.
---Source: lua/ge/extensions/ui/oneshotRaceSelector/quickRaceTrackDescriptor.lua:21
---@param backendName string Back-end name; also serves as the base of the display options save file.
---@return table  Descriptor to pass to ui_oneshotRaceSelector_core.createBackend.
function ui_oneshotRaceSelector_quickRaceTrackDescriptor.build(backendName) end


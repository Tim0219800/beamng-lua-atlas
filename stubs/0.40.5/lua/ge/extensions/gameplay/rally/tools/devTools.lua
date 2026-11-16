---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/tools/devTools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Development tools object returned by the constructor.
---@class gameplay_rally_tools_devTools
local gameplay_rally_tools_devTools = {}

--- Detects corners on the points of the editor snaproad's driveline with PacenoteGenerator.detectCorners and the interface parameters, then stores the points and the result.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1286
function gameplay_rally_tools_devTools:calculateCorners() end

--- Clears the stored driveline points, sections and corners and hides their display.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1397
function gameplay_rally_tools_devTools:clearDrivelinePoints() end

--- Draws the full imgui interface of the four sections (Voicepack Tools, Pacenotes Tools, Traffic, Game Settings).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1456
function gameplay_rally_tools_devTools:draw() end

--- Draws the detected sections (blue for left, red for right, gray for straight) with a sphere at the start of each corner, or failing that the raw driveline in dark gray.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1352
function gameplay_rally_tools_devTools:drawDrivelinePoints() end

--- Draws the elevation profile as spheres (green for normal points, red for race pathnodes) if the option is enabled.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1221
function gameplay_rally_tools_devTools:drawElevationProfilePoints() end

--- Displays the value of the rallyCodriverVoicepackMRU setting in imgui.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1282
function gameplay_rally_tools_devTools:drawGameSettings() end

--- Draws the traffic exclusion zones (sphere of the zone radius and small center sphere) if enabled.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1407
function gameplay_rally_tools_devTools:drawTrafficZones() end

--- Shortcut that calls exportScriptReaderHtml.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:280
function gameplay_rally_tools_devTools:enumerate() end

--- Writes the stored elevation profile and its summary to /temp/rally/elevation_profile_<timestamp>.json.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1198
function gameplay_rally_tools_devTools:exportElevationProfileToJson() end

--- Exports the co-driver's recording script as an HTML page (/temp/rally/beamng-voicepack-script_<fingerprint>.html) for the checked styles.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1077
function gameplay_rally_tools_devTools:exportScriptReaderHtml() end

--- Exports the same script as a text file (/temp/rally/beamng-voicepack-script_<fingerprint>.txt).
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1117
function gameplay_rally_tools_devTools:exportScriptReaderTxt() end

--- Creates a voicepack skeleton for the selected compositor: info.json (persona, language and dialect empty, style and styleLabel), empty metadata file and audio subfolder. Then opens the folder.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:174
function gameplay_rally_tools_devTools:generateVoicepackSkeleton() end

--- Identifier of the selected rallyLoop mission, extracted from the "Name (id)" entry of the list.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1435
---@return string|nil  Mission id, nil if "<none>"
function gameplay_rally_tools_devTools:getSelectedRallyLoopId() end

--- Loads the compositors and initializes the state of the Pacenotes Tools sections (elevation profile, driveline points, parameters) and Traffic (zone radius 10, list of rallyLoop missions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:17
function gameplay_rally_tools_devTools:init() end

--- Indicates whether the "Pacenotes Tools" section is expanded.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1846
---@return boolean  true if expanded
function gameplay_rally_tools_devTools:isPacenotesToolsSectionExpanded() end

--- Lists the valid text compositor styles, sorts them, groups them and prepares the checked boxes and the selected style for the skeleton (the first by default).
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:87
function gameplay_rally_tools_devTools:loadCompositors() end

--- Called every frame by the editor: draws the elevation and driveline points (if the Pacenotes Tools section is expanded) and the traffic zones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1445
function gameplay_rally_tools_devTools:onUpdate() end

--- Hook called when the vehicle is put back in place; empty body (commented-out code).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1841
function gameplay_rally_tools_devTools:onVehicleResetted() end

--- Merges the script entries of all checked compositors (enumerateScriptEntries), keyed by audio file name, with the list of styles and contexts; sorts the result and numbers each entry (order).
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:228
---@return table[]  Sorted entries
---@return string[]  Selected styles
function gameplay_rally_tools_devTools:recordingCoverageEntries() end

--- Reloads the list of rallyLoop missions of the current level (preceded by "<none>") and resets the selection.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1418
function gameplay_rally_tools_devTools:refreshRallyLoopMissions() end

--- Resets the detection parameters to the values of PacenoteGenerator.defaultParams.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1342
function gameplay_rally_tools_devTools:resetCornerDetectionParams() end

--- List of the compositors checked in the interface.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:217
---@return string[]  Style names
function gameplay_rally_tools_devTools:selectedCompositors() end

--- Stores the detected sections and corners and logs their count.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1319
---@param detection table|nil {sections, corners}
function gameplay_rally_tools_devTools:storeCornerDetection(detection) end

--- Copies the positions of the driveline points and enables their display.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1330
---@param points table[]|nil Points with pos field
function gameplay_rally_tools_devTools:storeDrivelinePoints(points) end

--- Stores an elevation profile and computes a summary (number of points, min and max altitudes, elevation gain, 2D distance, start and end distances, number of splits and race pathnodes).
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:1152
---@param elevationProfile table[]|nil Points {x, y, z, distFromStart, splitLabel, isRacePathnode}
function gameplay_rally_tools_devTools:storeElevationProfile(elevationProfile) end

--- Output folder of the voicepack skeleton: /temp/rally/voicepack_<style with '/' replaced by '_'>.
---Source: lua/ge/extensions/gameplay/rally/tools/devTools.lua:169
---@return string  Path, or empty string if no style is selected
function gameplay_rally_tools_devTools:voicepackSkeletonOutDir() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/saveLoad.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Loads and saves the drift spots of free roaming. Scans /levels/<level>/driftSpots/ looking for spot.driftSpot.json, builds a spots table keyed by id (level/folder) with their UI info, preview, saved scores and objectives, hides the marker objects of the scene, and writes the modified scores. Also loads the cascade zones (stuntZones) from a JSON file.
--- Access: extension `gameplay_drift_saveLoad`: `extensions.load("gameplay_drift_saveLoad")`, then the global `gameplay_drift_saveLoad`
---@class gameplay_drift_saveLoad
gameplay_drift_saveLoad = {}

--- Empties the spots cache; the next call to getDriftSpotsById will re-read everything from disk.
---Source: lua/ge/extensions/gameplay/drift/saveLoad.lua:17
function gameplay_drift_saveLoad.clearCache() end

--- Returns the data of a spot, or nil if it does not exist in the current level.
---Source: lua/ge/extensions/gameplay/drift/saveLoad.lua:45
---@param spotId string Spot id.
---@return table|nil  Spot data (id, spatialInfo, racePath, bounds, level, info, saveData, unlocked).
function gameplay_drift_saveLoad.getDriftSpotById(spotId) end

--- Returns (building it if needed) the table of all the drift spots of the current level, keyed by id. Uses the career save folder if career is active, otherwise settings/cloud/driftSpots/.
---Source: lua/ge/extensions/gameplay/drift/saveLoad.lua:50
---@return table<string, table>  Spots keyed by id.
function gameplay_drift_saveLoad.getDriftSpotsById() end

--- Looks for preview.jpg, preview.png or preview.jpeg in the given folder; otherwise returns /ui/images/noPreview.jpg.
---Source: lua/ge/extensions/gameplay/drift/saveLoad.lua:119
---@param dir string Spot folder.
---@return string  Path of the preview image.
function gameplay_drift_saveLoad.getPreviewWithFallback(dir) end

--- Returns the list (array) of the spots whose level is the current level.
---Source: lua/ge/extensions/gameplay/drift/saveLoad.lua:132
---@return table[]  Array of spots.
function gameplay_drift_saveLoad.loadAndSanitizeDriftFreeroamSpotsCurrMap() end

--- Reads a drift data JSON file, converts pos/rot/scl of each stuntZone to vec3/quat, then calls gameplay_drift_stuntZones.setStuntZones(json.stuntZones). Logs an error and returns if the file is absent.
---Source: lua/ge/extensions/gameplay/drift/saveLoad.lua:142
---@param fileName string|nil Path of the JSON file; does nothing if nil.
function gameplay_drift_saveLoad.loadDriftData(fileName) end

--- Hook: called when career is activated, empties the spots cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/saveLoad.lua:13
function gameplay_drift_saveLoad.onCareerActive() end

--- Hook: called when saving the career profile; writes to <currentSavePath>/career/driftSpots/ all the spots marked _dirty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/saveLoad.lua:27
---@param currentSavePath string Save folder of the current profile.
function gameplay_drift_saveLoad.onSaveCurrentProfile(currentSavePath) end

--- Marks the spot as modified (_dirty). Outside career, immediately writes its scores file in settings/cloud/driftSpots/; in career, the write is deferred to onSaveCurrentProfile.
---Source: lua/ge/extensions/gameplay/drift/saveLoad.lua:36
---@param spotId string Spot id, of the form "level/folder".
function gameplay_drift_saveLoad.saveDriftSpotsScoresForSpotById(spotId) end


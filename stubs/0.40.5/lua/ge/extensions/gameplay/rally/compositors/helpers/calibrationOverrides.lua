---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the per-mission calibration of the thresholds of a rally note compositor style (corner intensity diameters, arc lengths per intensity). Settings are stored in <missionDir>/rally/compositorCalibration.json as {version=1, styles={<style>={intensity={diameter={...}}, lengthsByIntensity={<intensity>={arcMeters={...}}}}}} and reapplied to a style's configuration at load time. A list of 'boundaries' is an ascending array of lower bounds starting at 0; the last range is open-ended (no max).
--- Access: extension `gameplay_rally_compositors_helpers_calibrationOverrides`: `extensions.load("gameplay_rally_compositors_helpers_calibrationOverrides")`, then the global `gameplay_rally_compositors_helpers_calibrationOverrides`
---@class gameplay_rally_compositors_helpers_calibrationOverrides
gameplay_rally_compositors_helpers_calibrationOverrides = {}

--- Rewrites the 'key' key of each entry in the list with the range {min, max} derived from the bounds (the last one: {min} only). Changes nothing if the bounds are invalid or of the wrong length.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:75
---@param list table[] List of entries, modified in place.
---@param key string Key to write.
---@param boundaries number[] Lower bounds.
---@return boolean  true if applied.
function gameplay_rally_compositors_helpers_calibrationOverrides.applyBoundariesToList(list, key, boundaries) end

--- Applies the saved calibrations to a style's configuration (corner.numbering.intensity and lengthsByIntensity). Called by textCompositor:load.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:143
---@param config table Style configuration (modified in place).
---@param compositorName string Style name.
---@param missionDir string Mission folder.
---@return boolean  true if at least one list was modified.
function gameplay_rally_compositors_helpers_calibrationOverrides.applyToConfig(config, compositorName, missionDir) end

--- Extracts the lower bounds from a list of entries whose 'key' key is a range {min, max}. Returns nil if the list is empty, does not start at 0, is not contiguous (previous max = next min) or if a max is missing outside the last entry.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:39
---@param list table[]|nil Ordered list of entries.
---@param key string Key containing the range (e.g. 'diameter', 'arcMeters').
---@return number[]|nil  Lower bounds, or nil if the list is not valid.
function gameplay_rally_compositors_helpers_calibrationOverrides.boundariesFromList(list, key) end

--- Path of a mission's calibration file: <missionDir>/rally/compositorCalibration.json.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:17
---@param missionDir string|nil Mission folder.
---@return string|nil  Path, or nil if missionDir is nil.
function gameplay_rally_compositors_helpers_calibrationOverrides.calibrationFile(missionDir) end

--- Reads the mission's calibration file. Returns a blank structure {version=1, styles={}} if the file is missing or unreadable (error logged in the latter case).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:87
---@param missionDir string|nil Mission folder.
---@return table  Data {version, styles}.
function gameplay_rally_compositors_helpers_calibrationOverrides.load(missionDir) end

--- Writes the calibration data (indented) to the mission's file, creating the folder if needed.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:101
---@param missionDir string|nil Mission folder.
---@param data table|nil Data; blank if nil.
---@return boolean  Result of jsonWriteFile (false if missionDir is nil).
function gameplay_rally_compositors_helpers_calibrationOverrides.save(missionDir, data) end

--- Stores a list of bounds under styles[compositorName][groupName][key] then saves the file.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:126
---@param missionDir string Mission folder.
---@param compositorName string Style name.
---@param groupName string Group (e.g. 'intensity').
---@param key string Key (e.g. 'diameter').
---@param boundaries number[] Bounds (copied; nil if a value is not numeric).
---@return boolean  Write success.
function gameplay_rally_compositors_helpers_calibrationOverrides.setBoundaries(missionDir, compositorName, groupName, key, boundaries) end

--- Stores the arc length bounds of an intensity under styles[compositorName].lengthsByIntensity[intensityName].arcMeters then saves.
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:134
---@param missionDir string Mission folder.
---@param compositorName string Style name.
---@param intensityName string Intensity identifier.
---@param boundaries number[] Arc bounds in meters.
---@return boolean  Write success.
function gameplay_rally_compositors_helpers_calibrationOverrides.setLengthBoundaries(missionDir, compositorName, intensityName, boundaries) end

--- Checks that a list of bounds is valid (numeric, starts at 0, strictly increasing, right length).
---Source: lua/ge/extensions/gameplay/rally/compositors/helpers/calibrationOverrides.lua:59
---@param boundaries table Array of numbers.
---@param expectedCount integer|nil Expected length.
---@return boolean  true if valid.
function gameplay_rally_compositors_helpers_calibrationOverrides.validateBoundaries(boundaries, expectedCount) end


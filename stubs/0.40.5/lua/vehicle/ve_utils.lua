---@meta
-- tim19Atlas stub generated from lua/vehicle/ve_utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Timer returned by HighPerfTimer(). Stores the start time in seconds in self[1].
---@class ve_utils__HighPerfTimer
local ve_utils__HighPerfTimer = {}

--- Returns the absolute high-precision clock in milliseconds (not the elapsed duration).
---Source: lua/vehicle/ve_utils.lua:33
---@return number  os.clockhp()*1000.
function ve_utils__HighPerfTimer:getTime() end

--- Restarts the timer at the present moment.
---Source: lua/vehicle/ve_utils.lua:18
function ve_utils__HighPerfTimer:reset() end

--- Returns the time elapsed since the start, in milliseconds, without restarting.
---Source: lua/vehicle/ve_utils.lua:22
---@return number  Duration in ms.
function ve_utils__HighPerfTimer:stop() end

--- Returns the elapsed time in milliseconds and restarts the timer.
---Source: lua/vehicle/ve_utils.lua:26
---@return number  Duration in ms.
function ve_utils__HighPerfTimer:stopAndReset() end

--- Creates a high-precision timer started at the moment of creation (based on os.clockhp).
---Source: lua/vehicle/ve_utils.lua:14
---@return table  _HighPerfTimer object with the methods reset, stop, stopAndReset, getTime.
function HighPerfTimer() end

--- Converts a relative pressure in psi to an absolute pressure in pascals: psi * 6894.757 + 101325.
---Source: lua/vehicle/ve_utils.lua:290
---@param psi number Relative pressure in psi.
---@return number  Absolute pressure in Pa.
function PSItoPascal(psi) end

--- Builds a dense lookup table from points {x, y}: an array whose index is x (integer) and whose value is the interpolated y. Straight line for 2 points, Catmull-Rom spline for 3 or more. Used for example for engine torque curves.
---Source: lua/vehicle/ve_utils.lua:265
---@param points table List of {x, y} with increasing integer x.
---@param returnArray boolean|nil If true and ffi is available, returns a C float[] array (0-based) instead of a Lua table.
---@return table|cdata|nil  Table keyed by x, or nil if fewer than 2 points.
function createCurve(points, returnArray) end

--- Returns a game color taken from the jet palette according to the index, to distinguish curves or debug elements.
---Source: lua/vehicle/ve_utils.lua:224
---@param i integer Index; the color is jetColor((i % 17) / 16).
---@param a number|nil Alpha passed to jetColor.
---@return color  Game color.
function getContrastColor(i, a) end

--- Same palette as getContrastColor but returns a CSS hexadecimal string.
---Source: lua/vehicle/ve_utils.lua:228
---@param i integer Index (modulo 17).
---@return string  Color in "#rrggbb" format.
function getContrastColorStringRGB(i) end

--- Saves compiled jbeam data to a text file (opens, writes via saveCompiledJBeamRecursive, closes). Used for debugging.
---Source: lua/vehicle/ve_utils.lua:211
---@param data table Data to save.
---@param filename string Output file path.
---@param lvl integer|nil Initial level (0 by default).
---@return boolean  false if the file could not be opened (warning logged), otherwise true.
function saveCompiledJBeam(data, filename, lvl) end

--- Recursively writes a data table in JSON-like text format to an open file, with indentation depending on the level and a header comment for each table having a partPath.
---Source: lua/vehicle/ve_utils.lua:119
---@param f file File open for writing (io.open).
---@param data table Data to write.
---@param level integer Current recursion level (0 at the start).
function saveCompiledJBeamRecursive(f, data, level) end

--- Converts a jbeam table in the "first row = header, following rows = values" format into a list of dictionaries {column=value}. A row that is a lone dictionary defines common options applied to the following rows; a dictionary placed in the last column merges its options into the row. If a row has an id field, it is renamed name.
---Source: lua/vehicle/ve_utils.lua:37
---@param entry table Raw jbeam table (entry[1] = header).
---@return table|boolean  List of rows (empty table if entry is empty), or false if the header/a row is invalid (a warning is logged).
function tableFromHeaderTable(entry) end


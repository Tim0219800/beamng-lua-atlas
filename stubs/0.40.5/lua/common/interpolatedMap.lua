---@meta
-- tim19Atlas stub generated from lua/common/interpolatedMap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 1D (linear) or 2D (bilinear) interpolation table on a regular or irregular grid. new() creates the object, loadData(inputData, opts) loads the data (which selects the 1D or 2D get method), then get(x[, y]) returns the interpolated value. Used for engine maps, torque curves, coefficient tables. Caches the last result and the last interval used (fast lookup when x varies little).
--- Access: `require("interpolatedMap")`
---@class interpolatedMap
local interpolatedMap = {}

--- Creates an empty interpolation table.
---Source: lua/common/interpolatedMap.lua:245
---@return table  interpolatedMap object with methods loadData, get, reset.
function interpolatedMap.new() end

--- Object returned by new().
---@class interpolatedMap_interpolatedMap
local interpolatedMap_interpolatedMap = {}

--- Interpolated value: get(x) in 1D, get(x, y) in 2D. Replaced by loadData depending on the dimension.
---Source: lua/common/interpolatedMap.lua:dyn
---@param x number X coordinate.
---@param y number|nil Y coordinate (2D only).
---@return number|nil  Interpolated value; nil outside the range if clampToDataRange is false.
function interpolatedMap_interpolatedMap:get(x, y) end

--- Loads the data (see formats in notes), computes the bounds and selects the 1D or 2D get method.
---Source: lua/common/interpolatedMap.lua:dyn
---@param inputData table Data in pairs format, two rows, or 2D array.
---@param opts table|nil Options {xScale, yScale, zScale}.
function interpolatedMap_interpolatedMap:loadData(inputData, opts) end

--- Does nothing (empty function).
---Source: lua/common/interpolatedMap.lua:dyn
function interpolatedMap_interpolatedMap:reset() end

return interpolatedMap

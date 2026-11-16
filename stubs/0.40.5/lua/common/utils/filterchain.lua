---@meta
-- tim19Atlas stub generated from lua/common/utils/filterchain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Proof of concept of a functional 'filter chain': a chain is described by text strings like 'smooth(2)' or 'interval(0.1, 0.1)' that are compiled (load) into an update function chaining the filters. The filters are in the local table F (smooth, interval, scale, digitize, floor, clamp, examine, startdelay); each filter is an object with a get(self, dt, ...) method. Loaded with require('utils/filterchain') but only the test function is exported: the newFilterchain factory is local and inaccessible. The file also defines two debug globals (locals, getVarByName).
--- Access: `require("utils/filterchain")`
---@class utils_filterchain
local utils_filterchain = {}

--- Usage example: creates a chain with the filter 'interval(0.1, 0.1)' in debug mode (examine) and calls update 30 times with dt = 0.02, printing the output via dump.
---*(internal: called by the engine or the main loop)*
---Source: lua/common/utils/filterchain.lua:234
function utils_filterchain.test() end

--- Local table of filter factories (not exported). Each function returns a filter object with get(self, dt, ...).
---@class utils_filterchain_F
local utils_filterchain_F = {}

--- Filter that clamps the value between minval and maxval.
---Source: lua/common/utils/filterchain.lua:123
---@param minval number|nil Minimum, 0 by default
---@param maxval number|nil Maximum, 1 by default
---@return table  Filter {get}
function utils_filterchain_F.clamp(minval, maxval) end

--- Filter that returns 1 if the value exceeds the threshold, otherwise 0.
---Source: lua/common/utils/filterchain.lua:108
---@param threshold number|nil Threshold, 0.5 by default
---@return table  Filter {get}
function utils_filterchain_F.digitize(threshold) end

--- Debug filter: logs (level D, origin filterchain.examine) the text str followed by the arguments, and returns the arguments starting from commonArgumentsCount+1 (removes common arguments like dt).
---Source: lua/common/utils/filterchain.lua:145
---@param str string Log label
---@param commonArgumentsCount integer|nil Number of common arguments not to return, 0 by default
---@return table  Filter {get}
function utils_filterchain_F.examine(str, commonArgumentsCount) end

--- Filter that returns math.floor(value).
---Source: lua/common/utils/filterchain.lua:117
---@return table  Filter {get}
function utils_filterchain_F.floor() end

--- Builds a blinking filter (Interval): alternates between active and inactive states.
---Source: lua/common/utils/filterchain.lua:67
---@param offsetTime number|nil Phase offset, 0 by default (stored but not used in get)
---@param timeOn number|nil Duration in the active state in s, 0.1 by default
---@param timeOff number|nil Duration in the inactive state in s, 0.1 by default
---@return table  Interval object
function utils_filterchain_F.interval(offsetTime, timeOn, timeOff) end

--- Filter that multiplies the value by scaleVal.
---Source: lua/common/utils/filterchain.lua:102
---@param scaleVal number Factor
---@return table  Filter {get}
function utils_filterchain_F.scale(scaleVal) end

--- Builds a rate-limited smoothing filter (Smooth).
---Source: lua/common/utils/filterchain.lua:44
---@param rate number|nil Maximum change per second, 1 by default
---@return table  Smooth object
function utils_filterchain_F.smooth(rate) end

--- Builds a filter (Startdelay) that delays a rise in value: as long as the input has been rising for less than startdelay seconds, the output stays at the old value.
---Source: lua/common/utils/filterchain.lua:158
---@param startdelay number|nil Delay in seconds, 0 by default
---@return table  Startdelay object
function utils_filterchain_F.startdelay(startdelay) end

--- Object returned by F.interval: alternates an active state (onTime) and an inactive state (offTime).
---@class utils_filterchain_Interval
local utils_filterchain_Interval = {}

--- Advances the internal timer by dt. When the state is active, returns {dt, ...} (arguments unchanged), otherwise {dt, 0, 0, ...} (as many zeros as arguments).
---Source: lua/common/utils/filterchain.lua:79
---@param dt number Time step (s)
---@param ... number Values to pass through or zero out (the first one decides, inferred from code)
---@return table  {dt, values...}
function utils_filterchain_Interval:get(dt, ...) end

--- Object returned by F.smooth: moves its state toward the sample at maximum rate `rate` (units per second).
---@class utils_filterchain_Smooth
local utils_filterchain_Smooth = {}

--- Advances the state toward sample by at most dt*rate and returns it. On the first call the state is initialized to sample.
---Source: lua/common/utils/filterchain.lua:52
---@param dt number Time step (s)
---@param sample number Target value
---@return number  Smoothed value
function utils_filterchain_Smooth:get(dt, sample) end

--- Object returned by F.startdelay.
---@class utils_filterchain_Startdelay
local utils_filterchain_Startdelay = {}

--- If the sample does not exceed the previous value, stores it and returns it. If it exceeds it, returns the old value as long as the accumulated rise time is below startdelay, then the sample.
---Source: lua/common/utils/filterchain.lua:167
---@param dt number Time step (s)
---@param sample number Input value
---@return number  Filtered value
function utils_filterchain_Startdelay:get(dt, sample) end

--- Debug GLOBAL: finds a variable from a dotted name (e.g. 'mv.foo') in a scope (default _G). The pattern used ('([^.]*).(.*)') only splits into two pieces at the first separator; works for names with one or two levels (inferred from code).
---Source: lua/common/utils/filterchain.lua:37
---@param name string Dotted name, e.g. 'a.b'
---@param scope table|nil Starting table, _G by default
---@return any  Value found
function getVarByName(name, scope) end

--- Debug GLOBAL: returns a table {localName = value} of the local variables of the calling function _anon(debug.getlocal at level 2).
---Source: lua/common/utils/filterchain.lua:22
---@return table<string, any>  Local variables of the caller
function locals() end

return utils_filterchain

---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/modules/driftModule.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph module (moduleOrder 0, depends on gameplay_drift_general) that relays drift gameplay events to flowgraph nodes. It listens to the hooks onDriftSpinout, onDriftCrash, onDonutDriftScored, onTightDriftScored and onDriftCompletedScored, and keeps each event in a callbacks table with a lifetime (ttl) of 2 ticks that nodes can read.
--- Access: `require("extensions/flowgraph/modules/driftModule")` (file under extensions/ but not a regular extension)
---@class flowgraph_modules_driftModule
flowgraph_modules_driftModule = {}

--- Registers (or replaces) an event with ttl = 2 and some data. (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@param name string event name (tight, donut, spinout, crash, scored...)
---@param data table|nil associated data
function flowgraph_modules_driftModule.addCallback(name, data) end

--- Returns the callbacks table (key = name, value = {ttl, data}). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@return table<string, table>  callbacks by name
function flowgraph_modules_driftModule.getCallBacks() end

--- Called when the module is created: calls resetModule(). (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.init() end

--- Hook: donut scored; registers 'donut' with {score}. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@param score number score obtained
function flowgraph_modules_driftModule.onDonutDriftScored(score) end

--- Relays to gameplay_drift_drift.onDonutZoneReactivated(). (dynamically assigned)
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.onDonutZoneReactivated() end

--- Hook: drift completed and counted; registers 'scored' with addedScore, cachedScore and combo. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@param data table fields addedScore, cachedScore, combo
function flowgraph_modules_driftModule.onDriftCompletedScored(data) end

--- Hook: drift crash; registers 'crash'. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.onDriftCrash() end

--- Hook: the player spun out; registers 'spinout'. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.onDriftSpinout() end

--- Hook: tight drift scored; registers 'tight' with {score}. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
---@param score number score obtained
function flowgraph_modules_driftModule.onTightDriftScored(score) end

--- Called on every manager update: decrements the ttl of each positive callback. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.onUpdate() end

--- Recreates the callbacks table with all events at ttl = 0. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:dyn
function flowgraph_modules_driftModule.resetModule() end

--- Local class `C` of lua/ge/extensions/flowgraph/modules/driftModule.lua
---@class flowgraph_modules_driftModule_C
local flowgraph_modules_driftModule_C = {}

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:38
---@param name any
---@param data any
function flowgraph_modules_driftModule_C:addCallback(name, data) end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:34
function flowgraph_modules_driftModule_C:getCallBacks() end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:21
function flowgraph_modules_driftModule_C:init() end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:57
---@param score any
function flowgraph_modules_driftModule_C:onDonutDriftScored(score) end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:65
function flowgraph_modules_driftModule_C:onDonutZoneReactivated() end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:61
---@param data any
function flowgraph_modules_driftModule_C:onDriftCompletedScored(data) end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:49
function flowgraph_modules_driftModule_C:onDriftCrash() end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:45
function flowgraph_modules_driftModule_C:onDriftSpinout() end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:53
---@param score any
function flowgraph_modules_driftModule_C:onTightDriftScored(score) end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:25
function flowgraph_modules_driftModule_C:onUpdate() end

---Source: lua/ge/extensions/flowgraph/modules/driftModule.lua:10
function flowgraph_modules_driftModule_C:resetModule() end


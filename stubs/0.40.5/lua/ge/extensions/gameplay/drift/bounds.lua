---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/bounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone boundaries of drift mode. Loads a sites file (zones) with setBounds, then, every frame, checks for each vehicle tracked by gameplay_drift_drift whether it is in at least one zone; otherwise it is "out of bounds". A drift mission modder reads getIsOutOfBounds(vehId) to penalize the player. Also contains an ImGui debug window and a profiler.
--- Access: extension `gameplay_drift_bounds`: `extensions.load("gameplay_drift_bounds")`, then the global `gameplay_drift_bounds`
---@class gameplay_drift_bounds
gameplay_drift_bounds = {}

--- Debug configuration table of the extension: {default = false, canBeChanged = true}.
---Source: lua/ge/extensions/gameplay/drift/bounds.lua:115
---@return table  Debug info.
function gameplay_drift_bounds.getDriftDebugInfo() end

--- Lua garbage produced by the last frame measured by the profiler (0 if general debug is off).
---Source: lua/ge/extensions/gameplay/drift/bounds.lua:119
---@return number  Measured garbage amount.
function gameplay_drift_bounds.getGC() end

--- Indicates whether a vehicle is outside the boundary zones.
---Source: lua/ge/extensions/gameplay/drift/bounds.lua:103
---@param vehId integer|nil Vehicle ID; nil = true if any tracked vehicle is out of bounds.
---@return boolean  true if out of bounds.
function gameplay_drift_bounds.getIsOutOfBounds(vehId) end

--- Per-frame hook: updates the out-of-bounds state of each tracked vehicle, the debug window and the profiler.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/drift/bounds.lua:88
function gameplay_drift_bounds.onUpdate() end

--- Loads the sites file that defines the allowed zones (gameplay_sites_sitesManager.loadSites then finalizeSites) and empties the vehicle state.
---Source: lua/ge/extensions/gameplay/drift/bounds.lua:24
---@param filePath string Path of the sites file containing the zones.
---@param drawBounds_ boolean|nil Drawing of the zones (nil = active); see notes, the provided value is ignored.
function gameplay_drift_bounds.setBounds(filePath, drawBounds_) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/bounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the bounds of the career tutorial zone. It checks that the player stays within the active zones of the tutorial sites; otherwise it displays a warning with a 5 s countdown in the task list, then triggers an automatic return via callbacks (onCareerTutorial... hooks). Can also draw the active zones in debug.
--- Access: extension `gameplay_tutorial_bounds`: `extensions.load("gameplay_tutorial_bounds")`, then the global `gameplay_tutorial_bounds`
---@class gameplay_tutorial_bounds
gameplay_tutorial_bounds = {}

--- Leaves the out-of-bounds state and resets sites, active zones, disabled zones and debug.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:278
function gameplay_tutorial_bounds.cleanup() end

--- Returns the sorted list of active zone names.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:188
---@return string[]  Names sorted alphabetically.
function gameplay_tutorial_bounds.getActiveZoneNames() end

--- Indicates whether the debug drawing of the zones is active.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:205
---@return boolean  State of the debug drawing.
function gameplay_tutorial_bounds.getDebugDrawBounds() end

--- Returns the internal zoneEnabled table (name -> boolean), direct reference.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:197
---@return table<string, boolean>  Zones explicitly enabled/disabled.
function gameplay_tutorial_bounds.getEnabledZones() end

--- Indicates whether a zone is enabled (true by default if never set).
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:183
---@param zoneName string Zone name.
---@return boolean  Activation state.
function gameplay_tutorial_bounds.getZoneEnabled(zoneName) end

--- Indicates whether the player is within bounds. Returns true if the tutorial is not active.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:209
---@return boolean  true if in an active and enabled zone (or if there is nothing to check).
function gameplay_tutorial_bounds.isInBounds() end

--- Render hook called every frame; draws the active zones if debug is enabled and the tutorial is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:271
---@param dtReal number Real-time delta.
---@param dtSim number Simulation time delta.
---@param dtRaw number Raw time delta.
function gameplay_tutorial_bounds.onPreRender(dtReal, dtSim, dtRaw) end

--- Sets the list of zones in which the player is allowed (replaces the previous list).
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:170
---@param names string[]|nil Zone names; nil clears the list (no more limit).
function gameplay_tutorial_bounds.setActiveZones(names) end

--- Replaces all or some of the out-of-bounds callbacks; absent keys keep their current callback.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:71
---@param newCallbacks table Possible keys: onOutOfBoundsStarted, onOutOfBoundsEnded, onOutOfBoundsTimedOut(currentStepId), onOutOfBoundsWhileNotAllowed.
function gameplay_tutorial_bounds.setCallbacks(newCallbacks) end

--- Sets the function that returns the current tutorial step identifier (passed to the timeout callback).
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:63
---@param getter function Function with no argument returning the step id (string) or nil.
function gameplay_tutorial_bounds.setCurrentStepGetter(getter) end

--- Enables or disables the debug drawing of the active zones (semi-transparent yellow), done in onPreRender.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:201
---@param enabled boolean true to draw.
function gameplay_tutorial_bounds.setDebugDrawBounds(enabled) end

--- Sets the function that indicates whether the tutorial is active. A non-function value resets it to a function returning false.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:55
---@param getter function Function with no argument returning a boolean.
function gameplay_tutorial_bounds.setRuntimeActiveGetter(getter) end

--- Sets the sites object (with zones) used to test the bounds. If it is nil, update loads it from gameplay_tutorial_setup.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:166
---@param newSites table|nil Sites object with sites.zones.byName / sites.zones.objects or the getZonesForPosition method.
function gameplay_tutorial_bounds.setSites(newSites) end

--- Temporarily enables or disables a zone without removing it from the active list.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:179
---@param zoneName string Zone name.
---@param enabled boolean false to ignore this zone.
function gameplay_tutorial_bounds.setZoneEnabled(zoneName, enabled) end

--- To call every frame: if the tutorial is active, tests the bounds; when out of bounds, displays the warning with countdown, and after 5 s triggers (via a job with a 1 s pause) the onOutOfBoundsTimedOut callback. If automatic return is not allowed (gameplay_tutorial_setup.isOutOfBoundsResetAllowed), only calls onOutOfBoundsWhileNotAllowed.
---Source: lua/ge/extensions/gameplay/tutorial/bounds.lua:214
---@param dtReal number Real-time delta in seconds.
function gameplay_tutorial_bounds.update(dtReal) end


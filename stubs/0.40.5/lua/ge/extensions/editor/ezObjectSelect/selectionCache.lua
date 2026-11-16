---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Selection cache of the Easy Select tool. It only rebuilds the selection data (list of projected "proxies") once the camera has been still for 0.12 s, or after an invalidation or a configuration change. Possible states: waiting, moving, building, ready.
--- Access: extension `editor_ezObjectSelect_selectionCache`: `extensions.load("editor_ezObjectSelect_selectionCache")`, then the global `editor_ezObjectSelect_selectionCache`
---@class editor_ezObjectSelect_selectionCache
editor_ezObjectSelect_selectionCache = {}

--- Completely resets the cache state (status waiting).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:45
function editor_ezObjectSelect_selectionCache.activate() end

--- Returns a snapshot of the cache state for debug.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:97
---@return table  {status, reason, targetCount (number of proxies), buildTime, classificationTime}
function editor_ezObjectSelect_selectionCache.getStatus() end

--- Deletes the cached data and restarts the stabilization delay.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:49
---@param reason string|nil Reason, stored for debug (default "invalidated")
function editor_ezObjectSelect_selectionCache.invalidate(reason) end

--- Records the classification duration for the debug display.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:93
---@param milliseconds number|nil Duration in ms (0 if nil)
function editor_ezObjectSelect_selectionCache.setClassificationTime(milliseconds) end

--- To be called every frame. Returns nil while the camera is moving, the configuration has just changed or the 0.12 s delay has not elapsed; then calls build() only once and returns its data, then returns them as-is.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:56
---@param camera table Camera context (pos, rangeOrigin, forward, up, halfTan, width, height)
---@param configKey any Configuration key; if it changes, the cache is invalidated (reason "settings")
---@param build function Function with no arguments that builds the data (expects a table that may contain proxies)
---@return table|nil  Built data or nil if not ready
function editor_ezObjectSelect_selectionCache.update(camera, configKey, build) end


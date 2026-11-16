---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Selection query of the Easy Object Select tool. From the mouse position and the camera, it collects the scene objects (StaticShape, StaticObject, vehicles) under or near the cursor, resolves them to their owning prefab, applies the filters (class, hidden, locked, bounds, name patterns, max volume and distance) and builds "proxies" (screen geometry) classified as "over" (cursor on top) or "discovery" (within the discovery radius) relation. Uses the selectionCache cache when available, otherwise a "broad" mode (screen rectangle + box around the camera).
--- Access: extension `editor_ezObjectSelect_selectionQuery`: `extensions.load("editor_ezObjectSelect_selectionQuery")`, then the global `editor_ezObjectSelect_selectionQuery`
---@class editor_ezObjectSelect_selectionQuery
editor_ezObjectSelect_selectionQuery = {}

--- Enables the selection cache (selectionCache.activate). Called when the tool opens.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:606
function editor_ezObjectSelect_selectionQuery.activate() end

--- Collects the selection candidates for the current frame. Returns nil if the camera context is unavailable. Fills proxies (over relation), discoveryProxies (discovery relation), filteredLarge (large filtered objects if options.collectFilteredLarge), queryStats, rejected and sourceCount.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:396
---@param options table|nil discoveryPixels (px, default 48), nearQueryDistance (m, default 40), maxDistance (m), maxVolume (m^3), namePattern, ignorePattern (comma-separated lists of Lua patterns), collectFilteredLarge (boolean).
---@return table|nil  Table {camera, mouse, queryRadius, discoveryRadius, nearQueryDistance, proxies, discoveryProxies, filteredLarge, queryStats, rejected, sourceCount}.
function editor_ezObjectSelect_selectionQuery.gather(options) end

--- Returns the state of the selection cache (selectionCache.getStatus), useful for the debug display.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:614
---@return table  Cache state.
function editor_ezObjectSelect_selectionQuery.getCacheStatus() end

--- Invalidates the selection cache.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:610
---@param reason string|nil Reason for the invalidation (diagnostic).
function editor_ezObjectSelect_selectionQuery.invalidateCache(reason) end

--- Checks that a comma-separated list of Lua patterns is valid (each entry is tested with pcall(string.find)).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua:618
---@param value string|nil List of patterns, comma-separated.
---@return boolean  true if all patterns are valid.
---@return string|nil  Error message "entry N: ..." if invalid.
function editor_ezObjectSelect_selectionQuery.validatePatternList(value) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Selection model of the editor's "Easy Object Select" tool. Every frame it queries selectionQuery.gather, groups the candidates under the cursor into a stack (object stacking), automatically chooses the winner (with hysteresis to avoid flickering), and handles manual wheel cycling as well as pick "freezing". It produces a snapshot (camera, mouse, candidates, pick, activeIndex, cycleActive, stackCount...) read by the drawing and interaction modules.
--- Access: extension `editor_ezObjectSelect_selectionModel`: `extensions.load("editor_ezObjectSelect_selectionModel")`, then the global `editor_ezObjectSelect_selectionModel`
---@class editor_ezObjectSelect_selectionModel
editor_ezObjectSelect_selectionModel = {}

--- Resets the temporal state (automatic target, cycle, frozen pick, snapshot) and enables the selectionQuery cache. To be called when the tool opens.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:204
function editor_ezObjectSelect_selectionModel.activate() end

--- Advances the active pick in the candidate stack following the wheel direction. No effect if there are fewer than 2 candidates or if wheelDelta is 0. Stores the mouse anchor and the camera to detect movement later.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:311
---@param wheelDelta number Wheel delta; > 0 steps back in the stack, < 0 steps forward.
---@return table|nil  The current snapshot (modified in place), or nil if there is none.
function editor_ezObjectSelect_selectionModel.cycle(wheelDelta) end

--- Resets the temporal state (target, cycle, frozen pick, snapshot) when the tool closes.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:209
function editor_ezObjectSelect_selectionModel.deactivate() end

--- Freezes the current pick: while frozen, it remains the target even if the cursor moves (useful during a drag).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:332
---@return table|nil  The frozen candidate, or nil if there is no pick.
function editor_ezObjectSelect_selectionModel.freezePick() end

--- Returns the last snapshot computed by update.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:346
---@return table|nil  Current snapshot.
function editor_ezObjectSelect_selectionModel.getSnapshot() end

--- Invalidates the selection cache of selectionQuery (the cache will be rebuilt at the next query).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:350
---@param reason string|nil Reason for the invalidation (diagnostic).
function editor_ezObjectSelect_selectionModel.invalidateCache(reason) end

--- Releases the pick frozen by freezePick.
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:340
function editor_ezObjectSelect_selectionModel.releasePick() end

--- Computes the frame's snapshot: calls selectionQuery.gather(options), groups and sorts the candidates, applies the stack limit, handles cycle reset, the frozen pick and the automatic winner. Returns an empty snapshot if the query fails (no camera).
---Source: lua/ge/extensions/editor/ezObjectSelect/selectionModel.lua:213
---@param options table|nil Options passed to gather (discoveryPixels, nearQueryDistance, maxDistance, maxVolume, namePattern, ignorePattern, collectFilteredLarge) plus preferUnselected (boolean: favor unselected objects), maxStackDistance (number, m) and cycleDeadZone (number, px).
---@return table  Snapshot: camera, mouse, queryRadius, discoveryRadius, nearQueryDistance, candidates, discovery, filteredLarge, queryStats, rejected, sourceCount, stackCount, stackLimited, activeIndex, pick, cycleActive, cycleAnchor, cycleDeadZone, frozenTargetId.
function editor_ezObjectSelect_selectionModel.update(options) end


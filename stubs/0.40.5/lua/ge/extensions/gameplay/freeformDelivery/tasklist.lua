---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Feeds the "tasks" app (task list at the top left) during a freeform delivery. It displays a header (delivery name), one task per active goal (placement, playerInVehicle, engineRunning, coupled, unhitched), a grouped "do not damage the cargo" task for damage goals, distance goals when their warning threshold is exceeded, and a message prompting to choose a route. The list is only rebuilt when a goal state hash changes.
--- Access: extension `gameplay_freeformDelivery_tasklist`: `extensions.load("gameplay_freeformDelivery_tasklist")`, then the global `gameplay_freeformDelivery_tasklist`
---@class gameplay_freeformDelivery_tasklist
---@field dependencies string[] gameplay_freeformDelivery_utils, gameplay_freeformDelivery_routes and core_groundMarkers.
gameplay_freeformDelivery_tasklist = {}

--- Clears the header, tasks and route messages from the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua:409
function gameplay_freeformDelivery_tasklist.cleanup() end

--- Displays the "tasks" app, clears the list, resets the caches, sends the header (delivery name), builds the initial list and the route message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua:314
---@param delivery table Delivery data (name...).
function gameplay_freeformDelivery_tasklist.setup(delivery) end

--- Called every frame: updates the odometer message, computes a hash of the goal state (including the progress of multi-vehicle goals) and rebuilds the list if something changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua:345
---@param profiler table|nil Optional profiler (add method).
function gameplay_freeformDelivery_tasklist.update(profiler) end

--- Removes the old route messages and, if there are routes but no active guidance (core_groundMarkers.currentlyHasTarget) and the prompt has not yet been shown, displays the message prompting to choose a route via the big map. Called by routes.lua.
---Source: lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua:122
function gameplay_freeformDelivery_tasklist.updateRouteMessage() end


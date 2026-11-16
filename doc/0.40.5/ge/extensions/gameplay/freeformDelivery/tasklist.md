# `gameplay_freeformDelivery_tasklist`

*File: `lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua` · VM: Game Engine (GE) · 429 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_freeformDelivery_tasklist`: `extensions.load("gameplay_freeformDelivery_tasklist")`, then the global `gameplay_freeformDelivery_tasklist`

Feeds the "tasks" app (task list at the top left) during a freeform delivery. It displays a header (delivery name), one task per active goal (placement, playerInVehicle, engineRunning, coupled, unhitched), a grouped "do not damage the cargo" task for damage goals, distance goals when their warning threshold is exceeded, and a message prompting to choose a route. The list is only rebuilt when a goal state hash changes.

## Notes

- Tasks are sent to the UI by guihooks.trigger: ClearTasklist, SetTasklistHeader, SetTasklistTask {id, type, label, subtext, done, fail} and DiscardTasklistItem (id, optional delay).
- Task ids: delivery_goal_<goalId>, delivery_damage, delivery_distance_<goalId>, delivery_route_prompt. A goal with showInTasklist == false is never displayed.
- A completed goal with removeOnComplete is removed after a delay and does not return to the list (unless it becomes incomplete again).
- The route prompt only appears once per delivery: as soon as a route is active, it is considered already shown.
- Depends on the globals gameplay_freeformDelivery_goals and _odometer and on ui_appContainers, without declaring them in dependencies.

**Dependencies (loaded first):** `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_routes`, `core_groundMarkers`

## Functions

| Function | Description | Line |
|---|---|---|
| `gameplay_freeformDelivery_tasklist.cleanup()` | Clears the header, tasks and route messages from the UI. *(internal)* | 409 |
| `gameplay_freeformDelivery_tasklist.setup(delivery)` | Displays the "tasks" app, clears the list, resets the caches, sends the header (delivery name), builds the initial list and the route message. *(internal)* | 314 |
| `gameplay_freeformDelivery_tasklist.update(profiler)` | Called every frame: updates the odometer message, computes a hash of the goal state (including the progress of multi-vehicle goals) and rebuilds the list if something changed. *(internal)* | 345 |
| `gameplay_freeformDelivery_tasklist.updateRouteMessage()` | Removes the old route messages and, if there are routes but no active guidance (core_groundMarkers.currentlyHasTarget) and the prompt has not yet been shown, displays the message prompting to choose a route via the big map. Called by routes.lua. | 122 |

### Parameter details

#### `gameplay_freeformDelivery_tasklist.setup(delivery)`

Displays the "tasks" app, clears the list, resets the caches, sends the header (delivery name), builds the initial list and the route message.

- `delivery` (*table*) : Delivery data (name...).

#### `gameplay_freeformDelivery_tasklist.update(profiler)`

Called every frame: updates the odometer message, computes a hash of the goal state (including the progress of multi-vehicle goals) and rebuilds the list if something changed.

- `profiler` (*table|nil*) : Optional profiler (add method).

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_freeformDelivery_utils, gameplay_freeformDelivery_routes and core_groundMarkers. |

**UI events (guihooks.trigger):** `ClearTasklist`, `DiscardTasklistItem`, `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/freeformDelivery/tasklist.lua`.*

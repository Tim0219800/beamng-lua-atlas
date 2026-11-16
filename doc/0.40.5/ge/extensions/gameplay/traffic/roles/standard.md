# `gameplay_traffic_roles_standard`

*File: `lua/ge/extensions/gameplay/traffic/roles/standard.lua` · VM: Game Engine (GE) · 319 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/traffic/roles/standard")` (file under extensions/ but not a regular extension)

"Standard" traffic role: the default civilian driver. It reacts to collisions, accidents and witnessed events (near miss, collision by a third party) according to its personality (bravery, patience): pulling over, following or fleeing the other vehicle, honking, or exchanging insurance. It also disables a vehicle that is too damaged.

## Notes

- Event types in driver.eventType: 'none', 'selfCrash', 'otherCrash', 'selfCollision', 'otherCollision', 'nearMiss' (or another type received by onOtherEvent).
- damageAction is chosen in onRefresh: bravery >= 0.56 -> 'followPostCrash', <= 0.44 -> 'fleePostCrash', otherwise 'stop' (AI only).
- collisionThreshold = ceil(random()^2 * 6): minimum number of collisions that triggers the post-crash action.
- minActionTime is 5 s; action durations depend on bravery or patience.
- In askInsurance, the askInsurance flag is reset to nil and the AI switches to 'stop' mode; a UI message 'ui.traffic.interactions.insuranceExchanged' is displayed outside career if the player is the target.
- A speed >= 1.2 times the limit during a collision assigns the fault to the vehicle itself (veh.collisions[otherId].fault = true).
- The 'pullOver' action used here is provided by baseRole (not defined in this file).

## Class `C`

Standard role class, completed by baseRole (self.veh, self.driver, self.flags, self.state, setAction, resetAction, setTarget, checkTargetVisible...).

The module returns a constructor: `local obj = require("gameplay_traffic_roles_standard")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Defines the actions fleePostCrash (AI flees, random aggression >= 0.5), followPostCrash (follow or 'road rage' pursuit of the culprit), askInsurance (AI stop) and disabled (stop, 'disabled' state), then merges the baseActions. | 15 |
| `C:onCollision(otherId, data)` | Called when this vehicle collides with another. Assigns the fault if the speed exceeds 1.2 times the limit, marks 'selfCollision', targets the other vehicle, emits onTrafficAction(vehId, 'collision', ...), schedules a honk (depending on bravery and number of hits) and stores selfHitCount. | 109 |
| `C:onCrashDamage(data)` | Called when the vehicle takes crash damage. If no collision is ongoing, marks the event 'selfCrash' and, for an AI, emits the hook onTrafficAction(vehId, 'crashDamage', {targetId}). | 86 |
| `C:onOtherCollision(id1, id2, data)` | Called when two other traffic vehicles collide. Targets the slower of the two if it is visible, close and ahead; records otherHitCount. | 130 |
| `C:onOtherCrashDamage(otherId, data)` | Called when another vehicle crashes. If this vehicle is close (< 60 m by interactive distance), ahead and visible, marks the event 'otherCrash' and targets it. | 97 |
| `C:onOtherEvent(eventType, otherId, data)` | Called for an event reported by another vehicle (e.g. near miss). Ignored if a crash is already active; otherwise, if the vehicle is visible, records the event type and targets it. | 149 |
| `C:onRefresh()` | Resets target, timers and driver state (driver.eventType, damageAction, collisionThreshold, collision counters). For an AI, chooses damageAction according to bravery and draws the collision threshold. | 60 |
| `C:onTrafficTick(tickTime)` | Called on each traffic tick. Disables the AI vehicle that is too damaged, evaluates the target's visibility and proximity, then chooses a reaction (honk, 'pullOver', follow, flee, switch to pursuit) according to the event and personality. Also handles the delayed honk and the freezing of lights if a light bar is on. | 158 |
| `C:onUpdate(dt, dtSim)` | Called every frame. Decrements actionTimer and ends actions: insurance exchange when both vehicles are stopped within 20 m, end of following/fleeing, end of pulling over; resets the action if the target has disappeared from traffic. | 274 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTrafficAction` — listened to by 2 module(s)

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic/roles/standard.lua`.*

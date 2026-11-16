# `gameplay_traffic_roles_police`

*File: `lua/ge/extensions/gameplay/traffic/roles/police.lua` · VM: Game Engine (GE) · 312 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/traffic/roles/police")` (file under extensions/ but not a regular extension)

"Police" traffic role ('emergency' class). It defines the pursuit actions (pursuitStart, pursuitEnd, chaseTarget, avoidTarget, roadblock) and handles the siren, target selection (the non-police vehicle with the best pursuit score), head-on collision avoidance, the rest delay after a pursuit and the optional freezing of traffic lights when the light bar is on.

## Notes

- self.state states: 'chase', 'follow', 'flee', 'stop', 'pullOver', 'disabled', 'none'. The 'pullOver' action is used by onUpdate but is not defined in this file (it must come from baseRole).
- After pursuitEnd, the vehicle is 'disabled' for cooldownTimer = max(10, arrestTime + 5) seconds, then onRefresh is called again.
- avoidSpeed is drawn at random between 18 and 24 multiplied by the pursuit mode; avoidance triggers if the sum of the speeds exceeds this threshold and the vehicles face each other (dot product <= -0.707).
- A vehicle that is too damaged (damage > baseValues.highDamage) switches to the 'disabled' action; if the target is within 20 m, the target's policeWrecks increases.
- enableTrafficSignalsChange and freezeTrafficSignals are not defined here (inherited from baseRole).

## Class `C`

Police role class, completed by baseRole (self.veh, self.flags, self.state, self.targetId, setAction, setTarget, resetAction...).

The module returns a constructor: `local obj = require("gameplay_traffic_roles_police")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:checkTarget()` | Compares the pursuit scores of non-police traffic vehicles whose pursuit mode is >= 1 and returns the id of the one with the best score. | 107 |
| `C:init()` | Configures the role: 'emergency' class, aggression +0.1, drivability 0.5, and defines the actions pursuitStart (starts a pursuit: mode 1 = passive following with intermittent siren, mode > 1 = aggressive pursuit with light bar on), pursuitEnd (AI stop, light bar in mode 1, cooldown), chaseTarget, avoidTarget (temporary 'flee' mode) and roadblock (stop, light bar on). Then merges the baseActions. | 7 |
| `C:onRefresh()` | Called when the role is refreshed. Leaves the 'disabled' state, resets the timers, resets the action if needed, then looks for a target: if there is one, starts pursuitStart; otherwise cancels the ongoing pursuit. Warns in the log if the player is targeted without their pursuit having been correctly triggered. | 124 |
| `C:onTrafficTick(dt)` | Called on each traffic tick. Updates the potential targets (distance, visibility), counts the police officers who see the target, triggers head-on collision avoidance, disables the police vehicle that is too damaged, and handles the freezing of traffic lights according to the light bar (speed >= 6 m/s). | 153 |
| `C:onUpdate(dt, dtSim)` | Called every frame. Handles siren pulses, the cooldown countdown (which calls onRefresh again at the end), stopping the pursuit if the target is no longer fleeing, leaving roadblocks, pulling over ('pullOver') near an almost stopped target, and the delays of temporary actions. | 225 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic/roles/police.lua`.*

# `gameplay_traffic_roles_suspect`

*File: `lua/ge/extensions/gameplay/traffic/roles/suspect.lua` · VM: Game Engine (GE) · 84 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/traffic/roles/suspect")` (file under extensions/ but not a regular extension)

"Suspect" traffic role: a vehicle wanted by the police. It defines the actions watchPolice (become wanted), fleePolice (flee), arrest (immobilize) and clear (reset). As long as its state is 'wanted' and the police have seen it enough, it triggers a pursuit via gameplay_police.

## Notes

- States used in self.state: 'wanted', 'flee', 'stop', 'none'.
- Flags manipulated in self.flags: flee, busy, freeze, driveCheck (read), pursuit/reset (read on police vehicles).
- pursuitMode is 2 by default.
- fleePolice makes the vehicle almost impossible to respawn by calling veh:modifyRespawnValues(800, 40).
- onUpdate is an empty function.

## Class `C`

Suspect role class, completed by baseRole (self.veh = traffic vehicle, self.flags, self.state, self.actions).

The module returns a constructor: `local obj = require("gameplay_traffic_roles_suspect")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the role: adds a +0.2 offset to aggression (personalityModifiers), defines the actions watchPolice / fleePolice / arrest / clear and sets pursuitMode = 2. | 7 |
| `C:onActiveDone()` | Called when the vehicle is no longer active in traffic. Same handling as onRoleEnded: if the flee flag is set, the suspect is declared to have escaped the police. | 55 |
| `C:onRoleEnded()` | Called when the role ends. If the suspect was fleeing, calls gameplay_police.evadeVehicle(vehId, gameplay_traffic.showMessages) and removes the flee flag. | 48 |
| `C:onTrafficTick(tickTime)` | Called on each traffic manager tick. If the state is 'wanted', the visibility value (pursuit.sightValue) reaches the threshold (0.25 for an AI, 1 for a player) and the speed reaches the threshold (1 m/s if driveCheck, otherwise 0), it looks for available police officers (neither in pursuit nor in reset), starts gameplay_police.setPursuitMode(pursuitMode, vehId, policeIds) and targets the closest police officer. | 62 |
| `C:onUpdate(dt, dtSim)` | Called every frame; empty body. | 81 |

## Calls into the engine (C++)

- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic/roles/suspect.lua`.*

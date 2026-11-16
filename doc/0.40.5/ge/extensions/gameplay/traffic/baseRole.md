# `gameplay_traffic_baseRole`

*File: `lua/ge/extensions/gameplay/traffic/baseRole.lua` · VM: Game Engine (GE) · 309 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/traffic/baseRole")` (file under extensions/ but not a regular extension)

Base class of traffic "roles" (civilian, police, suspect, etc.). A role is attached to a traffic vehicle (gameplay_traffic object) and gives it a personality (aggression, patience, bravery), named actions (pullOver, disabled and those added by derived classes), a state and possibly its own flowgraph. The module returns a constructor called with the derived class: require('/lua/ge/extensions/gameplay/traffic/baseRole')(derivedClass, {veh = vehObj, name = 'police'}). The empty onXxx methods are extension points for derived roles.

## Notes

- Constructor: creates the object from the passed table (o.veh, o.name), calls init, copies the fields of derivedClass (which can replace init and the methods), calls o:init() again with no argument, then postInit(). The derived class must therefore provide its own init that calls the base again with the right parameters.
- Personality: each value is Gaussian centered on 0.5 (randomGauss3()/3 + offset, bounded by min/max), values in [0, 1]. Only applies to AI vehicles (veh.isAi); the final AI aggression is base + (aggression - 0.5) * 0.6, bounded to [0.25; 1.25].
- Inconsistency: init creates self.personalityModifiers, but generatePersonality reads self.driver.personalityModifiers (never created here); the modifiers therefore only apply if a derived class defines driver.personalityModifiers.
- The code comment states that the pullOver action does not always work correctly (the vehicle may not park on the side).
- lockAction (enabled by setupFlowgraph) prevents setAction and resetAction from acting.

## Class `C`

Traffic role instance. Fields: veh (traffic vehicle object), name, class, actionName, actionTimer, state, flags, actions (table name -> function(args)), baseActions (pullOver, disabled), driver {personality, aggression}, targetId, targetVisible, targetNear, flowgraph, lockAction, ignorePersonality, keepPersonalityOnRefresh, keepActionOnRefresh.

The module returns a constructor: `local obj = require("gameplay_traffic_baseRole")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:applyPersonality(data)` | Applies a personality (merged into driver.personality) and sends the aggression to the AI. If data is not a table, restores the neutral personality. | 171 |
| `C:checkTargetVisible(id)` | Tests by static raycast whether the target vehicle is visible from this vehicle (aimed point 1 m above the target). | 191 |
| `C:clearFlowgraph()` | Stops and removes the flowgraph, restores the default AI mode and unlocks the action. | 99 |
| `C:freezeTrafficSignals(state)` | For emergency vehicles: forces the lights. When true, advances the sequences that have a green light, and freezes (timer stopped) those whose lights are all red; when false, restarts the frozen sequences. No effect if the traffic lights are not active. | 202 |
| `C:generatePersonality()` | Generates a random personality (aggression, patience, bravery). Returns the neutral personality (0.5) if ignorePersonality. | 152 |
| `C:init(veh, name, data)` | Initializes the role's default fields and the base actions pullOver and disabled. Options read from data: ignorePersonality, keepPersonalityOnRefresh, keepActionOnRefresh. | 9 |
| `C:onActiveDone()` | Extension point (empty): called by the traffic system when the vehicle has finished being active. | 243 |
| `C:onCollision(otherId, data)` | Extension point (empty): collision of this vehicle with another. | 261 |
| `C:onCrashDamage(data)` | Extension point (empty): crash damage on this vehicle. | 255 |
| `C:onDeserialized(data, veh)` | Restores the role after a Lua reload. | 287 |
| `C:onOtherCollision(id1, id2, data)` | Extension point (empty): collision between two other vehicles. | 264 |
| `C:onOtherCrashDamage(otherId, data)` | Extension point (empty): crash damage on another vehicle. | 258 |
| `C:onOtherEvent(eventType, otherId, data)` | Extension point (empty): event related to another vehicle. | 267 |
| `C:onRefresh()` | Extension point (empty): called by postInit, on vehicle creation and refresh. | 246 |
| `C:onRoleEnded()` | Extension point (empty): called when the role ends. | 252 |
| `C:onRoleStarted()` | Extension point (empty): called when the role becomes active. | 249 |
| `C:onSerialize()` | Serializes the vehicle id, name, state, action name and target. | 276 |
| `C:onTrafficTick(tickTime)` | Extension point (empty): periodic tick of the traffic system. | 270 |
| `C:onUpdate(dt, dtSim)` | Extension point (empty): per-frame update. | 273 |
| `C:postInit()` | Called after construction (and on each vehicle refresh): resets the action and regenerates the personality unless keepActionOnRefresh / keepPersonalityOnRefresh, then calls onRefresh. | 65 |
| `C:resetAction()` | Resets to the default action: default AI mode, parameters and electrics reset, flags cleared, state 'none', target cleared. No effect if lockAction. Called on each vehicle respawn unless keepActionOnRefresh. | 137 |
| `C:setAction(name, args)` | Runs the named action from self.actions (unless lockAction), stores its name and emits the hook onTrafficAction(vehId, name, {targetId, data}). Error logged if the action does not exist. | 118 |
| `C:setAggression(baseAggression, ignorePersonality)` | Computes and sends to the vehicle's AI the aggression (ai.setAggression), taking personality into account unless ignored. | 130 |
| `C:setTarget(id)` | Sets the target vehicle (if the identifier exists) and, for an AI vehicle, sends ai.setTargetObjectID. | 108 |
| `C:setupFlowgraph(fgFile, varData)` | Loads a flowgraph specific to this vehicle, sets its variables, activates it (with keepTrafficState), sets the vehicle's AI to 'stop' mode and locks the action (lockAction). Logs an error if the file is not found. | 75 |
| `C:tryRandomEvent()` | Extension point (empty): random event attempt of the role. | 240 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onTrafficAction` — listened to by 2 module(s)

## Calls into the engine (C++)

- `FS:` `fileExists`
- `obj:` `queueLuaCommand`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/traffic/baseRole.lua`.*

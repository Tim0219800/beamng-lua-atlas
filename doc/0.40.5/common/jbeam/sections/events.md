# `jbeam_sections_events`

*File: `lua/common/jbeam/sections/events.lua` · VM: Common (GE + vehicle) · 337 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("jbeam/sections/events")`

Processes the jbeam interaction sections: events (input events, simply cleaned), triggers (3D box/sphere trigger zones created in the engine with addTrigger, position, rotation, size, color, label, meshes to highlight) and triggerEventLinks / triggerEventLinks2 (links between a trigger and an input action). Builds vehicle.triggerEventLinksDict[triggerId][input] = list of links and migrates the old links (v1, to vehicle.events) to the v2 format (inputActions). Loads the core_vehicleTriggers extension if at least one trigger was created.

## Notes

- A trigger: reference id idRef and axes idX, idY (nodes), rotation in degrees (converted to radians), translation, baseTranslation(+Global/Elastic/Rigid), type 'box' (size = vec3) or 'sphere' (size = number), label, color {r,g,b,a}, mesh (string or list) to highlight, alphaOnUsed. The baseTranslationGlobal* variants take the component's rotations/translations into account (also written under 'xxxWithNodeTransforms').
- The trigger's cid must equal the id returned by the engine (addTrigger); otherwise error 'Trigger cId desync' and the trigger is ignored.
- triggerEventLinks2: mandatory fields triggerId, triggerInput, inputAction; inputAction can have the form 'namespace:action' (namespace defaults to 'vehicle'). The v1 links (triggerEventLinks) require targetEventId, triggerId and action and trigger a 'Legacy' warning in the log; they are converted to vehicle input actions (vehicle.inputActions, ctx 'vlua', cat 'vehicle_specific').
- During the v1 conversion, the trigger's label, if non-empty, becomes the action's title and is emptied on the trigger.
- Rows with a missing field are ignored with a print (not a log) of the content.
- Triggers are only created when the engine vehicle object exists (GE VM).

## Functions

| Function | Description | Line |
|---|---|---|
| `jbeam_sections_events.process(objID, vehicleObj, vehicle)` | Processes the vehicle's events, triggers and trigger-event links (creates the triggers in the engine and fills vehicle.triggerEventLinksDict). *(internal)* | 324 |

### Parameter details

#### `jbeam_sections_events.process(objID, vehicleObj, vehicle)`

Processes the vehicle's events, triggers and trigger-event links (creates the triggers in the engine and fills vehicle.triggerEventLinksDict).

- `objID` (*integer*) : Vehicle identifier (unused).
- `vehicleObj` (*userdata*) : Engine vehicle object (addTrigger, getTrigger).
- `vehicle` (*table*) : Vehicle jbeam data (modified in place).

**Loads extensions:** `core_vehicleTriggers`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jbeam/sections/events.lua`.*

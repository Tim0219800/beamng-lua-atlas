# `core_vehicle_vehicleTriggerHighlight`

*File: `lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua` · VM: Game Engine (GE) · 296 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_vehicle_vehicleTriggerHighlight`: `extensions.load("core_vehicle_vehicleTriggerHighlight")`, then the global `core_vehicle_vehicleTriggerHighlight`

GE extension `core_vehicle_vehicleTriggerHighlight`: highlights vehicle triggers (interaction zones defined in the jbeam) in the 3D world. Every frame, onUpdate draws with debugDrawer a sphere (with a camera-facing circle) or a pulsing box (oscillating alpha) and, if requested, a label 'id - name [section]'. Useful for trigger debug/editing tools.

## Example

```lua
core_vehicle_vehicleTriggerHighlight.setHighlightedTriggerByName(vehId, 'hood_trigger', {showTriggerIdAsLabel = true})
-- ...
core_vehicle_vehicleTriggerHighlight.clearHighlightedTrigger()
```

## Notes

- Identifiers are stored as strings; `triggerId` is the trigger's cid (key of vdata.triggers and argument of veh:getTrigger).
- Per-trigger options: showTriggerIdAsLabel (true by default; false hides the label).
- The trigger is determined to be a sphere if trg.type == 'sphere' (or type absent and size a number) and a box if trg.type == 'box' (or type absent and size a table); sphere radius = size, otherwise radius, otherwise half the diagonal of size, otherwise 0.1.
- drawOneHighlightedTrigger modifies the shared color SPHERE_COLOR (alpha field) on each draw: triggers drawn in the same frame share the same color.
- Labels use debugDrawer:drawTextAdvanced; boxes are drawn as filled triangles + edges.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_vehicle_vehicleTriggerHighlight.clearHighlightedTrigger()` | Removes all highlights from all vehicles. | 207 |
| `core_vehicle_vehicleTriggerHighlight.getSerializedHighlightedTriggerData()` | Exports the highlights as a serializable list. | 211 |
| `core_vehicle_vehicleTriggerHighlight.hasHighlightedTriggers()` | Indicates whether at least one trigger is highlighted. | 154 |
| `core_vehicle_vehicleTriggerHighlight.isHighlightedTrigger(vehId, triggerId)` | Indicates whether a given trigger is highlighted. | 158 |
| `core_vehicle_vehicleTriggerHighlight.onUpdate(dt)` | Per-frame hook: draws each highlighted trigger (sphere or pulsing box, label). *(internal)* *(hook)* | 282 |
| `core_vehicle_vehicleTriggerHighlight.setHighlightedTrigger(vehId, triggerId, options)` | Adds a trigger to the highlight (does not clear the others). | 164 |
| `core_vehicle_vehicleTriggerHighlight.setHighlightedTriggerByName(vehId, triggerName, options)` | Like setHighlightedTrigger but finds the trigger by its name, its jbeam id or its cid in the vehicle's vdata.triggers. | 189 |
| `core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData(data)` | Replaces all highlights with those of the given list (getSerialized... format). Also accepts the legacy format of a single {vehId, triggerId} tuple. | 224 |
| `core_vehicle_vehicleTriggerHighlight.unhighlightTrigger(vehId, triggerId)` | Removes a trigger from the highlight. | 196 |

### Parameter details

#### `core_vehicle_vehicleTriggerHighlight.getSerializedHighlightedTriggerData()`

Exports the highlights as a serializable list.

- **returns**: table[] list of {vehId, triggerId, options}

#### `core_vehicle_vehicleTriggerHighlight.hasHighlightedTriggers()`

Indicates whether at least one trigger is highlighted.

- **returns**: boolean true if there is one

#### `core_vehicle_vehicleTriggerHighlight.isHighlightedTrigger(vehId, triggerId)`

Indicates whether a given trigger is highlighted.

- `vehId` (*integer*) : vehicle
- `triggerId` (*integer|string*) : trigger cid
- **returns**: boolean true if highlighted

#### `core_vehicle_vehicleTriggerHighlight.onUpdate(dt)`

Per-frame hook: draws each highlighted trigger (sphere or pulsing box, label).

- `dt` (*number*) : elapsed time (s), used to pulse the alpha

#### `core_vehicle_vehicleTriggerHighlight.setHighlightedTrigger(vehId, triggerId, options)`

Adds a trigger to the highlight (does not clear the others).

- `vehId` (*integer*) : vehicle
- `triggerId` (*integer|string*) : trigger cid
- `options` (*table|nil*) : {showTriggerIdAsLabel = boolean}

#### `core_vehicle_vehicleTriggerHighlight.setHighlightedTriggerByName(vehId, triggerName, options)`

Like setHighlightedTrigger but finds the trigger by its name, its jbeam id or its cid in the vehicle's vdata.triggers.

- `vehId` (*integer*) : vehicle
- `triggerName` (*string|number*) : trigger name, id or cid
- `options` (*table|nil*) : {showTriggerIdAsLabel = boolean}
- **returns**: boolean false if the trigger is not found

#### `core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData(data)`

Replaces all highlights with those of the given list (getSerialized... format). Also accepts the legacy format of a single {vehId, triggerId} tuple.

- `data` (*table*) : list of {vehId, triggerId, options}

#### `core_vehicle_vehicleTriggerHighlight.unhighlightTrigger(vehId, triggerId)`

Removes a trigger from the highlight.

- `vehId` (*integer*) : vehicle
- `triggerId` (*integer|string*) : trigger cid

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/vehicle/vehicleTriggerHighlight.lua`.*

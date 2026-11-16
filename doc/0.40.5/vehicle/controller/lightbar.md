# `controller_lightbar`

*File: `lua/vehicle/controller/lightbar.lua` · VM: Vehicle · 257 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** controller `lightbar` declared in the jbeam (`controller`), reachable with `controller.getController("name")`

Auxiliary lightbar (beacon lights) controller with configurable modes (type "auxiliary"). Each mode defines, per electrics value name, a sequence of states (duration, value) repeated in a loop as long as the main electrics value (by default "lightbar") is > 0; a single-state sequence becomes a static value. The electrics values produced are multiplied by the intensity of the main value (0..1). A "Lightbar Modes" radial menu allows changing the mode.

## Example

```lua
-- jbeam (excerpt)
-- "modes": [["name", "config"],
--   ["Police", [["electric","duration","value"], ["lightbar_left",0.1,1], ["lightbar_left",0.1,0]]]]
```

## Notes

- jbeam keys (default): lightbarElectricsName ("lightbar"), modes (header table with name and config; config is a header table electric/duration/value), defaultModeIndex (1), resetTriggerElectricNames (list of electrics names whose change resets the sequences to zero; lightbarElectricsName is added to it).
- Durations are in seconds. The mode change displays an interface message.
- Inconsistency: init adds lightbarElectricsName into the jbeamData.resetTriggerElectricNames table itself (modifying the jbeam table, which accumulates at each init if the table is reused).
- reset(jbeamData) reapplies defaultModeIndex; setState/applyRemoteModeIndex changes mode without a message or cutting the output values.

## Functions

| Function | Description | Line |
|---|---|---|
| `controller_lightbar.getState()` | Returns the current mode index. | 231 |
| `controller_lightbar.init(jbeamData)` | Builds the modes (animated sequences and static values), registers the radial menu entry if several modes exist. *(internal)* | 143 |
| `controller_lightbar.reset(jbeamData)` | Restores the default mode. *(internal)* | 138 |
| `controller_lightbar.setModeIndex(index)` | Activates the mode at the given index: resets the sequences to zero, applies the static values and displays a message. Does nothing if the index does not exist. | 96 |
| `controller_lightbar.setState(data)` | Applies the mode index from a state table if valid. | 236 |
| `controller_lightbar.toggleMode()` | Switches to the next mode (returns to the first after the last). | 129 |
| `controller_lightbar.updateGFX(dt)` | Advances the sequences of each electrics value according to dt and writes electrics.values. *(internal)* | 43 |

### Parameter details

#### `controller_lightbar.getState()`

Returns the current mode index.

- **returns**: table State table (reused).

#### `controller_lightbar.init(jbeamData)`

Builds the modes (animated sequences and static values), registers the radial menu entry if several modes exist.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_lightbar.reset(jbeamData)`

Restores the default mode.

- `jbeamData` (*table*) : Controller jbeam data.

#### `controller_lightbar.setModeIndex(index)`

Activates the mode at the given index: resets the sequences to zero, applies the static values and displays a message. Does nothing if the index does not exist.

- `index` (*integer*) : Index 1..n in modes.

#### `controller_lightbar.setState(data)`

Applies the mode index from a state table if valid.

- `data` (*table|nil*) : State table.

#### `controller_lightbar.updateGFX(dt)`

Advances the sequences of each electrics value according to dt and writes electrics.values.

- `dt` (*number*) : Time step (s).

## Fields

| Field | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/controller/lightbar.lua`.*

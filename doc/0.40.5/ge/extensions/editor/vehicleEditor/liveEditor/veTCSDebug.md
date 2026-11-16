# `editor_vehicleEditor_liveEditor_veTCSDebug`

*File: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua` · VM: Game Engine (GE) · 238 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_vehicleEditor_liveEditor_veTCSDebug`: `extensions.load("editor_vehicleEditor_liveEditor_veTCSDebug")`, then the global `editor_vehicleEditor_liveEditor_veTCSDebug`

'TCS Debug' window of the live Vehicle Editor: plots in real time (600 history points) the traction control data of the vehicle's first 'esc' type controller (debugData.tcs): braking factors per wheel, slip per wheel with threshold, throttle factors and overall slip. Three PlotMultiLines graphs.

## Notes

- If the vehicle has no esc controller, vEditor.tcsData is nil and nothing is plotted.
- The histories are initialized only once (didInit) with the keys seen at the first reception; a vehicle change does not reinitialize them.
- At most 4 wheel colors (5 for graph 2) are defined; beyond that, the color is nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veTCSDebug.onDeserialized(data)` | Restores the open state. *(internal)* *(hook)* | 222 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.onExtensionLoaded()` | Called when the extension is loaded: fills the slipThresholds history with 600 zeros. *(internal)* *(hook)* | 206 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.onExtensionUnloaded()` | Called on unload (does nothing). *(internal)* *(hook)* | 213 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.onSerialize()` | Returns {windowOpen}. *(internal)* *(hook)* | 216 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.onUpdate(dt)` | Called every frame: requests the TCS data from the vehicle, updates the histories and draws the graphs. *(internal)* *(hook)* | 35 |
| `editor_vehicleEditor_liveEditor_veTCSDebug.open()` | Opens the window. | 201 |

### Parameter details

#### `editor_vehicleEditor_liveEditor_veTCSDebug.onDeserialized(data)`

Restores the open state.

- `data` (*table*) : onSerialize table.

#### `editor_vehicleEditor_liveEditor_veTCSDebug.onSerialize()`

Returns {windowOpen}.

- **returns**: table {windowOpen = boolean}

#### `editor_vehicleEditor_liveEditor_veTCSDebug.onUpdate(dt)`

Called every frame: requests the TCS data from the vehicle, updates the histories and draws the graphs.

- `dt` (*number*) : Time delta.

## Fields

| Field | Type | Description |
|---|---|---|
| `menuEntry` | string | 'TCS'. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/vehicleEditor/liveEditor/veTCSDebug.lua`.*

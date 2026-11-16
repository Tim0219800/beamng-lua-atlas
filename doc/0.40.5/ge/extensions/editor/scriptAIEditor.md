# `editor_scriptAIEditor`

*File: `lua/ge/extensions/editor/scriptAIEditor.lua` · VM: Game Engine (GE) · 3229 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_scriptAIEditor`: `extensions.load("editor_scriptAIEditor")`, then the global `editor_scriptAIEditor`

ScriptAI scenario editor: 'Edit ScriptAI Scenario' edit mode (BNGMicrochip toolbar icon) to create, edit and run scripted vehicle trajectories and a camera path. It opens several windows: Script AI Editor (play/pause/loop timeline), Scene Vehicles (vehicles and recording), Scene Trajectories (list), up to three individual trajectory windows, Camera Trajectory and Draw Trajectory. Trajectories are either time-based (nodes x, y, z, t) or speed-based (nodes x, y, z, v). At run time, each trajectory is sent to the vehicle by ai.startFollowing(...) and the camera path is played by core_paths.playPath.

## Notes

- Constants: speed increment 0.2778 m/s (1 km/h), minimum speed 0.1 m/s, maximum 41.67 m/s (150 km/h); standard forward (0,1,0) and up (0,0,1) axes.
- At launch, for a time-based trajectory whose first node has t > 0, this t becomes startDelay and is subtracted from all nodes.
- If the camera is included (isOnExecute), camera nodes are added at t = 0 and t = tEnd if missing; the FOV is set to 65 and bullettime to 1.
- Save/load via editor_fileDialog in JSON: the data is encoded with lpack.encode in the data field (trajectories, camera, vehicles {jBeam, config}, current time, visible windows).
- onVehicleSubmitRecording does nothing if the active edit mode is not 'Edit ScriptAI Scenario'; otherwise it creates a trajectory 'recorded_N' (speed-based if path[1].v exists, otherwise time-based).
- onDeactivate hides all the tool's windows; onActivate clears the object selection and displays the main window.
- The three individual trajectory windows are a maximum fixed by the code (name1 to name3).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_scriptAIEditor.onDeserialized(dataIn)` | Restoration hook after Lua reload: decodes data.d and restores trajectories, camera, time, unique identifiers and window state. *(internal)* *(hook)* | 3203 |
| `editor_scriptAIEditor.onEditorGui()` | Drawing hook called every editor UI frame: handles mouse and gizmos (selection, drag, free drawing), draws the trajectories and all the tool's windows (main, vehicles, list, trajectories, camera, drawing). *(internal)* *(hook)* | 1989 |
| `editor_scriptAIEditor.onEditorInitialized()` | Hook called when the editor world initializes: creates the scriptAIEditMode edit mode (onActivate/onDeactivate, icon, hideObjectIcons) and registers the eight windows; shows again those that were visible before a reload. *(internal)* *(hook)* | 3128 |
| `editor_scriptAIEditor.onSerialize()` | Serialization hook (Lua reload): returns {d = lpack.encode{...}} with trajectories, camera, time, selections and button alphas; the windows are noted as not visible. *(internal)* *(hook)* | 3186 |
| `editor_scriptAIEditor.onVehicleReplaced(vid)` | Hook called when a vehicle is replaced: updates the text and jBeam of the trajectories linked to this id. *(internal)* *(hook)* | 3169 |
| `editor_scriptAIEditor.onVehicleSubmitRecording(vid, data)` | Hook called when a vehicle's recording stops (ai.stopRecording returned to the GE): detaches the vehicle's old trajectory and creates a new trajectory 'recorded_N' from data.path. *(internal)* *(hook)* | 3153 |

### Parameter details

#### `editor_scriptAIEditor.onDeserialized(dataIn)`

Restoration hook after Lua reload: decodes data.d and restores trajectories, camera, time, unique identifiers and window state.

- `dataIn` (*table*) : Table returned by onSerialize ({d = ...}).

#### `editor_scriptAIEditor.onSerialize()`

Serialization hook (Lua reload): returns {d = lpack.encode{...}} with trajectories, camera, time, selections and button alphas; the windows are noted as not visible.

- **returns**: table Table {d = encoded string}.

#### `editor_scriptAIEditor.onVehicleReplaced(vid)`

Hook called when a vehicle is replaced: updates the text and jBeam of the trajectories linked to this id.

- `vid` (*integer*) : Id of the replaced vehicle.

#### `editor_scriptAIEditor.onVehicleSubmitRecording(vid, data)`

Hook called when a vehicle's recording stops (ai.stopRecording returned to the GE): detaches the vehicle's old trajectory and creates a new trajectory 'recorded_N' from data.path.

- `vid` (*integer*) : Id of the recorded vehicle.
- `data` (*table*) : Recording containing path (nodes with t or v).

## Calls into the engine (C++)

- `be:` `enterVehicle`
- `debugDrawer:` `drawArrow`, `drawLineInstance`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getInitialHeight`, `getInitialLength`, `getInitialWidth`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/scriptAIEditor.lua`.*

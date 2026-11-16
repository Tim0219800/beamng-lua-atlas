# `editor_ezObjectSelect`

*File: `lua/ge/extensions/editor/ezObjectSelect.lua` · VM: Game Engine (GE) · 180 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_ezObjectSelect`: `extensions.load("editor_ezObjectSelect")`, then the global `editor_ezObjectSelect`

Entry point of the editor's "Easy Select" tool. Registers an edit mode (editor.editModes.ezObjectSelect, name "Easy Select", action map "EZObjectSelect") and a tool window, then delegates the work to editor/ezObjectSelect/controller. The cut/copy/paste/duplicate/select all/deselect/delete actions are relayed to the standard mode editor.editModes.objectSelect. The mouse wheel shortcuts are documented: Ctrl+wheel cycles overlapping objects, Shift+wheel rotates the selection around world Z (Ctrl+Shift: in 1 degree steps).

## Notes

- If activating the controller fails, the mode returns to editModes.objectSelect on the next frame.
- Several hooks (object added, prefab exploded, inspector fields modified) invalidate the selection cache if the controller is active.
- The request* functions do nothing if the Easy Select mode is not the active mode.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_ezObjectSelect.onEditorAxisGizmoAligmentChanged()` | Hook (game spelling "Aligment"): relays the gizmo alignment change. *(internal)* *(hook)* | 164 |
| `editor_ezObjectSelect.onEditorAxisGizmoModeChanged(mode)` | Hook: relays the axis gizmo mode change to the controller if the mode is active. *(internal)* *(hook)* | 160 |
| `editor_ezObjectSelect.onEditorGui()` | If the mode is active, draws the screen debug and the workspace window (controller.drawWorkspace). *(internal)* *(hook)* | 86 |
| `editor_ezObjectSelect.onEditorInitialized()` | Loads the preferences, resets the input filters, registers the window (390x460 x uiscale) and the edit mode. *(internal)* *(hook)* | 77 |
| `editor_ezObjectSelect.onEditorInspectorDynFieldChanged()` | Hook: invalidates the cache (inspectorDynFieldChanged). *(internal)* *(hook)* | 148 |
| `editor_ezObjectSelect.onEditorInspectorFieldChanged()` | Hook: invalidates the cache (inspectorFieldChanged). *(internal)* *(hook)* | 144 |
| `editor_ezObjectSelect.onEditorObjectAdded()` | Hook: invalidates the selection cache (reason objectAdded). *(internal)* *(hook)* | 136 |
| `editor_ezObjectSelect.onEditorPrefabExploded()` | Hook: invalidates the cache (prefabExploded). *(internal)* *(hook)* | 140 |
| `editor_ezObjectSelect.onEditorPreferenceValueChanged(path, value)` | Hook: for gizmos.general.highlightSelectedMeshes refreshes the selection tint if the mode is active; otherwise relays to the controller. *(internal)* *(hook)* | 152 |
| `editor_ezObjectSelect.onEditorRegisterPreferences(prefsRegistry)` | Hook: lets the controller save its preferences. *(internal)* *(hook)* | 168 |
| `editor_ezObjectSelect.onExtensionLoaded()` | Loads the preferences and resets the input filters. *(internal)* *(hook)* | 111 |
| `editor_ezObjectSelect.onExtensionUnloaded()` | Leaves the mode (back to objectSelect) or deactivates the controller, then unregisters the window and the mode. *(internal)* *(hook)* | 95 |
| `editor_ezObjectSelect.requestFocusShortcut()` | Requests centering the camera on the selection (focus). | 128 |
| `editor_ezObjectSelect.requestNumpadPreset(preset)` | Forwards a numpad key to the controller (view preset). | 132 |
| `editor_ezObjectSelect.requestRotateShortcut()` | Requests the rotate operation via shortcut. | 120 |
| `editor_ezObjectSelect.requestScaleShortcut()` | Requests the scale operation via shortcut. | 124 |
| `editor_ezObjectSelect.requestTransformShortcut()` | Requests the transform (move) operation via keyboard shortcut. | 116 |

### Parameter details

#### `editor_ezObjectSelect.onEditorAxisGizmoModeChanged(mode)`

Hook: relays the axis gizmo mode change to the controller if the mode is active.

- `mode` (*any*) : New gizmo mode

#### `editor_ezObjectSelect.onEditorPreferenceValueChanged(path, value)`

Hook: for gizmos.general.highlightSelectedMeshes refreshes the selection tint if the mode is active; otherwise relays to the controller.

- `path` (*string*) : Preference path
- `value` (*any*) : New value

#### `editor_ezObjectSelect.onEditorRegisterPreferences(prefsRegistry)`

Hook: lets the controller save its preferences.

- `prefsRegistry` (*table*) : Preferences registry

#### `editor_ezObjectSelect.requestNumpadPreset(preset)`

Forwards a numpad key to the controller (view preset).

- `preset` (*any*) : Preset (inferred from code: value forwarded as-is)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/ezObjectSelect.lua`.*

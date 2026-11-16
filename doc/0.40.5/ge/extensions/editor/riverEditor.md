# `editor_riverEditor`

*File: `lua/ge/extensions/editor/riverEditor.lua` · VM: Game Engine (GE) · 57 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_riverEditor`: `extensions.load("editor_riverEditor")`, then the global `editor_riverEditor`

"River" edit mode of the world editor. This file is a thin wrapper: it loads the generic logic of meshEditor.lua (via dofile), configures it with type = "River" (preferencesName "riverEditor", niceName "River") and re-exposes its editor callbacks. It registers the riverEditMode mode (icon create_river, action map "RiverEditor", edited class River) with the shortcuts Alt + left click (create a river / add a node), copy and paste river properties.

## Notes

- Almost all the behavior comes from meshEditor.lua; the exported fields are direct aliases to meshEditor.xxx_ (nil if meshEditor does not define them).
- The same pattern is probably used by the other mesh editors (roads, etc.), but only River is configured here.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_riverEditor.onEditorInitialized()` | Hook called when the editor is initialized. Creates editor.editModes.riverEditMode (onActivate, onUpdate, onToolbar, copy/paste, delete, select all, icon, auxShortcuts) and adds the auxiliary shortcuts "Create river / Add node" (LMB + Alt), "Copy river properties" and "Paste river properties". *(internal)* *(hook)* | 17 |
| `editor_riverEditor.onExtensionLoaded()` | Hook called when the extension loads; only writes "initialized" to the log (level D). *(internal)* *(hook)* | 40 |

## Fields

| Field | Type | Description |
|---|---|---|
| `deleteNodeAM` | function | Alias of meshEditor.deleteNodeAM: node deletion, intended for the action map. |
| `onEditorAxisGizmoAligmentChanged` | function | Alias of meshEditor.onEditorAxisGizmoAligmentChanged_: axis gizmo alignment change (the spelling "Aligment" is the code's). |
| `onEditorGui` | function | Alias of meshEditor.onEditorGui_: draws the mode's ImGui interface. |
| `onEditorInspectorFieldChanged` | function | Alias of meshEditor.onEditorInspectorFieldChanged_: reacts to a field modification in the inspector. |
| `onEditorInspectorHeaderGui` | function | Alias of meshEditor.onEditorInspectorHeaderGui_: custom inspector header. |
| `onEditorObjectSelectionChanged` | function | Alias of meshEditor.onEditorObjectSelectionChanged_: the object selection changed. |
| `onEditorPreferenceValueChanged` | function | Alias of meshEditor.onEditorPreferenceValueChanged_: reacts to a preference change. |
| `onEditorRegisterPreferences` | function | Alias of meshEditor.onEditorRegisterPreferences_: declares the river editor's preferences. |
| `selectAllNodes` | function | Alias of meshEditor.selectAllNodes: selects all the river's nodes. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/riverEditor.lua`.*

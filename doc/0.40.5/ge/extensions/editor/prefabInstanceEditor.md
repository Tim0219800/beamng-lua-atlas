# `editor_prefabInstanceEditor`

*File: `lua/ge/extensions/editor/prefabInstanceEditor.lua` · VM: Game Engine (GE) · 63 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_prefabInstanceEditor`: `extensions.load("editor_prefabInstanceEditor")`, then the global `editor_prefabInstanceEditor`

Adds a "PrefabInstance" section at the top of the editor inspector when all the selected objects are PrefabInstance. If at least one instance no longer matches its parent template (matchesParentTemplate), it displays the "Make new template" and "Apply to parent" buttons.

## Notes

- The two buttons have no associated action in the code (empty if blocks): the feature is an unfinished skeleton.
- The module only reads inspectorInfo.previousSelectedIds.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_prefabInstanceEditor.onEditorInitialized()` | Called at editor initialization; only writes a log line (level I). *(internal)* *(hook)* | 15 |
| `editor_prefabInstanceEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Called every frame at the top of the inspector. Displays the collapsible "PrefabInstance" header only if the whole selection is made of PrefabInstance; the buttons only appear if an instance differs from its parent. *(internal)* *(hook)* | 19 |

### Parameter details

#### `editor_prefabInstanceEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Called every frame at the top of the inspector. Displays the collapsible "PrefabInstance" header only if the whole selection is made of PrefabInstance; the buttons only appear if an instance differs from its parent.

- `inspectorInfo` (*table*) : Inspector information; the previousSelectedIds field (list of object IDs) is used.

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/prefabInstanceEditor.lua`.*

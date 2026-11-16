# `editor_audioForestEditor`

*File: `lua/ge/extensions/editor/audioForestEditor.lua` · VM: Game Engine (GE) · 1022 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_audioForestEditor`: `extensions.load("editor_audioForestEditor")`, then the global `editor_audioForestEditor`

"Audio Forest Editor" edit mode of the level editor: configures a forest ambience sound from the trees of the Forest object. The tool builds a node graph (minimum spacing 20 m) from the included forest instances, classifies them as S/M/L according to the volume of their bounding box, sends this cloud to the runtime module core/audioForest and gives it the main event (default 'event:>Ambient>Ambiences>Forest_Static') and an optional "roomtone" ('event:>Ambient>Ambiences>Roomtone'). The window lets you exclude tree types, choose the class of each type, adjust the node visualization and select a type by clicking in the view. The state is persisted with the level through onSerialize / onDeserialized.

## Notes

- The file contains almost only local functions; only 4 functions are exported (hooks).
- Depends on the modules core/audioForest, core/audioForest/audioForestCommon and editor/toolUtilities/(render/markup, render/graph, style).
- Nodes are drawn within a radius of 1000 m by default, as 1.5 m spheres.
- When the mode is activated, if no persisted state exists, all forest types are included.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_audioForestEditor.onDeserialized(data)` | Receives the persisted state after level load; keeps it pending, marks the forest list as to be refreshed and rebuilds the node cloud if the mode is active. Ignores data that is not a table. *(internal)* *(hook)* | 1005 |
| `editor_audioForestEditor.onEditorGui()` | Called every editor frame: if the mode is active, refreshes the type list, draws the window, handles tree hover/selection and draws the graph nodes (and the centroid of the main emitter). *(internal)* *(hook)* | 918 |
| `editor_audioForestEditor.onEditorInitialized()` | Registers the audioForestEditMode edit mode (create_forest icon) and the "audioForestEditor" window (520x820). *(internal)* *(hook)* | 991 |
| `editor_audioForestEditor.onSerialize()` | Returns the tool state as a table (version=1, visualization radii, showNodes, mainEvent, roomtoneEnabled/Event/Z, selectedRow, includeByShape, classSelByShape, classOverrideByShape) for level persistence and the runtime. *(internal)* *(hook)* | 113 |

### Parameter details

#### `editor_audioForestEditor.onDeserialized(data)`

Receives the persisted state after level load; keeps it pending, marks the forest list as to be refreshed and rebuilds the node cloud if the mode is active. Ignores data that is not a table.

- `data` (*table*) : Table previously returned by onSerialize.

#### `editor_audioForestEditor.onSerialize()`

Returns the tool state as a table (version=1, visualization radii, showNodes, mainEvent, roomtoneEnabled/Event/Z, selectedRow, includeByShape, classSelByShape, classOverrideByShape) for level persistence and the runtime.

- **returns**: table Serializable editor state.

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`
- `worldEditorCppApi.` `renderForestBBs`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/audioForestEditor.lua`.*

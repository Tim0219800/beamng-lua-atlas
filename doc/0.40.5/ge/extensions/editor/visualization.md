# `editor_visualization`

*File: `lua/ge/extensions/editor/visualization.lua` · VM: Game Engine (GE) · 542 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_visualization`: `extensions.load("editor_visualization")`, then the global `editor_visualization`

"Visualization" window of the world editor. Three tabs: Debug (checkboxes for the registered visualization types: wireframe, bounding boxes, triggers, terrain, decals, light frustums, navigation graphs, Advanced Lighting views, Material Debug...), Visible (display by object class) and Selectable (selectability by class, with presets). It also adds the "Lights Status" visualization (colored spheres and texts on the scene's lights) and registers the gizmos.visualization.* preferences.

## Notes

- Preferences registered in the gizmos/visualization category: visTypes, visible, selectable (hidden tables), visualizationDrawDistance (int, default 250, 50 to 2000), saveVisualizationSettings (bool, default true), showMaterialDebugLegend (bool, default true). If saveVisualizationSettings is false, visTypes/visible/selectable are marked non-persistent.
- Lights Status: reads all lights (LightBase subclasses) with scenetree.findSubClassObjects, refreshing at most every 0.75 s. Blue = controlled by night (nightLight field), green = enabled, red = disabled (isEnabled field). Sphere radius 0.05 to 5 m (default 0.5), draw distance 10 to 2000 m (default 120). Texts are shown only within 25 m and for at most 12 lights.
- Visualizations enabled by default: SFXEmitter.renderEmitters, BeamNGWaypointDrawDebug and SceneCullingState.disableTerrainOcclusion; all the others are false.
- The "Annotation Viz" visualization is registered only if ResearchVerifier.isTechLicenseVerified() is true (BeamNG.tech license).
- The radius shown in a light's label comes from the 'range' field for a SpotLight and 'radius' for the others.
- Depends on the editor_aiViz extension (code comment: an "inelegant" dependency but convenient for reusing the navgraph visualization).

**Dependencies (loaded first):** `editor_aiViz`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_visualization.onEditorGui()` | Editor hook called every frame: draws the spheres/texts of the lights visualization, the Visualization window (search filter, three tabs), the lights settings window and the material debug legend. *(internal)* *(hook)* | 225 |
| `editor_visualization.onEditorInitialized()` | Editor hook called at initialization: initializes selectabilityPresets, registers the windows, clears then registers all visualization types (editor.registerVisualizationType), initializes materialDebugViz and computes the default values of each type. Also exposes editor.updateVisSettings. *(internal)* *(hook)* | 440 |
| `editor_visualization.onEditorPreferenceValueChanged(path, value)` | Editor hook called when a preference changes: applies visTypes, visible or selectable to the editor objects, synchronizes the selectability preset, and toggles the non-persistent paths when saveVisualizationSettings changes. *(internal)* *(hook)* | 359 |
| `editor_visualization.onEditorRegisterPreferences(prefsRegistry)` | Editor hook called when preferences are registered: remembers the initial visible/selectable state of each object class and registers the gizmos/visualization category. *(internal)* *(hook)* | 401 |

### Parameter details

#### `editor_visualization.onEditorPreferenceValueChanged(path, value)`

Editor hook called when a preference changes: applies visTypes, visible or selectable to the editor objects, synchronizes the selectability preset, and toggles the non-persistent paths when saveVisualizationSettings changes.

- `path` (*string*) : preference path, e.g. 'gizmos.visualization.visTypes'
- `value` (*any*) : new value (table for visTypes/visible/selectable, boolean for saveVisualizationSettings)

#### `editor_visualization.onEditorRegisterPreferences(prefsRegistry)`

Editor hook called when preferences are registered: remembers the initial visible/selectable state of each object class and registers the gizmos/visualization category.

- `prefsRegistry` (*table*) : editor preferences registry

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {'editor_aiViz'}: extension loaded before this one. |

## Calls into the engine (C++)

- `ResearchVerifier.` `isTechLicenseVerified`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `obj:` `getClassName`, `getDynDataFieldbyName`, `getField`, `getName`, `getPosition`, `getWorldBox`, `isSubClassOf`
- `scenetree.` `findClassObjects`, `findObject`, `findSubClassObjects`
- `worldEditorCppApi.` `getObjectClassNames`, `getRenderableObjectClassNames`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/visualization.lua`.*

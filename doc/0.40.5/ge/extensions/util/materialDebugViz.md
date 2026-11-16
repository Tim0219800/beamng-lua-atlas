# `util_materialDebugViz`

*File: `lua/ge/extensions/util/materialDebugViz.lua` · VM: Game Engine (GE) · 432 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_materialDebugViz`: `extensions.load("util_materialDebugViz")`, then the global `util_materialDebugViz`

Material (PBR) debug visualizations for the editor and rendering tools. It defines 22 modes (none, quad overdraw, wireframe, mipmap level, base color, opacity, metallic, roughness, world normals, ambient occlusion, emissive, clear coat, clear coat roughness, UV0/UV1 with checkerboard and grid, deprecated material, layer count, Draw ID uniformity). Each mode enables a debug flag in the engine (materialDebugSetFlag / enableMaterialDebug). When a mode is active, an ImGui legend window is shown at the bottom of the screen (gradient, color swatches and explanations).

## Example

```lua
extensions.load('util_materialDebugViz')
extensions.util_materialDebugViz.set('Material_Roughness')
extensions.util_materialDebugViz.set('Material_None')
```

## Notes

- Valid mode names for set: Material_None, Material_TriSize, Material_Wireframe, Material_Mip, Material_BaseColor, Material_Opacity, Material_Metallic, Material_Roughness, Material_NormalsWS, Material_AmbientOcclusion, Material_Emissive, Material_ClearCoat, Material_ClearCoatRoughness, Material_UV0, Material_UV0Checkerboard, Material_UV0ColorGrid, Material_UV1, Material_UV1Checkerboard, Material_UV1ColorGrid, Material_MaterialDeprecated, Material_LayerCount, Material_DrawIdUniformity.
- The Quad Overdraw, Mip and Draw ID Uniformity modes only work with Vulkan or Direct3D12 (stated in the legend).
- Bug: in drawLegendWindow, `editor.getPreference(...) or true` is always true when the preference is false (false or true), so the gizmos.visualization.showMaterialDebugLegend preference can never hide the legend.
- M.onUpdate is an alias of drawLegendWindow: the legend is drawn every frame, at most once per render frame id.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_materialDebugViz.drawLegendWindow()` | Draws the legend window of the active mode (horizontally centered, at 80% of the view height). Draws nothing if no mode is active or if it has no legend. Also hooked as onUpdate. | 361 |
| `util_materialDebugViz.getIndexPtr()` | Returns the integer ImGui pointer (IntPtr) holding the current mode index (0-based), usable with an ImGui combo. | 359 |
| `util_materialDebugViz.getTypes()` | Returns the list of visualization modes (tables {type='Custom', name, displayName, setter, getter}), nil before loading. | 358 |
| `util_materialDebugViz.onExtensionLoaded()` | Called on load: builds the table of visualization modes (type, name, displayName, setter, getter) and selects the index of the mode already active in the engine. *(internal)* *(hook)* | 257 |
| `util_materialDebugViz.onUpdate()` | Hook called every frame; alias of drawLegendWindow. (dynamically assigned) *(internal)* *(hook)* | dyn |
| `util_materialDebugViz.set(mode)` | Activates a visualization mode by name; with no argument or with Material_None, disables the visualization. Logs an error for an unknown name. | 410 |

### Parameter details

#### `util_materialDebugViz.getIndexPtr()`

Returns the integer ImGui pointer (IntPtr) holding the current mode index (0-based), usable with an ImGui combo.

- **returns**: userdata im.IntPtr of the current index

#### `util_materialDebugViz.getTypes()`

Returns the list of visualization modes (tables {type='Custom', name, displayName, setter, getter}), nil before loading.

- **returns**: table[]|nil Available modes

#### `util_materialDebugViz.set(mode)`

Activates a visualization mode by name; with no argument or with Material_None, disables the visualization. Logs an error for an unknown name.

- `mode` (*string|nil*) : Mode name, for example Material_Roughness

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/materialDebugViz.lua`.*

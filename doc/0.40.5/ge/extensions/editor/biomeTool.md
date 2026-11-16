# `editor_biomeTool`

*File: `lua/ge/extensions/editor/biomeTool.lua` · VM: Game Engine (GE) · 3986 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_biomeTool`: `extensions.load("editor_biomeTool")`, then the global `editor_biomeTool`

"Biome Tool" (edit mode "Edit Biome") of the level editor: generates vegetation (Forest objects) and paints terrain materials in layers. Two layer types (terrain = 0, area = 1); "area" layers contain lasso zones (inclusion/exclusion) or zones by terrain material. Each layer has fields (forest density, slope influence and range, falloff and border density, Add/Replace/Delete blending method, field placement with distance/rows/orientation, random area by RA_* noise, edge placement EP_*). The tool relies on ForestBrushTool and the forest brushes. Layers are read from <level>/art/biomeTool/biomeTool.json at initialization and rewritten after each level save.

## Notes

- Almost the whole file is local (140 local functions); the exported API is limited to 5 hooks. The "var" table is the internal state of the tool, not an exposed class; its get/setEP* methods are listed in classes.var for reference.
- Bug: M.onExtensionLoaded = onExtensionLoaded references a variable never defined in the file: the exported field is nil.
- If no Forest object exists, onEditorGui opens a "NoForestObjDialog" modal window offering to create one (worldEditorCppApi.createObject('Forest'), named "theForest").
- On load and save, the level path is deduced from getMissionFilename() (second segment of the path); the biomeTool.json file is deleted then rewritten only if at least one layer exists.
- The var.setEP* functions sometimes return fieldInfo.val (default value of the template) when they create the field, and nil otherwise: unreliable return value, to be ignored.
- var.setEPRandomTiltRange modifies the table passed as a parameter (range is reused as slopeRangeValid).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_biomeTool.onEditorAfterSaveLevel()` | Hook called after the level is saved: writes the layers (var.layers) to <level>/art/biomeTool/biomeTool.json (old file deleted first). Does nothing if there is no layer. *(internal)* *(hook)* | 3962 |
| `editor_biomeTool.onEditorGui()` | Called every editor frame. Does nothing outside the "Edit Biome" mode. Otherwise checks for the presence of a Forest object (creation dialog otherwise) and draws the interface (Level Biome / Biome Areas tabs), the lasso, the zones and the highlight animations. *(internal)* *(hook)* | 3623 |
| `editor_biomeTool.onEditorInitialized()` | Initialization: loads the level's biomeTool.json if it exists, fills the list of forest brushes and materials, registers the biomeEditMode edit mode (biome_tool icon), the "biomeTool" window (500x560), the NoForestObjDialog modal window and the custom field editors (TerrainMaterial, BlendingMethod, SlopeRange, VegetationFalloff, FieldPlacement, RA_Map). *(internal)* *(hook)* | 3903 |
| `editor_biomeTool.onEditorToolWindowGotFocus(windowName)` | Hook: when the "biomeTool" window gets focus, activates the biomeEditMode edit mode. *(internal)* *(hook)* | 3956 |
| `editor_biomeTool.onEditorToolWindowHide(windowName)` | Hook: when the "biomeTool" window is hidden, switches back to the objectSelect edit mode. *(internal)* *(hook)* | 3950 |

### Parameter details

#### `editor_biomeTool.onEditorToolWindowGotFocus(windowName)`

Hook: when the "biomeTool" window gets focus, activates the biomeEditMode edit mode.

- `windowName` (*string*) : Name of the window that got focus.

#### `editor_biomeTool.onEditorToolWindowHide(windowName)`

Hook: when the "biomeTool" window is hidden, switches back to the objectSelect edit mode.

- `windowName` (*string*) : Name of the hidden window.

## Fields

| Field | Type | Description |
|---|---|---|
| `onExtensionLoaded` | nil | Is nil: reference to a variable never defined in the file. ⚠ reference `onExtensionLoaded` not defined in the file (probably nil) |

## Class `var`

Internal state table of the tool (layers, zones, lasso, forest brushes, generation queue). Only a few accessor methods for the "edge placement" fields and the bounds are defined on it; layerType is 0 (terrain), 1 (area) or 2 (any, in the field templates).

| Method | Description | Line |
|---|---|---|
| `var.getEPFalloff(layerType, layerID)` | Returns the border falloff (EP_BorderFalloff, -10 to 10) of a layer; creates the field with the default value (0.0) if missing. | 1473 |
| `var.getEPItemDistance(layerType, layerID)` | Returns the distance between objects for edge placement (EP_ItemDistance, -10 to 10, default 1); creates the field if missing. | 1516 |
| `var.getEPRandomTiltRange(layerType, layerID)` | Returns the random tilt range (EP_RandomTilt field) of a layer; {-5, 5} by default if the layer does not have this field. | 1431 |
| `var.getFieldMinMax(layerType, layerID, fieldName)` | Returns the {min, max} bounds of a field of the fieldInfoTemplate template for this layer type; {0, 0} if not found. | 1421 |
| `var.setEPFalloff(layerType, layerID, val)` | Sets EP_BorderFalloff of a layer, clamped to the field's minValue/maxValue; creates the field if missing. | 1494 |
| `var.setEPItemDistance(layerType, layerID, val)` | Sets EP_ItemDistance of a layer, clamped to -10..10; creates the field if missing. | 1537 |
| `var.setEPRandomTiltRange(layerType, layerID, range)` | Sets the EP_RandomTilt range of a layer, clamped to -40..40; creates the field if missing. The passed table is modified. | 1447 |

## Calls into the engine (C++)

- `Engine.` `castRay`
- `FS:` `fileExists`, `removeFile`
- `debugDrawer:` `drawLineInstance`, `drawSphere`
- `obj:` `getClassName`, `getId`, `getInternalName`
- `scenetree.` `findClassObjects`, `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/biomeTool.lua`.*

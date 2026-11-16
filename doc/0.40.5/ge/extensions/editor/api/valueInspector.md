# `editor_api_valueInspector`

*File: `lua/ge/extensions/editor/api/valueInspector.lua` · VM: Game Engine (GE) · 1470 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/api/valueInspector")` (file under extensions/ but not a regular extension)

ImGui widget of the editor's field inspector: displays a field (name + value) in two columns and provides the editor suited to its type (text, float, int, bool, file, Point2F/3F/4F, Euler rotation, ColorF/ColorI colors, EaseF, RectF, material, datablock, annotation, SFX, etc.). The module returns a constructor function; each call creates an independent inspector. On import it also adds to editor functions to register custom editors, filters and label changers per class and field name. Useful to an editor tool modder to display object fields with the same rendering as the game's inspector.

## Example

```lua
local newInspector = require('editor/api/valueInspector')
local insp = newInspector()
insp.setValueCallback = function(name, value, idx, custom, editEnded) --[[ apply ]] end
insp:valueEditorGui('mass', 1200, nil, 'Mass', 'Mass in kg', 'float', 'TypeF32', nil, nil, nil, 0)
```

## Notes

- The module returns function() with no parameters: there are no options to pass to the constructor (init() sets the default values).
- Useful instance fields set by init: inspectorName ('default'), setValueCallback(fieldName, fieldValue, arrayIndex, customData, editEndedBool) to be provided, selectionClassName (class of the selection, used to find custom editors), selectedIds, differentValuesFieldFlags (fields whose value differs between selected objects, displayed in orange and bold), addTypeToTooltip.
- Custom editors/filters/label changers are keyed by the concatenation fieldName .. className.
- Functions added to editor at import: registerCustomFieldInspectorEditor, unregisterCustomFieldInspectorEditor, findCustomFieldEditor, registerCustomFieldInspectorFilter, unregisterCustomFieldInspectorFilter, findCustomFieldFilter, registerCustomFieldLabelChanger, unregisterCustomFieldLabelChanger, findCustomFieldLabelChanger, valueInspectorCopyPasteMenu, valueInspectorFilenameContextMenu, getAnnotations, getAnnotationsTbl.
- The float format depends on the ui.general.floatDigitCount preference, read on every valueEditorGui call.
- Copy/paste with Ctrl+C / Ctrl+V on the field name (preference ui.general.inspectorFieldNameHoverCopyPaste): the clipboard contains JSON {copiedValue, copiedFieldType}; pasting is refused only if the types differ and the destination is not a string.
- The datablock/annotation tables are global to the module (shared by all inspectors) and initialized once.

## Class `C`

Inspector object returned by the module constructor (require(...)()). Instance methods.

The module returns a constructor: `local obj = require("editor_api_valueInspector")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:deleteTexObjs()` | Clears the cache of preview textures used in the material selector. | 504 |
| `C:displayMaterialPopupList(objectSet, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className)` | Like displaySimSetPopupList but for materials: popup with texture previews (texObjs cache) and filtering by name or tag. | 299 |
| `C:displaySimSetPopupList(objectSetArray, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className)` | Displays a "..." button and the current value, and on click a filterable popup listing the objects of the given SimSets so one can be picked. | 212 |
| `C:init()` | Initializes the ImGui buffers (text, integers, floats, boolean, combo) and the default fields. Called automatically by the constructor. | 426 |
| `C:initializeTables(force)` | Builds (only once, unless forced) the global annotation and datablock tables used by the selectors. | 492 |
| `C:reinitializeTables()` | Marks the global tables as to be rebuilt at the next initializeTables. | 488 |
| `C:setSimSetWindowFieldId(id)` | Sets the id of the field whose SimSet selection popup window is open (nil to close it). | 500 |
| `C:valueEditorGui(fieldName, fieldValue, arrayIndex, fieldLabel, fieldDesc, fieldType, fieldTypeName, customData, pasteCallback, contextMenuUI, indeterminateFlags)` | Draws a complete field: label (with fieldDesc tooltip, copy/paste menu) and an editing widget chosen by fieldTypeName then fieldType. Calls a custom editor if one is registered for (selection class, fieldName). Any change is sent to self.setValueCallback. | 565 |

## Calls into the engine (C++)

- `Sim.` `findObject`, `findObjectById`, `findObjectByIdNoUpcast`, `findObjectByPersistID`, `getDataBlockSet`, `getMaterialSet`, `getRootGroup`, `getSFXAmbienceSet`, `getSFXDescriptionSet`, `getSFXEnvironmentSet`, `getSFXParameterGroup`, `getSFXStateSet`, `getSFXTrackSet`
- `obj:` `getClassName`, `getField`, `getID`, `getId`, `getName`
- `scenetree.` `findObject`, `findObjectById`
- `ui_imgui.` `Button`
- `worldEditorCppApi.` `findDerivedDatablockClassname`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/valueInspector.lua`.*

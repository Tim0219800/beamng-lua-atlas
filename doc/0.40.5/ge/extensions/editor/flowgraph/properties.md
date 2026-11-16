# `editor_flowgraph_properties`

*File: `lua/ge/extensions/editor/flowgraph/properties.lua` · VM: Game Engine (GE) · 1325 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/flowgraph/properties")` (file under extensions/ but not a regular extension)

"Properties" window (fg_properties) of the Flowgraph editor: inspector of the selected node (or the current graph). It displays a colored header with custom renaming/colors, the node's specific properties (node:drawCustomProperties), its data table, its input pins (hardcoded value, templates, visibility) and output pins (current _value), and the graph properties (name, macro tags...). Each change adds a history entry via fgEditor.addHistory.

## Notes

- _drawInputField handles number (float/int, input or slider depending on pin.numericSetup, min/max bounds applied), string and other types; the ImGui values are cached in item._cdata.
- The local variable `previousNode` (file upvalue) is used to call showProperties/hideProperties on the previously selected node; self.previousNode (init) is not used afterwards.
- Only the "single selected node" case displays the node properties.
- The inputs are disabled (BeginDisabled) when mgr.allowEditing is false.
- In _drawDataTable with keysEditable, the key rename callback calls saveCallback with v[k] already set to nil (nil value).

## Class `C`

Window class (windowName 'fg_properties', windowDescription 'Properties').

| Method | Description | Line |
|---|---|---|
| `C:_drawDataTable(path, cdata, v, savePath, saveCallback, keysEditable)` | Draws a data table in two key/value columns (sorted keys), or a single row if the only key is 'value'. | 158 |
| `C:_drawInputField(path, cdata, type, v, savePath, saveCallback, enterOnly, padRight, pin)` | Draws an edit field suited to the value type and calls saveCallback when the input is validated. | 24 |
| `C:customPropertyColor(item, customName, cdata)` | Draws an RGBA color picker for a custom property and writes it to item[customName] at the end of the edit. | 199 |
| `C:draw(dt)` | Draws the window: highlights the links of the selected nodes, handles selection changes, displays the selected node or the graph properties. | 1020 |
| `C:drawCustomInPins(item)` | Draws the editable "Input Pins" section for nodes with custom input pins (allowCustomInPins). | 397 |
| `C:drawCustomOutPins(item)` | Draws the editable output pins section (allowCustomOutPins). | 610 |
| `C:drawGraphProperties(graph)` | Draws the properties of a graph (name, with update of the integrated node for a macro, etc.). | 1156 |
| `C:drawHardTemplates(pin, item)` | Draws the "..." combo offering hardcoded value templates for a pin (file selection if pin.allowFiles, path relative to the project folder). | 745 |
| `C:drawInPins(item)` | Draws the "Input Pins" section: visibility, type icon, name, hardcoded value or link. | 804 |
| `C:drawItemHeader(item)` | Draws the item's colored header with its name and the edit button (mode_edit) for the name and colors. | 231 |
| `C:drawItemProperties(itemType, item)` | Draws the item's data table then its input and output pins (editable or not). | 976 |
| `C:drawOutPins(item)` | Draws the "Output Pins" section: visibility (can be hidden if not linked), type, name and current value (pin._value). | 934 |
| `C:getFirstAllowedType(types)` | Returns the first allowed type (alphabetical order) of a types table; 'number' if types is nil, 'bool' if none. | 388 |
| `C:init()` | Registers the window (visible by default) and loads the header texture art/imgui_node_header.png. | 18 |
| `C:initCustomProperties(item)` | Prepares the name and color (customColor/color, iconColor) edit fields of an item. | 211 |
| `C:showAvailableMacroTags()` | Lists the project's macro tags (mgr.macroTags) with renaming and deletion. | 1133 |
| `C:unselect()` | Calls hideProperties on the previously displayed node and resets the edit states. Called when the window closes. | 1124 |

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/flowgraph/properties.lua`.*

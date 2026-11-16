# `ui_flowgraph_editor`

*File: `lua/common/extensions/ui/flowgraph/editor.lua` · VM: Common (GE + vehicle) · 966 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_flowgraph_editor`: `extensions.load("ui_flowgraph_editor")`, then the global `ui_flowgraph_editor`

UI helper for the flowgraph editor (ui_flowgraph_editor). It integrates the node engine API (editor_api_luaintf), defines the colors/icons of node categories and pin types, the styles of graph types (state, graph, macro, instance), value display utilities, a variable editor, a vehicle selector and tests on node behavior categories. Useful to a modder writing a custom flowgraph node or ImGui tool.

## Notes

- types[type].icon is filled with typeIcons[type] or M.IconType_Circle; M.IconType_Circle comes from fge.enum, but the getTypeIcon() accessor returns an icon name (string) or M.detaultIconType ("fg_type_circle"), not the enum value: the two sources are therefore not consistent.
- fullValueString does not handle the 'boolean' type (only 'bool'), unlike shortValueString: a value typed 'boolean' returns "???" in the full version.
- The field detaultIconType is written with this typo (detault) in the code.
- tooltip() displays nothing if editor_flowgraphEditor.allowTooltip is false.
- The comment of the flowgraphVersion field in the auto page comes from a commented-out print; the value is 0.2 (0.1: until the April 2021 release; 0.2: flat lists for graphs).
- Recognized node categories: repeat_/once_/dynamic_ combined with instant, p_duration, f_duration, plus 'simple' and 'provider'.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_flowgraph_editor.fullDisplay(value, tpe)` | Displays fullValueString in ImGui; for a color type, first draws a colored square. | 273 |
| `ui_flowgraph_editor.fullValueString(value, tpe)` | Like shortValueString but without truncation: numbers in %f format, vec3/quat/color with %f. Returns "nil" if nil. | 238 |
| `ui_flowgraph_editor.getAutoTypeFromName(name)` | Guesses the pin type from the (lowercase) name: pos/scl/vec/position/scale/vector -> vec3; rot/quat/rotation/orientation -> quat; clr/color -> color; num/id/number/amount/score/count/time/duration/length/dist/points/threshold/velocity -> number; bool/enabled/disabled/contains/has.../uses.../with... -> bool; otherwise string. | 875 |
| `ui_flowgraph_editor.getBehaviourDescription(behaviour)` | English text describing a node behavior (once, duration, simple, singleActive, obsolete); nil otherwise. | 871 |
| `ui_flowgraph_editor.getBehaviourIcon(behaviour)` | Icon of a node behavior: once, duration, simple, singleActive, obsolete; nil otherwise. | 867 |
| `ui_flowgraph_editor.getGraphTypes()` | Returns the styles of the graph types (state, graph, macro, instance): name, color, tab colors, gridColor, abbreviation. | 186 |
| `ui_flowgraph_editor.getSimpleTypes()` | Returns the list of simple types: number, bool, string, vec3, quat, color. | 160 |
| `ui_flowgraph_editor.getTypeColor(dataType)` | ImGui color of a pin type; brown (0.45, 0.35, 0.1, 1) if the type is unknown. | 178 |
| `ui_flowgraph_editor.getTypeIcon(dataType)` | Icon name of a pin type, or "fg_type_circle" by default. | 182 |
| `ui_flowgraph_editor.getTypes()` | Returns the table of pin types with their color and icon. | 164 |
| `ui_flowgraph_editor.isDurationNode(category)` | True for the categories *_p_duration and *_f_duration (repeat, once, dynamic). | 833 |
| `ui_flowgraph_editor.isDynamicNode(category)` | True for dynamic_instant, dynamic_p_duration, dynamic_f_duration. | 854 |
| `ui_flowgraph_editor.isF_DurationNode(category)` | True for the categories *_f_duration (repeat, once, dynamic). | 842 |
| `ui_flowgraph_editor.isFunctionalNode(category)` | True for the categories repeat/once/dynamic × instant/p_duration/f_duration as well as 'simple' and 'provider'. | 814 |
| `ui_flowgraph_editor.isOnceNode(category)` | True for once_instant, once_p_duration, once_f_duration. | 848 |
| `ui_flowgraph_editor.isSimpleNode(category)` | True for 'simple' and 'provider' (nodes that do not need flow). | 828 |
| `ui_flowgraph_editor.shortDisplay(value, tpe)` | Displays shortValueString in ImGui (im.Text); for a color type, first draws a small colored square. Displays "nil" if the value is nil. | 225 |
| `ui_flowgraph_editor.shortValueString(value, tpe)` | Short representation of a value according to its type: strings truncated to 10 characters + "...", numbers to 2 decimals, vec3/quat/color with 1 decimal; "(nil)" if nil, "Flowing / Not Flowing" for flow, "???" if the type is not handled. If the type is absent/any/table, it is guessed. | 190 |
| `ui_flowgraph_editor.tooltip(message)` | Displays an ImGui tooltip for the hovered item, only if editor_flowgraphEditor.allowTooltip is true. | 168 |
| `ui_flowgraph_editor.variableEditor(source, name, displayOptions)` | Draws an ImGui widget to edit a flowgraph variable (string, number, etc. according to variable.type) from source:getFull(name); also offers rename/delete via a context menu. Displays "Variable X not found!" if absent. In edit mode, changes the base value (changeBase) and adds a history entry; otherwise changes the current value (changeInstant). | 286 |
| `ui_flowgraph_editor.vehicleSelector(self, onlyModel)` | Draws an ImGui vehicle selector: "Load Models and Configs" button (loads core_vehicles.getModelList), text search and choice of model then config. Updates self.model, self.config, self.vehType, self.modelName, self.configName. Returns a change reason (reason) or nil. | 567 |
| `ui_flowgraph_editor.vehicleSelectorRefresh(self, onlyModel)` | Updates self.modelName and self.configName (and self.configs sorted by name) from self.model / self.config / self.models. | 522 |

### Parameter details

#### `ui_flowgraph_editor.fullDisplay(value, tpe)`

Displays fullValueString in ImGui; for a color type, first draws a colored square.

- `value` (*any*) : Value to display.
- `tpe` (*string|nil*) : Pin type.

#### `ui_flowgraph_editor.fullValueString(value, tpe)`

Like shortValueString but without truncation: numbers in %f format, vec3/quat/color with %f. Returns "nil" if nil.

- `value` (*any*) : Value to format.
- `tpe` (*string|table|nil*) : Pin type; guessed if nil, any or table.
- **returns**: string Formatted text.

#### `ui_flowgraph_editor.getAutoTypeFromName(name)`

Guesses the pin type from the (lowercase) name: pos/scl/vec/position/scale/vector -> vec3; rot/quat/rotation/orientation -> quat; clr/color -> color; num/id/number/amount/score/count/time/duration/length/dist/points/threshold/velocity -> number; bool/enabled/disabled/contains/has.../uses.../with... -> bool; otherwise string.

- `name` (*string*) : Pin or field name.
- **returns**: string Guessed type.

#### `ui_flowgraph_editor.getBehaviourDescription(behaviour)`

English text describing a node behavior (once, duration, simple, singleActive, obsolete); nil otherwise.

- `behaviour` (*string*) : Behavior name.
- **returns**: string|nil Description.

#### `ui_flowgraph_editor.getBehaviourIcon(behaviour)`

Icon of a node behavior: once, duration, simple, singleActive, obsolete; nil otherwise.

- `behaviour` (*string*) : Behavior name.
- **returns**: string|nil Icon name.

#### `ui_flowgraph_editor.getGraphTypes()`

Returns the styles of the graph types (state, graph, macro, instance): name, color, tab colors, gridColor, abbreviation.

- **returns**: table<string, table> Styles per graph type.

#### `ui_flowgraph_editor.getSimpleTypes()`

Returns the list of simple types: number, bool, string, vec3, quat, color.

- **returns**: string[] Names of the simple types.

#### `ui_flowgraph_editor.getTypeColor(dataType)`

ImGui color of a pin type; brown (0.45, 0.35, 0.1, 1) if the type is unknown.

- `dataType` (*string*) : Pin type (flow, chainFlow, impulse, string, number, bool, any, table, vec3, quat, color, state).
- **returns**: ImVec4 Color.

#### `ui_flowgraph_editor.getTypeIcon(dataType)`

Icon name of a pin type, or "fg_type_circle" by default.

- `dataType` (*string*) : Pin type.
- **returns**: string Icon name.

#### `ui_flowgraph_editor.getTypes()`

Returns the table of pin types with their color and icon.

- **returns**: table<string, table> By type name: {color, icon}.

#### `ui_flowgraph_editor.isDurationNode(category)`

True for the categories *_p_duration and *_f_duration (repeat, once, dynamic).

- `category` (*string*) : Node category.
- **returns**: boolean Result.

#### `ui_flowgraph_editor.isDynamicNode(category)`

True for dynamic_instant, dynamic_p_duration, dynamic_f_duration.

- `category` (*string*) : Node category.
- **returns**: boolean Result.

#### `ui_flowgraph_editor.isF_DurationNode(category)`

True for the categories *_f_duration (repeat, once, dynamic).

- `category` (*string*) : Node category.
- **returns**: boolean Result.

#### `ui_flowgraph_editor.isFunctionalNode(category)`

True for the categories repeat/once/dynamic × instant/p_duration/f_duration as well as 'simple' and 'provider'.

- `category` (*string*) : Node category.
- **returns**: boolean Result.

#### `ui_flowgraph_editor.isOnceNode(category)`

True for once_instant, once_p_duration, once_f_duration.

- `category` (*string*) : Node category.
- **returns**: boolean Result.

#### `ui_flowgraph_editor.isSimpleNode(category)`

True for 'simple' and 'provider' (nodes that do not need flow).

- `category` (*string*) : Node category.
- **returns**: boolean Result.

#### `ui_flowgraph_editor.shortDisplay(value, tpe)`

Displays shortValueString in ImGui (im.Text); for a color type, first draws a small colored square. Displays "nil" if the value is nil.

- `value` (*any*) : Value to display.
- `tpe` (*string|nil*) : Pin type.

#### `ui_flowgraph_editor.shortValueString(value, tpe)`

Short representation of a value according to its type: strings truncated to 10 characters + "...", numbers to 2 decimals, vec3/quat/color with 1 decimal; "(nil)" if nil, "Flowing / Not Flowing" for flow, "???" if the type is not handled. If the type is absent/any/table, it is guessed.

- `value` (*any*) : Value to format.
- `tpe` (*string|table|nil*) : Pin type; guessed if nil, any or table.
- **returns**: string Formatted text.

#### `ui_flowgraph_editor.tooltip(message)`

Displays an ImGui tooltip for the hovered item, only if editor_flowgraphEditor.allowTooltip is true.

- `message` (*string*) : Tooltip text.

#### `ui_flowgraph_editor.variableEditor(source, name, displayOptions)`

Draws an ImGui widget to edit a flowgraph variable (string, number, etc. according to variable.type) from source:getFull(name); also offers rename/delete via a context menu. Displays "Variable X not found!" if absent. In edit mode, changes the base value (changeBase) and adds a history entry; otherwise changes the current value (changeInstant).

- `source` (*table*) : Object holding the variables (graph or manager) with getFull, changeBase, changeInstant, renameVariable, mgr.
- `name` (*string*) : Variable name.
- `displayOptions` (*table|nil*) : Options: global, allowEditing (default source.mgr.allowEditing), onlyValue.

#### `ui_flowgraph_editor.vehicleSelector(self, onlyModel)`

Draws an ImGui vehicle selector: "Load Models and Configs" button (loads core_vehicles.getModelList), text search and choice of model then config. Updates self.model, self.config, self.vehType, self.modelName, self.configName. Returns a change reason (reason) or nil.

- `self` (*table*) : Selector state object.
- `onlyModel` (*boolean|nil*) : If true, only picks the model, not the configuration.
- **returns**: string|nil Reason for the change (not checked in detail).

#### `ui_flowgraph_editor.vehicleSelectorRefresh(self, onlyModel)`

Updates self.modelName and self.configName (and self.configs sorted by name) from self.model / self.config / self.models.

- `self` (*table*) : Selection object (fields model, config, models, configs).
- `onlyModel` (*boolean|nil*) : Not used in the function body.

## Fields

| Field | Type | Description |
|---|---|---|
| `defaultTypeIconSize` | number | Default size of pin type icons: 18. |
| `detaultIconType` | string | Default type icon: "fg_type_circle". |
| `flowgraphVersion` | number | Flowgraph format version (0.2: flat lists for graphs). |
| `nodeColors` | table<string, ImVec4> | Color per node category (crash, ai, debug, vehicle, event, ui, camera, scene, default, career, traffic...). |
| `nodeIcons` | table<string, string> | Icon name per node category (vehicle, ai, camera, ui, event, scene, state, thread, logic, traffic, debug, button, timer, file, career, tech...). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/ui/flowgraph/editor.lua`.*

---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/flowgraph/editor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- UI helper for the flowgraph editor (ui_flowgraph_editor). It integrates the node engine API (editor_api_luaintf), defines the colors/icons of node categories and pin types, the styles of graph types (state, graph, macro, instance), value display utilities, a variable editor, a vehicle selector and tests on node behavior categories. Useful to a modder writing a custom flowgraph node or ImGui tool.
--- Access: extension `ui_flowgraph_editor`: `extensions.load("ui_flowgraph_editor")`, then the global `ui_flowgraph_editor`
---@class ui_flowgraph_editor
---@field defaultTypeIconSize number Default size of pin type icons: 18.
---@field detaultIconType string Default type icon: "fg_type_circle".
---@field flowgraphVersion number Flowgraph format version (0.2: flat lists for graphs).
---@field nodeColors table<string, ImVec4> Color per node category (crash, ai, debug, vehicle, event, ui, camera, scene, default, career, traffic...).
---@field nodeIcons table<string, string> Icon name per node category (vehicle, ai, camera, ui, event, scene, state, thread, logic, traffic, debug, button, timer, file, career, tech...).
ui_flowgraph_editor = {}

--- Displays fullValueString in ImGui; for a color type, first draws a colored square.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:273
---@param value any Value to display.
---@param tpe string|nil Pin type.
function ui_flowgraph_editor.fullDisplay(value, tpe) end

--- Like shortValueString but without truncation: numbers in %f format, vec3/quat/color with %f. Returns "nil" if nil.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:238
---@param value any Value to format.
---@param tpe string|table|nil Pin type; guessed if nil, any or table.
---@return string  Formatted text.
function ui_flowgraph_editor.fullValueString(value, tpe) end

--- Guesses the pin type from the (lowercase) name: pos/scl/vec/position/scale/vector -> vec3; rot/quat/rotation/orientation -> quat; clr/color -> color; num/id/number/amount/score/count/time/duration/length/dist/points/threshold/velocity -> number; bool/enabled/disabled/contains/has.../uses.../with... -> bool; otherwise string.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:875
---@param name string Pin or field name.
---@return string  Guessed type.
function ui_flowgraph_editor.getAutoTypeFromName(name) end

--- English text describing a node behavior (once, duration, simple, singleActive, obsolete); nil otherwise.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:871
---@param behaviour string Behavior name.
---@return string|nil  Description.
function ui_flowgraph_editor.getBehaviourDescription(behaviour) end

--- Icon of a node behavior: once, duration, simple, singleActive, obsolete; nil otherwise.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:867
---@param behaviour string Behavior name.
---@return string|nil  Icon name.
function ui_flowgraph_editor.getBehaviourIcon(behaviour) end

--- Returns the styles of the graph types (state, graph, macro, instance): name, color, tab colors, gridColor, abbreviation.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:186
---@return table<string, table>  Styles per graph type.
function ui_flowgraph_editor.getGraphTypes() end

--- Returns the list of simple types: number, bool, string, vec3, quat, color.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:160
---@return string[]  Names of the simple types.
function ui_flowgraph_editor.getSimpleTypes() end

--- ImGui color of a pin type; brown (0.45, 0.35, 0.1, 1) if the type is unknown.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:178
---@param dataType string Pin type (flow, chainFlow, impulse, string, number, bool, any, table, vec3, quat, color, state).
---@return ImVec4  Color.
function ui_flowgraph_editor.getTypeColor(dataType) end

--- Icon name of a pin type, or "fg_type_circle" by default.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:182
---@param dataType string Pin type.
---@return string  Icon name.
function ui_flowgraph_editor.getTypeIcon(dataType) end

--- Returns the table of pin types with their color and icon.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:164
---@return table<string, table>  By type name: {color, icon}.
function ui_flowgraph_editor.getTypes() end

--- True for the categories *_p_duration and *_f_duration (repeat, once, dynamic).
---Source: lua/common/extensions/ui/flowgraph/editor.lua:833
---@param category string Node category.
---@return boolean  Result.
function ui_flowgraph_editor.isDurationNode(category) end

--- True for dynamic_instant, dynamic_p_duration, dynamic_f_duration.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:854
---@param category string Node category.
---@return boolean  Result.
function ui_flowgraph_editor.isDynamicNode(category) end

--- True for the categories *_f_duration (repeat, once, dynamic).
---Source: lua/common/extensions/ui/flowgraph/editor.lua:842
---@param category string Node category.
---@return boolean  Result.
function ui_flowgraph_editor.isF_DurationNode(category) end

--- True for the categories repeat/once/dynamic × instant/p_duration/f_duration as well as 'simple' and 'provider'.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:814
---@param category string Node category.
---@return boolean  Result.
function ui_flowgraph_editor.isFunctionalNode(category) end

--- True for once_instant, once_p_duration, once_f_duration.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:848
---@param category string Node category.
---@return boolean  Result.
function ui_flowgraph_editor.isOnceNode(category) end

--- True for 'simple' and 'provider' (nodes that do not need flow).
---Source: lua/common/extensions/ui/flowgraph/editor.lua:828
---@param category string Node category.
---@return boolean  Result.
function ui_flowgraph_editor.isSimpleNode(category) end

--- Displays shortValueString in ImGui (im.Text); for a color type, first draws a small colored square. Displays "nil" if the value is nil.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:225
---@param value any Value to display.
---@param tpe string|nil Pin type.
function ui_flowgraph_editor.shortDisplay(value, tpe) end

--- Short representation of a value according to its type: strings truncated to 10 characters + "...", numbers to 2 decimals, vec3/quat/color with 1 decimal; "(nil)" if nil, "Flowing / Not Flowing" for flow, "???" if the type is not handled. If the type is absent/any/table, it is guessed.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:190
---@param value any Value to format.
---@param tpe string|table|nil Pin type; guessed if nil, any or table.
---@return string  Formatted text.
function ui_flowgraph_editor.shortValueString(value, tpe) end

--- Displays an ImGui tooltip for the hovered item, only if editor_flowgraphEditor.allowTooltip is true.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:168
---@param message string Tooltip text.
function ui_flowgraph_editor.tooltip(message) end

--- Draws an ImGui widget to edit a flowgraph variable (string, number, etc. according to variable.type) from source:getFull(name); also offers rename/delete via a context menu. Displays "Variable X not found!" if absent. In edit mode, changes the base value (changeBase) and adds a history entry; otherwise changes the current value (changeInstant).
---Source: lua/common/extensions/ui/flowgraph/editor.lua:286
---@param source table Object holding the variables (graph or manager) with getFull, changeBase, changeInstant, renameVariable, mgr.
---@param name string Variable name.
---@param displayOptions table|nil Options: global, allowEditing (default source.mgr.allowEditing), onlyValue.
function ui_flowgraph_editor.variableEditor(source, name, displayOptions) end

--- Draws an ImGui vehicle selector: "Load Models and Configs" button (loads core_vehicles.getModelList), text search and choice of model then config. Updates self.model, self.config, self.vehType, self.modelName, self.configName. Returns a change reason (reason) or nil.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:567
---@param self table Selector state object.
---@param onlyModel boolean|nil If true, only picks the model, not the configuration.
---@return string|nil  Reason for the change (not checked in detail).
function ui_flowgraph_editor.vehicleSelector(self, onlyModel) end

--- Updates self.modelName and self.configName (and self.configs sorted by name) from self.model / self.config / self.models.
---Source: lua/common/extensions/ui/flowgraph/editor.lua:522
---@param self table Selection object (fields model, config, models, configs).
---@param onlyModel boolean|nil Not used in the function body.
function ui_flowgraph_editor.vehicleSelectorRefresh(self, onlyModel) end


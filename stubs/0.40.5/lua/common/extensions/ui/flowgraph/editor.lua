---@meta
-- tim19Atlas stub generated from lua/common/extensions/ui/flowgraph/editor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_flowgraph_editor` : `extensions.load("ui_flowgraph_editor")`, puis la globale `ui_flowgraph_editor`
---@class ui_flowgraph_editor
---@field defaultTypeIconSize number
---@field detaultIconType string
---@field flowgraphVersion number
---@field nodeColors table
---@field nodeIcons table
ui_flowgraph_editor = {}

---Source : lua/common/extensions/ui/flowgraph/editor.lua:273
---@param value any
---@param tpe any
function ui_flowgraph_editor.fullDisplay(value, tpe) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:238
---@param value any
---@param tpe any
function ui_flowgraph_editor.fullValueString(value, tpe) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:875
---@param name any
function ui_flowgraph_editor.getAutoTypeFromName(name) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:871
---@param behaviour any
function ui_flowgraph_editor.getBehaviourDescription(behaviour) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:867
---@param behaviour any
function ui_flowgraph_editor.getBehaviourIcon(behaviour) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:186
function ui_flowgraph_editor.getGraphTypes() end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:160
function ui_flowgraph_editor.getSimpleTypes() end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:178
---@param dataType any
function ui_flowgraph_editor.getTypeColor(dataType) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:182
---@param dataType any
function ui_flowgraph_editor.getTypeIcon(dataType) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:164
function ui_flowgraph_editor.getTypes() end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:833
---@param category any
function ui_flowgraph_editor.isDurationNode(category) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:854
---@param category any
function ui_flowgraph_editor.isDynamicNode(category) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:842
---@param category any
function ui_flowgraph_editor.isF_DurationNode(category) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:814
---@param category any
function ui_flowgraph_editor.isFunctionalNode(category) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:848
---@param category any
function ui_flowgraph_editor.isOnceNode(category) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:828
---@param category any
function ui_flowgraph_editor.isSimpleNode(category) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:225
---@param value any
---@param tpe any
function ui_flowgraph_editor.shortDisplay(value, tpe) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:190
---@param value any
---@param tpe any
function ui_flowgraph_editor.shortValueString(value, tpe) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:168
---@param message any
function ui_flowgraph_editor.tooltip(message) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:286
---@param source any
---@param name any
---@param displayOptions any
function ui_flowgraph_editor.variableEditor(source, name, displayOptions) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:567
---@param self any
---@param onlyModel any
function ui_flowgraph_editor.vehicleSelector(self, onlyModel) end

---Source : lua/common/extensions/ui/flowgraph/editor.lua:522
---@param self any
---@param onlyModel any
function ui_flowgraph_editor.vehicleSelectorRefresh(self, onlyModel) end


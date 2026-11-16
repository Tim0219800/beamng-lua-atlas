---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/genericInspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Inspector object. After `initialize` it contains valueInspector, fieldSetter, fieldNameFilter (ImGuiTextFilter), inspectorFieldModifiers, etc.
---@class editor_api_genericInspector
local editor_api_genericInspector = {}

--- Prepares the inspector: creates a valueInspector (unique name "genericInspectorN"), the search filter and the ImGui buffers, and hooks `fieldSetter` as the value modification callback.
---Source: lua/ge/extensions/editor/api/genericInspector.lua:214
---@param fieldSetter function function(fieldName, fieldValue, arrayIndex, customData, editEnded) called when the user modifies a field
function editor_api_genericInspector:initialize(fieldSetter) end

--- Draws the inspector for the given field list: search bar, groups, simple fields, value arrays and field arrays (beginArray type). Shows "<No search matches>" if the filter matches nothing. To be called every frame in the ImGui window.
---Source: lua/ge/extensions/editor/api/genericInspector.lua:37
---@param fields table|nil field list {name, value, type, typeName, id, groupName, fieldDocs, hideInInspector, isArray...}; nil = display nothing
function editor_api_genericInspector:inspectorGui(fields) end

--- Builds the field list by calling `fieldCallback(i)` for i = 1, 2, ... until it returns nil (maximum 1000), then calls `inspectorGui`.
---Source: lua/ge/extensions/editor/api/genericInspector.lua:23
---@param fieldCallback function function(index) -> table|nil, returns field number index or nil at the end
function editor_api_genericInspector:inspectorGuiWithFieldCallback(fieldCallback) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/customFieldsUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the custom fields widget.
---@class editor_util_customFieldsUtil
local editor_util_customFieldsUtil = {}

--- Adds the entered tag to the fields (ignored if empty) then empties the input area.
---Source: lua/ge/extensions/editor/util/customFieldsUtil.lua:168
function editor_util_customFieldsUtil:addTag() end

--- Draws the table of fields (Name, Value, Type, Remove button) and the add row with type choice and Add button.
---Source: lua/ge/extensions/editor/util/customFieldsUtil.lua:38
function editor_util_customFieldsUtil:drawCustomFields() end

--- Draws the list of tags (click: "Remove Tag" popup), the tag input, the presetTags combo and the Add Tag button.
---Source: lua/ge/extensions/editor/util/customFieldsUtil.lua:105
function editor_util_customFieldsUtil:drawTags() end

--- Initializes the widget: unique name (used in imgui identifiers), texts, enableTags/enableFields flags, presetTags list, allowed types; applies the options then setFields and refresh.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/customFieldsUtil.lua:9
---@param name string|nil Unique name of the instance, default "Custom Fields".
---@param fields table|nil customFields object to edit.
---@param options table|nil Overrides of existing attributes.
function editor_util_customFieldsUtil:init(name, fields, options) end

--- Callback for the edit mode; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/customFieldsUtil.lua:188
function editor_util_customFieldsUtil:onActivate() end

--- Callback for the edit mode; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/customFieldsUtil.lua:191
function editor_util_customFieldsUtil:onDeactivate() end

--- Resets the input areas (name, value, tag) and the current type to "string".
---Source: lua/ge/extensions/editor/util/customFieldsUtil.lua:27
function editor_util_customFieldsUtil:refresh() end

--- Sets the customFields object being edited (creates an empty one if nil).
---Source: lua/ge/extensions/editor/util/customFieldsUtil.lua:34
---@param fields table|nil customFields object.
function editor_util_customFieldsUtil:setFields(fields) end

--- Draws the tags then the fields, according to enableTags and enableFields.
---Source: lua/ge/extensions/editor/util/customFieldsUtil.lua:178
function editor_util_customFieldsUtil:widget() end


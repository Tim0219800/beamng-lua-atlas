---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/customFields.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the module constructor. Fields: names (field order), types, values, tags (set) and sortedTags (sorted list).
---@class gameplay_util_customFields
local gameplay_util_customFields = {}

--- Adds a typed field; the value is validated according to the type.
---Source: lua/ge/extensions/gameplay/util/customFields.lua:137
---@param name string Field name.
---@param datatype string string, number, boolean, vec3 or quat.
---@param value any Initial value.
---@return boolean  false if the name already exists.
function gameplay_util_customFields:add(name, datatype, value) end

--- Adds a tag and re-sorts the list.
---Source: lua/ge/extensions/gameplay/util/customFields.lua:103
---@param tag string Tag to add.
---@return boolean|nil  false if absent or already present, nil otherwise.
function gameplay_util_customFields:addTag(tag) end

--- Reads a field.
---Source: lua/ge/extensions/gameplay/util/customFields.lua:152
---@param name string Field name.
---@return any  Value.
---@return string|nil  Type.
---@return boolean  true if found.
function gameplay_util_customFields:get(name) end

--- Tests whether a field exists.
---Source: lua/ge/extensions/gameplay/util/customFields.lua:151
---@param name string Field name.
---@return boolean
function gameplay_util_customFields:has(name) end

--- Initializes the names, types, values, tags and sortedTags tables.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/customFields.lua:10
function gameplay_util_customFields:init() end

--- Recreates all fields and tags from the serialized data (clears the existing state).
---Source: lua/ge/extensions/gameplay/util/customFields.lua:37
---@param data table Table produced by onSerialize.
function gameplay_util_customFields:onDeserialized(data) end

--- Returns {names, types, values, tags}; vec3 and quat are converted to tables.
---Source: lua/ge/extensions/gameplay/util/customFields.lua:18
---@return table  Serializable data.
function gameplay_util_customFields:onSerialize() end

--- Deletes a field.
---Source: lua/ge/extensions/gameplay/util/customFields.lua:125
---@param name string Field name.
---@return boolean  false if the field does not exist.
function gameplay_util_customFields:remove(name) end

--- Removes a tag, designated by its name or its index in sortedTags.
---Source: lua/ge/extensions/gameplay/util/customFields.lua:112
---@param tag string|integer Name or index.
---@return boolean  false if the tag does not exist.
function gameplay_util_customFields:removeTag(tag) end

--- Changes the value of an existing field (without type validation).
---Source: lua/ge/extensions/gameplay/util/customFields.lua:91
---@param name string Field name.
---@param value any New value.
---@return boolean  false if the field does not exist.
function gameplay_util_customFields:set(name, value) end

--- Rebuilds sortedTags (tags sorted alphabetically) from tags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/customFields.lua:160
function gameplay_util_customFields:updateTags() end

--- Converts a value to the requested type (string, number, boolean, vec3, quat).
---Source: lua/ge/extensions/gameplay/util/customFields.lua:62
---@param value any Value to convert.
---@param datatype string Target type.
---@return any  Converted value; nil if the type is unknown.
function gameplay_util_customFields:validate(value, datatype) end


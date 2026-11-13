---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/customFields.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/util/customFields.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_util_customFields
local gameplay_util_customFields = {}

---Source : lua/ge/extensions/gameplay/util/customFields.lua:137
---@param name any
---@param datatype any
---@param value any
function gameplay_util_customFields:add(name, datatype, value) end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:103
---@param tag any
function gameplay_util_customFields:addTag(tag) end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:152
---@param name any
function gameplay_util_customFields:get(name) end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:151
---@param name any
function gameplay_util_customFields:has(name) end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:10
function gameplay_util_customFields:init() end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:37
---@param data any
function gameplay_util_customFields:onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:18
function gameplay_util_customFields:onSerialize() end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:125
---@param name any
function gameplay_util_customFields:remove(name) end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:112
---@param tag any
function gameplay_util_customFields:removeTag(tag) end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:91
---@param name any
---@param value any
function gameplay_util_customFields:set(name, value) end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:160
function gameplay_util_customFields:updateTags() end

---Source : lua/ge/extensions/gameplay/util/customFields.lua:62
---@param value any
---@param datatype any
function gameplay_util_customFields:validate(value, datatype) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/sortedList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/util/sortedList.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_util_sortedList
local gameplay_util_sortedList = {}

---Source : lua/ge/extensions/gameplay/util/sortedList.lua:74
function gameplay_util_sortedList:buildNamesDir() end

---Source : lua/ge/extensions/gameplay/util/sortedList.lua:22
function gameplay_util_sortedList:clear() end

---Source : lua/ge/extensions/gameplay/util/sortedList.lua:32
---@param name any
---@param forceId any
---@param skipSort any
function gameplay_util_sortedList:create(name, forceId, skipSort) end

---Source : lua/ge/extensions/gameplay/util/sortedList.lua:83
---@param drawMode any
function gameplay_util_sortedList:drawDebug(drawMode) end

--- This creates objects.
---Source : lua/ge/extensions/gameplay/util/sortedList.lua:10
---@param name any
---@param parent any
---@param objectConstructor any
function gameplay_util_sortedList:init(name, parent, objectConstructor) end

---Source : lua/ge/extensions/gameplay/util/sortedList.lua:63
---@param id any
---@param dir any
function gameplay_util_sortedList:move(id, dir) end

---Source : lua/ge/extensions/gameplay/util/sortedList.lua:98
---@param data any
---@param oldIdMap any
function gameplay_util_sortedList:onDeserialized(data, oldIdMap) end

---Source : lua/ge/extensions/gameplay/util/sortedList.lua:89
---@param parent any
function gameplay_util_sortedList:onSerialize(parent) end

---Source : lua/ge/extensions/gameplay/util/sortedList.lua:43
---@param obj any
function gameplay_util_sortedList:remove(obj) end

---Source : lua/ge/extensions/gameplay/util/sortedList.lua:52
function gameplay_util_sortedList:sort() end


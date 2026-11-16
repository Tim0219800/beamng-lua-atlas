---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/util/sortedList.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ordered list. Fields: name, parent, objectConstructor, objects (id -> object), sorted (sorted array), byName.
---@class gameplay_util_sortedList
local gameplay_util_sortedList = {}

--- Rebuilds the byName index.
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:74
function gameplay_util_sortedList:buildNamesDir() end

--- Clears the list (objects, sorted, byName) then calls postClear.
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:22
function gameplay_util_sortedList:clear() end

--- Creates an element via objectConstructor, registers it and re-sorts (unless skipSort), then calls postCreate.
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:32
---@param name string Element name.
---@param forceId integer|nil Forced id.
---@param skipSort boolean|nil Do not re-sort (useful for batch creation).
---@return table  New element.
function gameplay_util_sortedList:create(name, forceId, skipSort) end

--- Calls drawDebug(drawMode) on each element.
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:83
---@param drawMode any Draw mode passed through unchanged.
function gameplay_util_sortedList:drawDebug(drawMode) end

--- Creates the (empty) list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:10
---@param name string List name.
---@param parent table Parent object passed to the element constructor.
---@param objectConstructor function function(parent, name, forceId) returning a new element.
function gameplay_util_sortedList:init(name, parent, objectConstructor) end

--- Swaps an element's position with its neighbor in the given direction.
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:63
---@param id integer Element id.
---@param dir integer -1 toward the start, +1 toward the end.
function gameplay_util_sortedList:move(id, dir) end

--- Clears the list and recreates the elements from the data.
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:98
---@param data table[]|nil Serialized data.
---@param oldIdMap table<integer, integer> Table filled with old id -> new id.
function gameplay_util_sortedList:onDeserialized(data, oldIdMap) end

--- Returns the list of serialized non-procedural elements, in order.
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:89
---@param parent any Unused.
---@return table[]  Element data.
function gameplay_util_sortedList:onSerialize(parent) end

--- Removes an element (object or id), re-sorts then calls postRemove.
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:43
---@param obj table|integer Element or its id.
function gameplay_util_sortedList:remove(obj) end

--- Rebuilds sorted according to sortOrder and renumbers sortOrder from 1 to N.
---Source: lua/ge/extensions/gameplay/util/sortedList.lua:52
function gameplay_util_sortedList:sort() end


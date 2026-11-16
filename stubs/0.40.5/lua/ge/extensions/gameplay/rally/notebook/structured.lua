---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/structured.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Structured" storage of a rally pacenote in six fixed slots (string keys "1" to "6", which are also the reading order): 1 = caution, 2 and 3 = modifiers before the corner, 4 = corner, 5 and 6 = modifiers after. An empty slot is {}. Each item is a typed table { type = ..., ... }; the active style provides the labels. The module also migrates the old v1 (list) and v2 (4 slots) schemas on deserialization. The module returns an object constructor (class C) and exposes M.* helpers that accept an object or a raw table.
--- Access: `require("extensions/gameplay/rally/notebook/structured")` (file under extensions/ but not a regular extension)
---@class gameplay_rally_notebook_structured
gameplay_rally_notebook_structured = {}

--- Utility version: returns the ordered list of non-empty items of a structured object or a raw table (also handles the old v2 schemas). (dynamically assigned)
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:dyn
---@param structured table Structured object or raw table (with or without an items field).
---@return table[]  Items in slot order; {} if the argument is not a table.
function gameplay_rally_notebook_structured.orderedItems(structured) end

--- Utility version: replaces the content with an ordered list of items, distributed into the slots. Calls the instance method if it exists, otherwise writes items and schemaVersion into the table. (dynamically assigned)
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:dyn
---@param structured table Structured object or raw table (modified in place).
---@param items table[] Typed items.
function gameplay_rally_notebook_structured.setOrderedItems(structured, items) end

--- Utility version: returns the item of a slot, or nil if it is empty. (dynamically assigned)
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:dyn
---@param structured table Structured object or raw table.
---@param index integer Slot number from 1 to 6.
---@return table|nil  Item { type = ... } or nil.
function gameplay_rally_notebook_structured.slotItem(structured, index) end

--- Utility version: returns the normalized table of the six slots (keys "1".."6"), migrating v1/v2 schemas if needed. (dynamically assigned)
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:dyn
---@param structured table Structured object or raw table.
---@return table<string, table>  Slot map; empty slots = {}.
function gameplay_rally_notebook_structured.slotItems(structured) end

--- Object returned by Structured(): fields schemaVersion and items (map of the six slots).
---@class gameplay_rally_notebook_structured_C
local gameplay_rally_notebook_structured_C = {}

--- true if at least one slot is filled.
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:311
---@return boolean  Result.
function gameplay_rally_notebook_structured_C:hasItems() end

--- Constructor: current schema, six empty slots.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:248
function gameplay_rally_notebook_structured_C:init() end

--- Number of non-empty items.
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:307
---@return integer  Count.
function gameplay_rally_notebook_structured_C:itemCount() end

--- Reloads from saved data (data.items, data.schemaVersion), migrating the v1 (ordered list) and v2 (four slots) schemas to schema v3.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:253
---@param data table|nil Serialized data; nil leaves the object empty.
function gameplay_rally_notebook_structured_C:onDeserialized(data) end

--- Returns { schemaVersion, items } where items is the normalized map of the six slots.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:274
---@return table  Data to write as JSON.
function gameplay_rally_notebook_structured_C:onSerialize() end

--- List of non-empty items in the order of slots 1 to 6.
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:281
---@return table[]  Items.
function gameplay_rally_notebook_structured_C:orderedItems() end

--- Replaces the content from an ordered list (caution -> 1, corner -> 4, modifiers -> 2/3 before or 5/6 after the corner). Surplus items are ignored with a warning.
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:297
---@param items table[] Typed items.
function gameplay_rally_notebook_structured_C:setOrderedItems(items) end

--- Replaces the content from a slot map (keys "1".."6" or integers).
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:302
---@param items table Slot map.
function gameplay_rally_notebook_structured_C:setSlotItems(items) end

--- Item of a slot, or nil if it is empty.
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:289
---@param index integer Slot from 1 to 6.
---@return table|nil  Element or nil.
function gameplay_rally_notebook_structured_C:slotItem(index) end

--- Normalized copy of the map of the six slots.
---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:285
---@return table<string, table>  Slots "1".."6".
function gameplay_rally_notebook_structured_C:slotItems() end

--- Module table: helpers orderedItems, slotItems, slotItem, setOrderedItems (see functions). Calling the module as a function creates an instance of C.
---@class gameplay_rally_notebook_structured_M
local gameplay_rally_notebook_structured_M = {}

---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:315
---@param structured any
function gameplay_rally_notebook_structured_M.orderedItems(structured) end

---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:359
---@param structured any
---@param items any
function gameplay_rally_notebook_structured_M.setOrderedItems(structured, items) end

---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:342
---@param structured any
---@param index any
function gameplay_rally_notebook_structured_M.slotItem(structured, index) end

---Source: lua/ge/extensions/gameplay/rally/notebook/structured.lua:327
---@param structured any
function gameplay_rally_notebook_structured_M.slotItems(structured) end


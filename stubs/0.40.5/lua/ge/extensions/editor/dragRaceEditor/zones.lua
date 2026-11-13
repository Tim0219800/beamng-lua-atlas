---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/zones.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Zone editing for drag strip zone and lane zones (crawl boundary-style).
---  Uses gameplay/sites/zone and same vertex manipulation as crawl boundaries.
--- Accès : extension `editor_dragRaceEditor_zones` : `extensions.load("editor_dragRaceEditor_zones")`, puis la globale `editor_dragRaceEditor_zones`
---@class editor_dragRaceEditor_zones
---@field zoneFromData any
---@field zoneToData any
editor_dragRaceEditor_zones = {}

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:334
function editor_dragRaceEditor_zones.init() end

--- Classe locale `C` de lua/ge/extensions/editor/dragRaceEditor/zones.lua
---@class editor_dragRaceEditor_zones_C
local editor_dragRaceEditor_zones_C = {}

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:226
function editor_dragRaceEditor_zones_C:beginDrag() end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:75
function editor_dragRaceEditor_zones_C:clearZone() end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:237
function editor_dragRaceEditor_zones_C:dragging() end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:318
---@param mouseInfo any
function editor_dragRaceEditor_zones_C:draw(mouseInfo) end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:129
---@param pos any
function editor_dragRaceEditor_zones_C:dropToTerrain(pos) end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:295
function editor_dragRaceEditor_zones_C:endDragging() end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:99
---@param mouseInfo any
---@param objects any
function editor_dragRaceEditor_zones_C:findVert(mouseInfo, objects) end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:57
function editor_dragRaceEditor_zones_C:init() end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:157
---@param mouseInfo any
function editor_dragRaceEditor_zones_C:input(mouseInfo) end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:68
---@param zoneInstance any
---@param target any
function editor_dragRaceEditor_zones_C:setZone(zoneInstance, target) end

--- Write zone back to strip.stripZone or lane.zone and mark strip dirty.
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:83
function editor_dragRaceEditor_zones_C:syncBack() end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:138
---@param mouseInfo any
function editor_dragRaceEditor_zones_C:tryInsert(mouseInfo) end

---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:201
function editor_dragRaceEditor_zones_C:updateTransform() end

--- Build Zone instance from serialized zone data (strip.stripZone or lane.zone table). Allows empty vertices for editor.
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:41
---@param data any
function editor_dragRaceEditor_zones_C.zoneFromData(data) end

--- Serialize Zone to table (for writing back to strip/lane).
---Source : lua/ge/extensions/editor/dragRaceEditor/zones.lua:52
---@param zone any
function editor_dragRaceEditor_zones_C.zoneToData(zone) end


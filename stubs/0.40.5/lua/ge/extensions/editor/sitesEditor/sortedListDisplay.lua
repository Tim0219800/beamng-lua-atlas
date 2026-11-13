---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua (instanciée par la fonction renvoyée par le module)
---@class editor_sitesEditor_sortedListDisplay
local editor_sitesEditor_sortedListDisplay = {}

--- Switch list selection without calling elementEditor:select (keeps in-progress gizmo drag).
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:112
---@param id any
function editor_sitesEditor_sortedListDisplay:adoptElement(id) end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:139
---@param mouseInfo any
function editor_sitesEditor_sortedListDisplay:draw(mouseInfo) end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:288
---@param fields any
function editor_sitesEditor_sortedListDisplay:drawCustomFields(fields) end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:194
function editor_sitesEditor_sortedListDisplay:drawList() end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:308
function editor_sitesEditor_sortedListDisplay:getCurrentSelected() end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:9
---@param sitesEditor any
---@param key any
---@param elementEditor any
function editor_sitesEditor_sortedListDisplay:init(sitesEditor, key, elementEditor) end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:147
function editor_sitesEditor_sortedListDisplay:input() end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:66
---@param id any
---@param mode any
function editor_sitesEditor_sortedListDisplay:selectElement(id, mode) end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:45
function editor_sitesEditor_sortedListDisplay:selected() end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:187
---@param name any
---@param value any
function editor_sitesEditor_sortedListDisplay:setField(name, value) end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:24
---@param sites any
function editor_sitesEditor_sortedListDisplay:setSites(sites) end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:57
function editor_sitesEditor_sortedListDisplay:unselect() end

---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:32
function editor_sitesEditor_sortedListDisplay:updateActiveTags() end


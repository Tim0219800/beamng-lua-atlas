---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the constructor. Fields: key, index (last selected id), selections (list of ids), objects, sorted, elementEditor, activeTags, createByShift, selectByClick, windowDescription.
---@class editor_sitesEditor_sortedListDisplay
local editor_sitesEditor_sortedListDisplay = {}

--- Changes the list selection without calling elementEditor:select, to keep a gizmo drag in progress (used after the Shift duplication).
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:112
---@param id integer Element id.
function editor_sitesEditor_sortedListDisplay:adoptElement(id) end

--- Draws the tab; handles mouse input if the gizmo is allowed.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:139
---@param mouseInfo table Mouse info from sitesEditor.
function editor_sitesEditor_sortedListDisplay:draw(mouseInfo) end

--- Draws the custom fields widget and the Copy Fields / Paste Fields buttons.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:288
---@param fields table customFields of the element.
function editor_sitesEditor_sortedListDisplay:drawCustomFields(fields) end

--- Draws the filterable list on the left and the element edit panel on the right.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:194
function editor_sitesEditor_sortedListDisplay:drawList() end

--- Returns the currently selected element.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:308
---@return table|nil  Element or nil.
function editor_sitesEditor_sortedListDisplay:getCurrentSelected() end

--- Constructor: prepares the selection (editor.selection[key]), the custom fields and the search box.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:9
---@param sitesEditor table editor_sitesEditor module.
---@param key string 'locations', 'zones' or 'parkingSpots'.
---@param elementEditor table Element sub-editor.
function editor_sitesEditor_sortedListDisplay:init(sitesEditor, key, elementEditor) end

--- Handles clicks in the world: creation by Shift+click, selection by hitTest or delegation to elementEditor:input.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:147
function editor_sitesEditor_sortedListDisplay:input() end

--- Selects the element with the given id (nil to deselect), updates highlight, element editor, tags and edit fields.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:66
---@param id integer|nil Element id.
---@param mode string|nil nil replaces the selection; 'toggle' or 'add' extends it (toggle removes an already selected id).
function editor_sitesEditor_sortedListDisplay:selectElement(id, mode) end

--- Called when the tab becomes active: clears the selection and sets the objects to 'normal' drawing.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:45
function editor_sitesEditor_sortedListDisplay:selected() end

--- Changes a field (name, color...) of all the selected elements via an undoable action.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:187
---@param name string Field name.
---@param value any New value.
function editor_sitesEditor_sortedListDisplay:setField(name, value) end

--- Sets the edited sites, keeps objects and sorted, passes them to the element editor and recomputes the active tags.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:24
---@param sites table Sites object.
function editor_sitesEditor_sortedListDisplay:setSites(sites) end

--- Called when the tab is left: clears the selection and sets the objects to 'faded' drawing.
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:57
function editor_sitesEditor_sortedListDisplay:unselect() end

--- Recounts the tags used by the elements (table tag to count).
---Source: lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:32
function editor_sitesEditor_sortedListDisplay:updateActiveTags() end


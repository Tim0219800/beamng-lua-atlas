---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/uiRows.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_uiRows` : `extensions.load("editor_toolUtilities_uiRows")`, puis la globale `editor_toolUtilities_uiRows`
---@class editor_toolUtilities_uiRows
---@field LABEL_COL_W number
editor_toolUtilities_uiRows = {}

--- Reset icon left of the slider (spacer when already at default); caller draws the slider between begin/endSliderRow.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:31
---@param id any
---@param atDefault any
---@param onReset any
function editor_toolUtilities_uiRows.beginSliderRow(id, atDefault, onReset) end

---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:92
---@param label any
---@param flags any
function editor_toolUtilities_uiRows.beginSubTab(label, flags) end

---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:45
function editor_toolUtilities_uiRows.endSliderRow() end

--- Every sub-tab closes with a line under its content.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:99
function editor_toolUtilities_uiRows.endSubTab() end

--- A list's closing line, remembered so the sub-tab holding it does not draw a second one straight under it.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:87
function editor_toolUtilities_uiRows.markSep() end

--- A row of option buttons any number of which can be lit at once, for a choice that is a mix. `has(id)` says which are lit.
--- Takes the bare { id, tip, icon } rows and the kit's named records alike. `offCol` is the unlit button, as the tool's own
--- option rows draw it. Answers the id clicked, or nil.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:70
---@param opts any
---@param id any
---@param has any
---@param offCol any
function editor_toolUtilities_uiRows.mixRow(opts, id, has, offCol) end

--- The icon button throws on a nil glyph, so an unknown name falls back to a plain square.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:63
---@param name any
function editor_toolUtilities_uiRows.optIcon(name) end

--- Label to the left of a row of buttons.
---Source : lua/ge/extensions/editor/toolUtilities/uiRows.lua:53
---@param label any
---@param tip any
---@param col any
function editor_toolUtilities_uiRows.rowLabel(label, tip, col) end


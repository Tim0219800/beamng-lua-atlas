---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/uiRows.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui row shapes that the editor tool panels are made of: a slider preceded by its reset button, a label in front of a row of option buttons, and a sub-tab that closes with a separator line. Shared so the windows look alike (30 px column for the reset, labels 118 px wide). Uses the 'crystal' palette and util.beginSubTab/endSubTab.
--- Access: extension `editor_toolUtilities_uiRows`: `extensions.load("editor_toolUtilities_uiRows")`, then the global `editor_toolUtilities_uiRows`
---@class editor_toolUtilities_uiRows
---@field LABEL_COL_W number Width of the label column (118), to align stacked button rows.
editor_toolUtilities_uiRows = {}

--- Reset icon to the left of the slider (empty space if already at the default value). The caller draws the slider between beginSliderRow and endSliderRow.
---Source: lua/ge/extensions/editor/toolUtilities/uiRows.lua:31
---@param id string Base ImGui identifier.
---@param atDefault boolean True: default value, no button.
---@param onReset function Called when the reset button is clicked.
function editor_toolUtilities_uiRows.beginSliderRow(id, atDefault, onReset) end

--- Opens a sub-tab via util.beginSubTab and resets the separator memory.
---Source: lua/ge/extensions/editor/toolUtilities/uiRows.lua:92
---@param label string Title.
---@param flags integer|nil ImGui flags passed to util.beginSubTab.
---@return boolean  True if the tab is open (inferred from code).
function editor_toolUtilities_uiRows.beginSubTab(label, flags) end

--- Closes the slider row (width, columns, style).
---Source: lua/ge/extensions/editor/toolUtilities/uiRows.lua:45
function editor_toolUtilities_uiRows.endSliderRow() end

--- Closes a sub-tab with a separator line, unless the last thing drawn was already one or there is no vertical space left.
---Source: lua/ge/extensions/editor/toolUtilities/uiRows.lua:99
function editor_toolUtilities_uiRows.endSubTab() end

--- Draws the closing line of a list and remembers its position, so that the sub-tab containing it does not draw a second one just below.
---Source: lua/ge/extensions/editor/toolUtilities/uiRows.lua:87
function editor_toolUtilities_uiRows.markSep() end

--- Button row where several can be lit at the same time, for a choice that is a mix. `has(id)` tells which ones are lit. The tooltip says "In the mix" or not.
---Source: lua/ge/extensions/editor/toolUtilities/uiRows.lua:70
---@param opts table List of options { id, tip, icon } or positional triplets.
---@param id string ImGui identifier prefix.
---@param has function has(optId) returns true if the option is lit.
---@param offCol ImVec4 Color of the unlit button.
---@return string|nil  Identifier of the clicked option, nil otherwise.
function editor_toolUtilities_uiRows.mixRow(opts, id, has, offCol) end

--- Returns the editor icon of that name, or a plain square if it is unknown.
---Source: lua/ge/extensions/editor/toolUtilities/uiRows.lua:63
---@param name string Name in editor.icons.
---@return any  Icon.
function editor_toolUtilities_uiRows.optIcon(name) end

--- Label to the left of a button row, followed by a SameLine at a fixed X (at least the label width).
---Source: lua/ge/extensions/editor/toolUtilities/uiRows.lua:53
---@param label string Text.
---@param tip string|nil Tooltip.
---@param col ImVec4|nil Color (greenB by default).
function editor_toolUtilities_uiRows.rowLabel(label, tip, col) end


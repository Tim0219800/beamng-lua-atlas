---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/iconOverview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor window "Available Icons" (Window > Debug menu) that lists all the icons of editor.icons in a filterable grid, with a tooltip of the name. Clicking an icon copies its name to the clipboard. The window menu allows recreating the icon atlas (editor.createIconAtlas). drawContent is reusable by other tools to offer an icon picker.
--- Access: extension `editor_iconOverview`: `extensions.load("editor_iconOverview")`, then the global `editor_iconOverview`
---@class editor_iconOverview
editor_iconOverview = {}

--- Draws the search field and the filtered icon grid in the current ImGui window. Calls selectedFun(iconName) when the user clicks an icon.
---Source: lua/ge/extensions/editor/iconOverview.lua:40
---@param selectedFun function|nil Callback receiving the name of the clicked icon (string). Default nop.
function editor_iconOverview.drawContent(selectedFun) end

--- Hook called when the editor is activated; empty in this file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/iconOverview.lua:116
function editor_iconOverview.onEditorActivated() end

--- Called every frame by the editor; displays the "Available Icons" window (menu + drawContent with copy to clipboard).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/iconOverview.lua:32
function editor_iconOverview.onEditorGui() end

--- Called at editor initialization; builds the sorted icon list, registers the window (600x600) and adds the "Available Icons" menu in the Debug group.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/iconOverview.lua:123
function editor_iconOverview.onEditorInitialized() end

--- Hook called when the extension loads; empty in this file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/iconOverview.lua:131
function editor_iconOverview.onExtensionLoaded() end

--- Shows the "iconOverview" window (editor.showWindow). Same function as the menu entry.
---Source: lua/ge/extensions/editor/iconOverview.lua:119
function editor_iconOverview.open() end


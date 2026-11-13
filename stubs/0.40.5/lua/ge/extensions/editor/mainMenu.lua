---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/mainMenu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_mainMenu` : `extensions.load("editor_mainMenu")`, puis la globale `editor_mainMenu`
---@class editor_mainMenu
---@field dependencies table
editor_mainMenu = {}

---Source : lua/ge/extensions/editor/mainMenu.lua:865
function editor_mainMenu.onEditorActivated() end

---Source : lua/ge/extensions/editor/mainMenu.lua:692
function editor_mainMenu.onEditorGuiMainMenu() end

---Source : lua/ge/extensions/editor/mainMenu.lua:872
function editor_mainMenu.onEditorInitialized() end

---Source : lua/ge/extensions/editor/mainMenu.lua:921
---@param state any
function editor_mainMenu.onEditorLoadState(state) end

---Source : lua/ge/extensions/editor/mainMenu.lua:906
---@param path any
---@param value any
function editor_mainMenu.onEditorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/mainMenu.lua:916
---@param state any
function editor_mainMenu.onEditorSaveState(state) end

---Source : lua/ge/extensions/editor/mainMenu.lua:847
function editor_mainMenu.onExtensionLoaded() end

--- Classe locale `editor` de lua/ge/extensions/editor/mainMenu.lua
---@class editor_mainMenu_editor
local editor_mainMenu_editor = {}

--- Add a new item in the main menu's `Window`.
---  if defaultToolWindow is true, then this is a window that opens by default in the editor, like Inspector and Scene Tree
---  and they will appear at the top of the Window menu, separated at the bottom with a menu separator, by other tool windows
---  @param itemText the text for the tools menu item
---  @param func the callback function called when the item is clicked
---  @param info [table] with info about this window menu item, with the following fields:
---  @param experimental [boolean] the extension tool is experimental if true, and it will be added to the Experimental submenu
---  @param gameplay [boolean] if true, then this extension tool will be shown on the gameplay Window menu (reduced editor, for gameplay only), but when full editor is on, it will also be visible in the Window menu
---  @param defaultToolWindow [boolean] if true, then this menu item will be shown at the top of the Window menu
---Source : lua/ge/extensions/editor/mainMenu.lua:804
---@param itemText any
---@param actionFunc any
---@param info any
---@param defaultToolWindow any
function editor_mainMenu_editor.addWindowMenuItem(itemText, actionFunc, info, defaultToolWindow) end

--- Hides the status bar. Please always use this function after your operation was completed.
---Source : lua/ge/extensions/editor/mainMenu.lua:617
function editor_mainMenu_editor.hideStatusBar() end

---Source : lua/ge/extensions/editor/mainMenu.lua:143
---@param force any
function editor_mainMenu_editor.rebuildCollision(force) end

--- Sets the current status bar text and optional UI. The status bar will be visible only when the text is non empty.
---  @param text the text shown in the status bar
---  @param uiCallback a function that will render additional imgui UI elements (progress bars, buttons etc), make sure to use imgui.SameLine() between them. (optional callback)
---Source : lua/ge/extensions/editor/mainMenu.lua:611
---@param text any
---@param uiCallback any
function editor_mainMenu_editor.setStatusBar(text, uiCallback) end

--- Add a new notification to the queue. It will override any notification in the same group (if present).
---  @param text the text of the notification
---  @param icon the icon (from editor.icons.*) to be shown next to the text (optional)
---  @param group the group name of this notification, it will override any current notification shown for this group (optional)
---  @param duration duration in seconds to show the notification, otherwise a default value will be used (optional)
---  @param doBeep make a beep sound for audio feedback
---Source : lua/ge/extensions/editor/mainMenu.lua:158
---@param text any
---@param icon any
---@param group any
---@param duration any
---@param doBeep any
function editor_mainMenu_editor.showNotification(text, icon, group, duration, doBeep) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/mainMenu.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main menu bar of the World Editor: File, Edit, Camera, Object, View, Window, Help menus, plus the level title, current edit mode, notifications, status bar, scene metrics (GPU/CPU memory), and dialog boxes (About, safe mode, revert level to original, save/delete/reset layouts). It provides the other tools with the APIs editor.addWindowMenuItem (entry in the Window menu), editor.showNotification, editor.setStatusBar/hideStatusBar and editor.rebuildCollision.
--- Access: extension `editor_mainMenu`: `extensions.load("editor_mainMenu")`, then the global `editor_mainMenu`
---@class editor_mainMenu
---@field dependencies table<integer, string> {"editor_layoutManager"}.
editor_mainMenu = {}

--- Called when the editor is activated: applies the gizmos preferences gizmos.general.drawGizmoPlane and highlightSelectedMeshes.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainMenu.lua:865
function editor_mainMenu.onEditorActivated() end

--- Draws the main menu bar and the dialogs every frame. Emits onEditorMainMenuBar (or onEditorHeadlessMainMenuBar in headless).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainMenu.lua:692
function editor_mainMenu.onEditorGuiMainMenu() end

--- Registers the dialog windows, opens the safe mode window if needed and determines whether the "revert level to original" button should be offered.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainMenu.lua:872
function editor_mainMenu.onEditorInitialized() end

--- Restores the recent tools list from the state (non-empty strings only).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainMenu.lua:921
---@param state table|nil Editor state.
function editor_mainMenu.onEditorLoadState(state) end

--- Reacts to the preferences ui.general.sceneMetric, gizmos.visualization.visTypes and ui.general.recentWindowMenuCount.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainMenu.lua:906
---@param path string Preference path.
---@param value any New value.
function editor_mainMenu.onEditorPreferenceValueChanged(path, value) end

--- Adds the recent tools list to the saved state (state.windowMenuRecentTools).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainMenu.lua:916
---@param state table Editor state to complete.
function editor_mainMenu.onEditorSaveState(state) end

--- Called on load: clears the menu lists, creates the notification queue (maxNotificationCount 100) and installs editor.addWindowMenuItem, showNotification, setStatusBar, hideStatusBar, rebuildCollision.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/mainMenu.lua:847
function editor_mainMenu.onExtensionLoaded() end

--- Functions added to the global `editor` table by this module.
---@class editor_mainMenu_editor
local editor_mainMenu_editor = {}

--- Adds an entry to the editor's Window menu. The defaultToolWindow entries (Inspector, Scene Tree...) are at the top of the menu, separated from the others; entries are sorted by text. Calls the hook onEditorToolWindowOpened(itemText, "windowMenu") on click.
---Source: lua/ge/extensions/editor/mainMenu.lua:804
---@param itemText string Entry text.
---@param actionFunc function Callback called on click.
---@param info table|nil Options: groupMenuName (submenu), experimental, gameplay (visible in the reduced editor's Window menu).
---@param defaultToolWindow boolean|nil true for a window open by default, placed at the top of the menu.
function editor_mainMenu_editor.addWindowMenuItem(itemText, actionFunc, info, defaultToolWindow) end

--- Hides the status bar. Call it when the operation is finished.
---Source: lua/ge/extensions/editor/mainMenu.lua:617
function editor_mainMenu_editor.hideStatusBar() end

--- Rebuilds the static collision (be:reloadCollision, then clears the flag) if needed or forced, and shows a notification.
---Source: lua/ge/extensions/editor/mainMenu.lua:143
---@param force boolean|nil true to rebuild even if Engine.getNeedCollisionRebuild() is false.
function editor_mainMenu_editor.rebuildCollision(force) end

--- Sets the status bar text and an optional ImGui callback (the bar is only visible if the text is non-empty).
---Source: lua/ge/extensions/editor/mainMenu.lua:611
---@param text string Text displayed.
---@param uiCallback function|nil Draws additional ImGui elements; use SameLine between them.
function editor_mainMenu_editor.setStatusBar(text, uiCallback) end

--- Adds a notification to the queue; it replaces the one from the same group if it exists.
---Source: lua/ge/extensions/editor/mainMenu.lua:158
---@param text string Text.
---@param icon any Icon (editor.icons.*); editor.icons.info by default.
---@param group string|nil Group name.
---@param duration number|nil Display duration in seconds (default value otherwise).
---@param doBeep boolean|nil Emits a beep.
function editor_mainMenu_editor.showNotification(text, icon, group, duration, doBeep) end


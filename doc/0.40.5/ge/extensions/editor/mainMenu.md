# `editor_mainMenu`

*File: `lua/ge/extensions/editor/mainMenu.lua` · VM: Game Engine (GE) · 941 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_mainMenu`: `extensions.load("editor_mainMenu")`, then the global `editor_mainMenu`

Main menu bar of the World Editor: File, Edit, Camera, Object, View, Window, Help menus, plus the level title, current edit mode, notifications, status bar, scene metrics (GPU/CPU memory), and dialog boxes (About, safe mode, revert level to original, save/delete/reset layouts). It provides the other tools with the APIs editor.addWindowMenuItem (entry in the Window menu), editor.showNotification, editor.setStatusBar/hideStatusBar and editor.rebuildCollision.

## Example

```lua
editor.addWindowMenuItem("My tool", function() editor.showWindow("myTool") end, {groupMenuName = 'Debug'})
editor.showNotification("Saved")
```

## Notes

- In addWindowMenuItem, if `info` is provided but without groupMenuName (e.g. only experimental or gameplay), the item is added to no list: it therefore does not appear in the menu (probable game bug). Without `info`, the entry is added normally.
- The Window menu remembers the recently opened tools (preference ui.general.recentWindowMenuCount, 5 by default), saved in the editor state (windowMenuRecentTools).
- The File menu has no "Save Level As" (commented out in the code).
- The "revert to original" button only appears for an official level or one from a mod unpacked in /mods/unpacked; it deletes the level folder then reopens the level (changes are lost).
- In headless mode, only the onEditorHeadlessMainMenuBar hook is emitted, with no menu bar.

**Dependencies (loaded first):** `editor_layoutManager`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_mainMenu.onEditorActivated()` | Called when the editor is activated: applies the gizmos preferences gizmos.general.drawGizmoPlane and highlightSelectedMeshes. *(internal)* *(hook)* | 865 |
| `editor_mainMenu.onEditorGuiMainMenu()` | Draws the main menu bar and the dialogs every frame. Emits onEditorMainMenuBar (or onEditorHeadlessMainMenuBar in headless). *(internal)* *(hook)* | 692 |
| `editor_mainMenu.onEditorInitialized()` | Registers the dialog windows, opens the safe mode window if needed and determines whether the "revert level to original" button should be offered. *(internal)* *(hook)* | 872 |
| `editor_mainMenu.onEditorLoadState(state)` | Restores the recent tools list from the state (non-empty strings only). *(internal)* *(hook)* | 921 |
| `editor_mainMenu.onEditorPreferenceValueChanged(path, value)` | Reacts to the preferences ui.general.sceneMetric, gizmos.visualization.visTypes and ui.general.recentWindowMenuCount. *(internal)* *(hook)* | 906 |
| `editor_mainMenu.onEditorSaveState(state)` | Adds the recent tools list to the saved state (state.windowMenuRecentTools). *(internal)* *(hook)* | 916 |
| `editor_mainMenu.onExtensionLoaded()` | Called on load: clears the menu lists, creates the notification queue (maxNotificationCount 100) and installs editor.addWindowMenuItem, showNotification, setStatusBar, hideStatusBar, rebuildCollision. *(internal)* *(hook)* | 847 |

### Parameter details

#### `editor_mainMenu.onEditorLoadState(state)`

Restores the recent tools list from the state (non-empty strings only).

- `state` (*table|nil*) : Editor state.

#### `editor_mainMenu.onEditorPreferenceValueChanged(path, value)`

Reacts to the preferences ui.general.sceneMetric, gizmos.visualization.visTypes and ui.general.recentWindowMenuCount.

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_mainMenu.onEditorSaveState(state)`

Adds the recent tools list to the saved state (state.windowMenuRecentTools).

- `state` (*table*) : Editor state to complete.

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | {"editor_layoutManager"}. |

## Class `editor`

Functions added to the global `editor` table by this module.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.addWindowMenuItem(itemText, actionFunc, info, defaultToolWindow)` | Adds an entry to the editor's Window menu. The defaultToolWindow entries (Inspector, Scene Tree...) are at the top of the menu, separated from the others; entries are sorted by text. Calls the hook onEditorToolWindowOpened(itemText, "windowMenu") on click. | 804 |
| `editor.hideStatusBar()` | Hides the status bar. Call it when the operation is finished. | 617 |
| `editor.rebuildCollision(force)` | Rebuilds the static collision (be:reloadCollision, then clears the flag) if needed or forced, and shows a notification. | 143 |
| `editor.setStatusBar(text, uiCallback)` | Sets the status bar text and an optional ImGui callback (the bar is only visible if the text is non-empty). | 611 |
| `editor.showNotification(text, icon, group, duration, doBeep)` | Adds a notification to the queue; it replaces the one from the same group if it exists. | 158 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorHeadlessMainMenuBar` — listened to by 1 module(s)
- `onEditorMainMenuBar` — listened to by 1 module(s)
- `onEditorToolWindowOpened` — listened to by 1 module(s)

## Calls into the engine (C++)

- `Engine.` `clearNeedCollisionRebuild`, `getNeedCollisionRebuild`
- `FS:` `directoryExists`, `directoryRemove`, `fileExists`, `findFiles`
- `be:` `reloadCollision`
- `worldEditorCppApi.` `colladaExportSelection`, `setAxisGizmoHighlightSelectedMeshes`, `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/mainMenu.lua`.*

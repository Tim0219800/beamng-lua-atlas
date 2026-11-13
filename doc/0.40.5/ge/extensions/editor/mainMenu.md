# `editor_mainMenu`

*Fichier : `lua/ge/extensions/editor/mainMenu.lua` · VM : Game Engine (GE) · 941 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_mainMenu` : `extensions.load("editor_mainMenu")`, puis la globale `editor_mainMenu`

**Dépendances (chargées avant) :** `editor_layoutManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_mainMenu.onEditorActivated()` | *(hook)* | 865 |
| `editor_mainMenu.onEditorGuiMainMenu()` | *(hook)* | 692 |
| `editor_mainMenu.onEditorInitialized()` | *(hook)* | 872 |
| `editor_mainMenu.onEditorLoadState(state)` | *(hook)* | 921 |
| `editor_mainMenu.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 906 |
| `editor_mainMenu.onEditorSaveState(state)` | *(hook)* | 916 |
| `editor_mainMenu.onExtensionLoaded()` | *(hook)* | 847 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addWindowMenuItem(itemText, actionFunc, info, defaultToolWindow)` | Add a new item in the main menu's `Window`.<br> if defaultToolWindow is true, then this is a window that opens by default in the editor, like Inspector and Scene Tree<br> and they will appear at the top of the Window menu, separated at the bottom with a menu separator, by other tool windows<br> @param itemText the text for the tools menu item<br> @param func the callback function called when the item is clicked<br> @param info [table] with info about this window menu item, with the following fields:<br> @param experimental [boolean] the extension tool is experimental if true, and it will be added to the Experimental submenu<br> @param gameplay [boolean] if true, then this extension tool will be shown on the gameplay Window menu (reduced editor, for gameplay only), but when full editor is on, it will also be visible in the Window menu<br> @param defaultToolWindow [boolean] if true, then this menu item will be shown at the top of the Window menu | 804 |
| `editor.hideStatusBar()` | Hides the status bar. Please always use this function after your operation was completed. | 617 |
| `editor.rebuildCollision(force)` |  | 143 |
| `editor.setStatusBar(text, uiCallback)` | Sets the current status bar text and optional UI. The status bar will be visible only when the text is non empty.<br> @param text the text shown in the status bar<br> @param uiCallback a function that will render additional imgui UI elements (progress bars, buttons etc), make sure to use imgui.SameLine() between them. (optional callback) | 611 |
| `editor.showNotification(text, icon, group, duration, doBeep)` | Add a new notification to the queue. It will override any notification in the same group (if present).<br> @param text the text of the notification<br> @param icon the icon (from editor.icons.*) to be shown next to the text (optional)<br> @param group the group name of this notification, it will override any current notification shown for this group (optional)<br> @param duration duration in seconds to show the notification, otherwise a default value will be used (optional)<br> @param doBeep make a beep sound for audio feedback | 158 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorHeadlessMainMenuBar` — écouté par 1 module(s)
- `onEditorMainMenuBar` — écouté par 1 module(s)
- `onEditorToolWindowOpened` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `Engine.` `clearNeedCollisionRebuild`, `getNeedCollisionRebuild`
- `FS:` `directoryExists`, `directoryRemove`, `fileExists`, `findFiles`
- `be:` `reloadCollision`
- `worldEditorCppApi.` `colladaExportSelection`, `setAxisGizmoHighlightSelectedMeshes`, `setAxisGizmoRenderMoveGrid`, `setAxisGizmoRenderPlane`, `setAxisGizmoRenderPlaneHashes`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/mainMenu.lua`.*

# `editor_flowgraphEditor`

*Fichier : `lua/ge/extensions/editor/flowgraphEditor.lua` · VM : Game Engine (GE) · 1101 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_flowgraphEditor` : `extensions.load("editor_flowgraphEditor")`, puis la globale `editor_flowgraphEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_flowgraphEditor.addHistory(title, graph)` |  | 392 |
| `editor_flowgraphEditor.arrowControllableWindowCall(fun, ...)` |  | 848 |
| `editor_flowgraphEditor.autoSave()` |  | 149 |
| `editor_flowgraphEditor.closeCurrent()` |  | 100 |
| `editor_flowgraphEditor.drawContextMenus()` |  | 378 |
| `editor_flowgraphEditor.drawEditor(dtReal, dtSim, dtRaw)` |  | 473 |
| `editor_flowgraphEditor.drawExecution()` |  | 386 |
| `editor_flowgraphEditor.drawRestoreMenu()` |  | 406 |
| `editor_flowgraphEditor.getManager()` |  | 797 |
| `editor_flowgraphEditor.getPropertiesWindow()` |  | 1059 |
| `editor_flowgraphEditor.isActionMapEnabled(map)` |  | 1048 |
| `editor_flowgraphEditor.onClientStartMission()` | *(hook)* | 822 |
| `editor_flowgraphEditor.onDeserialized(data)` | *(hook)* | 792 |
| `editor_flowgraphEditor.onEditorActivated()` | *(hook)* | 629 |
| `editor_flowgraphEditor.onEditorDeactivated()` | *(hook)* | 623 |
| `editor_flowgraphEditor.onEditorGui(dtReal, dtSim, dtRaw)` | *(hook)* | 260 |
| `editor_flowgraphEditor.onEditorInitialized()` | *(hook)* | 641 |
| `editor_flowgraphEditor.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 745 |
| `editor_flowgraphEditor.onSerialize()` | *(hook)* | 693 |
| `editor_flowgraphEditor.onUpdate(dtReal, dtSim, dtRaw)` | Small Testing Window *(hook)* | 552 |
| `editor_flowgraphEditor.open()` |  | 618 |
| `editor_flowgraphEditor.openFile(fCbData, openAsNewManager, keepSavedDirs)` |  | 80 |
| `editor_flowgraphEditor.save()` |  | 139 |
| `editor_flowgraphEditor.saveAsFile(fCbData)` |  | 195 |
| `editor_flowgraphEditor.saveCurrent()` |  | 131 |
| `editor_flowgraphEditor.saveFile()` |  | 160 |
| `editor_flowgraphEditor.saveMacro(graph)` |  | 114 |
| `editor_flowgraphEditor.setManager(newMgr, instant)` |  | 685 |
| `editor_flowgraphEditor.showNodeReferences(node)` |  | 835 |
| `editor_flowgraphEditor.uiAutoConnectShortcut()` |  | 913 |
| `editor_flowgraphEditor.uiDisconnectShortcut()` |  | 1000 |
| `editor_flowgraphEditor.uiFindShortcut()` |  | 1033 |
| `editor_flowgraphEditor.uiFocusNodesShortcut()` |  | 854 |
| `editor_flowgraphEditor.uiHideShortcut(hide)` |  | 864 |
| `editor_flowgraphEditor.uiShowSourceShortcut()` |  | 903 |
| `editor_flowgraphEditor.uiToggleCategoryShortcut()` |  | 1038 |
| `editor_flowgraphEditor.windowsMenu()` |  | 801 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `allowTooltip` | boolean |  |
| `forceOpen` | table |  |
| `lastOpenedFolder` | string |  |
| `pushedNodeLibActionMap` | boolean |  |
| `requestedEditor` | boolean |  |
| `settings` | table |  |
| `showSmallFgWindow` | any |  |
| `switchToSmallWindow` | boolean |  |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/flowgraphEditor.lua`.*

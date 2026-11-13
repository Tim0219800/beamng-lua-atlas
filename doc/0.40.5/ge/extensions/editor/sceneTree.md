# `editor_sceneTree`

*Fichier : `lua/ge/extensions/editor/sceneTree.lua` · VM : Game Engine (GE) · 2664 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_sceneTree` : `extensions.load("editor_sceneTree")`, puis la globale `editor_sceneTree`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_sceneTree.closeAllInstances()` |  | 2608 |
| `editor_sceneTree.debugNode(id, level)` |  | 2616 |
| `editor_sceneTree.moveSelectionIndex(up)` |  | 1009 |
| `editor_sceneTree.onEditorActivated()` | *(hook)* | 2455 |
| `editor_sceneTree.onEditorAfterOpenLevel()` | *(hook)* | 2459 |
| `editor_sceneTree.onEditorBeforeSaveLevel()` | *(hook)* | 2552 |
| `editor_sceneTree.onEditorDeactivated()` | *(hook)* | 2470 |
| `editor_sceneTree.onEditorFocusLockChanged()` | *(hook)* | 2628 |
| `editor_sceneTree.onEditorGui()` | *(hook)* | 2167 |
| `editor_sceneTree.onEditorInitialized()` | *(hook)* | 2474 |
| `editor_sceneTree.onEditorInspectorFieldChanged(selectedIds)` | *(hook)* | 2590 |
| `editor_sceneTree.onEditorLoadGuiInstancerState(state)` | *(hook)* | 2430 |
| `editor_sceneTree.onEditorObjectAdded()` | *(hook)* | 2561 |
| `editor_sceneTree.onEditorObjectSelectionChanged()` | *(hook)* | 821 |
| `editor_sceneTree.onEditorSaveGuiInstancerState(state)` | *(hook)* | 2441 |
| `editor_sceneTree.onEditorToolWindowGotFocus(windowName)` | *(hook)* | 2512 |
| `editor_sceneTree.onEditorToolWindowLostFocus(windowName)` | *(hook)* | 2522 |
| `editor_sceneTree.onExtensionLoaded()` | *(hook)* | 2409 |
| `editor_sceneTree.openSceneTree()` |  | 2161 |
| `editor_sceneTree.recacheAllNodes(keepOpenStatus)` |  | 732 |
| `editor_sceneTree.refreshAllNodes(incomingObjectIds)` |  | 1030 |
| `editor_sceneTree.refreshNodeNames(objectIds)` | TODO: check if we can do the scene tree populate directly with no Lua tables | 2569 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.getSceneTreeSelectedGroup(instance)` |  | 155 |
| `editor.removeObjectFromSet(object, simset)` | TODO: check if we can do the scene tree populate directly with no Lua tables | 1068 |
| `editor.submitTransactions(transactions)` |  | 1100 |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`
- `Sim.` `findObject`, `getRootGroup`, `upcast`
- `obj:` `at`, `deleteObject`, `getId`, `isSubClassOf`, `size`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`, `getObjectClassIcons`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sceneTree.lua`.*

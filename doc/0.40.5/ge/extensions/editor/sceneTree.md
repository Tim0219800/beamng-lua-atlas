# `editor_sceneTree`

*File: `lua/ge/extensions/editor/sceneTree.lua` · VM: Game Engine (GE) · 2664 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_sceneTree`: `extensions.load("editor_sceneTree")`, then the global `editor_sceneTree`

"Scene Tree" window of the level editor: displays the hierarchy of scene objects (MissionGroup, SimGroups, objects) as an ImGui tree with virtual scrolling, search (by name, ID, persistent ID, class or everything), multi-selection, drag and drop, renaming, sorting, deletion, object creation and context menus. It caches the tree on the Lua side (nodes) and synchronizes it with the engine via SimSet transactions. It also installs functions in the editor table (see class "editor"). A modder mainly uses it to add entries to the context menu and refresh the tree after creating/deleting objects by script.

## Example

```lua
-- add an entry to an object's context menu
editor.addExtendedSceneTreeObjectMenuItem({
  title = 'Mon action',
  extendedSceneTreeObjectMenuItems = function(node) log('I','', 'noeud '..node.id) end,
  validator = function(node) return true end
})
-- refresh the tree
editor.refreshSceneTreeWindow()
```

## Notes

- The code comment mentions a field onExtendedSceneTreeObjectMenuItemSelected, but it is actually the extendedSceneTreeObjectMenuItems field (function called with the node) that the context menu reads. The validator is optional and is not checked by addExtendedSceneTreeObjectMenuItem.
- Only one window instance is allowed: openSceneTree does nothing if an instance already exists.
- The functions of the editor table are only installed from onExtensionLoaded / onEditorInitialized (e.g. editor.addExtendedSceneTreeObjectMenuItem only exists after this extension has loaded).
- Before the level is saved (onEditorBeforeSaveLevel), the order of all objects under MissionGroup is stored in editor.orderTable (list of ids, depth-first traversal).
- A group's focus (focus lock) makes this group the root of the tree; it is released when a level is opened and when the editor is deactivated.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_sceneTree.closeAllInstances()` | Closes and unregisters all Scene Tree windows. | 2608 |
| `editor_sceneTree.debugNode(id, level)` | Logs (log level I) the cache node matching the given object, in each instance that contains it. | 2616 |
| `editor_sceneTree.moveSelectionIndex(up)` | Moves the selection by one row in the instance that has focus (used by the arrows of the "SceneTree" action map). | 1009 |
| `editor_sceneTree.onEditorActivated()` | Called when the editor is activated: resynchronizes the tree selection. *(internal)* *(hook)* | 2455 |
| `editor_sceneTree.onEditorAfterOpenLevel()` | Called after a level is opened in the editor: releases the focus lock, rebuilds the cache, clears the selection and the filter. *(internal)* *(hook)* | 2459 |
| `editor_sceneTree.onEditorBeforeSaveLevel()` | Called before the level is saved: fills editor.orderTable with the ids of all objects under MissionGroup (depth-first traversal). *(internal)* *(hook)* | 2552 |
| `editor_sceneTree.onEditorDeactivated()` | Called when the editor is deactivated: releases the focus lock if it is active. *(internal)* *(hook)* | 2470 |
| `editor_sceneTree.onEditorFocusLockChanged()` | Called when the focus lock changes: re-roots all instances on the locked group (or the root) while keeping the open state, and forces the root open. *(internal)* *(hook)* | 2628 |
| `editor_sceneTree.onEditorGui()` | Called every frame: draws each Scene Tree window instance (virtualized tree, search bar, menus, drag and drop). *(internal)* *(hook)* | 2167 |
| `editor_sceneTree.onEditorInitialized()` | Called when the editor initializes: fetches the class icons (worldEditorCppApi.getObjectClassIcons), caches the tree, installs the editor.* functions (removeObjectFromSet, submitTransactions, getSelectedSceneTreeNodes, getSceneTreeSelectedGroup, refreshSceneTreeWindow, hideAll/showAllSceneTreeInstances) and adds the "Scene Tree" menu entry. *(internal)* *(hook)* | 2474 |
| `editor_sceneTree.onEditorInspectorFieldChanged(selectedIds)` | Called when a field is modified in the inspector: refreshes the node names and, for objects contained in a prefab instance, updates the child's transform offset. *(internal)* *(hook)* | 2590 |
| `editor_sceneTree.onEditorLoadGuiInstancerState(state)` | Restores the Scene Tree window instances from the saved state of the editor layout. *(internal)* *(hook)* | 2430 |
| `editor_sceneTree.onEditorObjectAdded()` | Called when an object is added in the editor: rebuilds the cache (keeping groups open) and refreshes the node cache. *(internal)* *(hook)* | 2561 |
| `editor_sceneTree.onEditorObjectSelectionChanged()` | Called when the editor's object selection changes: updates the selected nodes of each instance. *(internal)* *(hook)* | 821 |
| `editor_sceneTree.onEditorSaveGuiInstancerState(state)` | Saves the window instances (without selection, cache or filter) in the editor layout state. *(internal)* *(hook)* | 2441 |
| `editor_sceneTree.onEditorToolWindowGotFocus(windowName)` | Called when a tool window gains focus: if it is a Scene Tree, marks the instance as focused and pushes the "SceneTree" action map. *(internal)* *(hook)* | 2512 |
| `editor_sceneTree.onEditorToolWindowLostFocus(windowName)` | Called when a tool window loses focus: removes the focus from the instance and pops the "SceneTree" action map when no instance is focused anymore. *(internal)* *(hook)* | 2522 |
| `editor_sceneTree.onExtensionLoaded()` | Called when the extension loads: prepares the list of search modes and installs editor.addExtendedSceneTreeObjectMenuItem. *(internal)* *(hook)* | 2409 |
| `editor_sceneTree.openSceneTree()` | Opens a Scene Tree window if none exists yet (only one instance allowed). | 2161 |
| `editor_sceneTree.recacheAllNodes(keepOpenStatus)` | Completely rebuilds the node cache of all instances from the Sim scene. With keepOpenStatus, the open/closed state of the groups is kept. | 732 |
| `editor_sceneTree.refreshAllNodes(incomingObjectIds)` | Updates the group cache of each instance (from its root) then invalidates the size cache; lighter version than recacheAllNodes. | 1030 |
| `editor_sceneTree.refreshNodeNames(objectIds)` | Recomputes the name and display name of the nodes whose id is in the list. Does nothing if objectIds is nil. | 2569 |

### Parameter details

#### `editor_sceneTree.debugNode(id, level)`

Logs (log level I) the cache node matching the given object, in each instance that contains it.

- `id` (*integer*) : Object id.
- `level` (*integer|nil*) : Depth passed to dumpsz.

#### `editor_sceneTree.moveSelectionIndex(up)`

Moves the selection by one row in the instance that has focus (used by the arrows of the "SceneTree" action map).

- `up` (*boolean*) : true to move up, false to move down.

#### `editor_sceneTree.onEditorInspectorFieldChanged(selectedIds)`

Called when a field is modified in the inspector: refreshes the node names and, for objects contained in a prefab instance, updates the child's transform offset.

- `selectedIds` (*integer[]*) : Ids of the modified objects.

#### `editor_sceneTree.onEditorLoadGuiInstancerState(state)`

Restores the Scene Tree window instances from the saved state of the editor layout.

- `state` (*table*) : Global state of the guiInstancer.

#### `editor_sceneTree.onEditorSaveGuiInstancerState(state)`

Saves the window instances (without selection, cache or filter) in the editor layout state.

- `state` (*table*) : Global state to fill.

#### `editor_sceneTree.onEditorToolWindowGotFocus(windowName)`

Called when a tool window gains focus: if it is a Scene Tree, marks the instance as focused and pushes the "SceneTree" action map.

- `windowName` (*string*) : Window name.

#### `editor_sceneTree.onEditorToolWindowLostFocus(windowName)`

Called when a tool window loses focus: removes the focus from the instance and pops the "SceneTree" action map when no instance is focused anymore.

- `windowName` (*string*) : Window name.

#### `editor_sceneTree.recacheAllNodes(keepOpenStatus)`

Completely rebuilds the node cache of all instances from the Sim scene. With keepOpenStatus, the open/closed state of the groups is kept.

- `keepOpenStatus` (*boolean|nil*) : true to keep the groups open in their current state.

#### `editor_sceneTree.refreshAllNodes(incomingObjectIds)`

Updates the group cache of each instance (from its root) then invalidates the size cache; lighter version than recacheAllNodes.

- `incomingObjectIds` (*table|nil*) : Ids of the incoming objects to integrate (inferred from code).

#### `editor_sceneTree.refreshNodeNames(objectIds)`

Recomputes the name and display name of the nodes whose id is in the list. Does nothing if objectIds is nil.

- `objectIds` (*integer[]|nil*) : Ids of renamed objects.

## Class `editor`

Functions added to the global `editor` table by this extension (and not an instantiated object). They are available once the extension and the editor are initialized. Other additions not listed here: addExtendedSceneTreeObjectMenuItem, getSelectedSceneTreeNodes, refreshSceneTreeWindow, hideAllSceneTreeInstances, showAllSceneTreeInstances.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.getSceneTreeSelectedGroup(instance)` | Returns the scene group in which to add new objects: the focus-locked group if there is one, otherwise the selected group (or the parent of the first selected node), otherwise MissionGroup. | 155 |
| `editor.removeObjectFromSet(object, simset)` | Removes the object from the nodes of all instances and refreshes the tree (called when an object leaves a SimSet). | 1068 |
| `editor.submitTransactions(transactions)` | Processes the batch of SimSet operations sent by the engine: flat array of triplets (type, objId, groupId) for ClearSet, AddObject, RemoveObject, AssignObjectName, ReorderObject, and updates the tree accordingly (in batches). | 1100 |

## Calls into the engine (C++)

- `FS:` `directoryExists`
- `Sim.` `findObject`, `getRootGroup`, `upcast`
- `obj:` `at`, `deleteObject`, `getId`, `isSubClassOf`, `size`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`, `getObjectClassIcons`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/sceneTree.lua`.*

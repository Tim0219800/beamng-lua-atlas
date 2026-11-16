---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sceneTree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Scene Tree" window of the level editor: displays the hierarchy of scene objects (MissionGroup, SimGroups, objects) as an ImGui tree with virtual scrolling, search (by name, ID, persistent ID, class or everything), multi-selection, drag and drop, renaming, sorting, deletion, object creation and context menus. It caches the tree on the Lua side (nodes) and synchronizes it with the engine via SimSet transactions. It also installs functions in the editor table (see class "editor"). A modder mainly uses it to add entries to the context menu and refresh the tree after creating/deleting objects by script.
--- Access: extension `editor_sceneTree`: `extensions.load("editor_sceneTree")`, then the global `editor_sceneTree`
---@class editor_sceneTree
editor_sceneTree = {}

--- Closes and unregisters all Scene Tree windows.
---Source: lua/ge/extensions/editor/sceneTree.lua:2608
function editor_sceneTree.closeAllInstances() end

--- Logs (log level I) the cache node matching the given object, in each instance that contains it.
---Source: lua/ge/extensions/editor/sceneTree.lua:2616
---@param id integer Object id.
---@param level integer|nil Depth passed to dumpsz.
function editor_sceneTree.debugNode(id, level) end

--- Moves the selection by one row in the instance that has focus (used by the arrows of the "SceneTree" action map).
---Source: lua/ge/extensions/editor/sceneTree.lua:1009
---@param up boolean true to move up, false to move down.
function editor_sceneTree.moveSelectionIndex(up) end

--- Called when the editor is activated: resynchronizes the tree selection.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2455
function editor_sceneTree.onEditorActivated() end

--- Called after a level is opened in the editor: releases the focus lock, rebuilds the cache, clears the selection and the filter.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2459
function editor_sceneTree.onEditorAfterOpenLevel() end

--- Called before the level is saved: fills editor.orderTable with the ids of all objects under MissionGroup (depth-first traversal).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2552
function editor_sceneTree.onEditorBeforeSaveLevel() end

--- Called when the editor is deactivated: releases the focus lock if it is active.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2470
function editor_sceneTree.onEditorDeactivated() end

--- Called when the focus lock changes: re-roots all instances on the locked group (or the root) while keeping the open state, and forces the root open.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2628
function editor_sceneTree.onEditorFocusLockChanged() end

--- Called every frame: draws each Scene Tree window instance (virtualized tree, search bar, menus, drag and drop).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2167
function editor_sceneTree.onEditorGui() end

--- Called when the editor initializes: fetches the class icons (worldEditorCppApi.getObjectClassIcons), caches the tree, installs the editor.* functions (removeObjectFromSet, submitTransactions, getSelectedSceneTreeNodes, getSceneTreeSelectedGroup, refreshSceneTreeWindow, hideAll/showAllSceneTreeInstances) and adds the "Scene Tree" menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2474
function editor_sceneTree.onEditorInitialized() end

--- Called when a field is modified in the inspector: refreshes the node names and, for objects contained in a prefab instance, updates the child's transform offset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2590
---@param selectedIds integer[] Ids of the modified objects.
function editor_sceneTree.onEditorInspectorFieldChanged(selectedIds) end

--- Restores the Scene Tree window instances from the saved state of the editor layout.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2430
---@param state table Global state of the guiInstancer.
function editor_sceneTree.onEditorLoadGuiInstancerState(state) end

--- Called when an object is added in the editor: rebuilds the cache (keeping groups open) and refreshes the node cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2561
function editor_sceneTree.onEditorObjectAdded() end

--- Called when the editor's object selection changes: updates the selected nodes of each instance.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:821
function editor_sceneTree.onEditorObjectSelectionChanged() end

--- Saves the window instances (without selection, cache or filter) in the editor layout state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2441
---@param state table Global state to fill.
function editor_sceneTree.onEditorSaveGuiInstancerState(state) end

--- Called when a tool window gains focus: if it is a Scene Tree, marks the instance as focused and pushes the "SceneTree" action map.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2512
---@param windowName string Window name.
function editor_sceneTree.onEditorToolWindowGotFocus(windowName) end

--- Called when a tool window loses focus: removes the focus from the instance and pops the "SceneTree" action map when no instance is focused anymore.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2522
---@param windowName string Window name.
function editor_sceneTree.onEditorToolWindowLostFocus(windowName) end

--- Called when the extension loads: prepares the list of search modes and installs editor.addExtendedSceneTreeObjectMenuItem.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/sceneTree.lua:2409
function editor_sceneTree.onExtensionLoaded() end

--- Opens a Scene Tree window if none exists yet (only one instance allowed).
---Source: lua/ge/extensions/editor/sceneTree.lua:2161
function editor_sceneTree.openSceneTree() end

--- Completely rebuilds the node cache of all instances from the Sim scene. With keepOpenStatus, the open/closed state of the groups is kept.
---Source: lua/ge/extensions/editor/sceneTree.lua:732
---@param keepOpenStatus boolean|nil true to keep the groups open in their current state.
function editor_sceneTree.recacheAllNodes(keepOpenStatus) end

--- Updates the group cache of each instance (from its root) then invalidates the size cache; lighter version than recacheAllNodes.
---Source: lua/ge/extensions/editor/sceneTree.lua:1030
---@param incomingObjectIds table|nil Ids of the incoming objects to integrate (inferred from code).
function editor_sceneTree.refreshAllNodes(incomingObjectIds) end

--- Recomputes the name and display name of the nodes whose id is in the list. Does nothing if objectIds is nil.
---Source: lua/ge/extensions/editor/sceneTree.lua:2569
---@param objectIds integer[]|nil Ids of renamed objects.
function editor_sceneTree.refreshNodeNames(objectIds) end

--- Functions added to the global `editor` table by this extension (and not an instantiated object). They are available once the extension and the editor are initialized. Other additions not listed here: addExtendedSceneTreeObjectMenuItem, getSelectedSceneTreeNodes, refreshSceneTreeWindow, hideAllSceneTreeInstances, showAllSceneTreeInstances.
---@class editor_sceneTree_editor
local editor_sceneTree_editor = {}

--- Returns the scene group in which to add new objects: the focus-locked group if there is one, otherwise the selected group (or the parent of the first selected node), otherwise MissionGroup.
---Source: lua/ge/extensions/editor/sceneTree.lua:155
---@param instance table|nil Scene Tree instance whose selection is read.
---@return userdata  SimGroup object.
function editor_sceneTree_editor.getSceneTreeSelectedGroup(instance) end

--- Removes the object from the nodes of all instances and refreshes the tree (called when an object leaves a SimSet).
---Source: lua/ge/extensions/editor/sceneTree.lua:1068
---@param object userdata Object removed.
---@param simset userdata Original SimSet (not used in the code).
function editor_sceneTree_editor.removeObjectFromSet(object, simset) end

--- Processes the batch of SimSet operations sent by the engine: flat array of triplets (type, objId, groupId) for ClearSet, AddObject, RemoveObject, AssignObjectName, ReorderObject, and updates the tree accordingly (in batches).
---Source: lua/ge/extensions/editor/sceneTree.lua:1100
---@param transactions integer[] Flat array of integer triplets.
function editor_sceneTree_editor.submitTransactions(transactions) end


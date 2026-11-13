---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sceneTree.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_sceneTree` : `extensions.load("editor_sceneTree")`, puis la globale `editor_sceneTree`
---@class editor_sceneTree
editor_sceneTree = {}

---Source : lua/ge/extensions/editor/sceneTree.lua:2608
function editor_sceneTree.closeAllInstances() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2616
---@param id any
---@param level any
function editor_sceneTree.debugNode(id, level) end

---Source : lua/ge/extensions/editor/sceneTree.lua:1009
---@param up any
function editor_sceneTree.moveSelectionIndex(up) end

---Source : lua/ge/extensions/editor/sceneTree.lua:2455
function editor_sceneTree.onEditorActivated() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2459
function editor_sceneTree.onEditorAfterOpenLevel() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2552
function editor_sceneTree.onEditorBeforeSaveLevel() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2470
function editor_sceneTree.onEditorDeactivated() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2628
function editor_sceneTree.onEditorFocusLockChanged() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2167
function editor_sceneTree.onEditorGui() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2474
function editor_sceneTree.onEditorInitialized() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2590
---@param selectedIds any
function editor_sceneTree.onEditorInspectorFieldChanged(selectedIds) end

---Source : lua/ge/extensions/editor/sceneTree.lua:2430
---@param state any
function editor_sceneTree.onEditorLoadGuiInstancerState(state) end

---Source : lua/ge/extensions/editor/sceneTree.lua:2561
function editor_sceneTree.onEditorObjectAdded() end

---Source : lua/ge/extensions/editor/sceneTree.lua:821
function editor_sceneTree.onEditorObjectSelectionChanged() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2441
---@param state any
function editor_sceneTree.onEditorSaveGuiInstancerState(state) end

---Source : lua/ge/extensions/editor/sceneTree.lua:2512
---@param windowName any
function editor_sceneTree.onEditorToolWindowGotFocus(windowName) end

---Source : lua/ge/extensions/editor/sceneTree.lua:2522
---@param windowName any
function editor_sceneTree.onEditorToolWindowLostFocus(windowName) end

---Source : lua/ge/extensions/editor/sceneTree.lua:2409
function editor_sceneTree.onExtensionLoaded() end

---Source : lua/ge/extensions/editor/sceneTree.lua:2161
function editor_sceneTree.openSceneTree() end

---Source : lua/ge/extensions/editor/sceneTree.lua:732
---@param keepOpenStatus any
function editor_sceneTree.recacheAllNodes(keepOpenStatus) end

---Source : lua/ge/extensions/editor/sceneTree.lua:1030
---@param incomingObjectIds any
function editor_sceneTree.refreshAllNodes(incomingObjectIds) end

--- TODO: check if we can do the scene tree populate directly with no Lua tables
---Source : lua/ge/extensions/editor/sceneTree.lua:2569
---@param objectIds any
function editor_sceneTree.refreshNodeNames(objectIds) end

--- Classe locale `editor` de lua/ge/extensions/editor/sceneTree.lua
---@class editor_sceneTree_editor
local editor_sceneTree_editor = {}

---Source : lua/ge/extensions/editor/sceneTree.lua:155
---@param instance any
function editor_sceneTree_editor.getSceneTreeSelectedGroup(instance) end

--- TODO: check if we can do the scene tree populate directly with no Lua tables
---Source : lua/ge/extensions/editor/sceneTree.lua:1068
---@param object any
---@param simset any
function editor_sceneTree_editor.removeObjectFromSet(object, simset) end

---Source : lua/ge/extensions/editor/sceneTree.lua:1100
---@param transactions any
function editor_sceneTree_editor.submitTransactions(transactions) end


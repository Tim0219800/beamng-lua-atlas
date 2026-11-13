---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraphEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_flowgraphEditor` : `extensions.load("editor_flowgraphEditor")`, puis la globale `editor_flowgraphEditor`
---@class editor_flowgraphEditor
---@field allowTooltip boolean
---@field forceOpen table
---@field lastOpenedFolder string
---@field pushedNodeLibActionMap boolean
---@field requestedEditor boolean
---@field settings table
---@field showSmallFgWindow any
---@field switchToSmallWindow boolean
editor_flowgraphEditor = {}

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:392
---@param title any
---@param graph any
function editor_flowgraphEditor.addHistory(title, graph) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:848
---@param fun any
---@param ... any
function editor_flowgraphEditor.arrowControllableWindowCall(fun, ...) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:149
function editor_flowgraphEditor.autoSave() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:100
function editor_flowgraphEditor.closeCurrent() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:378
function editor_flowgraphEditor.drawContextMenus() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:473
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_flowgraphEditor.drawEditor(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:386
function editor_flowgraphEditor.drawExecution() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:406
function editor_flowgraphEditor.drawRestoreMenu() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:797
function editor_flowgraphEditor.getManager() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1059
function editor_flowgraphEditor.getPropertiesWindow() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1048
---@param map any
function editor_flowgraphEditor.isActionMapEnabled(map) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:822
function editor_flowgraphEditor.onClientStartMission() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:792
---@param data any
function editor_flowgraphEditor.onDeserialized(data) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:629
function editor_flowgraphEditor.onEditorActivated() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:623
function editor_flowgraphEditor.onEditorDeactivated() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:260
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_flowgraphEditor.onEditorGui(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:641
function editor_flowgraphEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:745
---@param prefsRegistry any
function editor_flowgraphEditor.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:693
function editor_flowgraphEditor.onSerialize() end

--- Small Testing Window
---Source : lua/ge/extensions/editor/flowgraphEditor.lua:552
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_flowgraphEditor.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:618
function editor_flowgraphEditor.open() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:80
---@param fCbData any
---@param openAsNewManager any
---@param keepSavedDirs any
function editor_flowgraphEditor.openFile(fCbData, openAsNewManager, keepSavedDirs) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:139
function editor_flowgraphEditor.save() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:195
---@param fCbData any
function editor_flowgraphEditor.saveAsFile(fCbData) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:131
function editor_flowgraphEditor.saveCurrent() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:160
function editor_flowgraphEditor.saveFile() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:114
---@param graph any
function editor_flowgraphEditor.saveMacro(graph) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:685
---@param newMgr any
---@param instant any
function editor_flowgraphEditor.setManager(newMgr, instant) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:835
---@param node any
function editor_flowgraphEditor.showNodeReferences(node) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:913
function editor_flowgraphEditor.uiAutoConnectShortcut() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1000
function editor_flowgraphEditor.uiDisconnectShortcut() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1033
function editor_flowgraphEditor.uiFindShortcut() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:854
function editor_flowgraphEditor.uiFocusNodesShortcut() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:864
---@param hide any
function editor_flowgraphEditor.uiHideShortcut(hide) end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:903
function editor_flowgraphEditor.uiShowSourceShortcut() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:1038
function editor_flowgraphEditor.uiToggleCategoryShortcut() end

---Source : lua/ge/extensions/editor/flowgraphEditor.lua:801
function editor_flowgraphEditor.windowsMenu() end


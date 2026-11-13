---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/biomeTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_biomeTool` : `extensions.load("editor_biomeTool")`, puis la globale `editor_biomeTool`
---@class editor_biomeTool
---@field onExtensionLoaded any
editor_biomeTool = {}

---Source : lua/ge/extensions/editor/biomeTool.lua:3962
function editor_biomeTool.onEditorAfterSaveLevel() end

---Source : lua/ge/extensions/editor/biomeTool.lua:3623
function editor_biomeTool.onEditorGui() end

---Source : lua/ge/extensions/editor/biomeTool.lua:3903
function editor_biomeTool.onEditorInitialized() end

---Source : lua/ge/extensions/editor/biomeTool.lua:3956
---@param windowName any
function editor_biomeTool.onEditorToolWindowGotFocus(windowName) end

---Source : lua/ge/extensions/editor/biomeTool.lua:3950
---@param windowName any
function editor_biomeTool.onEditorToolWindowHide(windowName) end

--- Classe locale `var` de lua/ge/extensions/editor/biomeTool.lua
---@class editor_biomeTool_var
local editor_biomeTool_var = {}

---Source : lua/ge/extensions/editor/biomeTool.lua:1473
---@param layerType any
---@param layerID any
function editor_biomeTool_var.getEPFalloff(layerType, layerID) end

---Source : lua/ge/extensions/editor/biomeTool.lua:1516
---@param layerType any
---@param layerID any
function editor_biomeTool_var.getEPItemDistance(layerType, layerID) end

---Source : lua/ge/extensions/editor/biomeTool.lua:1431
---@param layerType any
---@param layerID any
function editor_biomeTool_var.getEPRandomTiltRange(layerType, layerID) end

---Source : lua/ge/extensions/editor/biomeTool.lua:1421
---@param layerType any
---@param layerID any
---@param fieldName any
function editor_biomeTool_var.getFieldMinMax(layerType, layerID, fieldName) end

---Source : lua/ge/extensions/editor/biomeTool.lua:1494
---@param layerType any
---@param layerID any
---@param val any
function editor_biomeTool_var.setEPFalloff(layerType, layerID, val) end

---Source : lua/ge/extensions/editor/biomeTool.lua:1537
---@param layerType any
---@param layerID any
---@param val any
function editor_biomeTool_var.setEPItemDistance(layerType, layerID, val) end

---Source : lua/ge/extensions/editor/biomeTool.lua:1447
---@param layerType any
---@param layerID any
---@param range any
function editor_biomeTool_var.setEPRandomTiltRange(layerType, layerID, range) end


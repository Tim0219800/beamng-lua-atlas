---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/scriptAIManager.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_scriptAIManager` : `extensions.load("editor_scriptAIManager")`, puis la globale `editor_scriptAIManager`
---@class editor_scriptAIManager
editor_scriptAIManager = {}

---Source : lua/ge/extensions/editor/scriptAIManager.lua:576
function editor_scriptAIManager.getCurrentRecordings() end

---Source : lua/ge/extensions/editor/scriptAIManager.lua:561
---@param data any
function editor_scriptAIManager.onDeserialized(data) end

---Source : lua/ge/extensions/editor/scriptAIManager.lua:464
---@param lastDebugFocusPos any
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_scriptAIManager.onDrawDebug(lastDebugFocusPos, dtReal, dtSim, dtRaw) end

--- public interface
---Source : lua/ge/extensions/editor/scriptAIManager.lua:130
function editor_scriptAIManager.onEditorGui() end

---Source : lua/ge/extensions/editor/scriptAIManager.lua:571
function editor_scriptAIManager.onEditorInitialized() end

--- persistence
---Source : lua/ge/extensions/editor/scriptAIManager.lua:557
function editor_scriptAIManager.onSerialize() end

---Source : lua/ge/extensions/editor/scriptAIManager.lua:515
---@param vehId any
---@param data any
function editor_scriptAIManager.onVehicleSubmitInfo(vehId, data) end

--- vehicle API, do not use directly
---Source : lua/ge/extensions/editor/scriptAIManager.lua:509
---@param vehId any
---@param data any
function editor_scriptAIManager.onVehicleSubmitRecording(vehId, data) end

---Source : lua/ge/extensions/editor/scriptAIManager.lua:567
---@param oldVehicle any
---@param newVehicle any
---@param player any
function editor_scriptAIManager.onVehicleSwitched(oldVehicle, newVehicle, player) end

---Source : lua/ge/extensions/editor/scriptAIManager.lua:552
function editor_scriptAIManager.onWindowMenuItem() end


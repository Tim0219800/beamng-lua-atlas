---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/veMain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_veMain` : `extensions.load("editor_veMain")`, puis la globale `editor_veMain`
---@class editor_veMain
---@field dependencies table
editor_veMain = {}

---Source : lua/ge/extensions/editor/veMain.lua:427
---@param data any
function editor_veMain.onDeserialize(data) end

---Source : lua/ge/extensions/editor/veMain.lua:318
---@param enabled any
---@param toolName any
function editor_veMain.onEditorHeadlessChange(enabled, toolName) end

--- this hook function is called by the editor when in headless mode to draw your own menubar
---Source : lua/ge/extensions/editor/veMain.lua:405
function editor_veMain.onEditorHeadlessMainMenuBar() end

---Source : lua/ge/extensions/editor/veMain.lua:310
function editor_veMain.onEditorInitialized() end

---Source : lua/ge/extensions/editor/veMain.lua:341
---@param selectedIds any
---@param fieldName any
---@param fieldValue any
---@param arrayIndex any
function editor_veMain.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Update data for other vehicle editors to use
---Source : lua/ge/extensions/editor/veMain.lua:251
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_veMain.onPreRender(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/veMain.lua:421
function editor_veMain.onSerialize() end

---Source : lua/ge/extensions/editor/veMain.lua:333
function editor_veMain.onVehicleDestroyed() end

---Source : lua/ge/extensions/editor/veMain.lua:314
---@param oldVehicle any
---@param newVehicle any
---@param player any
function editor_veMain.onVehicleSwitched(oldVehicle, newVehicle, player) end

---Source : lua/ge/extensions/editor/veMain.lua:417
function editor_veMain.saveCurrentWindowLayout() end

---Source : lua/ge/extensions/editor/veMain.lua:302
function editor_veMain.toggleActive() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_missionEditor` : `extensions.load("editor_missionEditor")`, puis la globale `editor_missionEditor`
---@class editor_missionEditor
---@field dependencies table
editor_missionEditor = {}

---Source : lua/ge/extensions/editor/missionEditor.lua:1730
---@param m any
function editor_missionEditor.clickMission(m) end

---Source : lua/ge/extensions/editor/missionEditor.lua:1752
function editor_missionEditor.getCurrentEditorHelperWhenActive() end

---Source : lua/ge/extensions/editor/missionEditor.lua:1729
function editor_missionEditor.getMissionList() end

---Source : lua/ge/extensions/editor/missionEditor.lua:1733
function editor_missionEditor.getMissionTypeWindow() end

---Source : lua/ge/extensions/editor/missionEditor.lua:1786
function editor_missionEditor.getSelectedMissionId() end

---Source : lua/ge/extensions/editor/missionEditor.lua:1732
function editor_missionEditor.getStartTriggerWindow() end

---Source : lua/ge/extensions/editor/missionEditor.lua:1782
---@param timer any
---@param lvl any
---@param origin any
---@param line any
function editor_missionEditor.onConsoleLog(timer, lvl, origin, line) end

---Source : lua/ge/extensions/editor/missionEditor.lua:1711
---@param data any
function editor_missionEditor.onDeserialized(data) end

--- display window
---Source : lua/ge/extensions/editor/missionEditor.lua:1074
function editor_missionEditor.onEditorGui() end

---Source : lua/ge/extensions/editor/missionEditor.lua:1673
function editor_missionEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/missionEditor.lua:1689
---@param prefsRegistry any
function editor_missionEditor.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/missionEditor.lua:1703
function editor_missionEditor.onSerialize() end

---Source : lua/ge/extensions/editor/missionEditor.lua:1758
function editor_missionEditor.reloadMissionSystem() end

---Source : lua/ge/extensions/editor/missionEditor.lua:1734
---@param id any
---@param instant any
function editor_missionEditor.setMissionById(id, instant) end

---Source : lua/ge/extensions/editor/missionEditor.lua:1668
function editor_missionEditor.show() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_raceEditor` : `extensions.load("editor_raceEditor")`, puis la globale `editor_raceEditor`
---@class editor_raceEditor
editor_raceEditor = {}

---Source : lua/ge/extensions/editor/raceEditor.lua:551
function editor_raceEditor.allowGizmo() end

---Source : lua/ge/extensions/editor/raceEditor.lua:28
function editor_raceEditor.calculateAiRoute() end

---Source : lua/ge/extensions/editor/raceEditor.lua:555
function editor_raceEditor.changedFromExternal() end

---Source : lua/ge/extensions/editor/raceEditor.lua:552
function editor_raceEditor.getCurrentFilename() end

---Source : lua/ge/extensions/editor/raceEditor.lua:553
function editor_raceEditor.getCurrentPath() end

---Source : lua/ge/extensions/editor/raceEditor.lua:567
function editor_raceEditor.getToolsWindow() end

---Source : lua/ge/extensions/editor/raceEditor.lua:554
function editor_raceEditor.isVisible() end

---Source : lua/ge/extensions/editor/raceEditor.lua:79
---@param filename any
function editor_raceEditor.loadRace(filename) end

---Source : lua/ge/extensions/editor/raceEditor.lua:520
---@param data any
function editor_raceEditor.onDeserialized(data) end

---Source : lua/ge/extensions/editor/raceEditor.lua:254
function editor_raceEditor.onEditorGui() end

---Source : lua/ge/extensions/editor/raceEditor.lua:471
function editor_raceEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/raceEditor.lua:535
---@param prefsRegistry any
function editor_raceEditor.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/raceEditor.lua:499
---@param windowName any
function editor_raceEditor.onEditorToolWindowHide(windowName) end

---Source : lua/ge/extensions/editor/raceEditor.lua:511
function editor_raceEditor.onSerialize() end

--- Race Testing window
---Source : lua/ge/extensions/editor/raceEditor.lua:113
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_raceEditor.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/raceEditor.lua:505
---@param windowName any
function editor_raceEditor.onWindowGotFocus(windowName) end

---Source : lua/ge/extensions/editor/raceEditor.lua:67
---@param race any
---@param savePath any
function editor_raceEditor.saveRace(race, savePath) end

---Source : lua/ge/extensions/editor/raceEditor.lua:106
function editor_raceEditor.setupRace() end

---Source : lua/ge/extensions/editor/raceEditor.lua:447
function editor_raceEditor.show() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_dragRaceEditor_utils` : `extensions.load("editor_dragRaceEditor_utils")`, puis la globale `editor_dragRaceEditor_utils`
---@class editor_dragRaceEditor_utils
editor_dragRaceEditor_utils = {}

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:34
function editor_dragRaceEditor_utils.clearUnsavedChanges() end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:116
function editor_dragRaceEditor_utils.createNewDragRaceData() end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:94
---@param laneIndex any
function editor_dragRaceEditor_utils.createNewLane(laneIndex) end

--- Visible label safe for ImGui (avoid '#' in user strings breaking IDs).
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:227
---@param s any
function editor_dragRaceEditor_utils.dragHeaderLabel(s) end

--- Collapsible section; default editor header colors, slightly taller hit area.
---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:235
---@param visibleLabel any
---@param idSuffix any
---@param defaultOpen any
function editor_dragRaceEditor_utils.dragSectionHeader(visibleLabel, idSuffix, defaultOpen) end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:11
---@param message any
function editor_dragRaceEditor_utils.logError(message) end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:30
function editor_dragRaceEditor_utils.markUnsavedChanges() end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:62
function editor_dragRaceEditor_utils.redo() end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:163
---@param t any
---@param old any
---@param new any
function editor_dragRaceEditor_utils.reorderLanes(t, old, new) end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:38
function editor_dragRaceEditor_utils.saveToUndoStack() end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:212
---@param label any
---@param transform any
---@param allowTranslate any
---@param allowRotate any
---@param allowScale any
function editor_dragRaceEditor_utils.setupTransform(label, transform, allowTranslate, allowRotate, allowScale) end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:17
function editor_dragRaceEditor_utils.showError() end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:50
function editor_dragRaceEditor_utils.undo() end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:173
function editor_dragRaceEditor_utils.updateMouseInfo() end

---Source : lua/ge/extensions/editor/dragRaceEditor/utils.lua:74
---@param data any
function editor_dragRaceEditor_utils.validateDragRaceData(data) end


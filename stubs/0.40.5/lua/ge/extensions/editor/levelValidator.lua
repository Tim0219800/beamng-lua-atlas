---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/levelValidator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_levelValidator` : `extensions.load("editor_levelValidator")`, puis la globale `editor_levelValidator`
---@class editor_levelValidator
---@field dependencies table
editor_levelValidator = {}

---Source : lua/ge/extensions/editor/levelValidator.lua:894
function editor_levelValidator.getLevelLogs() end

---Source : lua/ge/extensions/editor/levelValidator.lua:897
function editor_levelValidator.getLevelLogsAggregated() end

---Source : lua/ge/extensions/editor/levelValidator.lua:876
function editor_levelValidator.onClientStartMission() end

---Source : lua/ge/extensions/editor/levelValidator.lua:884
---@param state any
function editor_levelValidator.onEditorAfterSaveLevel(state) end

---Source : lua/ge/extensions/editor/levelValidator.lua:578
function editor_levelValidator.onEditorGui() end

---Source : lua/ge/extensions/editor/levelValidator.lua:856
function editor_levelValidator.onEditorInitialized() end

---Source : lua/ge/extensions/editor/levelValidator.lua:888
---@param path any
---@param value any
function editor_levelValidator.onEditorPreferenceValueChanged(path, value) end

---Source : lua/ge/extensions/editor/levelValidator.lua:865
---@param prefsRegistry any
function editor_levelValidator.onEditorRegisterPreferences(prefsRegistry) end

---Source : lua/ge/extensions/editor/levelValidator.lua:861
function editor_levelValidator.onExtensionLoaded() end

---Source : lua/ge/extensions/editor/levelValidator.lua:567
function editor_levelValidator.startLevelValidation() end

--- Classe locale `sortingFunctions` de lua/ge/extensions/editor/levelValidator.lua
---@class editor_levelValidator_sortingFunctions
local editor_levelValidator_sortingFunctions = {}

---Source : lua/ge/extensions/editor/levelValidator.lua:45
---@param a any
---@param b any
function editor_levelValidator_sortingFunctions.Code(a, b) end

---Source : lua/ge/extensions/editor/levelValidator.lua:51
---@param a any
---@param b any
function editor_levelValidator_sortingFunctions.Description(a, b) end

---Source : lua/ge/extensions/editor/levelValidator.lua:71
---@param a any
---@param b any
function editor_levelValidator_sortingFunctions.File(a, b) end

---Source : lua/ge/extensions/editor/levelValidator.lua:77
---@param a any
---@param b any
function editor_levelValidator_sortingFunctions.Line(a, b) end

---Source : lua/ge/extensions/editor/levelValidator.lua:39
---@param a any
---@param b any
function editor_levelValidator_sortingFunctions.LogLevel(a, b) end

---Source : lua/ge/extensions/editor/levelValidator.lua:63
---@param a any
---@param b any
function editor_levelValidator_sortingFunctions.ObjectName(a, b) end

---Source : lua/ge/extensions/editor/levelValidator.lua:57
---@param a any
---@param b any
function editor_levelValidator_sortingFunctions.Origin(a, b) end


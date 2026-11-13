---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/searchUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/util/searchUtil.lua (instanciée par la fonction renvoyée par le module)
---@class editor_util_searchUtil_C
local editor_util_searchUtil_C = {}

---Source : lua/ge/extensions/editor/util/searchUtil.lua:131
---@param im any
---@param string_label any
---@param string_preview_value any
---@param elementsAsList any
---@param ImGuiComboFlags_flags any
function editor_util_searchUtil_C:beginSearchableSimpleCombo(im, string_label, string_preview_value, elementsAsList, ImGuiComboFlags_flags) end

---Source : lua/ge/extensions/editor/util/searchUtil.lua:77
function editor_util_searchUtil_C:finishSearch() end

---Source : lua/ge/extensions/editor/util/searchUtil.lua:98
function editor_util_searchUtil_C:getFrecencyData() end

---Source : lua/ge/extensions/editor/util/searchUtil.lua:122
---@param fId any
function editor_util_searchUtil_C:getFrecencyScore(fId) end

--- initializes stuff for the helper.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:48
function editor_util_searchUtil_C:init() end

---Source : lua/ge/extensions/editor/util/searchUtil.lua:69
---@param elem any
---@param scoringFunction any
function editor_util_searchUtil_C:queryElement(elem, scoringFunction) end

---Source : lua/ge/extensions/editor/util/searchUtil.lua:94
---@param frecencyData any
function editor_util_searchUtil_C:setFrecencyData(frecencyData) end

---Source : lua/ge/extensions/editor/util/searchUtil.lua:59
---@param fun any
function editor_util_searchUtil_C:setSameScoreResolvingFunction(fun) end

---Source : lua/ge/extensions/editor/util/searchUtil.lua:55
---@param fun any
function editor_util_searchUtil_C:setScoringFunction(fun) end

---Source : lua/ge/extensions/editor/util/searchUtil.lua:63
---@param matchString any
function editor_util_searchUtil_C:startSearch(matchString) end

--- 10s auto undo for frecency
---Source : lua/ge/extensions/editor/util/searchUtil.lua:103
---@param fId any
function editor_util_searchUtil_C:updateFrecencyEntry(fId) end

--- Classe locale `self` de lua/ge/extensions/editor/util/searchUtil.lua (instanciée par la fonction renvoyée par le module)
---@class editor_util_searchUtil_self
local editor_util_searchUtil_self = {}

---Source : lua/ge/extensions/editor/util/searchUtil.lua:43
---@param a any
---@param b any
function editor_util_searchUtil_self.sameScoreResolvingFunction(a, b) end

---Source : lua/ge/extensions/editor/util/searchUtil.lua:38
---@param element any
---@param match any
function editor_util_searchUtil_self.scoringFunction(element, match) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/searchUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Search instance.
---@class editor_util_searchUtil_C
local editor_util_searchUtil_C = {}

--- Draws an imgui combo with a search field, X button and filtered list (140 px high, UI-scaled). Returns the clicked element.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:131
---@param im table Imgui module.
---@param string_label string Label/identifier.
---@param string_preview_value string|nil Displayed text, default "(None Selected)".
---@param elementsAsList string[] Candidates.
---@param ImGuiComboFlags_flags integer|nil Combo flags.
---@return string|nil  Chosen element, otherwise nil.
function editor_util_searchUtil_C:beginSearchableSimpleCombo(im, string_label, string_preview_value, elementsAsList, ImGuiComboFlags_flags) end

--- Computes frecency and finalScore of each result, sorts (finalScore descending) and returns the list.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:77
---@return table  Sorted results.
function editor_util_searchUtil_C:finishSearch() end

--- Returns the frecency table.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:98
---@return table|nil  Frecency data.
function editor_util_searchUtil_C:getFrecencyData() end

--- Recency score between 0 and 1 (0 if unknown).
---Source: lua/ge/extensions/editor/util/searchUtil.lua:122
---@param fId any Frecency identifier.
---@return number  1/1.25^(seconds/86400).
function editor_util_searchUtil_C:getFrecencyScore(fId) end

--- Installs the default scoring and tie-breaking function _anon(by name) and frecencyWeight = 0.5.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/util/searchUtil.lua:48
function editor_util_searchUtil_C:init() end

--- Evaluates an element: writes elem.score and adds it to the results if the score is > 0.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:69
---@param elem table Element (name, frecencyId...).
---@param scoringFunction function|nil One-off scoring function.
function editor_util_searchUtil_C:queryElement(elem, scoringFunction) end

--- Sets the frecencyId -> timestamp table.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:94
---@param frecencyData table Frecency data.
function editor_util_searchUtil_C:setFrecencyData(frecencyData) end

--- Replaces the tie-breaking function _anon(a, b) -> boolean used when the final score is equal.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:59
---@param fun function Comparator.
function editor_util_searchUtil_C:setSameScoreResolvingFunction(fun) end

--- Replaces the scoring function _anon(element, match) -> number.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:55
---@param fun function Returns a score; > 0 keeps the element.
function editor_util_searchUtil_C:setScoringFunction(fun) end

--- Starts a search: clears the results, remembers the searched string and forgets the frecency undo.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:63
---@param matchString string Searched text.
function editor_util_searchUtil_C:startSearch(matchString) end

--- Marks an identifier as used now (os.time()). If the previous update is 10 s old or less, it is canceled first.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:103
---@param fId any Frecency identifier; ignored if nil.
function editor_util_searchUtil_C:updateFrecencyEntry(fId) end

--- Function fields set on the instance by init.
---@class editor_util_searchUtil_self
local editor_util_searchUtil_self = {}

--- Default tie-break: a.name < b.name.
---Source: lua/ge/extensions/editor/util/searchUtil.lua:43
---@param a table Element.
---@param b table Element.
---@return boolean  True if a comes before b.
function editor_util_searchUtil_self.sameScoreResolvingFunction(a, b) end

--- Default score: matchStringScore(element.name, match).
---Source: lua/ge/extensions/editor/util/searchUtil.lua:38
---@param element table Element with name.
---@param match string Searched text.
---@return number  Score.
function editor_util_searchUtil_self.scoringFunction(element, match) end


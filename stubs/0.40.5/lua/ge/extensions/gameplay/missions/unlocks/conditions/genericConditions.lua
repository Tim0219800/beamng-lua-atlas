---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/unlocks/conditions/genericConditions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Generic condition types for mission unlocks: never, missing, always and the combinators multiAnd / multiOr. Loaded by gameplay_missions_unlocks; each type has conditionMet(c) (returns met and optionally the list of nested results) and getLabel(c).
--- Access: extension `gameplay_missions_unlocks_conditions_genericConditions`: `extensions.load("gameplay_missions_unlocks_conditions_genericConditions")`, then the global `gameplay_missions_unlocks_conditions_genericConditions`
---@class gameplay_missions_unlocks_conditions_genericConditions
---@field always table Always true; hidden = true.
---@field missing table Fallback condition for an invalid or unknown type; always true.
---@field multiAnd table Logical AND over c.nested (each sub-condition evaluated via gameplay_missions_unlocks.conditionMet). Returns met, nested. editorFunction 'displayNestedCondition'.
---@field multiOr table Logical OR over c.nested; true if the list is empty. Returns met, nested. editorFunction 'displayNestedCondition'.
---@field never table Always false. Literal label 'Never'.
gameplay_missions_unlocks_conditions_genericConditions = {}


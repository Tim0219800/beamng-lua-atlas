---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/unlocks/conditions/genericConditions.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Types de condition génériques pour les déblocages de missions : never, missing, always et les combinateurs multiAnd / multiOr. Chargés par gameplay_missions_unlocks ; chaque type a conditionMet(c) (renvoie met et éventuellement la liste des résultats imbriqués) et getLabel(c).
--- Accès : extension `gameplay_missions_unlocks_conditions_genericConditions` : `extensions.load("gameplay_missions_unlocks_conditions_genericConditions")`, puis la globale `gameplay_missions_unlocks_conditions_genericConditions`
---@class gameplay_missions_unlocks_conditions_genericConditions
---@field always table Toujours true ; hidden = true.
---@field missing table Condition de repli pour un type invalide ou introuvable ; toujours true.
---@field multiAnd table ET logique sur c.nested (chaque sous-condition évaluée via gameplay_missions_unlocks.conditionMet). Renvoie met, nested. editorFunction 'displayNestedCondition'.
---@field multiOr table OU logique sur c.nested ; true si la liste est vide. Renvoie met, nested. editorFunction 'displayNestedCondition'.
---@field never table Toujours false. Label littéral 'Never'.
gameplay_missions_unlocks_conditions_genericConditions = {}


# `gameplay_missions_unlocks_conditions_genericConditions`

*File: `lua/ge/extensions/gameplay/missions/unlocks/conditions/genericConditions.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_unlocks_conditions_genericConditions`: `extensions.load("gameplay_missions_unlocks_conditions_genericConditions")`, then the global `gameplay_missions_unlocks_conditions_genericConditions`

Generic condition types for mission unlocks: never, missing, always and the combinators multiAnd / multiOr. Loaded by gameplay_missions_unlocks; each type has conditionMet(c) (returns met and optionally the list of nested results) and getLabel(c).

## Notes

- missing is used when the condition type is unknown, and returns true (the condition is therefore considered fulfilled).
- multiOr returns true if the nested list is empty; multiAnd too (no elements).
- always is marked hidden = true (not shown in the UI).

## Fields

| Field | Type | Description |
|---|---|---|
| `always` | table | Always true; hidden = true. |
| `missing` | table | Fallback condition for an invalid or unknown type; always true. |
| `multiAnd` | table | Logical AND over c.nested (each sub-condition evaluated via gameplay_missions_unlocks.conditionMet). Returns met, nested. editorFunction 'displayNestedCondition'. |
| `multiOr` | table | Logical OR over c.nested; true if the list is empty. Returns met, nested. editorFunction 'displayNestedCondition'. |
| `never` | table | Always false. Literal label 'Never'. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/unlocks/conditions/genericConditions.lua`.*

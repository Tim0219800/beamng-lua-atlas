# `gameplay_missions_unlocks_conditions_careerConditions`

*File: `lua/ge/extensions/gameplay/missions/unlocks/conditions/careerConditions.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_missions_unlocks_conditions_careerConditions`: `extensions.load("gameplay_missions_unlocks_conditions_careerConditions")`, then the global `gameplay_missions_unlocks_conditions_careerConditions`

Career-related mission unlock condition types: branch level (branchLevel) and unlocked league (league). Loaded by gameplay_missions_unlocks, which calls conditionMet(self) and getLabel(self) on the condition table.

## Notes

- branchLevel is considered fulfilled if career is not active (or if career_branches is absent).
- league returns false outside career; its label is the concatenation of the league's unlock labels.

## Fields

| Field | Type | Description |
|---|---|---|
| `branchLevel` | table | Condition {type='branchLevel', branchId, level}: the player must have at least level `level` in branch branchId (career_branches.getBranchLevelByPath). Fields: info, editorFunction ('displayBranchLevel'), getLabel, conditionMet. |
| `league` | table | Condition {type='league', leagueId}: the league must be unlocked (career_modules_branches_leagues.isLeagueUnlocked). Fields: info, editorFunction ('displayLeague'), getLabel, conditionMet. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/missions/unlocks/conditions/careerConditions.lua`.*

# `gameplay_missions_unlocks_conditions_careerConditions`

*Fichier : `lua/ge/extensions/gameplay/missions/unlocks/conditions/careerConditions.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_unlocks_conditions_careerConditions` : `extensions.load("gameplay_missions_unlocks_conditions_careerConditions")`, puis la globale `gameplay_missions_unlocks_conditions_careerConditions`

Types de condition de déblocage de missions liés à la carrière : niveau de branche (branchLevel) et ligue débloquée (league). Chargés par gameplay_missions_unlocks, qui appelle conditionMet(self) et getLabel(self) sur la table de condition.

## Remarques

- branchLevel est considérée comme remplie si la carrière n'est pas active (ou si career_branches est absent).
- league renvoie false hors carrière ; son label est la concaténation des libellés de déblocage de la ligue.

## Champs

| Champ | Type | Description |
|---|---|---|
| `branchLevel` | table | Condition {type='branchLevel', branchId, level} : le joueur doit avoir au moins le niveau level dans la branche branchId (career_branches.getBranchLevelByPath). Champs : info, editorFunction ('displayBranchLevel'), getLabel, conditionMet. |
| `league` | table | Condition {type='league', leagueId} : la ligue doit être débloquée (career_modules_branches_leagues.isLeagueUnlocked). Champs : info, editorFunction ('displayLeague'), getLabel, conditionMet. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/unlocks/conditions/careerConditions.lua`.*

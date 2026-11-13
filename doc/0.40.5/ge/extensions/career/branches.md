# `career_branches`

*Fichier : `lua/ge/extensions/career/branches.lua` · VM : Game Engine (GE) · 651 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_branches` : `extensions.load("career_branches")`, puis la globale `career_branches`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_branches.calcBranchLevelFromValue(val, id)` |  | 294 |
| `career_branches.checkUnlocks()` |  | 462 |
| `career_branches.expandUnlocks(skill, level, unlocks)` |  | 396 |
| `career_branches.extractBranchPathIdFromFilePath(filePath)` |  | 624 |
| `career_branches.getBranchByDomainBranchSkill(domainId, branchId, skillId)` |  | 265 |
| `career_branches.getBranchById(id)` |  | 248 |
| `career_branches.getBranchByPath(pathId)` |  | 252 |
| `career_branches.getBranchIcon(id)` |  | 360 |
| `career_branches.getBranchLevel(id)` |  | 331 |
| `career_branches.getBranchLevelByPath(pathId)` |  | 338 |
| `career_branches.getBranchSimpleInfo(id)` |  | 315 |
| `career_branches.getBranchXP(id)` |  | 345 |
| `career_branches.getBranches()` | gets all branches in a dict by ID | 158 |
| `career_branches.getLevelLabel(id, level)` |  | 366 |
| `career_branches.getLevelRewardMultiplier(id)` |  | 374 |
| `career_branches.getOrder(key)` |  | 21 |
| `career_branches.getSortedBranches()` |  | 281 |
| `career_branches.getXPNeededForLevel(id, level)` |  | 352 |
| `career_branches.onCareerActive(active)` | *(hook)* | 445 |
| `career_branches.onGetUnlockFlagDefinitions(flagDefinitions)` | *(hook)* | 509 |
| `career_branches.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 432 |
| `career_branches.orderAttributeKeysByBranchOrder(list)` |  | 383 |
| `career_branches.orderBranchNamesKeysByBranchOrder(list)` |  | 389 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `newAttributeNamesToOldNames` | table |  |
| `oldAttributeNamesToNewNames` | table |  |
| `onPlayerAttributesChanged` | any |  ⚠ référence `onPlayerAttributesChanged` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/branches.lua`.*

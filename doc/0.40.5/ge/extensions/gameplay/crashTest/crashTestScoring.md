# `gameplay_crashTest_crashTestScoring`

*Fichier : `lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua` · VM : Game Engine (GE) · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crashTest_crashTestScoring` : `extensions.load("gameplay_crashTest_crashTestScoring")`, puis la globale `gameplay_crashTest_crashTestScoring`

**Dépendances (chargées avant) :** `gameplay_util_damageAssessment`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crashTest_crashTestScoring.calculateDamageLocationScore(damageLocationGoal, damageLocationData)` |  | 55 |
| `gameplay_crashTest_crashTestScoring.calculateIndividualDamageScore(damageGoal, damageCondition, vehId)` |  | 64 |
| `gameplay_crashTest_crashTestScoring.calculateStepScore(stepData, stepCrashData)` | onoly triggered if the step is successful | 117 |
| `gameplay_crashTest_crashTestScoring.getStepScoreData(stepIndex)` |  | 148 |
| `gameplay_crashTest_crashTestScoring.getTotalScoreData()` |  | 137 |
| `gameplay_crashTest_crashTestScoring.reset()` |  | 152 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crashTest/crashTestScoring.lua`.*

# `gameplay_missions_unlocks_conditions_missionConditions`

*Fichier : `lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_unlocks_conditions_missionConditions` : `extensions.load("gameplay_missions_unlocks_conditions_missionConditions")`, puis la globale `gameplay_missions_unlocks_conditions_missionConditions`

Types de condition de déblocage fondés sur la progression d'autres missions : missionPassed (réussie) et missionCompleted (complétée). Elles lisent mission.saveData.progress[clé].aggregate. La clé de progression peut être 'default' (ou vide), 'any' (n'importe laquelle) ou une clé précise.

## Remarques

- Si la mission référencée n'existe pas, un log d'erreur est émis et la condition vaut false.
- La fonction locale F n'est pas exportée : checkAggregateWithKey et getTargetLabel ne sont pas accessibles depuis l'extérieur.
- Le bloc missionFunction est commenté dans le code (inactif).

## Champs

| Champ | Type | Description |
|---|---|---|
| `missionCompleted` | table | Condition {type='missionCompleted', missionId, progressKey} : vraie si aggregate.completed est vrai. editorFunction 'displayMissionConditionWithProgressKey'. |
| `missionPassed` | table | Condition {type='missionPassed', missionId, progressKey} : vraie si aggregate.passed est vrai. editorFunction 'displayMissionCondition'. |

## Classe `F`

Table locale d'aides (non exportée) utilisée par missionPassed et missionCompleted.

| Méthode | Description | Ligne |
|---|---|---|
| `F.checkAggregateWithKey(id, progressKey, field)` | Vérifie si, pour la mission donnée, au moins une des clés de progression a le champ aggregate[field] vrai. | 8 |
| `F.getTargetLabel(id, progressKey, verb)` | Construit le label traduisible de la condition (clés missions.missions.unlock.<verb>.default\|any\|custom). | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua`.*

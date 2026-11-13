# `gameplay_missions_unlocks_conditions_missionConditions`

*Fichier : `lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua` · VM : Game Engine (GE) · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_unlocks_conditions_missionConditions` : `extensions.load("gameplay_missions_unlocks_conditions_missionConditions")`, puis la globale `gameplay_missions_unlocks_conditions_missionConditions`

## Champs

| Champ | Type | Description |
|---|---|---|
| `missionCompleted` | table |  |
| `missionPassed` | table |  |

## Classe `F`

| Méthode | Description | Ligne |
|---|---|---|
| `F.checkAggregateWithKey(id, progressKey, field)` | this function checks if any progress (by key) of a mission has a specific field set (passed, completed etc) | 8 |
| `F.getTargetLabel(id, progressKey, verb)` |  | 28 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/unlocks/conditions/missionConditions.lua`.*

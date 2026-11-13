# `gameplay_freeformDelivery_goals`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/goals.lua` · VM : Game Engine (GE) · 898 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_goals` : `extensions.load("gameplay_freeformDelivery_goals")`, puis la globale `gameplay_freeformDelivery_goals`

**Dépendances (chargées avant) :** `gameplay_freeformDelivery_utils`, `core_trailerRespawn`, `core_vehicles`, `core_vehicleBridge`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_goals.areAllGoalsInAreaComplete(areaId)` |  | 771 |
| `gameplay_freeformDelivery_goals.cleanup()` | Full cleanup: removes everything (for teardown) | 884 |
| `gameplay_freeformDelivery_goals.getAllGoals()` |  | 732 |
| `gameplay_freeformDelivery_goals.getCompletionTimer()` |  | 871 |
| `gameplay_freeformDelivery_goals.getGoalProgress(goalId)` |  | 740 |
| `gameplay_freeformDelivery_goals.getGoalState(goalId)` |  | 736 |
| `gameplay_freeformDelivery_goals.getGoals()` |  | 720 |
| `gameplay_freeformDelivery_goals.getGoalsByTargetArea(targetAreaId)` |  | 751 |
| `gameplay_freeformDelivery_goals.getGoalsByType(goalType)` |  | 761 |
| `gameplay_freeformDelivery_goals.getProgress()` |  | 692 |
| `gameplay_freeformDelivery_goals.hideFromTasklist()` | Hide goals from UI (tasklist) but keep internal state for evaluation | 876 |
| `gameplay_freeformDelivery_goals.isDistanceGoalWarningActive(goal)` |  | 280 |
| `gameplay_freeformDelivery_goals.isGoalActive(goalId)` |  | 746 |
| `gameplay_freeformDelivery_goals.setup(delivery)` |  | 492 |
| `gameplay_freeformDelivery_goals.update(dtReal, dtSim, dtRaw, profiler)` |  | 553 |
| `gameplay_freeformDelivery_goals.updateCompletionTimer(dtReal)` |  | 826 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/goals.lua`.*

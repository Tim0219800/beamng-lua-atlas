# `gameplay_tutorial_runtime`

*Fichier : `lua/ge/extensions/gameplay/tutorial/runtime.lua` · VM : Game Engine (GE) · 306 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_tutorial_runtime` : `extensions.load("gameplay_tutorial_runtime")`, puis la globale `gameplay_tutorial_runtime`

**Dépendances (chargées avant) :** `gameplay_tutorial_setup`, `gameplay_tutorial_markers`, `gameplay_tutorial_damageTracker`, `gameplay_tutorial_bounds`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_tutorial_runtime.activateStep(stepId)` |  | 150 |
| `gameplay_tutorial_runtime.advanceToNextStep()` |  | 200 |
| `gameplay_tutorial_runtime.completeStep(stepId)` |  | 192 |
| `gameplay_tutorial_runtime.configure(opts)` |  | 57 |
| `gameplay_tutorial_runtime.endTutorial()` |  | 227 |
| `gameplay_tutorial_runtime.getCurrentStep()` |  | 103 |
| `gameplay_tutorial_runtime.getProgressData()` |  | 95 |
| `gameplay_tutorial_runtime.getStepIdByIndex(index)` |  | 111 |
| `gameplay_tutorial_runtime.getStepOrder()` |  | 107 |
| `gameplay_tutorial_runtime.isActive()` |  | 99 |
| `gameplay_tutorial_runtime.onPreRender(dtReal, dtSim, dtRaw)` | *(hook)* | 293 |
| `gameplay_tutorial_runtime.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 277 |
| `gameplay_tutorial_runtime.setProgressData(data)` |  | 88 |
| `gameplay_tutorial_runtime.start()` |  | 115 |
| `gameplay_tutorial_runtime.stop()` | Unloads the active step without marking the tutorial completed | 262 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `sharedTutorialData` | table |  |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/tutorial/runtime.lua`.*

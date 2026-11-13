# `career_modules_tutorial`

*Fichier : `lua/ge/extensions/career/modules/tutorial.lua` · VM : Game Engine (GE) · 240 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial` : `extensions.load("career_modules_tutorial")`, puis la globale `career_modules_tutorial`

**Dépendances (chargées avant) :** `gameplay_tutorial_runtime`, `gameplay_tutorial_setup`, `gameplay_tutorial_markers`, `gameplay_tutorial_damageTracker`, `gameplay_tutorial_bounds`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial.activateStep(stepId)` |  | 164 |
| `career_modules_tutorial.advanceToNextStep()` |  | 180 |
| `career_modules_tutorial.completeStep(stepId)` |  | 172 |
| `career_modules_tutorial.endTutorial()` |  | 188 |
| `career_modules_tutorial.getCompletedSteps()` |  | 204 |
| `career_modules_tutorial.getCurrentStep()` |  | 144 |
| `career_modules_tutorial.getStepIdByIndex(index)` |  | 152 |
| `career_modules_tutorial.getStepOrder()` |  | 148 |
| `career_modules_tutorial.isActive()` |  | 140 |
| `career_modules_tutorial.onCareerActive()` | *(hook)* | 132 |
| `career_modules_tutorial.onExtensionLoaded()` | *(hook)* | 94 |
| `career_modules_tutorial.onExtensionUnloaded()` | *(hook)* | 120 |
| `career_modules_tutorial.onGetRawPoiListForTutorial(elements)` | *(hook)* | 209 |
| `career_modules_tutorial.onPreRender(dtReal, dtSim, dtRaw)` | *(hook)* | 200 |
| `career_modules_tutorial.onSaveCurrentProfile(currentSavePath)` | *(hook)* | 126 |
| `career_modules_tutorial.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 196 |
| `career_modules_tutorial.start()` |  | 156 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `sharedTutorialData` | any |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial.lua`.*

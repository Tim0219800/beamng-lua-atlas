# `career_modules_tutorial_step06dragStripBasics`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua` · VM : Game Engine (GE) · 649 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step06dragStripBasics` : `extensions.load("career_modules_tutorial_step06dragStripBasics")`, puis la globale `career_modules_tutorial_step06dragStripBasics`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step06dragStripBasics.cleanup()` |  | 609 |
| `career_modules_tutorial_step06dragStripBasics.dragRaceEndLineReached(vehId)` | Drag hook from gameplay_drag_utils when player reaches race end timer. | 506 |
| `career_modules_tutorial_step06dragStripBasics.dragRaceStarted(vehId)` | Drag hook from gameplay_drag_utils/general when race actually starts (green). | 493 |
| `career_modules_tutorial_step06dragStripBasics.onCareerTutorialLeftBounds()` | *(hook)* | 412 |
| `career_modules_tutorial_step06dragStripBasics.onDebugMenu(im)` | *(hook)* | 626 |
| `career_modules_tutorial_step06dragStripBasics.onDragRacersSetup(data)` | Drag hook fired when racers are set up for a new staging attempt. *(hook)* | 594 |
| `career_modules_tutorial_step06dragStripBasics.onIntroPopupCareerClosed(id)` | *(hook)* | 416 |
| `career_modules_tutorial_step06dragStripBasics.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)` | Drag hook from gameplay_drag_utils: phase transition for a specific racer.<br> We use this to complete the staging goal once the player moves from stage to countdown. *(hook)* | 477 |
| `career_modules_tutorial_step06dragStripBasics.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 543 |
| `career_modules_tutorial_step06dragStripBasics.setup(stepData)` |  | 359 |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua`.*

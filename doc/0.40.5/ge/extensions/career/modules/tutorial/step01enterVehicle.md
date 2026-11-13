# `career_modules_tutorial_step01enterVehicle`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua` · VM : Game Engine (GE) · 234 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step01enterVehicle` : `extensions.load("career_modules_tutorial_step01enterVehicle")`, puis la globale `career_modules_tutorial_step01enterVehicle`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step01enterVehicle.cleanup()` | Called when step completes or tutorial ends | 131 |
| `career_modules_tutorial_step01enterVehicle.onCareerTutorialLeftBounds()` | *(hook)* | 59 |
| `career_modules_tutorial_step01enterVehicle.onDebugMenu(im)` | Debug menu for this step *(hook)* | 226 |
| `career_modules_tutorial_step01enterVehicle.onIntroPopupCareerClosed(id)` | Called when intro popup is closed (once per page; tasklist runs only after the last page, approachVehicle) *(hook)* | 142 |
| `career_modules_tutorial_step01enterVehicle.onShiftModeSelectedViaPopup(data)` | Called from GearboxSelect.vue when user confirms shift mode (lua.extensions.hook) *(hook)* | 183 |
| `career_modules_tutorial_step01enterVehicle.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame while step is active (via extension system) *(hook)* | 70 |
| `career_modules_tutorial_step01enterVehicle.setup(stepData)` | Called when step becomes active | 36 |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua`.*

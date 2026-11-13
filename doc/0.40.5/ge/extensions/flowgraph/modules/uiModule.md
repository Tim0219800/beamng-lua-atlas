# `flowgraph_modules_uiModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/uiModule.lua` · VM : Game Engine (GE) · 711 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/uiModule")` (fichier sous extensions/ mais pas une extension classique)

**Dépendances (chargées avant) :** `ui_appContainers_topCenter`

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:addButton(fun, meta)` |  | 275 |
| `C:addCrashAnalysisStepDetails(stepDetails)` |  | 484 |
| `C:addDriftStats(driftStats)` |  | 506 |
| `C:addHeader(header)` |  | 267 |
| `C:addLaptimesForVehicle(state, attempt)` |  | 614 |
| `C:addObjectives(change, pages)` |  | 301 |
| `C:addRatings(change)` |  | 397 |
| `C:addReplayPanelAndSupportsReplay()` |  | 204 |
| `C:addScreenButton(fun, meta)` | Buttons added before finishUIBuilding appear above the start button. | 291 |
| `C:addUIElement(element)` |  | 259 |
| `C:buildListText(items)` | Elements -- | 235 |
| `C:clear()` |  | 18 |
| `C:clearButtonFunctions()` |  | 40 |
| `C:executionStarted()` |  | 669 |
| `C:executionStopped()` |  | 684 |
| `C:finishUIBuilding()` |  | 166 |
| `C:getFreeId()` |  | 9 |
| `C:init()` |  | 14 |
| `C:keepGameState(keep)` |  | 36 |
| `C:nextPage()` | will probably only be used by startPage | 664 |
| `C:onGetIsMissionStartOrEndScreenActive(screensActive)` |  | 229 |
| `C:onMissionScreenButtonClicked(button)` |  | 246 |
| `C:onRequestMissionScreenData(mode)` |  | 219 |
| `C:setAppContainerContext(context)` |  | 29 |
| `C:setGameState(...)` |  | 25 |
| `C:setPageIcon(pageName, icon)` |  | 56 |
| `C:setStartButtonText(text)` |  | 393 |
| `C:setStartScreenAsSimple()` |  | 200 |
| `C:setupPages()` |  | 61 |
| `C:startUIBuilding(uiMode, node)` |  | 44 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMissionScreenReady` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `onRequestMissionScreenDataReady`

**Charge les extensions :** `ui_apps_genericMissionData`, `ui_apps_pointsBar`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/uiModule.lua`.*

# `career_modules_delivery_progress`

*Fichier : `lua/ge/extensions/career/modules/delivery/progress.lua` · VM : Game Engine (GE) · 651 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_progress` : `extensions.load("career_modules_delivery_progress")`, puis la globale `career_modules_delivery_progress`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_progress.activateSound(soundLabel, active)` |  | 629 |
| `career_modules_delivery_progress.aggregateAfter()` |  | 107 |
| `career_modules_delivery_progress.aggregateBefore()` |  | 98 |
| `career_modules_delivery_progress.confirmDropOffCheckComplete()` |  | 366 |
| `career_modules_delivery_progress.confirmDropOffData(confirmedDropOffs, facId, psPath)` |  | 300 |
| `career_modules_delivery_progress.getFacilityCountForCargoCount(direction)` |  | 599 |
| `career_modules_delivery_progress.getMoneyMultiplerForSkill(skill, tier)` |  | 612 |
| `career_modules_delivery_progress.getProgress()` |  | 37 |
| `career_modules_delivery_progress.isFacilityUnlocked(facId)` |  | 550 |
| `career_modules_delivery_progress.isFacilityVisible(facId, isCargoDeliveryTutorialActive)` |  | 574 |
| `career_modules_delivery_progress.onBranchTierReached(skill, tier)` | *(hook)* | 617 |
| `career_modules_delivery_progress.onCareerActivated()` | *(hook)* | 7 |
| `career_modules_delivery_progress.onCargoDelivered(cargoItems)` | *(hook)* | 41 |
| `career_modules_delivery_progress.onVehicleTasksFinished(offers)` | *(hook)* | 77 |
| `career_modules_delivery_progress.openDropOffScreenGatheringComplete()` |  | 199 |
| `career_modules_delivery_progress.requestDropOffData(facId, psPath)` |  | 124 |
| `career_modules_delivery_progress.setProgress(data)` |  | 33 |
| `career_modules_delivery_progress.unloadCargoPopupClosed()` |  | 537 |
| `career_modules_delivery_progress.unloadMaterialsManualStart(cargoId, destination)` |  | 193 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDeliveryFacilityProgressStatsChanged` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `SetDeliveryDropOffCargoSelection`, `SetDeliveryDropOffRewardResult`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/progress.lua`.*

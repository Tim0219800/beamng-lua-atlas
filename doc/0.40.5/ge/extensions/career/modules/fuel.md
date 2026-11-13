# `career_modules_fuel`

*Fichier : `lua/ge/extensions/career/modules/fuel.lua` · VM : Game Engine (GE) · 665 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_fuel` : `extensions.load("career_modules_fuel")`, puis la globale `career_modules_fuel`

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_fuel.getFuelData()` |  | 211 |
| `career_modules_fuel.getFuelingData()` |  | 372 |
| `career_modules_fuel.isCurrentlyFueling()` |  | 473 |
| `career_modules_fuel.minimumRefuelingCheck(vehId)` |  | 617 |
| `career_modules_fuel.onCareerActive(active)` | *(hook)* | 632 |
| `career_modules_fuel.onChangeFlowRate(factor, tankIndex)` | *(hook)* | 349 |
| `career_modules_fuel.onClientEndMission(levelPath)` | *(hook)* | 637 |
| `career_modules_fuel.onUpdate(dtReal, dtSim)` | *(hook)* | 496 |
| `career_modules_fuel.payPrice()` |  | 402 |
| `career_modules_fuel.requestRefuelingTransactionData()` |  | 198 |
| `career_modules_fuel.sendUpdateDataToUI()` |  | 147 |
| `career_modules_fuel.startTransaction(_gasStation)` |  | 202 |
| `career_modules_fuel.uiButtonStartFueling(energyType)` | Called by UI | 437 |
| `career_modules_fuel.uiButtonStartFuelingTank(index)` |  | 445 |
| `career_modules_fuel.uiButtonStopFueling(energyType)` |  | 441 |
| `career_modules_fuel.uiButtonStopFuelingTank(index)` |  | 455 |
| `career_modules_fuel.uiCancelTransaction()` |  | 464 |
| `career_modules_fuel.uiSetSelectedTankIndex(index)` |  | 429 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPaidRefuelling`
- `onRefuelingEndTransaction`
- `onRefuelingStartTransaction`
- `onRefuelingStopFueling`

**Évènements UI (guihooks.trigger) :** `initialFuelingData`, `updateFuelData`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/fuel.lua`.*

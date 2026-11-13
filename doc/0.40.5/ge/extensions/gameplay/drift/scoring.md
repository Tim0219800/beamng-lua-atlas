# `gameplay_drift_scoring`

*Fichier : `lua/ge/extensions/gameplay/drift/scoring.lua` · VM : Game Engine (GE) · 823 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drift_scoring` : `extensions.load("gameplay_drift_scoring")`, puis la globale `gameplay_drift_scoring`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drift_scoring.addCachedScore(valueToAdd, useStallingSystem, vehId)` |  | 280 |
| `gameplay_drift_scoring.getCurrentDriftTier(vehId)` |  | 740 |
| `gameplay_drift_scoring.getDriftDebugInfo()` |  | 724 |
| `gameplay_drift_scoring.getDriftPerformanceFactor(vehId)` |  | 709 |
| `gameplay_drift_scoring.getDriftTiers()` |  | 728 |
| `gameplay_drift_scoring.getGC()` |  | 732 |
| `gameplay_drift_scoring.getPotentialScore(vehId)` |  | 704 |
| `gameplay_drift_scoring.getScore(vehId)` |  | 693 |
| `gameplay_drift_scoring.getScoreAddedThisFrame(vehId)` |  | 719 |
| `gameplay_drift_scoring.getScoreOptions()` |  | 736 |
| `gameplay_drift_scoring.getSteppedDriftPerformanceFactor(vehId)` |  | 714 |
| `gameplay_drift_scoring.getStuntZoneBasePoints(stuntZoneType)` |  | 745 |
| `gameplay_drift_scoring.isVehicleFrozen(vehId)` |  | 753 |
| `gameplay_drift_scoring.onAnyStuntZoneAccomplished(vehId)` | Drift stunts -- *(hook)* | 568 |
| `gameplay_drift_scoring.onClientEndMission()` | *(hook)* | 239 |
| `gameplay_drift_scoring.onDeserialized(data)` | *(hook)* | 778 |
| `gameplay_drift_scoring.onDonutDriftAccomplished(data)` | *(hook)* | 596 |
| `gameplay_drift_scoring.onDriftChainStarted(vehId)` | *(hook)* | 761 |
| `gameplay_drift_scoring.onDriftCompleted(data)` | *(hook)* | 631 |
| `gameplay_drift_scoring.onDriftCrash(vehId)` | *(hook)* | 685 |
| `gameplay_drift_scoring.onDriftFreeroamCruisingStarted()` | *(hook)* | 765 |
| `gameplay_drift_scoring.onDriftPlVehReset(vehId)` | *(hook)* | 757 |
| `gameplay_drift_scoring.onDriftSpinout(vehId)` | *(hook)* | 689 |
| `gameplay_drift_scoring.onDriftThroughAccomplished(data)` | *(hook)* | 575 |
| `gameplay_drift_scoring.onDriftTransition(vehId)` | *(hook)* | 667 |
| `gameplay_drift_scoring.onHitPoleAccomplished(data)` | *(hook)* | 582 |
| `gameplay_drift_scoring.onNearPoleAccomplished(data)` | *(hook)* | 589 |
| `gameplay_drift_scoring.onSerialize()` | *(hook)* | 771 |
| `gameplay_drift_scoring.onUpdate(dtReal, _dtSim)` | *(hook)* | 533 |
| `gameplay_drift_scoring.onVehicleDestroyed(vehId)` | *(hook)* | 234 |
| `gameplay_drift_scoring.reset(vehId)` |  | 222 |
| `gameplay_drift_scoring.setVehicleFrozen(vehId, isFrozen)` |  | 749 |
| `gameplay_drift_scoring.wrapUp(vehId)` |  | 602 |
| `gameplay_drift_scoring.wrapUpWithText(vehId)` |  | 614 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDonutDriftScored` — écouté par 1 module(s)
- `onDriftCachedScoreReset` — écouté par 1 module(s)
- `onDriftCompletedScored` — écouté par 5 module(s)
- `onDriftNewCombo` — écouté par 1 module(s)
- `onDriftScoreChanged` — écouté par 1 module(s)
- `onDriftScoreWrappedUp` — écouté par 1 module(s)
- `onHitPoleScored` — écouté par 1 module(s)
- `onNearPoleScored` — écouté par 1 module(s)
- `onNewDriftTierReached` — écouté par 2 module(s)
- `onTightDriftScored` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/scoring.lua`.*

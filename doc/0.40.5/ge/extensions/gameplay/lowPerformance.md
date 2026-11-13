# `gameplay_lowPerformance`

*Fichier : `lua/ge/extensions/gameplay/lowPerformance.lua` · VM : Game Engine (GE) · 365 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_lowPerformance` : `extensions.load("gameplay_lowPerformance")`, puis la globale `gameplay_lowPerformance`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_lowPerformance.cancelPendingSpawn()` |  | 125 |
| `gameplay_lowPerformance.confirmPendingSpawn()` |  | 119 |
| `gameplay_lowPerformance.confirmSpawn(spawnFn)` | Returns spawnFn's result, or false while the player decides on the warning | 93 |
| `gameplay_lowPerformance.getPauseNotice()` |  | 141 |
| `gameplay_lowPerformance.isLowPerformance()` |  | 88 |
| `gameplay_lowPerformance.muteAndConfirmPendingSpawn()` |  | 129 |
| `gameplay_lowPerformance.onScreenFadeState(state)` | *(hook)* | 196 |
| `gameplay_lowPerformance.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 151 |
| `gameplay_lowPerformance.onVehicleSpawned()` | *(hook)* | 192 |

**Évènements UI (guihooks.trigger) :** `showConfirmationDialog`, `toastrMsg`

## Appels vers le moteur (C++)

- `Engine.` `isProgramFocused`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/lowPerformance.lua`.*

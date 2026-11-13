# `ui_policeInfo`

*Fichier : `lua/ge/extensions/ui/policeInfo.lua` · VM : Game Engine (GE) · 202 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_policeInfo` : `extensions.load("ui_policeInfo")`, puis la globale `ui_policeInfo`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_policeInfo.isPursuit()` |  | 40 |
| `ui_policeInfo.onGuiUpdate(dt)` | *(hook)* | 154 |
| `ui_policeInfo.onPursuitAction(vehId, action, data)` | *(hook)* | 77 |
| `ui_policeInfo.onPursuitOffense(vehId, name, data)` | *(hook)* | 64 |
| `ui_policeInfo.onPursuitStatsEnded()` | *(hook)* | 144 |
| `ui_policeInfo.onUiChangedState()` | *(hook)* | 150 |
| `ui_policeInfo.onVehicleSwitched(_, id)` | *(hook)* | 58 |
| `ui_policeInfo.resetPursuitTable()` |  | 44 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `enabled` | boolean | set to false to disable stats overview after a pursuit |
| `showFinalStats` | boolean | if set, uses this vehicle's pursuit data instead of the player's |
| `targetId` | nil |  |

**Évènements UI (guihooks.trigger) :** `PoliceAlertClear`, `PoliceAlertPush`

## Appels vers le moteur (C++)

- `be:` `getEnabled`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/policeInfo.lua`.*

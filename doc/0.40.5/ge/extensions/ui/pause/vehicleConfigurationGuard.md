# `ui_pause_vehicleConfigurationGuard`

*Fichier : `lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua` · VM : Game Engine (GE) · 103 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_vehicleConfigurationGuard` : `extensions.load("ui_pause_vehicleConfigurationGuard")`, puis la globale `ui_pause_vehicleConfigurationGuard`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_vehicleConfigurationGuard.cancelExit()` |  | 83 |
| `ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context)` |  | 39 |
| `ui_pause_vehicleConfigurationGuard.confirmExitApplying()` | The pending parts tree and tuning values live in the UI, so it applies them and<br> then calls back into resumePendingExit() | 94 |
| `ui_pause_vehicleConfigurationGuard.confirmExitDiscarding()` | Unapplied changes only ever existed in the UI, so leaving the screen is the discard | 88 |
| `ui_pause_vehicleConfigurationGuard.navigateBack()` |  | 21 |
| `ui_pause_vehicleConfigurationGuard.resumePendingExit()` |  | 98 |
| `ui_pause_vehicleConfigurationGuard.setHasPendingChanges(value)` |  | 17 |

**Évènements UI (guihooks.trigger) :** `VehicleConfigurationCombinedApplyAndExit`, `showConfirmationDialog`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/vehicleConfigurationGuard.lua`.*

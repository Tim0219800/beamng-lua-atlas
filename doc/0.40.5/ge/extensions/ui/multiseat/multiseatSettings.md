# `ui_multiseat_multiseatSettings`

*Fichier : `lua/ge/extensions/ui/multiseat/multiseatSettings.lua` · VM : Game Engine (GE) · 676 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_multiseatSettings` : `extensions.load("ui_multiseat_multiseatSettings")`, puis la globale `ui_multiseat_multiseatSettings`

**Dépendances (chargées avant) :** `ui_multiseat_generalSettings`, `ui_multiseat_multiseatConfiguration`, `ui_multiseat_multiseatVehicles`, `ui_gridSelectorRouteLifecycleCallbacks`, `ui_pause_routeLifecycleCallbacks`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_multiseatSettings.applyStagedSettings(options)` |  | 319 |
| `ui_multiseat_multiseatSettings.cancelExit()` |  | 516 |
| `ui_multiseat_multiseatSettings.confirmExit(route, params, context)` |  | 470 |
| `ui_multiseat_multiseatSettings.confirmExitApplying()` |  | 525 |
| `ui_multiseat_multiseatSettings.confirmExitDiscarding()` | No explicit discard needed: leaving the flow drops the staged values in closeSettings | 521 |
| `ui_multiseat_multiseatSettings.confirmMultiseatExit()` |  | 432 |
| `ui_multiseat_multiseatSettings.cycleDevicePlayer(deviceId)` |  | 543 |
| `ui_multiseat_multiseatSettings.discardStagedSettings()` |  | 399 |
| `ui_multiseat_multiseatSettings.getScreenData()` |  | 213 |
| `ui_multiseat_multiseatSettings.joinDeviceGroup(groupId)` |  | 583 |
| `ui_multiseat_multiseatSettings.leaveDeviceGroup(player)` |  | 591 |
| `ui_multiseat_multiseatSettings.moveDevicePlayer(deviceId, direction)` |  | 559 |
| `ui_multiseat_multiseatSettings.notifyScreenChanged()` |  | 625 |
| `ui_multiseat_multiseatSettings.onClientEndMission()` | *(hook)* | 661 |
| `ui_multiseat_multiseatSettings.onExtensionUnloaded()` | *(hook)* | 671 |
| `ui_multiseat_multiseatSettings.onLocalParticipantsChanged()` | *(hook)* | 629 |
| `ui_multiseat_multiseatSettings.onSettingsEnter()` | *(hook)* | 634 |
| `ui_multiseat_multiseatSettings.onSettingsLeave(context, toRoute, fromRoute, data)` | *(hook)* | 639 |
| `ui_multiseat_multiseatSettings.onVehicleSelectorEnter(context, toRoute, fromRoute, data)` | *(hook)* | 644 |
| `ui_multiseat_multiseatSettings.onVehicleSelectorLeave(context, toRoute, fromRoute, data)` | *(hook)* | 654 |
| `ui_multiseat_multiseatSettings.onVehicleSelectorMount(context, toRoute, fromRoute, data)` | *(hook)* | 650 |
| `ui_multiseat_multiseatSettings.openVehicleSelectorForPlayer(player)` |  | 599 |
| `ui_multiseat_multiseatSettings.play()` |  | 619 |
| `ui_multiseat_multiseatSettings.removeDevice(deviceId)` |  | 575 |
| `ui_multiseat_multiseatSettings.requestMultiseatExit()` |  | 410 |
| `ui_multiseat_multiseatSettings.runSettingAction(providerId, fieldId, value)` | action fields do not carry a value, the owning provider performs the change right away | 298 |
| `ui_multiseat_multiseatSettings.setDevicePlayer(deviceId, personaNumber)` |  | 567 |
| `ui_multiseat_multiseatSettings.stagePlayerIcon(player, icon)` |  | 611 |
| `ui_multiseat_multiseatSettings.stagePlayerOptIn(player, optedIn)` |  | 535 |
| `ui_multiseat_multiseatSettings.stagePlayerVehiclePreferences(player, preferences)` |  | 603 |
| `ui_multiseat_multiseatSettings.stageSetting(providerId, fieldId, value)` |  | 275 |
| `ui_multiseat_multiseatSettings.toggleDevicePlayer(deviceId)` |  | 551 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onApplyMultiseatGameSettings` — écouté par 1 module(s)
- `onGetMultiseatGameSettings` — écouté par 1 module(s)
- `onGetMultiseatSettingsScreenData`
- `onMultiseatGameSettingAction` — écouté par 1 module(s)
- `onMultiseatGameSettingChanged` — écouté par 1 module(s)
- `onMultiseatSettingsApplied` — écouté par 2 module(s)
- `onMultiseatSettingsClosed` — écouté par 1 module(s)
- `onPlayMultiseatGameSettings`
- `onValidateMultiseatGameSettings` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `MultiseatSettingsChanged`, `showConfirmationDialog`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/multiseatSettings.lua`.*
